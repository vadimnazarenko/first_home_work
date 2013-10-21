<?php
/**
 * @version		$Id: install.com_donate.php 351 2010-01-27 17:41:12Z fatica $
 * @package		Donation
 * @copyright	Copyright (C) 2009 Michael Fatica, Fatica Consulting L.L.C. - All rights reserved.
 * @license		GNU/GPL
 * This file is part of Donation Component. Donation Component is free software:
 * you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 */


// Check to ensure this file is included in Joomla!
(defined( '_VALID_MOS' ) or defined('_JEXEC')) or die( 'Direct Access to this location is not allowed.' );

function com_install()
{
global $mainframe;
	
	//upgrade the database if needed
	$db  =& JFactory::getDBO();
	$db->setQuery( "show columns from #__donations where `Field`='other'");
	$row = $db->loadObject();
	
	if(@$row->Field != 'other'){
		$db  =& JFactory::getDBO();
		$db->setQuery( "ALTER TABLE #__donations add `other` text NOT NULL;");
		$db->Query();	
		
		$db  =& JFactory::getDBO();
		$db->setQuery( "ALTER TABLE #__donations add `program` varchar(255) default NULL;");
		$db->Query();		    
	}
	
	//upgrade the database if needed
	$db  =& JFactory::getDBO();
	$db->setQuery( "show columns from #__donations where `Field`='invoice'");
	$row = $db->loadObject();
	
	if(@$row->Field != 'invoice'){

		$db  =& JFactory::getDBO();
		$db->setQuery( "ALTER TABLE #__donations add `invoice` varchar(255) default NULL;");
		$db->Query();		    
	}
		
	
	//upgrade to rev 282
	$db  =& JFactory::getDBO();
	$db->setQuery( "show columns from #__donations where `Field`='user_id'");
	$row = $db->loadObject();
	
	if(@$row->Field != 'user_id'){
		$db  =& JFactory::getDBO();
		
		//	UPGRADE ALTER TABLE #__donations add configuration_id int(11);
		$db->setQuery( "ALTER TABLE #__donations add user_id int(11);");
		$db->Query();		    
	}	

}
?>
