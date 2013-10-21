<?php
/**
 * @version		$Id: donate.php 375 2010-02-11 19:32:16Z fatica $
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


require_once(  "config.class.php" );


/**
 * TODO, load the language dynamically
 */

require_once(  "donate.html.php" );
require_once(  "donate.class.php" );

//set the global CMS config
$cfg = new config();
$cfg->setCMSConfig();

//for Joomla
$GLOBALS['cfg'] = $cfg;


$configuration_id = (int)getActiveConfiguration();

//initialize the application config
setApplicationConfig($configuration_id);

//load the language
require_once(getLanguageFile());

if(@$cfg->gateway_mode == _TEST_MODE){
	//show errors in test mode
	ini_set('display_errors', 1);
	ini_set('log_errors', 0);
	error_reporting(E_ALL ^ E_NOTICE);
}



//get our task
@$id = (int)addslashes($_REQUEST["id"]);
$task = mosGetParam($_REQUEST,'task');

switch ($task) {
	
	case 'thermoxml':{
		showThermoXML();
	}break;

	case 'donate':
		processDonation();
	break;

	case 'show':
		showDonations($id);
	break;

	case 'delete':
		deleteDonations();
	break;

	case 'thank':
		showThankYou();
	break;

	case 'export':
		exportDonations();
	break;

	case 'ipn':
		verifyDonation();
	break;
	
	case 'spu':
		handleSilentPost();		
	break;
	
	case 'linkspu':
		handlePayflowLinkSilentPost();
	break;	

	case 'configure':{
		showConfiguration();
	}break;

	case 'saveconfiguration':{
		saveConfiguration();
	}break;

	case 'deleteconfig':{
		deleteConfiguration();
	}break;
	

	/**
	 * AJAX
	 */
	case 'checkusername':{
		checkUsername(mosGetParam($_GET,'username'));
	}break;

	case 'updatedonation':
	default:

		if(checkIsAdmin()){
			showDonations($id);
		}else{

	if(@$cfg->force_https == 1 && checkIsAdmin() === false){

		//safer that $_SERVER['https']
		if(!@$cfg->isSSL()){
	
			$url = "https://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
	
			if(strpos($url,"?") === false){
				$url .= "?redir=1";
			}else{
				$url .= "&redir=1";
			}
	
			//did we already try to redirect to https?
			if(@$_GET['redir'] == 1){
	
				//double check that SERVER_PORT was not returning bogus values
				//echo '<h1>Cannot redirect to https. Unable to establish secure (HTTPS is : ' .$_SERVER['HTTPS'] .' SERVER_PORT is:'.$_SERVER['SERVER_PORT'].') connection.  Please turn "Force HTTPS" off or configure your server to allow HTTPS connections.</h1>';
	
			}else{
				header("Location: $url");
			}
		}

	}


				showForm();

		}

	break;
}

function getModuleParameters(){
	global $cfg;
	$params = "";
	$values = array();
	
	$module_id = (int) $_GET['module_id'];
	
	if($module_id > 0){
	
	$sql = "SELECT params FROM #__modules m 
			WHERE m.module = 'mod_donate' and id = $module_id LIMIT 1";
	}
	
	$cfg->database->setQuery($sql);
	$params = $cfg->database->loadResult();	
	
	$params_explode = explode("\n",$params);
	
	foreach ($params_explode as $set){

		$pair = explode("=",$set);
		
		$values[$pair[0]]=$pair[1];

	}

	return $values;
}


function getFundsRaised($configuration_id){
	global $cfg;
	
	if($configuration_id > 0){

		$catCondition = ' AND (configuration_id=' . $configuration_id .')';
		
		$query = 'SELECT sum(amount) as total FROM #__donations WHERE amount > 0 ' . $catCondition;		
		$cfg->database->setQuery($query);
		$total = $cfg->database->loadResult();

		return $total;
	}		
}

function showThermoXML(){

$values = getModuleParameters();
$total = (int)getFundsRaised($values['configuration_id']);

$markers = explode(",",$values['scale_markers']);


echo '<?xml version="1.0" encoding="utf-8"?>
<thermometer>
	<goal goalNum="'.(int)$values['thermo_max'].'"><![CDATA[$'.(int)$values['thermo_max'].']]></goal>
	<current currentNum="'.$total.'" />
	<marks>';

foreach ($markers as $mark){
	echo '
		<mark markNum="' . $mark . '" />';
}
echo'
	</marks>
	<currency currencySymbol="$" />
</thermometer>';
}

//'editor2', $cfg->thank_you_page_message , 'thank_you_page_message', '75%;', '200', '75', '20'
function _editorArea( $name, $value,$id,$width,$rows,$cols, $number ) {

	if(defined('_JEXEC')){
		$editor = &JFactory::getEditor();
		echo $editor->display($id, $value , $width, '300',$rows, $cols ) ;
	}else{
		editorArea( $name, $value,$id,$width,$rows,$cols, $number );
		//echo "<textarea rows='$rows' cols='$cols' name='$name'>$value</textarea>";
	}

	echo '<br style="clear:both;"/>';
}

function checkUsername($username){
global $cfg;

	//sanitize the input
	$username = strtolower(addslashes(trim($username)));

	if($username == "admin"){
		echo 1;
		return;
	}
	if(strlen($username) <= 3){
		echo 1;
		return;
	}

	$sql = "SELECT id FROM  #__users WHERE lower(username) = '$username' LIMIT 1";

	$cfg->database->setQuery($sql);
	$user_id = (int)$cfg->database->loadResult();

	echo $user_id;
}

/**
 * Returns a sanitized transaction description
 *
 */
function getDescription(){
global $cfg;

	if(strlen(@$cfg->transaction_comment) > 0){
		$description = addslashes($cfg->transaction_comment);
	}else{
		$description = addslashes($cfg->sitename);
	}

	if(strlen($description) > 255){
		$description = substr($description,0,255);
	}

return $description;

}


/**
 * "Multiplatform" method of detecting admin side operations
 *
 * @return unknown
 */
function checkIsAdmin(){

	if(strpos($_SERVER['REQUEST_URI'],'/administrator') !== false){
		return true;
	}

	return false;

}

/**
 * Get the two-letter code for this ID
 *
 */
function getCountryISOCode($id){
global $cfg;

	$id = (int)$id;

	$sql = "select countries_iso_code_2 from #__donate_countries WHERE Id=$id LIMIT 1";

	$cfg->database->setQuery($sql);
	$code = $cfg->database->loadResult();

	return trim($code);

}

/**
 * Responds to an IPN from paypal_standard
 * Paypal is the client to this request.
 */
