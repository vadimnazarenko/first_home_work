<?php
/**
* @version		$Id$
* @package		Donate
* @copyright	Copyright (C) 2005 - 2008 Fatica Consulting L.L.C.
* @license		GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// Include the syndicate functions only once
require_once (dirname(__FILE__).DS.'helper.php');

$list = modDonateHelper::getList($params);

if($params->get('show_percent') > 0){
	require(JModuleHelper::getLayoutPath('mod_donate','goal'));
}

if ($params->get('show_thermo') > 0) {
	require(JModuleHelper::getLayoutPath('mod_donate','thermo'));	
}


