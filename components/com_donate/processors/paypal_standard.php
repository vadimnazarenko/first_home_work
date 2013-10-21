<?php
/**
 * @version		$Id: paypal_standard.php 371 2010-02-10 17:44:10Z fatica $
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

define('IPN_PROCESSOR',1);

function process(&$row){
global $cfg;

if($cfg->gateway_mode == _TEST_MODE){

	$url = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
	
}else{
	
	$url = 'https://www.paypal.com/cgi-bin/webscr';	
}

$description = getDescription();

?>
<h2><?php echo _CD_PAYPALNOTICE; ?></h2>
<?php echo _CD_PAYPALPROMPT; ?>
<form action="<?php echo $url; ?>" method="post" name="paypal" />
<input type="hidden" name="redirect_cmd" value="_xclick"  />
<input type="hidden" name="business" value="<?php echo $cfg->paypal_account; ?>" />
<input type="hidden" name="item_name" value="<?php echo $description; ?>"  />
<input type="hidden" name="amount" value="<?php echo $row->amount; ?>" />
<input type="hidden" name="email" value="<?php echo $row->email; ?>" />
<input type="hidden" name="first_name" value="<?php echo $row->firstname; ?>" />
<input type="hidden" name="last_name" value="<?php echo $row->lastname; ?>" />
<input type="hidden" name="address1" value="<?php echo $row->address1; ?>" />
<input type="hidden" name="address2" value="<?php echo $row->address2; ?>" />
<input type="hidden" name="city" value="<?php echo $row->city; ?>" />
<input type="hidden" name="state" value="<?php echo $row->state; ?>" />
<input type="hidden" name="zip" value="<?php echo $row->postalcode; ?>" />
<!-- <input type="hidden" name="country" value="<?php echo $row->country_code; ?>" />
<input type="hidden" name="lc" value="<?php echo $row->country_code; ?>" /> -->
<?php
//if a thankyou page has been provided, add it as the return url
if(strlen($cfg->thank_you_page) > 0){
	?>
<input type="hidden" name="return" value="<?php echo $cfg->thank_you_page;?>" />
	<?php
}

//cover recurring PayPal payments
//validate the recurring donation
if(strlen($row->unit) > 0 && strlen($row->duration) > 0 && strlen($row->length) > 0 && $_POST['interval'] > 0){
	$recurr = true;	
}else {
	$recurr = false;	
	$cmd = "_ext-enter";
}

if($recurr === true){

	$cmd = "_xclick-subscriptions";
	
	//unit is days, months
	$unit = addslashes($row->unit);
	
	//Paypay accepts D W M or Y
	$unit = strtoupper(substr($unit,0,1));
		
	//the interval length E.g. 3 means every three months
	$length = (int)$row->length;
	
	//bill for selected length of time
	if((int)$row->duration == 9999){	
		$totalOccurrences = (int)$row->duration;		
	}else{
		
		if($unit == "D"){
			//e.g. every 36 days for 1 year =  10.138 or 10 occurrences.
			$totalOccurrences = (int)floor(($row->duration * 365) / $length);
			
			$duration = $totalOccurrences;
			
		}elseif ($unit == "M"){
			//e.g. every 1 Month for 1 year =  12 or 10 occurrences.
			$totalMonths = (int)$row->duration * 12;
			$totalOccurrences = (int)floor($totalMonths / $length);		
			
			$duration = $totalMonths;
		}else{
			die("Paypal: Invalid unit passed to recurring transaction");	
		}
	?>
		
	<!-- Limit the number of recurring payments if not "indefinite" -->
	<input type="hidden" name="srt" value="<?php echo $totalOccurrences; ?>">
	<input type="hidden" name="src" value="1">

	<?php

	}
	
	?>

	<!-- amount to bill -->
	<input type="hidden" name="a3" value="<?php echo $row->amount; ?>">
	
	<!-- set the terms of recurring payments -->
	<input type="hidden" name="p3" value="<?php echo $length; ?>">
	<input type="hidden" name="t3" value="<?php echo $unit; ?>">

	<?php
}
?>

<input type="hidden" name="cmd" value="<?php echo $cmd;?>"  />
<input type="hidden" name="notify_url" value="<?php echo $cfg->live_site . "/index.php?option=com_donate&task=ipn&configuration_id=" . $cfg->id; ?>"  />
<input type="hidden" name="no_shipping" value="1"  />
<input type="hidden" name="cn" value="<?php echo $row->comments; ?>" />
<input type="hidden" name="currency_code" value="<?php echo $row->country_currency; ?>"  />
<input type="hidden" name="tax" value="0"  />
<input type="hidden" name="lc" value="US"  />
<input type="hidden" name="bn" value="PP-DonationsBF"  />
<input type="image" name="zsubmit" border="0" src="https://www.paypal.com/en_US/i/btn/btn_donate_LG.gif" alt="PayPal - The safer, easier way to pay online" /> 
<img alt="" border="0" width="1" height="1" src="https://www.paypal.com/en_US/i/scr/pixel.gif" /> 
</form>

<?php
$row->xaction_id = "PAYPAL";
$row->xaction_result = _CD_DONATE_PENDING;

if($cfg->gateway_mode == _DEBUG_MODE){
	die("DEBUG MODE - Intentionally stopped script");	
}
return true;
}
?>