function verifyDonation(){
global $cfg;

//build the response
$fields = 'cmd=_notify-validate';
$value = "";

foreach ($_POST as $key => $value) {

	if($key == "option" || $key=="task"){
		continue;
	}

	$fields .= "&$key=$value";
}

if($cfg->gateway_mode != _TEST_MODE){
	$url = 'https://www.paypal.com/cgi-bin/webscr';
}else{
	$url = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
}

if(!function_exists('curl_init')){

	sendEmail($cfg->admin_email,"IPN Failed, no cURL Support","Your server does not support the PHP cURL, which is required for PayPal IPN.  See http://us2.php.net/curl");
	die("Error creating cURL object.  cURL is required to use this package.  See http://us2.php.net/curl");

}

$ch = curl_init($url);

if($ch === false){

	sendEmail($cfg->admin_email,"cURL object creation failed","Your server does not support the PHP cURL, which is required for PayPal IPN.  See http://us2.php.net/curl");
	die("Error creating cURL object.  cURL is required to use this package.  See http://us2.php.net/curl");

}

curl_setopt($ch, CURLOPT_HEADER, FALSE); // set to 0 to eliminate header info from response
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE); // Returns response data instead of TRUE(1)
curl_setopt($ch, CURLOPT_POSTFIELDS, rtrim( $fields, "& " )); // use HTTP POST to send form data
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); // uncomment this line if you get no gateway response. ###

$res = curl_exec($ch); //execute post and get results
curl_close ($ch);

//did we get a response?
if(strlen($res) <= 0){
	sendEmail($cfg->admin_email,"","PayPal IPN Failed","We did not get a response from the PayPal Gateway when responding to an IPN Post from PayPal: <br />" . print_r($_POST,1));
}

//paypal validated the transaction
if (strcmp ($res, "VERIFIED") == 0) {

	//update the transaction in the back end as valide
	$item_name = addslashes(mosGetParam($_POST,'item_name'));
	$item_number = addslashes( mosGetParam($_POST,'item_number'));
	$payment_status =  addslashes(mosGetParam($_POST,'payment_status'));
	$payment_amount =  addslashes(mosGetParam($_POST,'mc_gross'));
	$payment_currency =  addslashes(mosGetParam($_POST,'mc_currency'));
	$txn_id =  addslashes(mosGetParam($_POST,'txn_id'));
	$receiver_email = addslashes(mosGetParam($_POST,'receiver_email'));
	$payer_email =  addslashes(mosGetParam($_POST,'payer_email'));

	$configuration_id = (int)mosGetParam($_POST,'configuration_id');

	//perform some basic validation on our response
	if($cfg->paypal_account != $receiver_email || !strlen($payer_email) || !strlen($payment_amount)){
		return false;
	}

	//avoid duplicates
	$sql = "SELECT count(*) from #__donations where xactionid='$txn_id'";

	$cfg->database->setQuery($sql);

	//ensure this is not a duplicate
	if($cfg->database->loadResult() == 0){
		
		$sql = "UPDATE #__donations SET xaction_id='$txn_id',xaction_result='$payment_status' WHERE email='$payer_email' and xaction_result='"._CD_DONATE_PENDING."' and amount='$payment_amount'";

		$cfg->database->setQuery($sql);

		if($cfg->database->query()){
			
				if($configuration_id <= 0){
					//get the correct application configuration from the donation
					$sql = "SELECT configuration_id from #__donations where xactionid='$txn_id'";
					$cfg->database->setQuery($sql);
					$configuration_id = (int)$cfg->database->loadResult();
				}

				setApplicationConfig($configuration_id);
					
				if(strlen($payer_email) > 0){
					
					foreach ($row as $key => $val){
						$cfg->thank_you_body = str_replace("%%$key%%",$val,$cfg->thank_you_body);
						$cfg->thank_you_subject = str_replace("%%$key%%",$val,$cfg->thank_you_subject);
					}
					
					if($cfg->gateway_mode == _TEST_MODE){
						$email = $cfg->admin_email;
						$cfg->thank_you_subject = "TEST MODE IPN: " . $cfg->thank_you_subject;
					}
					
					sendEmail($email,$cfg->admin_email,$cfg->thank_you_subject,$cfg->thank_you_body);
				}	
				
			return true;
		}

	}

}else if (strcmp ($res, "INVALID") == 0) {

	sendEmail($cfg->admin_email,"","PayPal IPN Failed","PayPal refused the IPN notification.  Data posted is as follows: <br />" . print_r($_POST,1));
	//paypal did not validate the transaction
	return false;
}

return false;
}


/* Handle the PayflowLink silent post for recurring donations
 * Sample url
 * RESULT=0&AUTHCODE=010101&RESPMSG=Approved&AVSDATA=YNY&PNREF=V63F28770576&HO
 STCODE=&INVOICE=3452345&AMOUNT=117.03&TAX=&METHOD=CC&TYPE=S&DESCRIPTION=1+f
elt+hat%2C+Model+FC&CUSTID=NT1000&NAME=Nancy+Thompson&ADDRESS=1428+Elm+Stre
et&CITY=Springwood&STATE=CA&ZIP=66666&COUNTRY=USA&PHONE=121-325-
4253&FAX=&EMAIL=nthompson@buyalot.com&USER1=User1+value&USER2=&USER3=&USER4
=&USER5=&USER6=&USER7=&USER8=&USER9=&USER10=&NAMETOSHIP=Nancy+Thompson&ADDR
ESSTOSHIP=1428+Elm+Street&CITYTOSHIP=Springwood&STATETOSHIP=&ZIPTOSHIP=6666
6&COUNTRYCODE=USA&PHONETOSHIP=121-325-
4253&FAXTOSHIP=&EMAILTOSHIP=&CSCMATCH=Y
 * Need to add documentation for this.
 * 
 * 
 */
