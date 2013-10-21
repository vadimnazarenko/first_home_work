<?php
/**
 * @version		$Id: en-GB.php 347 2010-01-15 21:18:26Z fatica $
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

@DEFINE(_CD_AUTHNET_COMERR,'Error contacting payment processor.  No transaction was performed');
@DEFINE(_CD_GATEWAY_ERROR,'There was an error processing your payment. Your credit card was not charged.');
@DEFINE(_CD_FORM_ERRORS,'The following corrections must be made before submitting this form');
@DEFINE(_CD_FORM_AMOUNT,'Amount');
@DEFINE(_CD_FORM_AMOUNT_ERR,'Please select the amount of your payment');
@DEFINE(_CD_FORM_NOAMOUNT_ERR,'No Amount Provided');
@DEFINE(_CD_FORM_INVALIDAMOUNT_ERR,'Invalid Payment Amount Provided');
@DEFINE(_CD_FORM_SMALLAMOUNT_ERR,'The smallest payment allowed is');
@DEFINE(_CD_FORM_USEREXISTS_ERR,'Error creating user account.  Account/email address already exists!');
 

@DEFINE(_CD_FORM_ORGANIZATION,'Organization');
@DEFINE(_CD_FORM_SALUTATION,'Salutation');
@DEFINE(_CD_FORM_TITLE,'Title');

@DEFINE(_CD_FORM_FNAME,'First Name');
@DEFINE(_CD_FORM_LNAME,'Last Name');
@DEFINE(_CD_FORM_COMMENTS,'Comments');
@DEFINE(_CD_FORM_CARDNUMBER,'Card Number');
@DEFINE(_CD_FORM_CARDTYPE,'Card Type');

@DEFINE(_CD_FORM_PROGRAM_LIST,'<b>Please use my donation for</b>');
 
@DEFINE(_CD_FORM_EXPIRATIONDATE,'Expiration Date');
@DEFINE(_CD_FORM_CVV,'Card Verification Number');
@DEFINE(_CD_CVV,'Click here for details');

@DEFINE(_CD_FORM_ADDRESS1,'Address 1');
@DEFINE(_CD_FORM_ADDRESS2,'Address 2');
@DEFINE(_CD_FORM_CITY,'City');
@DEFINE(_CD_FORM_STATE,'State');
@DEFINE(_CD_FORM_POSTAL,'Postal Code');
@DEFINE(_CD_FORM_PASSWORD_NOMATCH,'Passwords do not match!');
@DEFINE(_CD_FORM_USERNAMETAKEN,'That username is already in use.  Please choose another!');
@DEFINE(_CD_FORM_PASSWORD_SHORT,'Your password must be longer than 4 characters');

@DEFINE(_CD_FORM_BILLINGADDRESS,'<br /><b>Billing Address:</b>');
@DEFINE(_CD_FORM_COUNTRY,'Country');
@DEFINE(_CD_FORM_PHONEEXT,'Phone/Ext');

@DEFINE(_CD_FORM_EMAIL,'Email');
@DEFINE(_CD_FORM_USERNAME,'Username');
@DEFINE(_CD_FORM_PASSWORD,'Password');
@DEFINE(_CD_FORM_PASSWORD_VERIFY,'Verify Password');
@DEFINE(_CD_FORM_OTHER,'Other');
@DEFINE(_CD_FORM_SUBMIT,'Submit');

@DEFINE(_CD_PAYMENT_SHORT_DESCRIPTION,'Payment');
@DEFINE(_CD_PAYMENT_DESCRIPTION,'Payment');
 

@DEFINE(_CD_FORM_SIMPLE_FREQUENCY,'Contribution Type');


@DEFINE(_CD_FORM_FREQ_NEVER,'Never');
@DEFINE(_CD_FORM_FREQ_EVERY,'Every');
 
@DEFINE(_CD_FORM_FREQ_DAYS,'Day(s)');
@DEFINE(_CD_FORM_FREQ_MONTHS,'Month(s)');

@DEFINE(_CD_FORM_FREQ_1_YEAR,'for 1 Year');
@DEFINE(_CD_FORM_FREQ_2_YEAR,'for 2 Years');
@DEFINE(_CD_FORM_FREQ_3_YEAR,'for 3 Years');
@DEFINE(_CD_FORM_FREQ_4_YEAR,'for 4 Years');
@DEFINE(_CD_FORM_FREQ_5_YEAR,'for 5 Years');

@DEFINE(_CD_FORM_FREQ_INDEF,'Indefinitely');

@DEFINE(_CD_OPTIONAL,'(optional)');


/**
 * DO NOT TRANSLATE THESE BELOW
 */
@DEFINE(_TEST_MODE,"test");
@DEFINE(_LIVE_MODE,"live");
@DEFINE(_DEBUG_MODE,"debug");
/**
 * DO NOT TRANSLATE THESE ABOVE
 */

@DEFINE(_CD_PROCESSOR_LOAD_ERROR,'Fatal Error loading the payment processor.  File does not exist.');
@DEFINE(_CD_PROCESSOR_CONFIG_ERROR,'Fatal Error. You must configure a payment processor in the back end.');
@DEFINE(_CD_JSERRORS,'The following corrections must be made before submitting this form:');
@DEFINE(_CD_JSAMOUNTERRORS,'Please select the amount of your payment');
@DEFINE(_CD_PAYPALNOTICE,'Payment will be processed via Paypal');
@DEFINE(_CD_PAYPALPROMPT,'Please complete the payment in the PayPal window provided.  If no window opened, click the secure button below to continue.');
@DEFINE(_CD_SELECT,'Please Select...');
@DEFINE(_CD_DONATE_ERROR,'An error occurred');
@DEFINE(_CD_DONATE_PENDING,'PENDING');
@DEFINE(_CD_DONATE_NOTICE,'Payment Notification');
@DEFINE(_CD_CREATENEW,'Create New Configuration');
@DEFINE(_CD_FORM_FREQUENCY,'Repeat this payment');
@DEFINE(_CD_FORM_DURATION,'Duration');


@DEFINE(_CD_FORM_ERR_POSTAL,'Invalid postal code');
@DEFINE(_CD_FORM_ERR_EMAIL,'Invalid email address');
@DEFINE(_CD_FORM_ERR_ISREQUIRED,' is required');
@DEFINE(_CD_FORM_ERR_R_LENGTH,'Please choose the number of days or months between payment recurrences');
@DEFINE(_CD_FORM_ERR_R_MONTHS,'Payments recurring monthly must occur 12 or less times.');
@DEFINE(_CD_FORM_ERR_R_DAYSORMONTHS,'Please choose either days or months');
@DEFINE(_CD_FORM_ERR_R_DURATION,'Please choose how long this payment recurrence will continue.');
@DEFINE(_CD_FORM_POSTAL_FORMAT, '(5 or 9 digits)');
@DEFINE(_CD_FORM_ERR_CARD, 'Invalid credit card number');


//the default user type created "registered user"
@DEFINE(_CD_USERGROUP,18);

?>