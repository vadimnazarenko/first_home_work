<?php
/**
 * @version		$Id: paypal_pro.php 374 2010-02-10 18:34:54Z fatica $
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

function process(&$row){

global $cfg;

// Set request-specific fields.
$paymentType = urlencode('Sale');				// or 'Sale'
$firstName = urlencode($row->firstname);
$lastName =  urlencode($row->lastname);

$creditCardType =  urlencode($row->card_type);

$creditCardNumber =  urlencode($row->credit_card);

$expDate = urlencode($row->expiration_month) . "20" . urlencode($row->expiration_year);

$cvv2Number = urlencode($row->cvv);
$address = urlencode($row->address1 . " " . $row->address2);

$city = urlencode($row->city);
$state = urlencode($row->state);
$zip = urlencode($row->postalcode);

$email = urlencode($row->email);

$country = "US";
$amount =  urlencode($row->amount);
$currencyID = urlencode($row->country_currency);							// or other currency ('GBP', 'EUR', 'JPY', 'CAD', 'AUD')


if(!$currencyID){
	$currencyID = "USD";
}

//cover recurring PayPal WPP payments
//validate the recurring donation
if(strlen($row->unit) > 0 && strlen($row->duration) > 0 && strlen($row->length) > 0 && $_POST['interval'] > 0){
	$recurr = true;	
}else {
	$recurr = false;	
}

$recurrNvpStr = "";

$description = getDescription();

//create the recurring payments profile
if($recurr === true){

	//start the payments now
	$startDate = date("Y-m-d",strtotime(date("Y-m-d"). "+1 day")) . "T00:00:00Z";
	
	//unit is days, months
	$unit = addslashes($row->unit);
	
	$length = (int)($row->length);
	
	//paypal WPP isnt plural 	
	switch (strtolower($unit)) {
		case 'months':
			$unit = "Month";
			break;
			
		case 'days':{
			$unit = "Day";
		}break;
	
		default:
			break;
	}
	
	$recurrNvpStr .= "&DESC=".urlencode($description) ."&L_BILLINGTYPE=RecurringPayments" . "&PROFILESTARTDATE=$startDate" . "&BILLINGPERIOD=$unit" . "&BILLINGFREQUENCY=$length"; 
	
	//bill for selected length of time
	if((int)$row->duration == 9999){	
		$totalOccurrences = (int)$row->duration;
	}else{
		if(strtolower($unit) == "day"){
			//e.g. every 36 days for 1 year =  10.138 or 10 occurrences.
			$totalOccurrences = (int)floor(($row->duration * 365) / $length);
		}elseif (strtolower($unit) == "month"){
			//e.g. every 36 days for 1 year =  10.138 or 10 occurrences.
			$totalMonths = (int)$row->duration * 12;
			$totalOccurrences = (int)floor($totalMonths / $length);		
		}else{
			die("PayPal: Invalid unit passed to recurring transaction");	
		}
		
		$recurrNvpStr .= "&TOTALBILLINGCYCLES=$totalOccurrences";

	}
	
	
}

$nvpStr = "";

// Add request-specific fields to the request string. 
$nvpStr .= "&DESC=".urlencode($description) ."&PAYMENTACTION=$paymentType&AMT=$amount&CREDITCARDTYPE=$creditCardType&ACCT=$creditCardNumber&EMAIL=$email&EXPDATE=$expDate&CVV2=$cvv2Number&FIRSTNAME=$firstName&LASTNAME=$lastName&STREET=$address&CITY=$city&STATE=$state&ZIP=$zip&COUNTRYCODE=$country&CURRENCYCODE=$currencyID";
	
if($recurr === true){

	$nvpStr = $recurrNvpStr . $nvpStr;
	// Execute the API operation; see the PPHttpPost function above.
	$httpParsedResponseAr = PPHttpPost('CreateRecurringPaymentsProfile', $nvpStr);
	
}else{
	
	// Execute the API operation; see the PPHttpPost function above.
	$httpParsedResponseAr = PPHttpPost('DoDirectPayment', $nvpStr);
	
}
	 



if($cfg->gateway_mode == _DEBUG_MODE){
	dumpArray($httpParsedResponseAr);
	dumpArray($nvpStr);
	die();
}	

if(strtolower($httpParsedResponseAr["ACK"]) == "success") {

	$row->xaction_id = $httpParsedResponseAr["CORRELATIONID"];
	$row->xaction_result = $httpParsedResponseAr["ACK"];
	
	return true;
	
	} else  {
		
		if(@$httpParsedResponseAr["L_ERRORCODE0"] == 10002){
			
			
			die("Invalid login credentials configured.  Ensure your signature, api login and api password are correct.  Response dump from PayPal follows \n" . print_r($httpParsedResponseAr,1));
			
		}
		
		if($cfg->gateway_mode == _TEST_MODE){
		
			echo "This information is only shown in test mode:<br />";
			echo "You said:" . print_r($nvpStr,1) . "<br />";
			echo "Paypal said:" . print_r($httpParsedResponseAr,1);
				
		}
		 
		$row->xaction_result = urldecode(@$httpParsedResponseAr["L_SHORTMESSAGE0"] . ':' . @$httpParsedResponseAr["L_LONGMESSAGE0"]);
		
		
		return false;
	}
}

/**
 * Send HTTP POST Request
 *
 * @param	string	The API method name
 * @param	string	The POST Message fields in &name=value pair format
 * @return	array	Parsed HTTP Response body
 */
