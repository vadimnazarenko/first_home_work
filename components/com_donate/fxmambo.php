<?php
/**
 * @version		$Id: fxmambo.php 294 2009-09-06 06:03:17Z fatica $
 * @package		Donation
 * @copyright	Copyright (C) 2009 Michael Fatica, Fatica Consulting L.L.C. - All rights reserved.
 * @license		GNU/GPL
 * This file is part of Donation Component. Donation Component is free software:
 * you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 */



/**
 * Mambo specific functions
 */

/** ensure this file is being included by a parent file */
(defined( '_VALID_MOS' ) or defined('_JEXEC')) or die( 'Direct Access to this location is not allowed.' );


function getUserId(){
global $my;

return $my->id;
}




?>