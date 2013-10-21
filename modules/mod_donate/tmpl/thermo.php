<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>
<?php

$url = JURI::root();

if (strtolower(@$_SERVER['HTTPS']) == "on"){
	$url = str_replace("http://","https://",$url);	
}

?>
<OBJECT classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000'
        codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0'
        width="<?php echo $params->get('width'); ?>" height="<?php echo $params->get('width'); ?>">
        <param name='movie' value="<?php echo $url; ?>modules/mod_donate/tmpl/thermometer<?php echo ($params->get('size') == "small")?("_small"):(""); ?>.swf">
        <param name='quality' value="high">
        <param name='loop' value="false">
        <param name='FlashVars' value="module_id=<?php echo $module->id; ?>">
        <EMBED src="<?php echo $url; ?>modules/mod_donate/tmpl/thermometer<?php echo ($params->get('size') == "small")?("_small"):(""); ?>.swf" quality='high' width="<?php echo $params->get('width'); ?>"
        height="<?php echo $params->get('width'); ?>" loop="false" type='application/x-shockwave-flash'
        flashvars="module_id=<?php echo $module->id; ?>"
        pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash'>
        </EMBED>
        </OBJECT>