function handlePayflowLinkSilentPost(){
global $cfg;

$values = array();

	//Payflow did not validate the transaction
	//sendEmail("mike@fatica.net","pope@topekacommunityfoundation.org","Payflow Link Billing Debug:","The transaction was not approved.  Data posted is as follows: <br />" . print_r($_POST,1));
	

	$values = array();
	
	$fields = array(
				"RESULT",
				"AUTHCODE",
				"RESPMSG",
				"AVSDATA",
				"PNREF",
				"HOSTCODE",
				"INVOICE",
				"AMOUNT",
				"METHOD",
				"TYPE",
				"DESCRIPTION",
				"CUSTID",
				"NAME",
				"ADDRESS");

	//change to post when not testing
	foreach ($_REQUEST as $key => $value) {
	
		//is the posted variable one of the expected?
		if(array_search($key,$fields) !== false){
	
			$values[$key] = $value;
			
		}
		
	}


//is this successful?
if((int)$values["RESULT"] == 0){

		if($cfg->gateway_mode == _DEBUG_MODE){
			die(print_r($_POST));
		}
		
		$payment_status = addslashes($values["RESULT"] . ":" . $values["RESPMSG"]);
		
		$invoice = addslashes($values["INVOICE"]);
		
		$authcode = addslashes($values["AUTHCODE"]);

		$sql = "UPDATE #__donations SET xaction_id='$authcode',xaction_result='$payment_status' WHERE xaction_result='"._CD_DONATE_PENDING."' AND invoice='$invoice'";

		$cfg->database->setQuery($sql);

		if($cfg->database->query()){
			
			
		}	

		return true;
	
	}else{
		
		//Payflow did not validate the transaction
		sendEmail($cfg->admin_email,"","Payflow Link Billing Failed:" . $values["RESULT"] .":". $values["RESPMSG"],"The transaction was not approved.  Data posted is as follows: <br />" . print_r($_POST,1));
		
		return false;	
	}


}


/* Handle the Authorize.NET silent post for recurring donations
 * Sample url
 * index.php?option=com_donate&task=spn&x_response_code=1&x_response_subcode=1&x_response_reason_code=1&x_response_reason_text=This+transaction+has+been+approved%2E&x_auth_code=QbJHm4&x_avs_code=Y&x_trans_id=2147490176&x_invoice_num=INV12345&x_description=My+test+description&x_amount=0%2E44&x_method=CC&x_type=auth%5Fcapture&x_cust_id=CustId&x_first_name=Firstname&x_last_name=LastNamenardkkwhczdp&x_company=&x_address=&x_city=&x_state=&x_zip=&x_country=&x_phone=&x_fax=&x_email=&x_ship_to_first_name=&x_ship_to_last_name=&x_ship_to_company=&x_ship_to_address=&x_ship_to_city=&x_ship_to_state=&x_ship_to_zip=&x_ship_to_country=&x_tax=0%2E0000&x_duty=0%2E0000&x_freight=0%2E0000&x_tax_exempt=FALSE&x_po_num=&x_MD5_Hash=B9B3D19AEFD7BECC86C5FB3DB717D565&x_cavv_response=2&x_test_request=false&x_subscription_id=101635&x_subscription_paynum=
 * Need to add documentation for this.
 */
function handleSilentPost(){
global $cfg;

	$values = array();
	
	$fields = array(
				"x_response_code",
				"x_response_subcode",
				"x_response_reason_code",
				"x_response_reason_text",
				"x_auth_code",
				"x_avs_code",
				"x_trans_id",
				"x_invoice_num",
				"x_description",
				"x_amount",
				"x_method",
				"x_type",
				"x_cust_id",
				"x_first_name",
				"x_last_name",
				"x_company",
				"x_address",
				"x_city=",
				"x_state",
				"x_zip",
				"x_country",
				"x_phone",
				"x_fax",
				"x_email",
				"x_MD5_Hash",
				"x_cavv_response",
				"x_test_request",
				"x_subscription_id",
				"x_subscription_paynum");

	//change to post when not testing
	foreach ($_REQUEST as $key => $value) {
	
		//is the posted variable one of the expected?
		if(array_search($key,$fields) !== false){
	
			$values[$key] = $value;
			
		}
		
	}
	
	//are we dealing with an ARB?
	if((int)$values["x_subscription_id"] > 0){

		//was this a successful donation?
		if((int)$values["x_response_code"] == 1){
	
			if($cfg->gateway_mode == _DEBUG_MODE){
				die(print_r($_POST));
			}
			
			//save the donation!
			$row = new donation($cfg->database);
			
			//grab a mysql timestamp
			$row->timestamp = date("Y-m-d H:i:s");
			
			//map the posted values to our donation object
			$row->firstname = 		$values['x_first_name'];
			$row->lastname = 		$values['x_last_name'];
			$row->xaction_id = 		$values['x_trans_id'];
			$row->amount = 			(float)$values['x_amount'];
			$row->address1 = 		$values['x_address'];
			$row->address2 = 		"";
			$row->city = 			$values['x_city'];
			$row->state = 			$values['x_state'];
			$row->country = 		getCountryISOCode($values['x_country']);
			$row->postalcode = 		$values['x_zip'];
			$row->email =			$values['x_email'];
			$row->xaction_result = 	$values['x_response_reason_text'];

			//set the country to the correct ISO code
			$row->store();
			
			return true;
		
		}else{
			
			//Authorize.net did not validate the transaction
			sendEmail($cfg->admin_email,"","Authorize.NET Recurring Billing Failed","The transaction was not approved.  Data posted is as follows: <br />" . print_r($_POST,1));
			
			return false;	
		}
		
	}

}


/**
 * Delete a configuration entry
 *
 */
function deleteConfiguration(){
	global $cfg;

	if(strpos(strtolower($cfg->user->usertype),"administrator") !== false){
		//initialize the application config
		$configuration_id = (int)mosGetParam($_REQUEST,'configuration_id');

		if($configuration_id > 0){
			//load the list of states from the database
			$sql = "DELETE FROM #__donate WHERE id=$configuration_id LIMIT 1";

			$cfg->database->setQuery($sql);

			$cfg->database->Query();

			$cfg->fRedirect("?option=com_donate&task=configure&configuration_id=",'Deleted');
		}
	}
}


/**
 * Calculate some stats about our donations
 *
 */
function donateStats(){
	global $cfg;

	$stats = "";
	$stats->count = "";

	$sql = "SELECT count(*) from #__donations WHERE amount > 0";
	$cfg->database->setQuery($sql);
	$stats->count = $cfg->database->loadResult();

	$sql = "SELECT sum(amount) as total from #__donations";
	$cfg->database->setQuery($sql);
	$stats->total = $cfg->database->loadResult();

	HTML_donate::showStats($stats);

}

/**
 * Delete donations, admin only
 *
 */
function deleteDonations(){
global $cfg;
$ids = array();
$id = 0;
$sql = "";
$clause = "";

	if(strpos(strtolower($cfg->user->usertype),"administrator") !== false){
		if(is_array($_POST['id'])){

			foreach ($_POST['id'] as $id ){

				//sanitize each variable
				$ids[] = (int)$id;
			}

			$clause = implode(",",$ids);

			$sql = "DELETE FROM #__donations WHERE id in ($clause)";
			$cfg->database->setQuery($sql);
			$cfg->database->loadResult();

			$cfg->fRedirect("?option=com_donate&task=show",'Deleted');
		}
	}else{
		die(_NOT_AUTH);
	}
}

