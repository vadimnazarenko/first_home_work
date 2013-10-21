<?php
/**
 * @version		$Id: config.class.php 335 2009-12-04 00:22:00Z fatica $
 * @package		Donation
 * @copyright	Copyright (C) 2009 Michael Fatica, Fatica Consulting L.L.C. - All rights reserved.
 * @license		GNU/GPL
 * This file is part of Donation Component. Donation Component is free software:
 * you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 */


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

//If not mambo
if(defined( '_VALID_MOS' ) && !defined('_JEXEC')){ 
	require_once(  "fxmambo.php" );
}else{
	require_once(  "fxjoomla.php" );
}

class config{

	var $live_site;
	
	var $secure_site;
	
	var $absolute_path;
	
	var $database;
	
	var $application_dir;
	
	var $im;
	
	var $mosConfig_dbprefix;
	
	var $user;
	
	var $private_fields;
	
	/**
	 * Redirect and pass a message
	 *
	 * @param unknown_type $url
	 * @param unknown_type $mosmsg
	 */
	function fRedirect($url,$mosmsg){
		
		$mosmsg = urlencode($mosmsg);
		
		if(strlen($mosmsg)  > 0){
			if(strpos($url,"?") !==false){
				header("Location: $url&mosmsg=$mosmsg");
			}else{
				header("Location: $url?mosmsg=$mosmsg");
			}
			
		}else{
			header("Location: $url");
		}
	}	
	
	
	function isSSL(){
		
		if(@$_SERVER['SERVER_PORT'] == 443){
			return true;
		}
		
		if (strtolower(@$_SERVER['HTTPS']) == "on"){
			return true;	
		}
		
		if (strtolower(@$_SERVER['HTTPS']) == "1"){
			return true;	
		}
		
		if(strpos(@$_SERVER['SCRIPT_URI'], 'https://') === 0){
			return true;
		} 
		
		return false;
		
	}	
	
	/**
	 * Constructor,
	 *
	 * @return config
	 */
	function setCMSConfig(){

		//These are donor fields that should not be sent via email or stored in the cookie
		$this->private_fields = array('credit_card','cvv','x_bank_acct_num','expiration','x_bank_acct_name','password');

		//Joomla 1.5
		if(defined('_JEXEC')){
			
			$conf = new JConfig();
			
			$root = JURI::base(); 
			
			$this->live_site = $root;
			$this->absolute_path = JPATH_BASE;
			$this->database = &JFactory::getDBO();
			$this->mosConfig_dbprefix = $conf->dbprefix;

			if(defined('_JEXEC')){
				$this->user =& JFactory::getUser();
			}		
			
			
			if($this->isSSL()){
				$this->secure_site = str_replace("http:","https:",$root);
			}else{
				$this->secure_site = $this->live_site;
			}
			
			//$this->secure_site = str_replace("//","/",$this->secure_site);
			
		//Mambo 
		}elseif (defined( '_VALID_MOS' )){
			
			global $database,$mosConfig_live_site,$mosConfig_absolute_path,$mosConfig_dbprefix,$my;
			$this->live_site = $mosConfig_live_site;
			$this->absolute_path =  $mosConfig_absolute_path;
			$this->database = &$database;
			$this->mosConfig_dbprefix = $mosConfig_dbprefix;
			$this->user =& $my;
			
			if($this->isSSL()){
				$this->secure_site = str_replace("http:","https:",$this->live_site);
			}else{
				$this->secure_site = $this->live_site;
			}
		}
	}
}


?>