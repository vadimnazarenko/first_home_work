<?php
/**
 * @version		$Id: donate.class.php 351 2010-01-27 17:41:12Z fatica $
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

if(defined( '_VALID_MOS' ) && !defined('_JEXEC')){ 
	
	class donation extends mosDBTable {
	
		var $id;
		
		var $firstname;
		
		var $lastname;
		
		var $title;
		
		var $organization;
		
		var $credit_card;
		
		var $card_type;
		
		var $expiration;
		
		var $expiration_year;
		
		var $expiration_month;
		
		var $cvv;
		
		var $address1;
		
		var $address2;
		
		var $city;
		
		var $state;
		
		var $country;
		
		var $postalcode;
		
		var $email;
		
		var $phone;
		
		var $extension;
		
		var $comments;
		
		var $amount;
		
		var $xaction_result;
		
		var $xaction_id;
		
		var $timestamp;
		
		var $country_currency;
		
		var $length;
			
		var $unit;
				
		var $duration;
		
		var $configuration_id;
		
		var $program;
		
		var $other;
		
		var $user_id;
		
		var $invoice;
		
			
		/**
		* @param database A database connector object
		*/
		function donation( &$db ) {
			$this->mosDBTable( '#__donations', 'id', $db );
		}
		
	}
}elseif (defined('_JEXEC')){

		class donation extends JTable {
	
		var $id;
		
		var $firstname;
		
		var $lastname;
		
		var $title;
		
		var $organization;
		
		var $credit_card;
		
		var $card_type;
		
		var $expiration;
		
		var $expiration_year;
		
		var $expiration_month;
		
		var $cvv;
		
		var $address1;
		
		var $address2;
		
		var $city;
		
		var $state;
		
		var $country;
		
		var $postalcode;
		
		var $email;
		
		var $phone;
		
		var $extension;
		
		var $comments;
		
		var $amount;
		
		var $xaction_result;
		
		var $xaction_id;
		
		var $timestamp;
		
		var $country_currency;
		
		var $length;
			
		var $unit;
				
		var $duration;
		
		var $configuration_id;
		
		var $program;
		
		var $other;
		
		var $user_id;
		
		/**
		* @param database A database connector object
		*/
		
        function __construct(&$db)
        {
                parent::__construct( '#__donations', 'id', $db );
        }
		
		
	}
	
}
?>