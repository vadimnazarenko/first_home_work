<?php
/**
* @version		$Id: helper.php 10857 2008-08-30 06:41:16Z willebil $
* @package		Joomla
* @copyright	Copyright (C) 2005 - 2008 Open Source Matters. All rights reserved.
* @license		GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

require_once (JPATH_SITE.DS.'components'.DS.'com_content'.DS.'helpers'.DS.'route.php');

class modDonateHelper
{
	function getList(&$params)
	{
		global $mainframe;

		$db			=& JFactory::getDBO();
		$configuration_id		= (int)trim( $params->get('configuration_id') );
		$recent_donations		= (int)trim( $params->get('recent_donations',5) );

		
		if ($configuration_id)
		{
			$ids = explode( ',', $configuration_id );
			JArrayHelper::toInteger( $ids );
			$catCondition = ' AND (configuration_id=' . implode( ' OR configuration_id=', $ids ) . ')';
		}		
		
		$query = 'SELECT firstname,lastname,amount,program,comments FROM #__donations WHERE amount > 0 ' . $catCondition;
		
		$db->setQuery($query, 0, $recent_donations);
		$rows = $db->loadObjectList();

		$i		= 0;
		$lists	= array();
		foreach ( $rows as $row )
		{
			$lists[$i]->name = htmlspecialchars( $row->firstname . " " .$row->lastname );
			$lists[$i]->amount = htmlspecialchars( $row->amount );
			$i++;
		}			

		
		$query = 'SELECT sum(amount) as total FROM #__donations WHERE amount > 0 ' . $catCondition;		
		$db->setQuery($query);
		$total = $db->loadResult();
		
	
		$lists[0]->total = $total;
		$lists[0]->goal = (float)trim( $params->get('fundraising_goal') );
		
		if($lists[0]->goal > 0){
			$lists[0]->percent = number_format($total / $lists[0]->goal,2) . "%";
		}

		return $lists;
	}
}