/**
 * dump and die a pretty-printed array
 *
 * @param unknown_type $arr
 */
function dumpArray($arr){
	echo "<pre>" . print_r($arr,1) . "<pre>";
}

/**
 * Show the donation form!
 *
 */
function showForm(){
	HTML_donate::showForm();
}

/**
 * Show the donation thankyou message
 *
 */
function showThankYou(){
	global $cfg;

$row = new donation($cfg->database);

	
	$id = (int)mosGetParam($_REQUEST,'donation_id',0);
	
	if($id > 0){
	
		$row->load($id);
	
		//do the hotword replacement

		foreach ($row as $key => $val){
			$cfg->thank_you_page_message = str_replace("%%$key%%",$val,$cfg->thank_you_page_message);
		}
	}
	
	//do the hotword replacement
	
	HTML_donate::showThankYou();
}

/**
 * Show the admin list of donations
 *
 * @param unknown_type $id
 */
function showDonations($id){
global $cfg;

$sort = @addslashes($_GET['sort']);
$order = @addslashes($_GET['order']);
$limit = @(int)($_REQUEST['limit']);
$limitstart = @(int)($_REQUEST['limitstart']);
$search = @addslashes($_POST['search']);

$order_clause = "";
$clause = "";
$search_clause = "";
$where = "";
$limit_clause = "";

	if(strpos(strtolower($cfg->user->usertype),"administrator") !== false){

		//looking at one record?
		if($id > 0){
			$clause = " id = $id";
		}

		//searching
		if(strlen($search) > 0){

			$keywords = explode(" ",$search);

			foreach ($keywords as $keyword){

				$search_clause .= "(firstname like '%$keyword%' or
								  lastname like '%$keyword%' or
								  title like '%$keyword%' or
								  organization like '%$keyword%' or
								  credit_card like '%$keyword%' or
								  address1 like '%$keyword%' or
								  address2 like '%$keyword%' or
								  city like '%$keyword%' or
								  state like '%$keyword%' or
								  postalcode like '%$keyword%' or
								  email like '%$keyword%' or
								  phone like '%$keyword%' or
								  amount like '%$keyword%' or
								  xaction_result like '%$keyword%' or
								  xaction_id like '%$keyword%' or
								  program like '%$keyword%' or
								  comments like '%$keyword%') OR ";

			}

			$search_clause = rtrim($search_clause," OR");

		}

		if($order == "ASC"){
			$order = "DESC";
		}else{
			$order = "ASC";
		}

		if(strlen($sort) > 0){
			$order_clause = " ORDER BY $sort $order";
		}

		$limit = @$limit ? $limit : 10;

		$limit_clause	= "\n LIMIT ". $limitstart .", ". $limit;


		$where = "WHERE amount > 0 ";


		if($clause || $search_clause ){
			$where .= " AND ";
		}

		$sql = "SELECT SQL_CALC_FOUND_ROWS * from #__donations $where $clause $search_clause $order_clause $limit_clause";

		$cfg->database->setQuery($sql);
		$rows = $cfg->database->loadObjectList();

		$sql = "SELECT FOUND_ROWS();";
		$cfg->database->setQuery($sql);
		$pageNav->total = $cfg->database->loadResult();

		$pageNav->limitstart = $limitstart;
		$pageNav->limit = $limit;
		
		$donor_rows = null;
		
		//show the related donor records
		if($id > 0){
		
			if(count($rows) == 1){
				
				$sql = "SELECT * FROM #__donations WHERE email = '".addslashes($rows[0]->email)."'";
				$cfg->database->setQuery($sql);
				$donor_rows = $cfg->database->loadObjectList();
				
			}
		}

		HTML_donate::showDonations($rows,$order,$pageNav,$donor_rows);
	}else{
		jsAlertBack("Access denied");
	}
}


/**
 * Export the list of donations to a CSV
 *
 */
function exportDonations(){
global $cfg;

	if(strpos(strtolower($cfg->user->usertype),"administrator") !== false){
		$sql = "SELECT * FROM #__donations ORDER BY id";

		$cfg->database->setQuery($sql);

		$rows = $cfg->database->loadObjectList() or die("No donations");

		$datestamp = date("mdY");

		header("Content-type:text/octect-stream");
	    header("Content-Disposition:attachment;filename=payments_$datestamp.csv");

	    foreach ($rows as $row){

	    	print '"';

	    	foreach ($row as $key=>$val){
	    		echo stripslashes($val)	. ",";
	    	}

	        echo "\"\n";
	    }
	}

exit;
}

function showConfiguration(){
global $cfg;
global $my;


	if(strpos(strtolower($cfg->user->usertype),"administrator") !== false){
		HTML_donate::showConfiguration($cfg);
	}else{
		die("You must be a super administrator to view the configuration");
	}
}


function getUserNameById($id){
	global $cfg;

	$id = (int)$id;

	$sql = "SELECT username from #__users WHERE id=$id";
	$cfg->database->setQuery($sql);
	$username = $cfg->database->loadResult();

	return $username;

}



/**
 * Creates a unique invoice "number" *
 *
 */
function getInvoiceNumber(){
	global $cfg;
	$number = 0;
	$result = null;
				
		//get the current auto increment value
		$sql = 'SHOW TABLE STATUS LIKE "jos_donate_number"';
	
	  	$cfg->database->setQuery($sql);	
	  	$rows = $cfg->database->loadObjectList();
	  	
	  	
	  	$result  = $rows[0];
	  	
	  	$number = $result->Auto_increment;
	  	
	  	//left pad the MLSID with 2 digits
		$number = str_pad($number, 2, "0", STR_PAD_LEFT);
		
		//make it a really big integer
	  	$number = (int)"999" . $number;
	  		  
	  	$next_number = (int)$result->Auto_increment + 1;
	  	
		//set the next auto increment value
		$sql = "ALTER TABLE #__donate_number AUTO_INCREMENT = $next_number";
	  	$cfg->database->setQuery($sql);	  	
	  	$cfg->database->query();
	
	  	return $number;
	  	
}


/* Various syntactic validation functions for supported credit card types*
 * *
 *
 * @return boolean
 */
