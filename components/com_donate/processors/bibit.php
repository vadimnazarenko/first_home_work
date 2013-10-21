<?php
/**
 * @version		$Id: bibit.php 305 2009-09-08 20:03:45Z fatica $
 * @package		Donation
 * @copyright	Copyright (C) 2009 Michael Fatica, Fatica Consulting L.L.C. - All rights reserved.
 * @license		GNU/GPL
 * This file is part of Donation Component. Donation Component is free software:
 * you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 */


/** ensure this file is being included by a parent file */
(defined( '_VALID_MOS' ) or defined('_JEXEC')) or die( 'Direct Access to this location is not allowed.' );

function process (&$row){
	
global $cfg;

//some validation
if(!isset($cfg->bibit_user)){
	die("No bibit user");	
}

//some validation
if(!isset($cfg->bibit_password)){
	die("No bibit password configured");	
}

//some validation
if(!$row->amount){
	die("No amount specified");	
}

$orderCode="order".time();

// Shopper specific details
$shopperID="shopper" . time();

//set the gateway address
if($cfg->gateway_mode == _TEST_MODE){
	$url ="https://{$cfg->bibit_user}:{$cfg->bibit_password}@secure-test.bibit.com/jsp/merchant/xml/paymentService.jsp";//it is better to keep this url outside your HTML dir which has public (internet) access
}else{
	$url ="https://{$cfg->bibit_user}:{$cfg->bibit_password}@secure.bibit.com/jsp/merchant/xml/paymentService.jsp";//it is better to keep this url outside your HTML dir which has public (internet) access
}

//$xml is the order string to send to bibit
$xml="
<?xml version='1.0'?>
<!DOCTYPE paymentService PUBLIC '-//Bibit/DTD Bibit PaymentService v1//EN' 'http://dtd.bibit.com/paymentService_v1.dtd'>
<paymentService version='1.0' merchantCode='".$cfg->bibit_user."'>
	<submit>
		<order orderCode = '".$orderCode."'>
			<description>Payment</description>
			<amount value='{$row->amount}' currencyCode = '{$row->country_currency}' exponent = '1'/>
			<orderContent>
				<![CDATA[
					<table>
					<tr><td bgcolor='#CCCCCC'>Payment:</td><td colspan='2' bgcolor='#ffff00' align='right'>".$orderCode."</td></tr>
					<tr><td bgcolor='#c0c0c0' colspan='3'>Billing notice:</td></tr>
					<tr><td colspan='3'>Your payment will be handled by Bibit Global Payments Services<br>This name may appear on your bank statement<br>http://www.bibit.com</td></tr>
					</table>
					]]>
			</orderContent>
		<paymentMethodMask>
			<include code='ALL'/>
		</paymentMethodMask>
		<shopper>
			<shopperEmailAddress>{$row->email}</shopperEmailAddress> <authenticatedShopperID>$shopperID</authenticatedShopperID>
		</shopper>
		<shippingAddress>
			<address>
				<firstName>{$row->firstname}</firstName>
				<lastName>{$row->lastname}</lastName>
				<street>{$row->address1} {$row->address2}</street>
				<postalCode>{$row->postalcode}</postalCode>
				<city>{$row->city}</city>
				<countryCode>{$row->country}</countryCode>
				<telephoneNumber>{$row->phone}</telephoneNumber>
			</address>
		</shippingAddress>
		</order>
	</submit>
</paymentService>";//$xml is the order string to send to bibit

	$ch = curl_init ($url);
	curl_setopt($ch, CURLOPT_POST,1);
	curl_setopt($ch, CURLOPT_POSTFIELDS,$xml);   //$xml is the xml string
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_NOPROGRESS, 0);

    $result = curl_exec ($ch); // result will contain XML reply from Bibit curl_close ($ch);
    if ( $result == false )
    {
		die("Curl could not retrieve page '$url', curl_exec returns false");               
        return false;
    }
                
	
	global $currentTag,$ordercode,$referenceID,$errorcode,$url_togoto;//define globals
	
	//parse the response
	$xml_parser = xml_parser_create();
	
	// set callback functions
	xml_set_element_handler($xml_parser, "startElement", "endElement");
	xml_set_character_data_handler($xml_parser, "characterData");
	
	if (!xml_parse($xml_parser, $result))
	{
		if($cfg->gateway_mode == _TEST_MODE){
		    die(sprintf("XML error: %s at line %d",
			xml_error_string(xml_get_error_code($xml_parser)),
			xml_get_current_line_number($xml_parser)));
		}else{
			die("Error parsing XML response from BIBIT");	
		}
	}

	//let the calling function know our result and response message
	if($errorcode > 0){
		
		$row->xaction_result = "Failed: $errorcode";
		$row->xaction_id = "";
		return false;	
		
	}elseif($referenceID > 0){
		$row->xaction_result = $errorcode;
		$row->xaction_id = $referenceID;
		
		return true;
	}
	
return false;	
}


//now we have the result from bibit containing the xml answer. we need to parse this through the XML parser
// initialize parser //using SAX parser
//
//more info on SAX/PHP on these urls
// http://www.devshed.com/Server_Side/XML/XMLwithPHP/XMLwithPHP1/page1.html
// http://www.php.net/manual/en/ref.xml.php


function startElement($parser, $name, $attrs) 
{
	global $currentTag,$ordercode,$referenceID,$errorcode,$url_togoto;
	$currentTag = $name;
	
	$errorcode = 0;

	switch ($name) {
		case "ERROR": 

/*	
THERE IS AN XML ERROR REPLY
1 : internal error, could be everything
2 : parse error, invalid xml
3 : invalid number of transactions in batch
4 : security error
5 : invalid request
6 : invalid content, occurs when xml is valid but content of xml not
7 : payment details in the order element are incorrect
*/
		$errorcode = $attrs['CODE']; //example of how to catch the error code number (i.e. 1 to 7)
			break;

		case "REFERENCE":
			$referenceID = $attrs['ID'];//for storage in your own database
			break;
			
		case "ORDERSTATUS":
			$ordercode = $attrs['ORDERCODE'];
			break;
			
		default:
			break;
	}
}


//////////////////
function endElement($parser, $name) {
	global $currentTag;
	$currentTag = "";
}

/////////////////
function characterData($parser, $result) {

	global $currentTag;
	global $url_togoto;

	switch ($currentTag) {

	case "REFERENCE":
		//there is a REFERENCE so there must be an url which was provided by bibit for the actual payment. echo $result;
		$url_togoto=$result;
		break;

	default:
		break;
	}
}



?>