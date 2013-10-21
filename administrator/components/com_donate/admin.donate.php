<?php
/**
 * @version		$Id: admin.donate.php 294 2009-09-06 06:03:17Z fatica $
 * @package		Donation
 * @copyright	Copyright (C) 2009 Michael Fatica, Fatica Consulting L.L.C. - All rights reserved.
 * @license		GNU/GPL
 * This file is part of Donation Component. Donation Component is free software:
 * you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 */

// Check to ensure this file is included in Joomla!

/** ensure this file is being included by a parent file */
(defined( '_VALID_MOS' ) or defined('_JEXEC')) or die( 'Direct Access to this location is not allowed.' );


if (stristr(PHP_OS, 'WIN')) { 
 if(!defined('DS')){
	define('DS','\\');
 }
} else { 
 if(!defined('DS')){
	define('DS','/');
 }
}
$path = str_replace("administrator" . DS,"",dirname(__FILE__));

require_once($path . DS . "donate.php");
?>