function validateCreditCard($type,$cc_num){

	$verified = false;

	$type = strtolower($type);

	if($type == "amex") {
		$pattern = "/^([34|37]{2})([0-9]{13})$/";//American Express
		if (preg_match($pattern,$cc_num)) {
			$verified = true;
		}
	}elseif($type == "diners") {
		$pattern = "/^([30|36|38]{2})([0-9]{12})$/";//Diner's Club
		if (preg_match($pattern,$cc_num)) {
			$verified = true;
		}
	} elseif($type == "discover") {
		$pattern = "/^([6011]{4})([0-9]{12})$/";//Discover Card
		if (preg_match($pattern,$cc_num)) {
			$verified = true;
		}
	} elseif($type == "mastercard") {
		$pattern = "/^([51|52|53|54|55]{2})([0-9]{14})$/";//Mastercard
		if (preg_match($pattern,$cc_num)) {
			$verified = true;
		}
	} elseif($type == "visa") {
		$pattern = "/^([4]{1})([0-9]{12,15})$/";//Visa
		if (preg_match($pattern,$cc_num)) {
			$verified = true;
		}
	}else{
		//some other type of credit card, we should just validate it since the gateway will reject it anyway if its bad
		$verified = true;
	}

	return $verified;
}


	/**
	 * Show the "Required"
	 *
	 * @param unknown_type $fieldname
	 */
	function showRequired($fieldname){
		global $cfg;

		if(strpos($cfg->required_fields,trim($fieldname)) !== false){
			echo '<span class="required">*</span>';
		}

	}


/* Process the donation based on the configured processor
 * *
 *
 */
function processDonation(){
global $cfg;
$user_id = 0;
$result = false;
$row = new donation($cfg->database);
$row->bind($_POST);
$amount = 0;
$subscriptionid = "";

	$subscriptionid = addslashes(@$_POST['subscriptionid']);

	//save the custom fieds
	$row->other = addslashes(@$_POST['custom1']) . "|" . addslashes(@$_POST['custom2']) . "|" . addslashes(@$_POST['custom3']);
	$row->other .= "|" . addslashes(@$_POST['custom_cb1']) . "|" . addslashes(@$_POST['custom_cb2']) . "|" . addslashes(@$_POST['custom_cb3']);
		
	//get the amount from either the radio buttons or the custom field
	if(@$_POST['idonate_amts'] > 0){
		
		//remove dollar signs
		$amount = str_replace("$","",$_POST['idonate_amts']);
		
		//remove commas
		$amount = str_replace(",","",$amount);
				
		$row->amount = (float)$amount;
	}
	
	if($_POST['amount'] > 0){

		//remove dollar signs
		$amount = str_replace("$","",$_POST['amount']);
		
		//remove commas
		$amount = str_replace(",","",$amount);
		
		$row->amount = (float)$amount;

	}
	
	if($row->amount == 0 && strlen($subscriptionid) <= 0){
		jsAlertBack(_CD_FORM_NOAMOUNT_ERR);
	}
	
	//check that the donation is at least our minimum donation
	if(@$cfg->minimum_amount > 0 && $row->amount < @$cfg->minimum_amount && strlen($subscriptionid) <= 0){
		jsAlertBack(_CD_FORM_SMALLAMOUNT_ERR . " " . htmlentities($cfg->minimum_amount));
	}

	//check that this is a valid credit card number, if provided
	//NB: This doesn't really matter for us, since the gateway will reject it if its invalid anyway.
	if(strlen(@$_POST['credit_card']) > 0){
		if(validateCreditCard(addslashes($_POST['card_type']),addslashes($_POST['credit_card'])) === true){
			$row->credit_card = addslashes($_POST['credit_card']);
			
			//strip spaces and slashes
			$row->credit_card = str_replace(" ","",$row->credit_card);
			$row->credit_card = str_replace("-","",$row->credit_card);
			$row->credit_card = str_replace("/","",$row->credit_card);
		} else {
			jsAlertBack(_CD_FORM_ERR_CARD);
		}
	}

	//grab a mysql timestamp
	$row->timestamp = date("Y-m-d H:i:s");

	//expiration should look like "0102" (except PayPal WPP which needs "012009")
	if($cfg->show_credit == 1){
		if((int)$_POST['expiration_month'] > 0 && (int)$_POST['expiration_year'] > 0){
			$row->expiration = addslashes($_POST['expiration_month'] . $_POST['expiration_year']);
		}
	}

	//assign a unique id to this record
	$row->invoice = "DONATE_" . getInvoiceNumber();

	//get the processor, cleaning any possible filename hack attempt
	$cfg->processor = basename(addslashes(str_replace(array(DS,'/','\\','.',':'),'',$cfg->processor)));

	if(!$cfg->processor){
		die(_CD_PROCESSOR_CONFIG_ERROR . ": No payment processor is configured");
	}

	//trim any trailing slash
	if($cfg->absolute_path[strlen($cfg->absolute_path) - 1] == DS){
		$cfg->absolute_path = substr($cfg->absolute_path,0,strlen($cfg->absolute_path) - 1);
	}

	$path = $cfg->absolute_path . DS . "components" .DS. "com_donate" .DS. "processors" .DS. "" . $cfg->processor . ".php";

	if(!file_exists($path)){
		die(_CD_PROCESSOR_LOAD_ERROR . ":". $path);
	}else{
		require_once($path);
	}

	//set the country to the correct ISO code
	$row->country = getCountryISOCode($row->country);

	//optionally create a Joomla user account based on the form submittal
	if($cfg->create_user_account == 1){

		if($cfg->show_user_account == 1){

			//can never be too careful
			if($_POST['password'] == $_POST['password_verify']){

				$row->user_id = (int)createUserAccount($_POST['username'],$row->email,$row->firstname . " " . $row->lastname,$_POST['password']);

				if($row->user_id < 0){
					jsAlertBack(_CD_FORM_USEREXISTS_ERR);
				}

			}else{
				jsAlertBack(_CD_FORM_PASSWORD_NOMATCH);
			}

		}else{
			$row->user_id = (int)createUserAccount($row->email,$row->email,$row->firstname . " " . $row->lastname,"");
		}
	}


	//save the user id with the donation
	if($row->user_id <= 0){
		$user_id = (int)getUserId();

		if($user_id > 0){
			$row->user_id = $user_id;
		}
	}


	if(@$cfg->save_cookie == 1){
		saveCookie($row);
	}

	//Cha-ching!?
	$result = process($row);

	//override transaction id if we're only in the gateway's test mode
	if($cfg->gateway_mode == _TEST_MODE){
		//$row->xaction_id = _TEST_MODE;
	}

	//associate this with the configuration
	$row->configuration_id = getActiveConfiguration();


	//lets not store the full CC number
	if($cfg->store_full_cc == 0){
		$row->credit_card = "XXXXXXXXXXXX" . substr($row->credit_card,12,4);
	}

	//transaction was approved or is pending IPN verification
	if($result == true || $row->xaction_result == _CD_DONATE_PENDING){

		$row->check();

		if(!$row->store()){
			die("Error saving donation locally." . $row->getError());
		}

		//add the recurring data to the object for keyword replacement
		$row->interval = htmlentities(@$_POST['interval']);


		//add these so that hotword replacement includes custom
		$row->custom1 = addslashes(@$_POST['custom1']);
		$row->custom2 = addslashes(@$_POST['custom2']);
		$row->custom3 = addslashes(@$_POST['custom3']);
	
		//do the hotword replacement
		foreach ($row as $key => $val){
			if(is_string($val) || is_numeric($val)){		
				$cfg->thank_you_page_message = str_replace("%%$key%%",$val,$cfg->thank_you_page_message);
			}
		}

		//do the hotword replacement
		foreach ($row as $key => $val){
			if(is_string($val) || is_numeric($val)){
				$cfg->thank_you_body = str_replace("%%$key%%",$val,$cfg->thank_you_body);
			}
		}

		if(strlen(trim($cfg->thank_you_page)) > 0){

			//do the hotword replacement
			foreach ($row as $key => $val){
				if(is_string($val) || is_numeric($val)){
					$cfg->thank_you_page = str_replace("%%$key%%",$val,$cfg->thank_you_page);
				}				
			}
			
			//add the donation id number to load hotword replacement valudes
			if(strpos($cfg->thank_you_page,"?") !== false){
				$cfg->thank_you_page .= "&donation_id=" . $row->id;
			}else{
				$cfg->thank_you_page .= "?donation_id=" . $row->id;				
			}

		}

		//send the user a thankyou email
		if($cfg->send_thankyou_email == 1){

			//send email only for non-IPN gateways
			if($row->xaction_result != _CD_DONATE_PENDING){

				$email = mosGetParam($_POST,'email','');

				if(strlen($email) > 0){
					sendEmail($email,$cfg->admin_email,$cfg->thank_you_subject,$cfg->thank_you_body);
				}
			}
		}

		//send us a donation notice
		if($cfg->send_admin_email == 1){
			mailForm($cfg->admin_email,$cfg->admin_email,$cfg->sitename . ":" . _CD_DONATE_NOTICE);
		}

		//redirect to the thank you page
		if($row->xaction_result != _CD_DONATE_PENDING){

			if(strlen(trim($cfg->thank_you_page)) > 0){

				$cfg->fRedirect($cfg->thank_you_page,trim($cfg->thank_you_page_message));

			}else{

				$cfg->fRedirect("index.php?option=com_donate&task=thank&configuration_id=" . $cfg->id ,trim($cfg->thank_you_page_message));
			}

		}else{
		?>
		<script language="javascript" type="text/javascript" >
		   document.paypal.submit();
		</script>
		<?php
		die();

		}

	}else{
		
		//transaction failed, get the gateway-generated message
		$message = htmlentities($row->xaction_result);

		//if we didn't get an error, use our generic one
		if(!strlen($message)){
			$message = _CD_DONATE_ERROR;
		}

		//show the user the error and bounce back to the form
		//echo "<script> alert('".addslashes($message)."'); window.history.go(-1); </script>\n";
		jsAlertBack($message);

		exit();
	}
}

