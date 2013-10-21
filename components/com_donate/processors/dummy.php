<?php
/**
 * @version		$Id: dummy.php 305 2009-09-08 20:03:45Z fatica $
 * @package		Donation
 * @copyright	Copyright (C) 2009 Michael Fatica, Fatica Consulting L.L.C. - All rights reserved.
 * @license		GNU/GPL
 * This file is part of Donation Component. Donation Component is free software:
 * you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 */



/** ensure this file is being included by a parent file test */
(defined( '_VALID_MOS' ) or defined('_JEXEC')) or die( 'Direct Access to this location is not allowed.' );


/* This dummy gateway always returns true.  Can be used for manual credit card processing *
 * *
 *
 * @param unknown_type $row
 * @return unknown
 */
function process (&$row){

	return true;
}


?>