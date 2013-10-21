<?php
/**
 * @version		$Id: paypal_standard.php 305 2009-09-08 20:03:45Z fatica $
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
	
	$url = 'https://payflowlink.paypal.com';	
}

$description = getDescription();

?>
<h2><?php echo _CD_PAYPALNOTICE; ?></h2>
<?php echo _CD_PAYPALPROMPT; ?>
<form action="<?php echo $url; ?>" method="post" name="paypal" />

<input type="hidden" name="LOGIN" value="<?php  echo $cfg->paypal_link_login; ?>">
<input type="hidden" name="PARTNER" value="<?php  echo $cfg->paypal_link_partner; ?>">
<input type="hidden" name="AMOUNT" value="<?php echo $row->amount; ?>">
<input type="hidden" name="TYPE" value="S">
<input type="hidden" name="ECHODATA" value="True">
<input type="hidden" name="DESCRIPTION" value="<?php echo $description; ?>">
<input type="hidden" name="NAME" value="<?php echo $row->firstname; ?> <?php echo $row->lastname; ?>">
<input type="hidden" name="ADDRESS" value="<?php echo $row->address1; ?>">
<input type="hidden" name="CITY" value="<?php echo $row->city; ?>">
<input type="hidden" name="STATE" value="<?php echo $row->state; ?>">
<input type="hidden" name="ZIP" value="<?php echo $row->postalcode; ?>">
<input type="hidden" name="COUNTRY" value="<?php echo $row->country; ?>">
<input type="hidden" name="INVOICE" value="<?php echo $row->invoice; ?>">

<input type="image" name="zsubmit" border="0" src="https://www.paypal.com/en_US/i/btn/btn_donate_LG.gif" alt="PayPal - The safer, easier way to pay online" /> 
<img alt="" border="0" width="1" height="1" src="https://www.paypal.com/en_US/i/scr/pixel.gif" /> 
</form>
<?php
$row->xaction_id = "PAYPAL_PAYFLOW_LINK";
$row->xaction_result = _CD_DONATE_PENDING;

if($cfg->gateway_mode == _DEBUG_MODE){
	die("DEBUG MODE - Intentionally stopped script");	
}
return true;
}
?>