/**
 * Saves the donor record to a cookie
 *
 * @param unknown_type $row
 */
function saveCookie($row){
global $cfg;

	foreach ($row as $key => $val){

		if(!in_array($key,$cfg->private_fields) && substr($key,0,1) != "_"){
			$newrow->{$key} = $val;
		}
	}


	$value = serialize($newrow);

	//30 days = 60*60*24*30

	setcookie('donor_data', $value,time() + 2592000);

}

/**
 * Returns a donor record loaded from a cookie
 *
 */
function loadCookie(){
global $cfg;
$row = "";
$newrow = "";

	if (strlen($_COOKIE["donor_data"]) > 0){

		$row = unserialize(stripslashes($_COOKIE["donor_data"]));

		if(is_array($row) || is_object($row)){
			foreach (@$row as $key => $val){
				$newrow->{$key} = $val;
			}

			$newrow->loaded = 1;
		}

	}

	return $newrow;
}

function getDonationIDByUser($user_id){
global $cfg;

	$id = 0;
	$user_id = (int)$user_id;
	
	if($user_id > 0){

		$sql = "SELECT id FROM #__donations WHERE user_id = $user_id ORDER BY id DESC LIMIT 1";
		$cfg->database->setQuery( $sql );
		$id = (int)$cfg->database->loadResult();		
		
		
	}
	
	return $id;
	
}

function getDonationIDByEmail($emailAddress){
global $cfg;

	$id = 0;

	$sql = "SELECT id FROM #__donations WHERE email = '". addslashes($emailAddress) ."' ORDER BY id DESC LIMIT 1";
	$cfg->database->setQuery( $sql );
	$id = (int)$cfg->database->loadResult();		
	
	return $id;
	
}

function getDonationIDByTransactionID($xaction_id){
global $cfg;

	$id = 0;
	$xaction_id = (int)addslashes($xaction_id);
	
	if($xaction_id > 0){

		$sql = "SELECT id FROM #__donations WHERE xaction_id = '$xaction_id' ORDER BY id DESC LIMIT 1";
		
		$cfg->database->setQuery( $sql );
		$id = (int)$cfg->database->loadResult();		
		
	}
	
	return $id;
	
}
	

/**
 * Silently
 * create a Joomla or Mambo User account
 * based on the information provided
 *
 */
function createUserAccount($username,$email,$fullname,$password){

global $cfg;

//check if the user exists
	$username = addslashes(strtolower(trim($username)));
	$fullname = addslashes(trim($fullname));
	$password = addslashes(trim($password));
	$email = addslashes(strtolower(trim($email)));

	if(strlen($username) <= 0){
		return false;
	}

	if(strlen($fullname) <= 0){
		return false;
	}

	$block = (int)$cfg->block_user_account;

	$sql = "SELECT id FROM #__users WHERE LOWER(username) = '$username' or (LOWER(email) = '$username' or LOWER(email)='$email') LIMIT 1";
	$cfg->database->setQuery( $sql );
	$id = (int)$cfg->database->loadResult();

	//create an account
	if($id == 0){

		if(defined('_JEXEC')){
			//joomla not-so-required salt
			$password = "CONCAT(MD5('$password'),':')";

		}else{

			$password = "MD5('$password')";

		}

		$gid = (int)_CD_USERGROUP;

		if(@$cfg->default_account_level > 0){
			$gid = (int)$cfg->default_account_level;
		}

		//ADD THE USER!
		$sql = "INSERT INTO
				#__users (`name`,`username`,`password`,`email`,`block`,`sendEmail`,`gid`,`registerDate`,`lastvisitDate`,`activation`,`params`)
				VALUES ('$fullname','$username', $password ,'$email',$block,0," . $gid . ",' ',' ',' ','" .'\n'. "')";
		$cfg->database->setQuery( $sql );
		$cfg->database->Query();

		$user_id = (int)$cfg->database->insertid();

		if($user_id > 0){

			//add the ARO
			$sql = "INSERT INTO #__core_acl_aro (section_value, value, 	order_value, name, hidden)
					VALUES
					( 'users', '$user_id', '0', '$fullname', '0')";

			$cfg->database->setQuery( $sql );
			$cfg->database->Query();
			$aro_id = (int)$cfg->database->insertid();

			if($aro_id > 0){

				$sql = "INSERT INTO
						#__core_acl_groups_aro_map (`group_id`,`section_value`,`aro_id`)
						VALUES (" . $gid . ",'',$aro_id)";

				$cfg->database->setQuery( $sql );
				$cfg->database->Query();

				return $user_id;
			}

		}

	}

return -1;

}

