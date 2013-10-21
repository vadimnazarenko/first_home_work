<?php
/**
 * @version		$Id: payflow_pro.php 337 2009-12-15 23:01:05Z fatica $
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


$description = getDescription();

	if(strlen($row->expiration) == 3){
		$row->expiration = '0' . $row->expiration;
	}

	$transaction = array(
	
		'TRXTYPE'    => 'S',
		'TENDER'     => 'C',
		'AMT'        => urlencode($row->amount),
		'ACCT'       => $row->credit_card,
		'EXPDATE'    => $row->expiration,
		'FREIGHTAMT'    => 0,
		'TAXAMT'    => 0,
		'FIRSTNAME'    => urlencode($row->firstname),
		'LASTNAME'    => urlencode($row->lastname),
		'ADDRESS'    => urlencode($row->address1 . " " . $row->address2),
		'CITY'    => urlencode($row->city),
		'STATE'    => urlencode($row->state),
		'ZIP'    => urlencode($row->postalcode),
		'COUNTRY'    => urlencode($row->country),
		'EMAIL'    => urlencode($row->email),
		'CVV2'        => urlencode($row->cvv),
		'DESC'        => urlencode($description) 
	);

	$response = pfpro_process($transaction);
	
	if(strtolower($response['RESPMSG'])=='approved'){
		
		$row->xaction_id = $response['PNREF'];
		$row->xaction_result = $response['RESPMSG'];
		
		if($cfg->gateway_mode == _DEBUG_MODE){
			dumpArray($transaction);
			dumpArray($url);
			die();
		}
				
		return true;
		
	}else{
		
		if($cfg->gateway_mode == _DEBUG_MODE){
			dumpArray($transaction);
			dumpArray($url);
			die();
		}
				
		$row->xaction_result = $response['RESPMSG'];
		return false;	
	}
}
	// API functions and error handling
	function fetch_data($unique_id, $submiturl, $data) 
	{
		// get data ready for API
		//$tempstr = $_POST['AMT'].date('YmdGis'); 
		$request_id = md5($unique_id);
		
		$user_agent = $_SERVER['HTTP_USER_AGENT'];
		
		$headers = array();
		
		// Here's your custom headers; adjust appropriately for your setup:
		$headers[] = "Content-Type: text/namevalue"; //or maybe text/xml
		$headers[] = "X-VPS-Timeout: 15";
		$headers[] = "X-VPS-VIT-OS-Name: Linux";  // Name of your OS
		$headers[] = "X-VPS-VIT-OS-Version: RHEL 4";  // OS Version
		$headers[] = "X-VPS-VIT-Client-Type: PHP/cURL";  // What you are using
		$headers[] = "X-VPS-VIT-Client-Version: 0.01";  // For your info
		$headers[] = "X-VPS-VIT-Client-Architecture: x86";  // For your info
		
		// Get your Certification ID from Todd (payflowintegrator@paypal.com)
		$headers[] = "X-VPS-VIT-Client-Certification-Id: 73bcc2113ba8794e8b193e9d011b7fae"; 
		$headers[] = "X-VPS-VIT-Integration-Product: FC_Donations";  // For your info, would populate with application name
		$headers[] = "X-VPS-VIT-Integration-Version: 1.00"; // Application version
		$headers[] = "X-VPS-Request-ID: " . $request_id;
	
		$ch = curl_init(); 
		
		if($ch === false){
			die("Error creating cURL object.  cURL is required to use this software.  See http://us2.php.net/curl");
		}	
			
		curl_setopt($ch, CURLOPT_URL, $submiturl);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		curl_setopt($ch, CURLOPT_USERAGENT, $user_agent);
		curl_setopt($ch, CURLOPT_HEADER, 1); // tells curl to include headers in response
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); // return into a variable
		curl_setopt($ch, CURLOPT_TIMEOUT, 90); // times out after 90 secs
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0); // this line makes it work under https
		curl_setopt($ch, CURLOPT_POSTFIELDS, $data); //adding POST data
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,  2); //verifies ssl certificate
		curl_setopt($ch, CURLOPT_FORBID_REUSE, TRUE); //forces closure of connection when done 
		curl_setopt($ch, CURLOPT_POST, 1); //data sent as POST 
								
		$result = curl_exec($ch);
		$headers = curl_getinfo($ch);
						
		curl_close($ch);
		
		$result = strstr($result, "RESULT");
		
		// prepare responses into array
	 	$proArray = array();
	 	
		while(strlen($result)){
			// name
			$keypos= strpos($result,'=');
			$keyval = substr($result,0,$keypos);
			// value
			$valuepos = strpos($result,'&') ? strpos($result,'&'): strlen($result);
			$valval = substr($result,$keypos+1,$valuepos-$keypos-1);
			// decoding the respose
			$proArray[$keyval] = $valval;
			$result = substr($result,$valuepos+1,strlen($result));
		}
	
		return $proArray;
	}	 

        function pfpro_process($transaction, $url=pfpro_defaulthost, $port=pfpro_defaultport, $timeout=pfpro_defaulttimeout, $proxy_password=pfpro_proxypassword)
        {  	
        	global $cfg;
        	
        	if(!(is_array($transaction)))
                        return(NULL);
			
			$user = $cfg->payflow_user; 
			$vendor = $cfg->payflow_vendor; 
			$partner = $cfg->payflow_partner; 
			$password = $cfg->payflow_password; 
			
			define(_MAX_RETRY,5);
			
			if($cfg->gateway_mode == _TEST_MODE){
				$submiturl = 'https://pilot-payflowpro.paypal.com';
			} else {
				$submiturl = 'https://payflowpro.paypal.com';
			}

			// Other information
			$ipaddr = addslashes($_SERVER['REMOTE_ADDR']);
			
			$paypal = 'USER='. $user.'&VENDOR='. $vendor .'&PARTNER='.$partner.'&PWD='.$password;
			
			$data = $paypal;
			$data .= '&TENDER=' .$transaction['TENDER'];
			$data .= '&TRXTYPE=' .$transaction['TRXTYPE'];		// C - Direct Payment using credit card, P - Express Checkout using PayPal account
			
			//creating a recurring profile			
			if($transaction['ACTION'] == 'A'){
				$data .= '&ACTION='.$transaction['ACTION'];
				$data .= '&PROFILENAME='.$transaction['PROFILENAME'];
				$data .= '&PAYPERIOD='.$transaction['PAYPERIOD'];
				$data .= '&START='.$transaction['START'];
				$data .= '&TERM='.$transaction['TERM'];
			}
			
			
			$data .= '&ACCT='.$transaction['ACCT'];
			$data .= '&CVV2='.$transaction['CVV2'];
			$data .= '&EXPDATE='.$transaction['EXPDATE'];
			$data .= '&ACCTTYPE='.$transaction['ACCTTYPE'];
			$data .= '&AMT='.$transaction['AMT'];
			$data .= '&CURRENCY='.$transaction['CURRENCY'];
			$data .= '&FIRSTNAME='.$transaction['FIRSTNAME'];
			$data .= '&LASTNAME='.$transaction['LASTNAME'];
			$data .= '&STREET='.$transaction['ADDRESS'];
			$data .= '&SHIPTOSTREET='.$transaction['ADDRESS'];
			$data .= '&SHIPTOCITY='.$transaction['CITY'];
			$data .= '&CITY='.$transaction['CITY'];
			$data .= '&SHIPTOSTATE='.$transaction['STATE'];
			$data .= '&STATE='.$transaction['STATE'];
			$data .= '&ZIP='.$transaction['ZIP'];
			$data .= '&SHIPTOZIP='.$transaction['ZIP'];
			$data .= '&COUNTRY='.$transaction['COUNTRY'];
			$data .= '&COUNTRYCODE='.$transaction['COUNTRY'];
			$data .= '&EMAIL='.$transaction['EMAIL'];
			$data .= '&CLIENTIP='.$ipaddr;
			$data .= '&COMMENT1=com_donate';
			$data .= '&ORDERDESC='.$transaction['DESC'];
			
			//not required after php 4.2.-
			srand(make_seed());
			$randval = rand();
			
			$unique_id = $randval;
		
			// call function to return name-value pair
			
			$nvp = null;
			
			
			//try up to 5 times to get data from PFP
			for($x = 0; $x < _MAX_RETRY; $x++){
	
				$nvp = fetch_data($unique_id, $submiturl, $data);
	
				if($nvp == null){
					//lets retry
				}else{
					
					if($cfg->gateway_mode == _DEBUG_MODE){
						dumpArray($data);
						dumpArray($nvp);
						die();
					}
								
					//got it!
					break;
				}
			}
			
		    return($nvp);
	    
        }
        
		function make_seed()
		{
		    list($usec, $sec) = explode(' ', microtime());
		    return (float) $sec + ((float) $usec * 100000);
		}
?>