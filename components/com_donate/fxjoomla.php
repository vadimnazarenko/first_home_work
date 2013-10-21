<?php
/**
 * @version		$Id: fxjoomla.php 294 2009-09-06 06:03:17Z fatica $
 * @package		Donation
 * @copyright	Copyright (C) 2009 Michael Fatica, Fatica Consulting L.L.C. - All rights reserved.
 * @license		GNU/GPL
 * This file is part of Donation Component. Donation Component is free software:
 * you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 */


/**
 * Joomla specific functions
 */

/** ensure this file is being included by a parent file */
(defined( '_VALID_MOS' ) or defined('_JEXEC')) or die( 'Direct Access to this location is not allowed.' );


/**
 * Retrieve a url parameter Mambo-style
 *
 * @param unknown_type $global
 * @param unknown_type $name
 * @param unknown_type $default
 * @return unknown
 */

if(!function_exists('mosGetParam')){
	function mosGetParam(&$global,$name,$default=null){
	
		switch ($global){
					
			case $_POST:{
				$ret = addslashes($_POST["$name"]);
			}break;
			
			default:
			case $_REQUEST:{
				$ret = JRequest::getVar($name,$default);
			}break;	
		}
	
		return $ret;
	}
}

function getUserId(){
	$user = null;
	$id = 0;
	
	$user =& JFactory::getUser(); 
	$id = (int)$user->get('id'); 	
	
	return $id;
}

function getUserName(){
	$user = null;
	$username = null;
	
	$user =& JFactory::getUser(); 
	$username = $user->get('username'); 	
	
	return $username;
}
?>