/*
 * Save configuration
 *
 *
 */
function saveConfiguration(){
	global $cfg;

	if(strpos(strtolower($cfg->user->usertype),"administrator") !== false){

		$options = "";

		$id = (int)mosGetParam($_POST,"id",0);

		if($id > 0){
			$sql = "UPDATE #__donate SET `options`='%s' WHERE `id`='$id'";
		}else{
			$sql = "INSERT INTO #__donate (`options`) VALUES ('%s')";
		}

		foreach ($_POST as $key=>$val) {

			if($key != 'task' && $key !='option' && $key !='submit'){

				if(is_array($val)){
					$val = implode("|",$val);
				}

				$val = str_replace(",","\,",$val);

				$options .= addslashes($key) . "=" . trim(addslashes($val)) . ",";
			}
		}

		$sql = sprintf($sql,$options);

		$sql = str_replace('#__',$cfg->mosConfig_dbprefix,$sql);

		$cfg->database->setQuery($sql);

		$cfg->database->query($sql) or die("Error in SQL!" . print_r($cfg->database));

		if($id <=0){
			$id = (int)$cfg->database->insertid();
		}

		$cfg->fRedirect("?option=com_donate&task=configure&configuration_id=$id","Saved");

	}else{
		die("Not Authorized");
	}
}

/**
 * Explode with escaped strings
 *
 * @param unknown_type $delimiter
 * @param unknown_type $string
 * @return unknown
 */
function explode_escaped($delimiter, $string){
        $exploded = explode($delimiter, $string);
        $fixed = array();
        for($k = 0, $l = count($exploded); $k < $l; ++$k){

        	$offset = strlen($exploded[$k]) - 1;

        	if($offset >= 0){
	            if($exploded[$k][$offset] == '\\') {
	                if($k + 1 >= $l) {
	                    $fixed[] = trim($exploded[$k]);
	                    break;
	                }
	                $exploded[$k][strlen($exploded[$k]) - 1] = $delimiter;
	                $exploded[$k] .= $exploded[$k + 1];
	                array_splice($exploded, $k + 1, 1);
	                --$l;
	                --$k;
	            } else $fixed[] = trim($exploded[$k]);
        	}
        }
        return $fixed;
    }


/**
 *  Get the active donation config
 *
 */
function getActiveConfiguration(){
global $cfg;

	$Itemid = (int)mosGetParam($_REQUEST,'Itemid');

	$configuration_id =(int)mosGetParam($_REQUEST,'configuration_id');
	
	if($configuration_id > 0){
		return $configuration_id;
	}
	
	if($Itemid == 0){

		$sql = "SELECT * from #__donate WHERE active = 1  order by `id` DESC LIMIT 1";
		$cfg->database->setQuery($sql);
		$configuration_id = (int)$cfg->database->loadResult();

	}else{

		$configuration_id = (int)getMenuParameters('configuration_id',$Itemid);
	}


	return $configuration_id;

}



/**
 * Function to get the workflow plugin default email
 * Enterprise only
 *
 */
function getMenuParameters($parameter,$Itemid){

	global $cfg;

	$Itemid = (int)$Itemid;

	$sql = "SELECT params FROM #__menu WHERE id=$Itemid LIMIT 1";
	$cfg->database->setQuery( $sql );
	$params = $cfg->database->loadResult();

	if(strlen(trim($params)) > 0){

		$tuples = explode("\n",$params);

		if(count($tuples) > 0){
			foreach ($tuples as $tuple){

				$set = explode("=",$tuple);

				if(strtolower($set[0]) == $parameter){
					return strtolower($set[1]);
				}

			}
		}
	}

	return '';

}



/**
 * Load Configuration from the database
 * Initialize the global cfg variable with its settings.
 *
 */
function setApplicationConfig($id, $force = false){

	$appconfig = null;

	global $cfg;
	
	//$cfg = $GLOBALS['cfg'];

	$id = (int)$id;

	if($id > 0){
		//get the chosen config set
		$sql = "SELECT * from #__donate WHERE active = 1 and `id`= $id order by `id` DESC LIMIT 1";

	}else{
		//get the top config set to active
		$sql = "SELECT * from #__donate WHERE active = 1  order by `id` DESC LIMIT 1";
	}

	$cfg->database->setQuery($sql);

	if(defined('_JEXEC')){
		$appconfig = $cfg->database->loadObject() or die("Cannot load donation component configuration. The configuration associated with this menu item must exist and be active.");
	}else{
		$cfg->database->loadObject($appconfig) or die("Cannot load donation component configuration.  The configuration associated with this menu item must exist and be active.");
	}

	foreach ($appconfig as $key => $val){
		$cfg->$key = $val;
	}
	
	if(strlen($appconfig->options)){

		//of the format name=value
		$opts =  explode_escaped(',',$appconfig->options);

		foreach ($opts as $opt){

			$entry = explode("=",$opt);

			$name = @$entry[0];
			$value = @$entry[1];

			//for when we have = signs in the values
			if(count($entry) > 2){
				for($x = 2; $x < count($entry); $x++){
					$value .= "=" . $entry[$x];
				}
			}

			if(strlen(trim($name)) > 0){
				$cfg->{trim($name)} = stripslashes($value);
			}
		}

		$cfg->id = $appconfig->id;
		
		
		

	}else{
		die("No configuration options set!");
	}


	//echo "<!-- config is " . print_r($cfg,1) . "-->";

	//switch the config if this isn't the one needed for this language

	if(strlen(trim(@$cfg->select_joomfish_lang)) > 0 && !$force){

		//check the language parameter
		$lang = mosGetParam($_REQUEST,'lang');
		if(strlen($lang) > 0){

			$language_code = getLanguageCode($lang);

			if(trim($language_code) != $cfg->select_joomfish_lang && strlen($cfg->select_joomfish_lang) > 0){
				//this isn't the correct configuration
				$sql = "SELECT * from #__donate WHERE active = 1 and options like '%select_joomfish_lang=$cfg->select_joomfish_lang%' order by `id` DESC LIMIT 1";
				$cfg->database->setQuery($sql);
				$id = (int)$cfg->database->loadResult();

				if($id > 0){
					setApplicationConfig($id,true);
				}
			}
		}
	}
}

