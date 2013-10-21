<?php
/**
 * @version		$Id: authorizenet.php 375 2010-02-11 19:32:16Z fatica $
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

//error_reporting(E_ALL);

function process (&$row){
global $cfg;

if(!$row->country_currency){
	$row->country_currency = "USD";
}

if(!$row->country){
	$row->country = "United States";
}

$method = '';

$row->other .= "|" . $row->invoice;


$description = getDescription();

$authnet_values				= array
(
	"x_login"				=> $cfg->auth_net_login,
	"x_version"				=> "3.1",
	"x_delim_char"			=> "|",
	"x_delim_data"			=> "TRUE",
	"x_url"					=> "FALSE",
	"x_type"				=> "AUTH_CAPTURE",
	"x_method"				=> "CC",
 	"x_tran_key"			=> $cfg->auth_net_xaction,
 	"x_relay_response"		=> "FALSE",
	"x_card_num"			=> $row->credit_card,
	"x_card_code"			=> $row->cvv,
	"x_exp_date"			=> $row->expiration,
	"x_description"			=> $description,
	"x_amount"				=> $row->amount,
	"x_first_name"			=> $row->firstname,
	"x_last_name"			=> $row->lastname,
	"x_address"				=> $row->address1 . " " . $row->address2,
	"x_city"				=> $row->city,
	"x_state"				=> $row->state,
	"x_zip"					=> $row->postalcode,
	"x_country"				=> $row->country,
	"x_email"				=> $row->email,
	"x_currency_code"		=> $row->country_currency,
	"x_invoice_num"			=> $row->invoice
);

//eCheck values
if($cfg->auth_net_echeck == 1){
	
	if($_POST['method'] == "ECHECK"){
		
		$authnet_values["x_bank_aba_code"] = urlencode($_POST[x_bank_aba_code]);
		$authnet_values["x_bank_acct_num"] =  urlencode($_POST[x_bank_acct_num]);
		$authnet_values["x_bank_acct_type"] =  urlencode($_POST[x_bank_acct_type]);
		$authnet_values["x_bank_name"] =   urlencode($_POST[x_bank_name]);
		$authnet_values["x_bank_acct_name"] =  urlencode($_POST[x_bank_acct_name]);
		$authnet_values["x_bank_check_number"] =  urlencode($_POST[x_bank_check_number]);	
		$authnet_values["x_method"] = "ECHECK"; 
	}
	
}


//some validation
if(!$cfg->auth_net_login){
	jsAlertBack("No authorize.net login configured");	
}

//some validation
if(!$cfg->auth_net_xaction){
	jsAlertBack("No authorize.net transaction key configured");	
}

//validate the recurring donation
if(strlen($row->unit) > 0 && strlen($row->duration) > 0 && strlen($row->length) > 0 && $_POST['interval'] > 0){
	$recurr = true;	
}else {
	$recurr = false;	
}

$subscriptionid = "";

$subscriptionid = addslashes(@$_POST['subscriptionid']);

if(strlen($subscriptionid) > 0){
	$recurr = true;
}

//set the gateway address
if($cfg->gateway_mode == _TEST_MODE || $cfg->gateway_mode == _DEBUG_MODE){
	
	if($recurr === true){
		$url = 'https://apitest.authorize.net/xml/v1/request.api';	
	}else{
		$url = 'https://test.authorize.net/gateway/transact.dll';
	}
}else{
	
	if($recurr === true){
		$url = 'https://api.authorize.net/xml/v1/request.api';
	}else{
		$url = 'https://secure.authorize.net/gateway/transact.dll';
	}
}

$ch = curl_init($url);

if($ch === false){
	jsAlertBack("Error creating cURL object.  cURL is required to use this package.  See http://us2.php.net/curl");
}

//if this is a recurring donation
if($recurr === true){
	
	//zero pad to four digits
	if(strlen($row->expiration) == 3){
		$row->expiration = "0" . $row->expiration;
	}	
	
	if(strlen($subscriptionid) > 0){
		
		//build xml to post
		$fields = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" .
			"<ARBUpdateSubscriptionRequest xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">" .
			"<merchantAuthentication>".
				"<name>" . $cfg->auth_net_login . "</name>".
				"<transactionKey>" .$cfg->auth_net_xaction . "</transactionKey>".
			"</merchantAuthentication>".
			"<refId>" . $row->id . "</refId>".
			"<subscriptionId>$subscriptionid</subscriptionId>".
			"<subscription>".
			"<name>" . addslashes($cfg->sitename) . "</name>".
			"<payment>";
		
			//eCheck values
			if($cfg->auth_net_echeck == 1){
				
				if($_POST['method'] == "ECHECK"){
					
					$echeckType = '';
					
					$_POST[x_bank_acct_type] = strtolower($_POST[x_bank_acct_type]);
					
					if($_POST[x_bank_acct_type] == "businesschecking"){
						$_POST[x_bank_acct_type] = "businessChecking";
						$echeckType="CCD";
						
					}else{
						$echeckType="WEB";
					}
						
				$fields .= 
				"<bankAccount>".
					"<accountType>" .  urlencode($_POST[x_bank_acct_type]). "</accountType>".
					"<routingNumber>" .  urlencode($_POST[x_bank_aba_code]) . "</routingNumber>".
					"<accountNumber>" .  urlencode($_POST[x_bank_acct_num]) . "</accountNumber>".
					"<nameOnAccount>" . urlencode($_POST[x_bank_acct_name]) . "</nameOnAccount>".
					"<echeckType>". $echeckType."</echeckType>".
					"<bankName>" .  urlencode($_POST[x_bank_name]) . "</bankName>".
				"</bankAccount>";					
				}else{
				
				//credit card
			
				$fields .= "<creditCard>".
					"<cardNumber>" . $row->credit_card . "</cardNumber>".
					"<expirationDate>" . $row->expiration . "</expirationDate>".
				"</creditCard>";					
				}
			}else{
				
				//credit card
			
				$fields .= "<creditCard>".
					"<cardNumber>" . $row->credit_card . "</cardNumber>".
					"<expirationDate>" . $row->expiration . "</expirationDate>".
				"</creditCard>";			
			}

			$fields .= "</payment>".
				"<billTo>".
				"<firstName>". $row->firstname . "</firstName>".
				"<lastName>" .$row->lastname . "</lastName>".
				"<address>" . $row->address1 . " " . $row->address2 . "</address>" . 
				"<city>" . $row->city . "</city>" . 
				"<state>" . $row->state . "</state>" . 
				"<zip>" . $row->postalcode . "</zip>" .
				"<country>" . $row->country . "</country>" .
				"</billTo>".
				"</subscription>".
				"</ARBUpdateSubscriptionRequest>";
			
	}else{
		
		
	//start date is now
	$startDate = date("Y-m-d");
	
	$trialAmount = "0";
	
	//once a month
	$unit = addslashes($row->unit);
	
	//the interval length E.g. 3 means every three months
	$length = (int)$row->length;
	
	//bill for selected length of time
	if((int)$row->duration == 9999){	
		$totalOccurrences = (int)$row->duration;
	}else{
		
		if($unit == "days"){
			//e.g. every 36 days for 1 year =  10.138 or 10 occurrences.
			$totalOccurrences = (int)floor(($row->duration * 365) / $length);
		}elseif ($unit == "months"){
			//e.g. every 36 days for 1 year =  10.138 or 10 occurrences.
			$totalMonths = (int)$row->duration * 12;
			$totalOccurrences = (int)floor($totalMonths / $length);		
		}else{
			jsAlertBack("AUTHNET: Invalid unit passed to recurring transaction");	
		}

	}
		
		
		//build xml to post
		$fields = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" .
			"<ARBCreateSubscriptionRequest xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">" .
			"<merchantAuthentication>".
				"<name>" . $cfg->auth_net_login . "</name>".
				"<transactionKey>" .$cfg->auth_net_xaction . "</transactionKey>".
			"</merchantAuthentication>".
			"<refId>" . $row->id . "</refId>".
			"<subscription>".
			"<name>" . addslashes($cfg->sitename) . "</name>".
			"<paymentSchedule>".
				"<interval>".
					"<length>". $length ."</length>".
						"<unit>". $unit ."</unit>".
					"</interval>".
				"<startDate>" . $startDate . "</startDate>".
				"<totalOccurrences>". $totalOccurrences . "</totalOccurrences>".
				"<trialOccurrences>". 0 . "</trialOccurrences>".
			"</paymentSchedule>".
			"<amount>". $row->amount ."</amount>".
			"<trialAmount>". $trialAmount ."</trialAmount>".
			"<payment>";
	
			//eCheck values
			if($cfg->auth_net_echeck == 1){
				
				if($_POST['method'] == "ECHECK"){
					
					$echeckType = '';
					
					$_POST[x_bank_acct_type] = strtolower($_POST[x_bank_acct_type]);
					
					if($_POST[x_bank_acct_type] == "businesschecking"){
						$_POST[x_bank_acct_type] = "businessChecking";
						$echeckType="CCD";
						
					}else{
						$echeckType="WEB";
					}
					
					
							
				$fields .= 
				"<bankAccount>".
					"<accountType>" .  urlencode($_POST[x_bank_acct_type]). "</accountType>".
					"<routingNumber>" .  urlencode($_POST[x_bank_aba_code]) . "</routingNumber>".
					"<accountNumber>" .  urlencode($_POST[x_bank_acct_num]) . "</accountNumber>".
					"<nameOnAccount>" . urlencode($_POST[x_bank_acct_name]) . "</nameOnAccount>".
					"<echeckType>". $echeckType."</echeckType>".
					"<bankName>" .  urlencode($_POST[x_bank_name]) . "</bankName>".
				"</bankAccount>";					
				}else{
				
				//credit card
			
				$fields .= "<creditCard>".
					"<cardNumber>" . $row->credit_card . "</cardNumber>".
					"<expirationDate>" . $row->expiration . "</expirationDate>".
				"</creditCard>";					
				}
			}else{
				
				//credit card
			
				$fields .= "<creditCard>".
					"<cardNumber>" . $row->credit_card . "</cardNumber>".
					"<expirationDate>" . $row->expiration . "</expirationDate>".
				"</creditCard>";			
				
				
			}
	
			
		
		$fields .= "</payment>".
			"<billTo>".
			"<firstName>". $row->firstname . "</firstName>".
			"<lastName>" .$row->lastname . "</lastName>".
			"<address>" . $row->address1 . " " . $row->address2 . "</address>" . 
			"<city>" . $row->city . "</city>" . 
			"<state>" . $row->state . "</state>" . 
			"<zip>" . $row->postalcode . "</zip>" .
			"<country>" . $row->country . "</country>" .
			"</billTo>".
			"</subscription>".
			"</ARBCreateSubscriptionRequest>";

	}	

	curl_setopt($ch, @CURLOPT_HTTPHEADER,array('Content-Type: application/xml')); 
	
}else{

	$fields = "";
	//non recurring donation
	foreach( $authnet_values as $key => $value ) $fields .= "$key=" . urlencode( $value ) . "&";
	
}

curl_setopt($ch, CURLOPT_HEADER, FALSE); // set to 0 to eliminate header info from response
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE); // Returns response data instead of TRUE(1)
curl_setopt($ch, CURLOPT_POSTFIELDS, rtrim( $fields, "& " )); // use HTTP POST to send form data
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); // uncomment this line if you get no gateway response. ###

$resp = curl_exec($ch); //execute post and get results
curl_close ($ch);

//did we get a response?
if(strlen($resp) <= 0){
	jsAlertBack("No response from payment gateway: " . _CD_AUTHNET_COMERR) ;
}

if($recurr === true){
	
	list ($resultcode, $retcode, $retcode, $retmessage, $transid) = parse_return($resp);
	

	if(strtolower($retcode) != "ok"){
		
		if($cfg->gateway_mode == _DEBUG_MODE){
			print_r($fields);
			dumpArray($resp);
			dumpArray($url);
			die("DEBUG");
		}

		$row->xaction_result = $retmessage;
			
		return false;
		
	}else{

		if($cfg->gateway_mode == _DEBUG_MODE){
			print_r($fields);
			dumpArray($resp);
			dumpArray($url);
			die("DEBUG");
		}
						
		//let the calling function know our result and response message
		$row->xaction_result = $retmessage;
		
		//if we are updating, return the subscriptionId since ARB does not return when updating
		if(strlen($subscriptionid) > 0){
			$transid = $subscriptionid;
		}		
		//transid in this case is actually a subscriptionID to reference the recurring transaction later
		$row->xaction_id = $transid;
		return true;	
	}
	
}else{

	//did we get a sensical response?
	$p = strpos($resp, "|");

	//parse it
	$response = explode("|",$resp);
	
	/*$retval = $response[0];
	$retcode = $response[2];
	$transid = $response[7];
	$retmessage = $response[3];*/

	$retval = $response[0];
	$retcode = $response[2];
	$transid = $response[7];
	$retmessage = $response[2] . ":" . $response[3] . ":" . $response[4];

	//transaction was accepted
	if($retval=="1"){
		
		//let the calling function know our result and response message
		$row->xaction_result = $retmessage;
		$row->xaction_id = $transid;
		
		if($cfg->gateway_mode == _DEBUG_MODE){
			print_r($fields);
			dumpArray($response);
			dumpArray($url);
			die("DEBUG");
		}
		
		return true;
		
	//transaction was declined
	}elseif($retval=="2"){
		$row->xaction_result = $retmessage;
		$row->xaction_id = $transid;
		
		if($cfg->gateway_mode == _DEBUG_MODE){
			print_r($fields);
			dumpArray($response);
			dumpArray($url);
			die("DEBUG");
		}		
		
		return false;
	
	//this gets triggered for more technical reasons, so lets show the admin some detailed code
	}elseif($retval=="3"){
		
		//if they click submit twice, the second donation shouldn't cause an error, but will be flagged in the db as a dup
		if($retcode == "11"){
			$row->xaction_result = "Duplicate";
			return true;	
		}
		
		if($cfg->gateway_mode == _DEBUG_MODE){
			print_r($fields);
			dumpArray($response);
			dumpArray($url);
			die("DEBUG");
		}
		
		$row->xaction_result = $retmessage;
		
		return false;
	}elseif($retval=="4"){

		//let the calling function know our result and response message
		$row->xaction_result = $retmessage;
		$row->xaction_id = $transid;
		
		if($cfg->gateway_mode == _DEBUG_MODE){
			print_r($fields);
			dumpArray($response);
			dumpArray($url);
			die("DEBUG");
		}
		
		return true;
				
	}else{
		return false;
	}	
}
	
return false;
}


//function to parse Authorize.net response
function parse_return($content)
{
	$refId = substring_between($content,'<refId>','</refId>');
	$resultCode = substring_between($content,'<resultCode>','</resultCode>');
	$code = substring_between($content,'<code>','</code>');
	$text = substring_between($content,'<text>','</text>');
	$subscriptionId = substring_between($content,'<subscriptionId>','</subscriptionId>');
	return array ($refId, $resultCode, $code, $text, $subscriptionId);
}

	
//helper function for parsing response
function substring_between($haystack,$start,$end) 
{
	if (strpos($haystack,$start) === false || strpos($haystack,$end) === false) 
	{
		return false;
	} 
	else 
	{
		$start_position = strpos($haystack,$start)+strlen($start);
		$end_position = strpos($haystack,$end);
		return substr($haystack,$start_position,$end_position-$start_position);
	}
}
?>