function PPHttpPost($methodName_, $nvpStr_) {
	global $environment;
	global $cfg;

	// Set up your API credentials, PayPal end point, and API version.
	$API_UserName = urlencode($cfg->wpp_user);
	$API_Password = urlencode($cfg->wpp_password);
	$API_Signature = urlencode($cfg->wpp_signature);
	
	$API_Endpoint = "https://api-3t.paypal.com/nvp";
	
	if($cfg->gateway_mode == _TEST_MODE || $cfg->gateway_mode == _DEBUG_MODE){
		$API_Endpoint = "https://api-3t.sandbox.paypal.com/nvp";
	}
	
	$version = urlencode('51.0');

	// Set the curl parameters.
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $API_Endpoint);
	curl_setopt($ch, CURLOPT_VERBOSE, 1);

	// Turn off the server and peer verification (TrustManager Concept).
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);

	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_POST, 1);

	// Set the API operation, version, and API signature in the request.
	$nvpreq = "METHOD=$methodName_&VERSION=$version&PWD=$API_Password&USER=$API_UserName&SIGNATURE=$API_Signature$nvpStr_";


	if($cfg->gateway_mode == _DEBUG_MODE){
		dumpArray($nvpreq);
	}	
	
	// Set the request as a POST FIELD for curl.
	curl_setopt($ch, CURLOPT_POSTFIELDS, $nvpreq);
	
	// Get response from the server.
	$httpResponse = curl_exec($ch);

	if($cfg->gateway_mode == _DEBUG_MODE){
		dumpArray($httpResponse);
	}	
		
	if(!$httpResponse) {
		exit("$methodName_ failed: ".curl_error($ch).'('.curl_errno($ch).')');
	}

	// Extract the response details.
	$httpResponseAr = explode("&", $httpResponse);

	$httpParsedResponseAr = array();
	foreach ($httpResponseAr as $i => $value) {
		$tmpAr = explode("=", $value);
		if(sizeof($tmpAr) > 1) {
			$httpParsedResponseAr[$tmpAr[0]] = $tmpAr[1];
		}
	}

	if((0 == sizeof($httpParsedResponseAr)) || !array_key_exists('ACK', $httpParsedResponseAr)) {
		exit("Invalid HTTP Response for POST request($nvpreq) to $API_Endpoint.");
	}

	return $httpParsedResponseAr;
}

		
?>