/**
 * Send all posted form data via email
 *
 * @param unknown_type $strTo
 * @param unknown_type $strFrom
 * @param unknown_type $strSubject
 */
function mailForm($strTo,$strFrom,$strSubject){

$nl = "\r\n";

//set this as the from email address
$strMsgBody = "";

foreach ($_POST as $strAttr => $strValue) {

	//don't mail the credit card or account info
	if($strAttr != "credit_card" && $strAttr != "x_bank_acct_num" && strpos($strAttr,"password") === false){
		$strMsgBody .= $nl . $strAttr . ": " . $strValue . "<br />";
	}

}

	sendEmail($strTo,$strFrom,$strSubject,$strMsgBody);

}

function jsAlertBack($msg){

	$msg = addslashes($msg);
	echo '<script language="javascript" type="text/javascript">alert(\''.$msg.'\'); history.go(-1);</script>';
	die();

}

/**
 * Send an HTML Email
 *
 * @param unknown_type $to
 * @param unknown_type $from
 * @param unknown_type $subject
 * @param unknown_type $message
 * @return unknown
 */
function sendEmail($to,$from,$subject,$message){
global $cfg;

	$headers = "";

	$headers = "From: $from\r\n";
	$headers .= "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";

	mail($to,$subject,$message, $headers);

}

function showGIDSelect($gid){

	$gid = (int)$gid;


?>
<select name="default_account_level" id="default_account_level" size="10">
  <option value="29"  <?php echo ($gid==29)? "SELECTED" :""  ?> >&nbsp; Public Front-end</option>
  <option value="18"  <?php echo ($gid==18 || $gid==0)? "SELECTED" :""  ?> >.&nbsp;-&nbsp;Registered</option>
  <option value="19"  <?php echo ($gid==19)? "SELECTED" :""  ?>>.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Author</option>
  <option value="20"  <?php echo ($gid==20)? "SELECTED" :""  ?>>.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Editor</option>
  <option value="21"  <?php echo ($gid==21)? "SELECTED" :""  ?>>.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Publisher</option>
  <option value="30"  <?php echo ($gid==30)? "SELECTED" :""  ?>>-&nbsp; Public Back-end</option>
  <option value="23"  <?php echo ($gid==23)? "SELECTED" :""  ?>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Manager</option>
  <option value="24"  <?php echo ($gid==24)? "SELECTED" :""  ?>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Administrator</option>
  <option value="25"  <?php echo ($gid==25)? "SELECTED" :""  ?>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Super Administrator</option>
</select>
<?php
}


function dcGetLanguages(){
global $cfg;

	$sql = "SELECT code from #__languages";
	$cfg->database->setQuery($sql);
	$languages = $cfg->database->loadObjectList();

	return $languages;
}

function getLanguageCode($shortcode){
global $cfg;

	if(strlen($shortcode) > 0){

		$shortcode = addslashes($shortcode);

		$sql = "SELECT code from #__languages WHERE shortcode = '$shortcode' LIMIT 1";
		$cfg->database->setQuery($sql);
		$code = trim($cfg->database->loadResult());

		return (  $code );

	}

}

function getLanguageFile(){
global $cfg;

//TODO: move this to a function
$language_file = basename(@$cfg->language_file);

	if(@$cfg->use_joomfish_lang == 1){

		$lang = addslashes(mosGetParam($_GET,'lang'));

		if(strlen($lang) > 0){

			$sql = "SELECT code from #__languages WHERE shortcode = '$lang' LIMIT 1";
			$cfg->database->setQuery($sql);
			$language_file = trim($cfg->database->loadResult());

			return (  "i8n/$language_file.php" );

		}

	}


	if(strlen($language_file) > 0){
		return (  "i8n/$language_file" );
	}else{
		return  (  "i8n/en-GB.php" );
	}


}

function getStateHTML($input_name = "state",$user_state=""){
//load the list of states from the database
global $cfg;

	$sql = "SELECT state_code,state_name,country_id from #__donate_states ORDER BY state_name ASC";

	$cfg->database->setQuery($sql);

	$rows = $cfg->database->loadObjectList();

	$html = "<select id='".$input_name."' name='".$input_name."'>";

	$html .= "<option value=''>"._CD_SELECT."</option>";

	$value = "";

	if($rows){

		foreach ($rows as $row){

			$selected = ($row->state_code == @$cfg->default_state)?(' selected="SELECTED" '):("");

			if(strlen($user_state) > 0){
				$selected = ($row->state_code == $user_state)?(' selected="SELECTED" '):("");
			}

			if($cfg->default_country > 0){

				if($cfg->default_country==$row->country_id){
					$html .= "<option value='{$row->state_code}' $selected>{$row->state_name}</option>";
				}

			}else{
				$html .= "<option value='{$row->state_code}' $selected>{$row->state_name}</option>";
			}



			$value .= "{$row->state_code},{$row->state_name},{$row->country_id}|";

		}
	}
	$html .= "</select>";

	$html .=  '<input type="hidden" id="state_list" value="' . $value . '" />';

	return $html;

}

function getCountryHTML($input_name = "country",$user_country = ""){
global $cfg;

	//load the list of countries from the database
	$sql = "SELECT id,countries_name,countries_iso_code_2 from #__donate_countries ORDER BY countries_name ASC";
	$cfg->database->setQuery($sql);

	$rows = $cfg->database->loadObjectList();

	$country_html = "<select id='".$input_name."' name='".$input_name."' onchange='trimStates(this);'>";

	$country_html .= "<option value=''>"._CD_SELECT."</option>";

	if($rows){

		foreach ($rows as $row){

			$selected =  ($row->id == @$cfg->default_country)?(' selected="SELECTED" '):("");

			if(strlen($user_country) > 0){
				$selected = ($row->countries_iso_code_2 == $user_country)?(' selected="SELECTED" '):("");
			}

			$country_html .= "<option value='{$row->id}' $selected>{$row->countries_name}</option>";

		}
	}
	$country_html .= "</select>";


return $country_html;

}

?>