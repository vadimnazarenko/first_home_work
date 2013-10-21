<?php
/**
 * @version		$Id: donate.html.php 375 2010-02-11 19:32:16Z fatica $
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

class HTML_donate {
	
	function showDonations(&$rows,$order,$pageNav,&$donor_rows){
		global $my, $mosConfig_live_site;
		
			if(count($rows) == 1){
				$row = $rows[0];
				?>
				<table class="adminheading">
				<tr><th>Payment Details</th>
				</tr><tr><td><?php 
				if(count($donor_rows) > 0){
					?>
					<a href="#donor_rows">This donor has <?php echo count($donor_rows) - 1?> other donations.</a>
					<?php } ?>
				</td></tr></table>
				<table class="adminlist" >
				<tr class="row0">
					<td align="left" width="10%">id:</td>	<td align="left"><?php echo $row->id;?></td>
				</tr>			
				<tr class="row0">
					<td align="left" width="10%">Name:</td>	<td align="left"><?php echo htmlentities($row->firstname);?>&nbsp;<?php echo htmlentities($row->lastname);?></td>
				</tr>
				<tr  class="row1">
					<td align="left">Amount:</td><td align="left"><?php echo "$" . number_format($row->amount,2);?> </td>
				</tr>
				<tr  class="row0">
					<td align="left">Date:</td>  <td align="left"><?php echo date("M d y",(strlen($row->timestamp) > 0)?(strtotime($row->timestamp)):(strtotime(date("M d y"))));?> </td>
				</tr>	
				<tr class="row1">
					<td align="left">Organization:</td>	<td align="left"><?php echo htmlentities($row->organization);?></td>
				</tr>	
				<tr class="row0">
					<td align="left">Title:</td>	<td align="left"><?php echo htmlentities($row->title);?></td>
				</tr>	
				
				<tr class="row1">
					<td align="left">Address 1:</td>	<td align="left"><?php echo htmlentities($row->address1);?></td>
				</tr>
				<tr class="row0">
					<td align="left">Address 2:</td>	<td align="left"><?php echo htmlentities($row->address2);?></td>
				</tr>
				<tr class="row1">
					<td align="left">City:</td>	<td align="left"><?php echo htmlentities($row->city);?></td>
				</tr>
				<tr class="row0">
					<td align="left">State:</td>	<td align="left"><?php echo htmlentities($row->state);?></td>
				</tr>
				<tr class="row1">
					<td align="left">Zip:</td>	<td align="left"><?php echo htmlentities($row->postalcode);?></td>
				</tr>
				<tr class="row0">
					<td align="left">Phone:</td>	<td align="left"><?php echo htmlentities($row->phone);?> <?php echo htmlentities($row->extension);?></td>
				</tr>			
				<tr class="row1">
					<td align="left">Email:</td>	<td align="left"><a href="mailto:<?php echo htmlentities($row->email);?>"><?php echo htmlentities($row->email);?></a></td>
				</tr>		
				<tr class="row0">
					<td align="left">Credit Card:</td>	<td align="left"><?php echo htmlentities($row->credit_card);?>, Exp: <?php echo htmlentities($row->expiration);?>, CVV: <?php echo htmlentities($row->cvv);?></td>
				</tr>						
				<tr class="row1">
					<td align="left">Transaction Result:</td><td align="left"><?php echo htmlentities($row->xaction_result);?></td>
				</tr>		
				<tr class="row0">
					<td align="left">Transaction ID:</td><td align="left"><?php echo htmlentities($row->xaction_id);?></td>
				</tr>					
				<tr class="row1">
					<td align="left">Timestamp:</td><td align="left"><?php echo htmlentities($row->timestamp);?></td>
				</tr>		
				<tr class="row0">
					<td align="left">Configuration:</td><td align="left"><?php echo (int)$row->configuration_id;?></td>
				</tr>	
				<tr class="row1">
					<td align="left">Program:</td><td align="left">	<?php echo htmlentities(@$row->program);?></td>
				</tr>
				<tr class="row0">
					<td align="left">Custom Text Fields 1:</td><td align="left"><?php $custom = explode("|",$row->other); echo htmlentities(@$custom[0]);?></td>
				</tr>		
				<tr class="row1">
					<td align="left">Custom Text Fields 2:</td><td align="left"><?php echo htmlentities(@$custom[1]);?></td>
				</tr>		
				<tr class="row0">
					<td align="left">Custom Text Fields 3:</td><td align="left"><?php echo htmlentities(@$custom[2]);?></td>
				</tr>	
				<tr class="row0">
					<td align="left">Custom Checkbox 1:</td><td align="left"><?php echo htmlentities(@$custom[3]);?></td>
				</tr>		
				<tr class="row1">
					<td align="left">Custom Checkbox 2:</td><td align="left"><?php echo htmlentities(@$custom[4]);?></td>
				</tr>		
				<tr class="row0">
					<td align="left">Custom Checkbox 3:</td><td align="left"><?php echo htmlentities(@$custom[5]);?></td>
				</tr>					
				<tr class="row1">
					<td align="left">Invoice Number:</td><td align="left"><?php echo htmlentities(@$row->invoice);?></td>
				</tr>	
				<tr class="row0">
					<td align="left">User Name (ID):</td><td align="left"><?php echo htmlentities(getUserNameById($row->user_id) . " (" . $row->user_id . ")");?></td>
				</tr>	
				</table>		
				
				
				<?php

				//show all the other donation records from this email address
				
				if(count($donor_rows) > 0){
					
					?>
				<a name="donor_rows" />
				<table class="adminlist" >
				<tr><th>All (<?php echo count($donor_rows);?>) Donations from <?php echo htmlentities($row->email);?></th>
					<?php 
					
					foreach ($donor_rows as $donor_row){
						?>
						<tr class="row0">
						<td align="left"><a href="index2.php?option=com_donate&task=show&id=<?php echo $donor_row->id;?>"><?php echo date("M d y",(strlen($donor_row->timestamp) > 0)?(strtotime($donor_row->timestamp)):(strtotime(date("M d y"))));?> for <?php echo "$" . number_format($donor_row->amount,2);?></a></td>
						</tr>
						<?php 
						
					}
					
					?>

				</table>
					<?php 
				}
				
			}else{
				?>
				<form name="adminForm" action="<?php echo $_SERVER['PHP_SELF'];?>" method="POST" >
				<table class="adminheading">
				<tr><th class="header">Donations</th></tr></table>
	
				<table class="admin" >
				<tr><th ><a href="index2.php?option=com_donate&task=configure">Configure</a> | </th><th> <a href="index3.php?option=com_donate&task=export&no_html=1">Export as CSV</a> | </th><th>  <a href="#" onclick="fsubmitbutton(1);">Delete Selected</a></th></tr></table>
				
				<table class="admin" width="20%">
				<tr><td>Search: <input type="text" name="search" id="search" /><input type="submit" value="Go" name="go" /></td></tr></table>
						
				
				<table class="admin" width="20%">
				<tr><td>
				<?php donateStats(); ?> 
				</td></tr></table>
				<table class="adminlist" align="left">
				<tr class="row0">
					<th align="left">&nbsp;</th>
					<th align="left"><a href="index2.php?option=com_donate&task=show&sort=id&order=<?php echo $order;?>">ID</a></th>
					<th align="left"><a href="index2.php?option=com_donate&task=show&sort=lastname&order=<?php echo $order;?>">Name</a></th>
					<th align="left"><a href="index2.php?option=com_donate&task=show&sort=amount&order=<?php echo $order;?>">Amount</a></th>
					<th align="left"><a href="index2.php?option=com_donate&task=show&sort=timestamp&order=<?php echo $order;?>">Date</a></th>
					<th align="left"><a href="index2.php?option=com_donate&task=show&sort=xaction_result&order=<?php echo $order;?>">Transaction Result</a></th>
					<th align="left"><a href="index2.php?option=com_donate&task=show&sort=configuration_id&order=<?php echo $order;?>">Configuration</a></th>
					<th align="left"><a href="index2.php?option=com_donate&task=show&sort=program&order=<?php echo $order;?>">Program</a></th>
				</tr>
				<?php
				$x = 0;
				$no_records = "";
				if($rows){
					foreach ($rows as $row){
						$x++;
					?>
					<tr class="row<?php echo ($x % 2);?>">
						<td align="left" width="2%">
							<input type="checkbox" name="id[]" value="<?php echo $row->id;?>" />
						</td>			
						<td align="left">
							<?php echo $row->id;?>
						</td>				
						<td align="left">
						<?php
							if(strlen($row->firstname) > 0){
								$hypertext = htmlentities($row->firstname) . "&nbsp;" . htmlentities($row->lastname);
							}else{
								$hypertext = "No name provided";
							}
							
						?>
							<a href="index2.php?option=com_donate&task=show&id=<?php echo $row->id;?>"><?php echo $hypertext; ?></a>
						</td>
						<td align="left">
							<?php echo "$" . number_format($row->amount,2);?>
						</td>	
						<td align="left">
							<?php echo date("M d y",(strlen($row->timestamp) > 0)?(strtotime($row->timestamp)):(strtotime(date("M d y"))));?>
						</td>
						<td align="left">
							<?php echo htmlentities($row->xaction_result); ?>
						</td>	
						<td align="left" width="2%">
							<a href="index2.php?option=com_donate&task=configure&configuration_id=<?php echo (int)$row->configuration_id;?>"><?php echo (int)$row->configuration_id;?></a>
						</td>
						<td align="left" width="2%">
							<?php echo htmlentities(@$row->program);?>
						</td>		
						
										
					</tr>
												
					<?php
					}
				}else{
					
					$no_records = "No records found";
						
				}
				?>
					<tr>
						<td colspan="8"><?php echo $no_records; ?></td>
					</tr>
					<tr>
						<td align="center" colspan="8">
	<?php
					$link = '?option=com_donate&amp;task=show';
					$prev = '';
					$next = '';
					$s = '';
					$t = false;
					
					$sel = '<select name="limit" id="limit" onchange="document.adminForm.submit();">';
					
					for($x = 5; $x < $pageNav->total; $x+=($x+5)){
						
						if($x == $pageNav->limit){
							$s = 'selected="selected"';	
							$t = true;
						}else{
							$s = "";	
						}
						$sel .= '<option value="'.$x.'" '.$s.' >' . $x . '</option>';
					}
					
					if($t == false){
						$s = 'selected="selected"';	
					}else{
						$s = '';
					}
			
					$sel .= '<option value="'.$pageNav->total.'" '.$s.' >' . 'All' . '</option>';
					
					$sel .= '</select>';
					
					if($pageNav->limitstart < $pageNav->total && $pageNav->limitstart > 0){
						$nls = $pageNav->limitstart - $pageNav->limit;
						if($nls < 0){
							$nls = 0;
						}
						$prev = "&limitstart=$nls&limit=$pageNav->limit";
					}
					
					if($pageNav->limitstart < $pageNav->total && ($pageNav->total - $pageNav->limit) > 0){
						$nls = $pageNav->limitstart + $pageNav->limit;
						if($nls < $pageNav->total){
							$next = "&limitstart=$nls&limit=$pageNav->limit";
						}
					}
					
					if($prev){
						echo "<a href='$link$prev'>Previous</a>";				
					}
					
					echo $sel;
					
					if($next){
						echo "<a href='$link$next'>Next</a>";		
					}
					
	?>
						</td>
					</tr>
		</table>
		<input type="hidden" name="option" value="com_donate" />
		<input type="hidden" name="task" id="task" value="show" />
		</form>
		<script language="javascript" type="text/javascript">
			function fsubmitbutton(d){
				
				if(d==1){
					
					var ok = false;
					
					var chks = document.getElementsByName('id[]');
					
					for(var x = 0; x < chks.length; x++){
						if(chks[x].checked == true){
							ok = true;
						}
					}
					if(ok){
						if(confirm("Are you sure?")){
							document.getElementById('task').value ='delete';
							document.adminForm.submit();
						}	
					}else{
						alert('None Selected!');	
					}
				}
				
			}
		</script>
		<?php
			}
		
	}
	
	
	/**
	 * Display some stats about oour donations
	 *
	 * @param unknown_type $stats
	 */
	function showStats(&$stats){
		
		if( $stats->count > 0){
			$average = number_format($stats->total / $stats->count,2);
		}else{
			$average = 0;
		}
		
		echo $stats->count . " payments for $" . number_format($stats->total,2) . " an average of $" . $average ;
		
	}

	/**
	 * Display the configuration
	 *
	 * @param unknown_type $cfg
	 */
	function showConfiguration(){
		global $cfg;		
			
			//initialize the application config
			$configuration_id = (int)$_GET['configuration_id'];

			
			setApplicationConfig($configuration_id);
					

			//load the list of states from the database			
			$sql = "SELECT * FROM #__donate order by id DESC";

			$cfg->database->setQuery($sql);
			
			$rows = $cfg->database->loadObjectList();
			
			
			$html = "<select id='id' name='id'>";
			
			if($configuration_id == 0){
				$html .= "<option value='' selected='SELECTED'>"."Create New"."</option>";
			}else{
				$html .= "<option value=''>"."Create New"."</option>";
			}
			
			$value = "";
			
			
			if($rows){
				
				foreach ($rows as $row){
					
					$selected = ($row->id == @$cfg->id)?(' selected="SELECTED" '):("");
					
					if( $configuration_id == 0 ){
						$selected = "";
					}
					
					$html .= "<option value='{$row->id}' $selected>{$row->id}</option>";
				}
			}
			
			$html .= "</select>";
			$html .= "<input type='button' name='go' value='Load' onclick='loadConfig(this);' />";
			$html .= "<input type='button' name='delete' value='Delete' onclick='deleteConfig(this);' />";
			//$html .= "<input type='button' name='export' value='Export' onclick='exportConfig(this);' />";
		

		?>
		
		<form action="index2.php" name="donate" method="post"  >
		<table class="adminheading">
		<tr>
		<th>Component Configuration</th>
		</tr>
		<tr><td>&nbsp;</td></tr>
		</table>
		
		<table class="adminlist">
		<tr><td align="left">
			Choose configuration set:<br />
			<?php
			echo $html;
			?><br />
		
<?php
if(defined('_JEXEC')){
	JHTML::_('behavior.tooltip');
	
    jimport('joomla.html.pane');
	$tabs = &JPane::getInstance('tabs',array('startOffset'=>0));
	echo $tabs->startPane( 'configuration' );
	echo $tabs->startPanel( 'General', 'general' );	
}else{
	$tabs = new mosTabs(0);
	$tabs->startPane( 'configuration' );
	$tabs->startTab( 'General', 'general' );
}
?>		
	<fieldset><legend>Main Options</legend>
		Administrator Email:<br /> <input type="text" name="admin_email" value="<?php echo $cfg->admin_email; ?>" /><br />
		Site Name:<br /> <input type="text" id="sitename" name="sitename"  value="<?php echo $cfg->sitename; ?>" /><br />
		Configuration Name:<br /> <input type="text" id="config_name" name="config_name"  value="<?php echo @$cfg->config_name; ?>" /><br />
		Configuration ID:<br /> <b><?php 
		if( $configuration_id != 0 ){
			echo @$cfg->id;
		}else{
			
		}
		?></b><br />
		Payment Processor:<br />
		<select name="processor">
				<option value="authorizenet" <?php echo ($cfg->processor == "authorizenet")?("SELECTED"):(""); ?> >Authorize.NET</option>
				<option value="paypal_pro" <?php echo ($cfg->processor == "paypal_pro")?("SELECTED"):(""); ?> >PayPal Website Payments Pro</option>
				<option value="payflow_pro" <?php echo ($cfg->processor == "payflow_pro")?("SELECTED"):(""); ?> >PayPal/Verisign PayFlow Pro</option>
				<option value="paypal_standard" <?php echo ($cfg->processor == "paypal_standard")?("SELECTED"):(""); ?> >PayPal Website Payments Standard</option>
				<option value="paypal_payflow_link" <?php echo ($cfg->processor == "paypal_payflow_link")?("SELECTED"):(""); ?> >PayPal Payflow Link</option>
				<option value="bibit" <?php echo ($cfg->processor == "bibit")?("SELECTED"):(""); ?> >Bibit Global Payment Services (BETA)</option>
				<option value="eway_merchant" <?php echo ($cfg->processor == "eway_merchant")?("SELECTED"):(""); ?> >EWay Merchant</option>
				<option value="dummy" <?php echo ($cfg->processor == "dummy")?("SELECTED"):(""); ?> >No Gateway Processor</option>
			</select>
			<br />
		Gateway Mode:<br /> 
			<select name="gateway_mode">
				<option value="test" <?php echo (@$cfg->gateway_mode == "test")?("SELECTED"):(""); ?> >TEST</option>
				<option value="live" <?php echo (@$cfg->gateway_mode == "live")?("SELECTED"):(""); ?> >LIVE</option>
				<option value="debug" <?php echo (@$cfg->gateway_mode == "debug")?("SELECTED"):(""); ?> >DEBUG</option> 
			</select>
			<br />
			
			Force the use of HTTPS?<br />
			<select name="force_https">
				<option value="1" <?php echo (@$cfg->force_https == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->force_https == "0")?("SELECTED"):(""); ?> >No</option>		
			</select></i>
			<br />			
			</fieldset>
			
			<fieldset><legend>Language Settings</legend>
				
			Which language file to use?: <br /><select name="language_file">
				<option value="en-GB.php" <?php echo (@$cfg->language_file == "en-GB.php")?("SELECTED"):(""); ?> >en-GB</option>
				<option value="es-ES.php" <?php echo (@$cfg->language_file == "es-ES.php")?("SELECTED"):(""); ?> >es-ES</option>
			</select> 
			<br />
			
			Load language file based on Joomfish lang parameter?<br />
			<select name="use_joomfish_lang">
				<option value="1" <?php echo (@$cfg->use_joomfish_lang == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->use_joomfish_lang == "0")?("SELECTED"):(""); ?> >No</option>		
			</select> <i>Ex: (lang=en)</i>
			<br />
			<?php $langs = dcGetLanguages(); ?>
			Select this Configuration with Joomfish language?<br />
			<select name="select_joomfish_lang">
				<option value="">--</option>
				<?php foreach ($langs as $lang){
				
					echo '<option value="'.$lang->code.'" ' . (@$cfg->select_joomfish_lang == $lang->code)?("SELECTED"):("") . ' >'.$lang->code.'</option>';	
				}
			?>
			</select> <i>This option use the language file associated with the Joomfish language parameter (lang=en)</i>
			<br />						
			</fieldset>
					
			<fieldset><legend>User Account Settings</legend>
			Create A User Account?<br /> 
			<select name="create_user_account">
				<option value="1" <?php echo (@$cfg->create_user_account == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->create_user_account == "0")?("SELECTED"):(""); ?> >No</option>		
			</select> <i>This option will silently create a "blocked" user account based on the email address provided.</i>
			<br />		
			
			Show User Account Fields?<br /> <select name="show_user_account">
				<option value="1" <?php echo (@$cfg->show_user_account == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_user_account == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />	
			<?php //LEFTOFF ?>
			Save new user accounts as "Blocked"?<br /> <select name="block_user_account">
				<option value="1" <?php echo (@$cfg->block_user_account == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->block_user_account == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			
			<br />	
			Save ID of logged in user with donation?<br /> <select name="save_user_id">
				<option value="1" <?php echo (@$cfg->save_user_id == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->save_user_id == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />
			Pre-populate donor data in form when logged in?<br /> <select name="user_prepop">
				<option value="1" <?php echo (@$cfg->user_prepop == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->user_prepop == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />	
			<span class="hasTip" title="Info :: Append the donation form's URL with &emailAddress=sample@fatica.net and the last donation record from that email address will be prepopulated into the form.">
			Pre-populate donor data by Email Address URL Parameter?</span><br /> 
			<select name="user_prepop_email">
				<option value="1" <?php echo (@$cfg->user_prepop_email == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->user_prepop_email == "0")?("SELECTED"):(""); ?> >No</option>
			</select>			
			<br />
			<span class="hasTip" title="Info :: Append the donation form's URL with &subscriptionId=sampletransactionid and the last donation record from that Authorize.NET Transaction ID will be prepopulated into the form.">	
			Pre-populate donor data by Authorize.NET Transaction ID?</span><br />
			<select name="user_prepop_subscription_id">
				<option value="1" <?php echo (@$cfg->user_prepop_subscription_id == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->user_prepop_subscription_id == "0")?("SELECTED"):(""); ?> >No</option>
			</select>			
			
			<br />	
			<span class="hasTip" title="Info :: Used in tandem with the Email and SubscriptionID pre-population options above.  ARB Update allows for the change/update of the subscribers Billing Address or Credit Card information.">Allow for Authorize.NET ARB Profile Update with pre-populated donor data?</span><br /> 
			<select name="user_arbupdate">
				<option value="1" <?php echo (@$cfg->user_arbupdate == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->user_arbupdate == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			
			<br />	
			Allow for cancellation of ARB Profile with pre-populated donor data?<br /> 
			<select name="user_arbcancel">
				<option value="1" <?php echo (@$cfg->user_arbcancel == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->user_arbcancel == "0")?("SELECTED"):(""); ?> >No</option>
			</select>					
				
			<br />
			Ajax-check username availability?<br /> <select name="validate_user_account">
				<option value="1" <?php echo (@$cfg->validate_user_account == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->validate_user_account == "0")?("SELECTED"):(""); ?> >No</option>
			</select>		
			
			<br />
			New User Account Level:
			<br />		
			<?php showGIDSelect(@$cfg->default_account_level); ?>	
			<br />					
			</fieldset>
<?php
if(defined('_JEXEC')){
	echo $tabs->endPanel();
	echo $tabs->startPanel( 'Form Options', 'formfields' );
}else{
	$tabs->endTab();
	$tabs->startTab('Form Options', 'formfields' );
}
?>

<fieldset><legend>Fields on Payment form</legend>
			
			<i>Be sure to update the "Required fields" entry to not require fields you chose not to display in this section</i><br />
			
		Show Introductory Text:<select name="show_intro_text">
				<option value="1" <?php echo (@$cfg->show_intro_text == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_intro_text == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />		
		Introductory Text:
		<br />
		<?php _editorArea( 'editor1',  $cfg->intro_text , 'intro_text', '75%;', '400', '75', '40' ) ; ?>
		<!-- <textarea rows="20" cols="50" name="intro_text"><?php echo $cfg->intro_text; ?></textarea><br /> -->
		
		<br />
		
		Show Narrative Below Form, above the submit button:<select name="show_outro_text">
				<option value="1" <?php echo (@$cfg->show_outro_text == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_outro_text == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />		
		Narrative Below:
		<br />
		<?php _editorArea( 'editor11',  $cfg->outro_text , 'outro_text', '75%;', '400', '75', '40' ) ; ?>
		<!-- <textarea rows="20" cols="50" name="intro_text"><?php echo $cfg->outro_text; ?></textarea><br /> -->
		
		<br />
		
		Default Country:
		
		<?php echo getCountryHTML('default_country'); ?> <br />
			
		Default State:
		
		<?php echo getStateHTML('default_state'); ?> <br />
		

		Show Billing Address Fields:<select name="show_billing_address">
				<option value="1" <?php echo (@$cfg->show_billing_address == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_billing_address == "0")?("SELECTED"):(""); ?> >No</option>
			</select> 
			<br />
	
			
		Save form info in a cookie:<select name="save_cookie"> <i>This option will pre-populate the form data from the cookie if available.</i>
				<option value="1" <?php echo (@$cfg->save_cookie == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->save_cookie == "0")?("SELECTED"):(""); ?> >No</option>
			</select> 
			<br />	


		Show Program List:<select name="show_programs">
				<option value="1" <?php echo (@$cfg->show_programs == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_programs == "0")?("SELECTED"):(""); ?> >No</option>
			</select> 
			<br />	
								
		Available Programs:<input type="text" id="programs" name="programs" value="<?php echo $cfg->programs;?>" />
					<i>(Possible values: Pipe (|) seperated list of program names on the payment form)</i><br />			
			
					
		Show Email Field?:<select name="show_email">
				<option value="1" <?php echo (@$cfg->show_email == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_email == "0")?("SELECTED"):(""); ?> >No</option>

			</select>
			<br />		
		Show Phone Number Field?:<select name="show_phone">
				<option value="1" <?php echo (@$cfg->show_phone == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_phone == "0")?("SELECTED"):(""); ?> >No</option>

			</select>
			<br />					
		Show Comments Field:<select name="show_comments">
				<option value="1" <?php echo (@$cfg->show_comments == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_comments == "0")?("SELECTED"):(""); ?> >No</option>

			</select>
			<br />
		Show Credit Card Fields?:<select name="show_credit">
				<option value="1" <?php echo (@$cfg->show_credit == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_credit == "0")?("SELECTED"):(""); ?> >No</option>

			</select><i>(Choose to hide these if you dont have an SSL Cert and you're using PayPal Website Payments Standard)</i>
			<br />		
		Show Recurring Payment Fields?:<select name="frequency_enabled">
				<option value="1" <?php echo (@$cfg->frequency_enabled == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->frequency_enabled == "0")?("SELECTED"):(""); ?> >No</option>

				
			</select><i>Valid only for gateways that support recurring payments</i>
			<br />		
		Show Recurring Payment Fields simply as 'One time' or 'Monthly'?:<select name="simple_frequency">
				<option value="1" <?php echo (@$cfg->simple_frequency == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->simple_frequency == "0")?("SELECTED"):(""); ?> >No</option>

				
			</select><i>You must have 'Show Recurring Payment Fields' above set to 'Yes' for this to function </i>
			<br />				
			
		Hide "Other" Amount?:<select name="hide_amount_other">
				<option value="1" <?php echo (@$cfg->hide_amount_other == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->hide_amount_other == "0")?("SELECTED"):(""); ?> >No</option>

			</select>
			<br />				
				
		Show Organization Field:<select name="show_organization">
				<option value="1" <?php echo (@$cfg->show_organization == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_organization == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />
		Show Title Field:<select name="show_title">
				<option value="1" <?php echo (@$cfg->show_title == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_title == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />	
		Show Salutation Field:<select name="show_salutation">
				<option value="1" <?php echo (@$cfg->show_salutation == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_salutation == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />	
		Show Country Field:
			<select name="show_country">
				<option value="1" <?php echo (@$cfg->show_country == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_country == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />	
		Show Secure Donation Form link:
			<select name="show_tagline">
				<option value="1" <?php echo (@$cfg->show_tagline == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_tagline == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />		
					
				
			

		Required Fields:<input type="text"  name="required_fields" value="<?php echo $cfg->required_fields;?>" />
					<i>(Possible values: Pipe (|) seperated list of required field names on the payment form)</i>
		</fieldset>	
		
		<fieldset><legend>Custom Fields</legend>
		
		Show Custom Text Field 1?:<select name="show_custom1">
				<option value="1" <?php echo (@$cfg->show_custom1 == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_custom1 == "0")?("SELECTED"):(""); ?> >No</option>
				<option value="" <?php echo (!isset($cfg->show_custom1))?("SELECTED"):(""); ?> >--</option>
			</select>
			<br />		

		Custom Field 1 Label:
			<input type="text" id="custom1" name="custom1" value="<?php echo @$cfg->custom1; ?>" />
			<br />	
			
		Show Custom Text Field 2?:<select name="show_custom2">
				<option value="1" <?php echo (@$cfg->show_custom2 == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_custom2 == "0")?("SELECTED"):(""); ?> >No</option>
				<option value="" <?php echo (!isset($cfg->show_custom2))?("SELECTED"):(""); ?> >--</option>
			</select>
			<br />		

		Custom Field 2 Label:
			<input type="text"  name="custom2" value="<?php echo @$cfg->custom2; ?>" />
			<br />						
		
		Show Custom Text Field 3?:<select name="show_custom3">
				<option value="1" <?php echo (@$cfg->show_custom3 == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_custom3 == "0")?("SELECTED"):(""); ?> >No</option>
				<option value="" <?php echo (!isset($cfg->show_custom3))?("SELECTED"):(""); ?> >--</option>
			</select>
			<br />		

		Custom Field 3 Label:
			<input type="text" name="custom3" value="<?php echo @$cfg->custom3; ?>" />
			<br />	
			
			
		Show Custom Check Box 1?:<select name="show_custom1_cb">
				<option value="1" <?php echo (@$cfg->show_custom1_cb == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_custom1_cb == "0")?("SELECTED"):(""); ?> >No</option>
				<option value="" <?php echo (!isset($cfg->show_custom1_cb))?("SELECTED"):(""); ?> >--</option>
			</select>
			<br />		

		Custom Check Box 1 Label:
			<input type="text" name="custom_cb1" value="<?php echo @$cfg->custom_cb1; ?>" />
			<br />	
						
		Show Custom  Check Box 2?:<select name="show_custom2_cb">
				<option value="1" <?php echo (@$cfg->show_custom2_cb == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_custom2_cb == "0")?("SELECTED"):(""); ?> >No</option>
				<option value="" <?php echo (!isset($cfg->show_custom2_cb))?("SELECTED"):(""); ?> >--</option>
			</select>
			<br />		

		Custom Check Box 2 Label:
			<input type="text" name="custom_cb2" value="<?php echo @$cfg->custom_cb2; ?>" />
			<br />	
			
		Show Custom  Check Box 3?:<select name="show_custom3_cb">
				<option value="1" <?php echo (@$cfg->show_custom3_cb == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->show_custom3_cb == "0")?("SELECTED"):(""); ?> >No</option>
				<option value="" <?php echo (!isset($cfg->show_custom3_cb))?("SELECTED"):(""); ?> >--</option>
			</select>
			<br />		
			
		Custom Check Box 3 Label:
			<input type="text" name="custom_cb3" value="<?php echo @$cfg->custom_cb3; ?>" />
			<br />	
						
		<!-- Show Custom List?:<select name="custom_list">
				<option value="1" <?php echo (@$cfg->custom_list == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo (@$cfg->custom_list == "0")?("SELECTED"):(""); ?> >No</option>
				<option value="" <?php echo (!isset($cfg->custom_list))?("SELECTED"):(""); ?> ></option>
			</select> 
			<br />		
			
		Custom Options:<input type="text" id="custom_list_options" name="custom_list_options" value="<?php echo @$cfg->custom_list_options;?>" />
					<i>(Possible values: Pipe (|) seperated list of options E.g. red|green|blue)</i><br />			-->
						
		</fieldset>
		
<?php
if(defined('_JEXEC')){
	echo $tabs->endPanel();
	echo $tabs->startPanel( 'Email', 'email' );
}else{
	$tabs->endTab();
	$tabs->startTab( 'Email', 'email' );
}
?>
		<fieldset><legend>Email options</legend>	
		Send "Thank you" Email:					
			<select name="send_thankyou_email">
				<option value="1" <?php echo ($cfg->send_thankyou_email == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo ($cfg->send_thankyou_email == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />
		Send Administrator Payment Notice?:<select name="send_admin_email">
				<option value="1" <?php echo ($cfg->send_admin_email == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo ($cfg->send_admin_email == "0")?("SELECTED"):(""); ?> >No</option>
			</select>
			<br />
		Use HTML Email?:
			<select name="send_htmlemail">
				<option value="1" <?php echo ($cfg->send_htmlemail == "1")?("SELECTED"):(""); ?> >Yes</option>
				<option value="0" <?php echo ($cfg->send_htmlemail == "0")?("SELECTED"):(""); ?> >No</option>
			</select>	
			<br />		

		Thank you Email Body:<i>Use %%fieldname%% for dynamic replacement</i><br />
		<?php _editorArea( 'editor3', $cfg->thank_you_body , 'thank_you_body', '75%;', '200', '75', '20' ) ; ?>
		<!-- <textarea rows="20" cols="50" name="thank_you_body"><?php echo $cfg->thank_you_body; ?></textarea><br />-->
		Thank you Email Subject:<br /> <input type="text" name="thank_you_subject" value="<?php echo $cfg->thank_you_subject; ?>" /><br />
		
		Thank you Page: <br /> <input type="text" name="thank_you_page" value="<?php echo $cfg->thank_you_page; ?>" /><br />(Possible values: An absolute URL to redirect to after a payment has been made)<br>
		Thank you Message: <i>Use %%fieldname%% for dynamic replacement</i><br /> 
		<?php _editorArea( 'editor2', $cfg->thank_you_page_message , 'thank_you_page_message', '75%;', '200', '75', '20' ) ; ?>
		<!-- <textarea rows="20" cols="50"  name="thank_you_page_message"><?php echo $cfg->thank_you_page_message; ?></textarea><br />(Possible values: An text string to display after a payment has been made)<br> -->
		
		</fieldset>
		
<?php
if(defined('_JEXEC')){
	echo $tabs->endPanel();
	echo $tabs->startPanel( 'eCommerce', 'eCommerce' );
}else{
	$tabs->endTab();
	$tabs->startTab( 'eCommerce', 'eCommerce' );
}
?>		
		Predefined amounts: <br /> <input type="text"  name="amounts"  value="<?php echo $cfg->amounts; ?>"/><i>(Possible values: Pipe (|) seperated list of radio button values to display as preconfigured amounts E.g. 500.00|1000.00|2000.00)</i><br />
		
		Default Predefined amount: <br /> <input type="text"  name="default_amount"  value="<?php echo @$cfg->default_amount; ?>"/><i>(Possible values: One of the radio button values above (E.g. 500.00)</i><br />
		
		Minimum donation amount: <br /> <input type="text"  name="minimum_amount"  value="<?php echo @$cfg->minimum_amount; ?>"/><i>A numeric value indicating the smallest donation allowed</i><br />
		
		Currency Label: <br /> <input type="text"  name="currency_descr" value="<?php echo $cfg->currency_descr; ?>"/><i>Text to display after the amount field USD,EURO,Yen etc.</i><br />
		Card types: <br /> 
			<select name="card_types[]" size="4" multiple="multiple">
				<option value="Visa" <?php echo (strpos($cfg->card_types,"Visa") !==false)?("SELECTED"):(""); ?> >Visa</option>
				<option value="Mastercard" <?php echo (strpos($cfg->card_types,"Mastercard") !==false)?("SELECTED"):("");; ?> >Mastercard</option>
				<option value="Diners" <?php echo(strpos($cfg->card_types,"Diners") !==false)?("SELECTED"):(""); ?> >Diners</option>
				<option value="Amex" <?php echo (strpos($cfg->card_types,"Amex") !==false)?("SELECTED"):(""); ?> >American Express</option>
				<option value="Discover" <?php echo (strpos($cfg->card_types,"Discover") !==false)?("SELECTED"):(""); ?> >Discover</option>
			</select>
			<br /> 
			
		Save Full Credit Card Number? :<select name="store_full_cc">
				<option value="0" <?php echo ($cfg->store_full_cc == "0")?("SELECTED"):(""); ?> >No</option>
				<option value="1" <?php echo ($cfg->store_full_cc == "1")?("SELECTED"):(""); ?> >Yes</option>				
			</select><i>Not recommended!</i>
			<br /> 
		Currency code:
		<input type="text"  name="country_currency"  id="country_currency" value="<?php echo @$cfg->country_currency;?>"/><br />
		
		Transaction Comment:
		<input type="text"  name="transaction_comment"  id="transaction_comment" value="<?php echo @$cfg->transaction_comment;?>"/><i>This appears in the gateway under the comment or purchase description.  Can be used for seperating transactions by configuration.</i><br />		
		<h2>Gateway Settings</h2>
		
		<fieldset><legend>PayPal Standard</legend>
		PayPal Account Email:  <input type="text"  name="paypal_account"  value="<?php echo @$cfg->paypal_account;?>" /><br />
		</fieldset>
		
		<fieldset><legend>PayPal PayFlow Link</legend>
		Login:  <input type="text"  name="paypal_link_login"  value="<?php echo @$cfg->paypal_link_login;?>" /><br />
		Partner:  <input type="text"  name="paypal_link_partner"  value="<?php echo @$cfg->paypal_link_partner;?>" /><br />
		</fieldset>		
				
		<fieldset><legend>Authorize.net</legend>
		Authorize.Net Login Id: <input type="text"  name="auth_net_login"   value="<?php echo @$cfg->auth_net_login;?>"/> <br /> 
		Authorize.Net Transaction Key: <input type="text"  name="auth_net_xaction"   value="<?php echo  @$cfg->auth_net_xaction;?>"/> <br /> 
		Show eCheck option?
		<select name="auth_net_echeck">
				<option value="" >--</option>
				<option value="0" <?php echo ($cfg->auth_net_echeck == "0")?("SELECTED"):(""); ?> >No</option>
				<option value="1" <?php echo ($cfg->auth_net_echeck == "1")?("SELECTED"):(""); ?> >Yes</option>				
		</select>
		
		</fieldset>
		<fieldset><legend>PayPal Website Payments Pro</legend>
		<i>API login credentials</i>
		PayPal WPP User:  <input type="text"  name="wpp_user"   value="<?php echo @$cfg->wpp_user;?>"/><br />
		PayPal WPP Password:  <input type="text"  name="wpp_password"  value="<?php echo @$cfg->wpp_password;?>"/><br />
		PayPal WPP Signature:  <input type="text"  name="wpp_signature"  value="<?php echo @$cfg->wpp_signature;?>"/><br />
		</fieldset>
		<fieldset><legend>PayPal PayFlow Pro</legend>
		PayFlowPro User:  <input type="text"  name="payflow_user"   value="<?php echo @$cfg->payflow_user;?>"/><br />
		PayFlowPro Vendor:  <input type="text"  name="payflow_vendor"   value="<?php echo @$cfg->payflow_vendor;?>"/> <br />
		PayFlowPro Partner:  <input type="text"  name="payflow_partner"   value="<?php echo @$cfg->payflow_partner;?>"/> <br />
		PayFlowPro Password:  <input type="text"  name="payflow_password"  value="<?php echo @$cfg->payflow_password;?>"/><br />
		</fieldset>
		
		<fieldset><legend>Bibit</legend>
		Merchant Code:  <input type="text"  name="bibit_user"   value="<?php echo @$cfg->bibit_user;?>"/><br />
		Merchant Password:  <input type="text"  name="bibit_password"  value="<?php echo @$cfg->bibit_password;?>"/><br />
		</fieldset>	
		
		<fieldset><legend>EPay</legend>
		EPay Customer ID:  <input type="text"  name="eway_customer_id"   value="<?php echo @$cfg->eway_customer_id;?>"/><br />
		EPay :  <input type="text"  name="eway_customer_password"  value="<?php echo @$cfg->eway_customer_password;?>"/><br />
		</fieldset>			

		<input type="hidden" name="task" id="task" value="saveconfiguration" />
      	<input type="hidden" name="option" id="option" value="com_donate" />
      	
<?php
if(defined('_JEXEC')){
	echo $tabs->endPanel();
	echo $tabs->startPanel( 'Information', 'Information' );
}else{
	$tabs->endTab();
	$tabs->startTab( 'Information', 'Information' );
}
?>
		<fieldset><legend>Distribution</legend>
		Component is downloaded from the site <a href="http://joomfans.com" target="_blank" title="Joomla! Templates & Extensions" >Joomfans.com</a>.<br />
<ul>
<li><a href="http://joomfans.com/template/" target="_blank" title="Joomla! Templates" >Joomla! Templates</a>.</li>
<li><a href="http://joomfans.com/extensions/" target="_blank" title="Joomla! Extensions" >Joomla! Extensions</a>.</li>
<li><a href="http://joomfans.com/soft/" target="_blank" title="Joomla! Tools" >Joomla! Tools</a>.</li>
</ul>
The component is provided Joomfans.com site for viewing and testing. If you want to use this product legally, please buy it on the developer's site: <a href="http://fatica.net" target="_blank" title="Fatica" >Fatica.net</a>
		</fieldset>
      	<?php
      	if(defined('_JEXEC')){
			echo $tabs->endPanel();
			echo $tabs->endPane();
		}else{
	      	$tabs->endTab();
	      	$tabs->endPane();
	     
		}
      	?>

      	<input type="submit" name="submit" value="Save" style="clear:both;">
		</form>
		
		</td></tr></table>
		<script language="javascript" type="text/javascript">
		
		function loadConfig(){
			window.location = '?option=com_donate&task=configure&configuration_id=' + document.getElementById('id').options[document.getElementById('id').selectedIndex].value;
			//
		}
		
		
		function deleteConfig(){

			if(confirm("Are you sure?")){
				if(document.getElementById('id').options[document.getElementById('id').selectedIndex].value){
					window.location = '?option=com_donate&task=deleteconfig&configuration_id=' + document.getElementById('id').options[document.getElementById('id').selectedIndex].value;
				}else{
					alert("None selected");	
				}
			}
			//
		}		
		</script>
		
		
		<?php
	}
	

	
	/**
	 * display the  thank you message
	 * Testing
	 *
	 */
	function showThankYou(){
		global $cfg;

		if(!isset($_GET['mosmsg'])){
			
			echo $cfg->thank_you_page_message;
			
		}
	}


	/**
	 * Display the donation form
	 *
	 * @param unknown_type $cfg
	 */
	function showForm(){
			
			global $database,$cfg;
			
			$user_loaded = false;
			$user_id = 0;
			$country_html = "";
			$html = "";
			$donation_id = 0;
			$_emailAddress = "";
			$_subscriptionId = "";
			$user_state = "";
			$user_country = "";
						
			//load the donor data from the database if requested
			if(@$cfg->user_prepop == 1){
				
				$user_id = getUserId();
				
				if($user_id > 0){
					
					$user_row = new donation($cfg->database);
					
					$donation_id = getDonationIDByUser($user_id);
					
					if($user_row->load($donation_id)){
						$user_loaded = true;	
					}
				}
			}
			
			
			//load the donor data from the URL if requested
			if(@$cfg->user_prepop_email == 1 || @$cfg->user_prepop_subscription_id == 1){
				
				$user_row = "";
				$user_row = new donation($cfg->database);
				
				if(@$cfg->user_prepop_subscription_id == 1){
				
					$_subscriptionId = addslashes($_GET['subscriptionId']);

					$donation_id = getDonationIDByTransactionID($_subscriptionId);
					
				}elseif(@$cfg->user_prepop_emailaddress == 1){
					
					//sanitized in the d
					$_emailAddress = addslashes($_GET['emailAddress']);
								
					$donation_id = getDonationIDByEmail($_emailAddress);
				}
				
				if($user_row->load($donation_id)){
					$user_loaded = true;	
					
					$user_state = $user_row->state;
					$user_country = $user_row->country;

				}
				
			}

			if($cfg->show_country){
				$country_html = getCountryHTML("",$user_country);
			}else{
				$country_html = "<input type='hidden' id='country' name='country' value='223' />";
			}

			$html = getStateHTML("",$user_state);
			
			
//show the page title if requested
if(defined('_JEXEC')){
global $mainframe;

$menu = & JSite::getMenu('site');

$active_page = $menu->getActive();

$params = $menu->getParams( $active_page->id );

	if($params->get('show_page_title') == 1){
		?>
		<h1 class="contentheading"><?php echo $active_page->name;?></h1>
		<?php
	}
}


?>
<!-- this can be moved to your template_css.css for xhtml compliance -->
<link href="<?php echo @$cfg->secure_site; ?>/components/com_donate/donate.css" rel="stylesheet" type="text/css"/>
<script language="javascript" src="<?php echo @$cfg->secure_site; ?>/components/com_donate/donate.js" type="text/javascript"></script>
<form action="index.php" name="donate" method="post" onSubmit="return validate(this);" autocomplete="off" >
  <?php 
  if($cfg->gateway_mode == _TEST_MODE){
  	?>
  	<h2><font color="Red">This form is in TEST mode using configuration_id <?php echo $cfg->id;?></font></h2>
  	<?php
  }
  if($cfg->gateway_mode == _DEBUG_MODE){
  	?>
  	<h2><font color="Red">This form is in DEBUG mode.</font></h2>
  <?php
  }
  
  if($cfg->show_intro_text == 1){
  		echo $cfg->intro_text; 
  }

  ?>
  <table width="100%" border="0" cellspacing="0" cellpadding="3" class="com_donate">
  <tr>
    <td align="left" valign="top"><table align="left" >
        <?php if(@$cfg->show_salutation == 1){ ?>
        <tr>
          <td align="right" width="30%"><label for="salutation"><?php echo _CD_FORM_SALUTATION; ?></label></td>
          <td align="left"> <select name="salutation" id="salutation">
                <option value="Mr." >Mr.</option>
                <option value="Mrs.">Mrs.</option>
                <option value="Ms.">Ms.</option>
                <option value="Rev.">Rev.</option>
                <option value="Dr.">Dr.</option>
              </select>
              <?php showRequired('salutation'); ?>
              </td>
        </tr>        
        <?php } ?>
        <tr>
         	<td  width="30%" align="right"><label for="firstname"><?php echo _CD_FORM_FNAME; ?></label></td>
          	<td align="left"><input type="text" size="30" maxlength="255" name="firstname" id="firstname" value="<?php if($user_loaded){echo $user_row->firstname;}?>" />
             <?php showRequired('firstname'); ?></td>
        </tr>
        
        <tr>
         	<td align="right"><label for="lastname"><?php echo _CD_FORM_LNAME; ?></label></td>
         	<td align="left"><input type="text" size="30" maxlength="255" name="lastname" id="lastname" value="<?php if($user_loaded){echo $user_row->lastname;}?>" />
           <?php showRequired('lastname'); ?></td>
        </tr>
        
        <!-- field start -->
        <?php if(@$cfg->show_organization == 1){ ?>
        <tr>
          	<td align="right"><label for="organization"><?php echo _CD_FORM_ORGANIZATION; ?>:</label></td>
          	<td align="left"><input type="text" size="30" maxlength="255" name="organization" id="organization" value="<?php if($user_loaded){echo $user_row->organization;}?>" />
          	<?php showRequired('lastname'); ?>
          	</td>
        </tr>        
        <?php } ?>
        <!-- field end -->

        <?php if(@$cfg->show_title == 1){ ?>
        <tr>
          	<td align="right"><label for="title"><?php echo _CD_FORM_TITLE; ?>:</label></td>
          	<td align="left"><input type="text" size="30" maxlength="255" name="title" id="title" value="<?php if($user_loaded){echo $user_row->title;}?>" />
          	<?php showRequired('lastname'); ?>
            </td>
        </tr>        
        <?php } ?>

        <?php if(@$cfg->auth_net_echeck == 1 && $cfg->show_credit == 1){ ?>
        <tr>
			<td align="right"><label for="method">Payment Method:</label></td>
			<td align="left">
				<select name="method" id="method" onchange="togglePayment(this);">
					<option value="CC">Credit Card</option>
					<option value="ECHECK">Check</option>
				</select>
			</td>
        </tr>           
        <?php } ?>
        <?php if(@$cfg->show_credit == 1){ ?>    
       <tr><td colspan="2" align="left">
        <div id="cc" style="text-align:left;">
        <table width="100%" align="left">
        <tr>
          <td  width="30%" align="right"><?php echo _CD_FORM_CARDTYPE; ?>:</td>
          <td align="left"><select name="card_type" >
          <?php 
           $cards = explode("|",$cfg->card_types);
           foreach ($cards as $card){
           	echo '<option value="'.$card.'">'.$card.'</option>';
           }
          ?>
           </select>
            <span class="required">*</span>
            </td>
        </tr>
        <tr>
          <td align="right"><label for="credit_card"><?php echo _CD_FORM_CARDNUMBER; ?>:</label></td>
          <td align="left"><input type="text" size="19" maxlength="19" id="credit_card" name="credit_card"  />
            <span class="required">*</span>
            </td>
        </tr>
        <tr>
          <td align="right"><?php echo _CD_FORM_EXPIRATIONDATE; ?>:</td>
          <td align="left">
              <select name="expiration_month">
                <option value="1">01</option>
                <option value="2">02</option>
                <option value="3">03</option>
                <option value="4">04</option>
                <option value="5">05</option>
                <option value="6">06</option>
                <option value="7">07</option>
                <option value="8">08</option>
                <option value="9">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
              </select>
              <select name="expiration_year">
              <?php
              	
              	for($x = date("y"),$y=date("Y"); $x < date("y") + 20; $x++,$y++){
              		echo '<option value="'.$x.'">'.$y.'</option>';
              	}
              	
              ?>
              </select>
              <span class="required">*</span></td>
        </tr>
        <tr>
          <td align="right"><label for="cvv"><?php echo _CD_FORM_CVV ?>:</label></td>
          <td align="left"><input type="text" size="3" maxlength="4" name="cvv" id="cvv" />
            <span class="required">*</span>
            <a href="javascript:openpopup('<?php echo @$cfg->secure_site; ?>/components/com_donate/cvv.html',20,20,300,300);" ><?php echo _CD_CVV; ?></a>
            </td>
        </tr>
        
        </table></td></tr>
        <?php } //end show credit card 

        if(@$cfg->auth_net_echeck == 1){
        ?>
        <tr><td colspan="2">
        <div id="check" style="display:none;">
        <table>
        <tr>
          <td width="30%" align="right">
          <strong>eCheck Payment</strong>
     	</td>
          <td> <a href="javascript:openpopup('<?php echo @$cfg->secure_site; ?>/components/com_donate/echeck.jpg',20,20,360,260);" ><?php echo _CD_CVV; ?></a></td>
        </tr>               
        <tr>
          <td align="right">Bank Routing Number:</td>
          <td align="left"><input name="x_bank_aba_code" id="x_bank_aba_code" maxlength="9" />
            <span class="required">*</span>
            </td>
        </tr>
        
        <tr>
          <td align="right">Account Number:</td>
          <td align="left"><input name="x_bank_acct_num" id="x_bank_acct_num" maxlength="20" />
            <span class="required">*</span>
            </td>
        </tr>      
        
        
 		<tr>
          <td align="right">Account Type:</td>
          <td align="left">
              <select name="x_bank_acct_type" id="x_bank_acct_type">
                <option value="CHECKING">Checking</option>
                <option value="BUSINESSCHECKING">Business Checking</option>
                <option value="SAVINGS">Savings</option>
              </select>
              <span class="required">*</span></td>
        </tr> 
        
 		<tr>
          <td align="right">Bank Name:</td>
          <td align="left"><input name="x_bank_name" id="x_bank_name" maxlength="50" />
            <span class="required">*</span>
            </td>
        </tr> 
                
 		<tr>
          <td align="right">Name of Account Holder:</td>
          <td align="left"><input name="x_bank_acct_name" id="x_bank_acct_name" maxlength="50" />
            <span class="required">*</span>
            </td>
        </tr>         
        </table>
        </div>
        </td></tr>
        <?php	
        }
        ?> 
       
        
        <?php if(@$cfg->show_billing_address == 1){ ?>  
        <tr>
          <td align="right">
          <?php echo _CD_FORM_BILLINGADDRESS; ?></td>
          <td></td>
        </tr>
        <?php if(@$cfg->show_country){ 	?>
        <tr>
          <td align="right"><label for="country"><?php echo _CD_FORM_COUNTRY; ?>:</label></td>
          <td align="left"><?php echo $country_html?>
           <?php showRequired('country'); ?>
          </td>
        </tr>        
        <?php
        }
        ?>
        <tr>
          <td align="right"><label for="address1"><?php echo _CD_FORM_ADDRESS1; ?>:</label></td>
          <td align="left"><input type="text" size="25" maxlength="100" name="address1"  value="<?php if($user_loaded){echo $user_row->address1;}?>" />
            <span class="required">*</span></td>
        </tr>
        <tr>
          <td align="right"><label for="address2"><?php echo _CD_FORM_ADDRESS2; ?>:</label></td>
          <td align="left"><input type="text"  size="25" maxlength="100" name="address2"  value="<?php if($user_loaded){echo $user_row->address2;}?>" />
            (optional)</td>
        </tr>
        <tr>
          <td align="right"><label for="city"><?php echo _CD_FORM_CITY; ?>:</label></td>
          <td align="left"><input type="text" size="25" maxlength="40" name="city" id="city"  value="<?php if($user_loaded){echo $user_row->city;}?>" />
            <span class="required">*</span></td>
        </tr>
        <tr>
          <td align="right"><label for="state"><?php echo _CD_FORM_STATE; ?>:</label></td>
          <td align="left"><?php echo $html?></td>
        </tr>
        <tr>
          <td align="right"><label for="postalcode"><?php echo _CD_FORM_POSTAL; ?>:</label></td>
          <td align="left"><input type="text" size="10" maxlength="10" name="postalcode" id="postalcode"  value="<?php if($user_loaded){echo $user_row->postalcode;}?>" />
            <span class="required">*</span><span id="postal_format" ><?php echo _CD_FORM_POSTAL_FORMAT; ?></span></td>
        </tr>
         <?php } //end show billing address ?> 
         <?php if($cfg->show_phone == 1){ ?> 
        <tr>
          <td align="right"><label for="phone"><?php echo _CD_FORM_PHONEEXT; ?>:</label></td>
          <td align="left"><input name="phone" id="phone" type="text" size="25" maxlength="40"  value="<?php if($user_loaded){echo $user_row->phone;}?>"/>
            <?php showRequired('phone'); ?>
            <input name="extension" type="text" id="ext" size="4" maxlength="40" />
          </td>
        </tr>
        <?php } //end show phone ?> 
        
        <?php if($cfg->show_email == 1){ ?>
        <tr>
          <td align="right"><label for="email"><?php echo _CD_FORM_EMAIL; ?>:</label></td>
          <td align="left"><input name="email" type="text" id="email"  size="25" maxlength="100"  value="<?php if($user_loaded){echo $user_row->email;}?>" />
           <?php showRequired('email'); ?></td>
        </tr>
        <?php } //end show email ?> 
        
        
        <?php if(@$cfg->show_programs == 1){ ?>
        
         <tr>
          <td align="right"><label for="program"><?php echo _CD_FORM_PROGRAM_LIST; ?>:</label></td>
          <td align="left">
          	<select name="program" type="text" id="program" >
          	<?php 
          		$programs = explode("|",@$cfg->programs);
          		
          		echo '<option value="">' . _CD_SELECT . '</option>';
          		
          		if(count($programs) > 0){
	          		foreach ($programs as $program){
	          		
	          			echo '<option value="' . $program . '">' . $program . '</option>';
	          				
	          		}
          		}
          	
          	?>
          	</select>
          	 <?php showRequired('program'); ?>
          </td>
        </tr>       
        
        <?php } //end show custome1 ?> 
                        
        <?php if(@$cfg->show_custom1 == 1){ ?>
        
         <tr>
          <td align="right"><label for="custom1"><?php echo @$cfg->custom1; ?>:</label></td>
          <td align="left"><input name="custom1" type="text" id="custom1" size="25" maxlength="100" /><?php showRequired('custom1'); ?></td>
        </tr>       
        
        <?php } //end show custome1 ?> 
        
        
        <?php if(@$cfg->show_custom2 == 1){ ?>
        
         <tr>
          <td align="right"><label for="custom2"><?php echo @$cfg->custom2; ?>:</label></td>
          <td align="left"><input name="custom2" type="text" id="custom2" size="25" maxlength="100" /><?php showRequired('custom2'); ?></td>
        </tr>       
        
        <?php } //end show custome1 ?>        
        <?php if(@$cfg->show_custom3 == 1){ ?>
        
         <tr>
          <td align="right"><label for="custom3"><?php echo @$cfg->custom3; ?>:</label></td>
          <td align="left"><input name="custom3" type="text" id="custom3" size="25" maxlength="100" /><?php showRequired('custom3'); ?></td>
        </tr>       
        
        <?php } //end show custom1 ?>      
        
        <?php if(@$cfg->show_custom1_cb == 1){ ?>
        
         <tr>
          <td align="right"><label for="custom_cb1"><?php echo @$cfg->custom_cb1; ?>:</label></td>
          <td align="left"><input name="custom_cb1" type="checkbox" id="custom_cb1" value="checked" checked="checked"  /></td>
        </tr>       
        
        <?php } //end show custome1 ?> 
        
        
        <?php if(@$cfg->show_custom2_cb == 1){ ?>
        
         <tr>
          <td align="right"><label for="custom_cb2"><?php echo @$cfg->custom_cb2; ?>:</label></td>
          <td align="left"><input name="custom_cb2" type="checkbox" id="custom_cb2" value="checked" checked="checked"  /></td>
        </tr>       
        
        <?php } //end show custome1 ?>        
        <?php if(@$cfg->show_custom3_cb == 1){ ?>
         <tr>
          <td align="right"><label for="custom_cb3"><?php echo @$cfg->custom_cb3; ?>:</label></td>
          <td align="left"><input name="custom_cb3" type="checkbox" id="custom_cb3" value="checked" checked="checked" /></td>
        </tr>       
        
        <?php } //end show custom1 ?>             
        <?php 
        //show the create user account fields if chosen and the user is not logged in
        if($cfg->show_user_account == 1 && $user_loaded !== true){   ?>
        <tr>
          <td align="right"><label for="username"><?php echo _CD_FORM_USERNAME; ?>:</label></td>
          <td align="left"><input name="username" type="text" id="username" size="25" maxlength="100" <?php if(@$cfg->validate_user_account == 1){ echo 'onchange="checkUsername(this.value)"'; } ?>  />
            <input name="username_valid" type="hidden" id="username_valid" value="0" />	
            <span class="required">*</span><div id="username_check"></div></td>
        </tr><tr>
          <td align="right"><label for="password"><?php echo _CD_FORM_PASSWORD; ?>:</label></td>
          <td align="left"><input name="password" type="password" id="password"  size="25" maxlength="100"  />
            <span class="required">*</span></td>
		</tr><tr>            
          <td align="right"><label for="password_verify"><?php echo _CD_FORM_PASSWORD_VERIFY; ?>:</label></td>
          <td align="left"><input name="password_verify" type="password" id="password_verify"  size="25" maxlength="100"  />
            <span class="required">*</span></td>                        
        </tr>
        <?php } //end show email

        
        //should we ask for an amount at all?
        if(strlen(trim($cfg->amounts)) > 0 || $cfg->hide_amount_other != 1){
        ?>         
        <tr>
          <td align="right" valign="top"><span class="required">*</span><?php echo _CD_FORM_AMOUNT; ?>:</td>
          <td align="left"><?php
          
          //get the predefined donation amounts
          $amounts = explode("|",$cfg->amounts);
          $count = 0;
          $amount_html = "";
          $checked = "";
          
          foreach ($amounts as $amount)
          {
          	if(strlen(trim($amount)) > 0){
          		
          		if($amount == @$cfg->default_amount){
          			$checked = 'checked="checked"';	
          		}else{
          			$checked = "";
          		}
          		
              $amount_html .= '<input class="radio" type="radio" name="idonate_amts" value="'.$amount.'" '.$checked.' />$' . number_format($amount,2) . "<br />";
              $count++;
              
          	}
          }  
          
          if($count == 1){
			
			$amounts[0] = (float)$amounts[0];
			
			echo '<input type="hidden" name="amount" value="'.$amounts[0].'" />';
			
			echo '$' . number_format($amounts[0],2);
			
			echo "&nbsp;" . $cfg->currency_descr;
			
			 echo "<br />";
          	
          }else{

          	echo $amount_html;
          	
          }
			
			if(@$cfg->hide_amount_other != 1){
				
				if ($count > 0){ 
					?>
			  	<input class="radio" type="radio" name="idonate_amts" value="" />
			  <?php echo _CD_FORM_OTHER; ?>
				 <?php } ?>
			  <input type="text" size="10" maxlength="20" name="amount" />
			  <?php echo $cfg->currency_descr;
			
			}
			
			?>
                            
              </td>
        </tr>

       <?php }else{  	?>
       	<input type="hidden" name="no_payment" id="no_payment" value="1" />
       	<?php
       	 
			
       }//end show amount   ?>
        
        <?php if (@$cfg->frequency_enabled == 1 && (@strtolower($cfg->processor) == "authorizenet" || @strtolower($cfg->processor) == "paypal_standard" || @strtolower($cfg->processor) == "paypal_pro"  || @strtolower($cfg->processor) == "dummy")  ){ ?>
        
        <?php if(@$cfg->simple_frequency == 1){ ?>
		<tr>
          <td align="right" valign="top"><?php echo _CD_FORM_SIMPLE_FREQUENCY; ?>:</td>
          <td align="left">
          <select name="interval" id="interval">
          	<option value="0">One-time donation</option>
          	<option value="1">Monthly</option>
          </select>
          <input name="length" id="length" value="1" type="hidden" />                  
          <input name="unit" id="unit" value="months" type="hidden" />
          <input name="duration" id="duration" value="9999" type="hidden" />            
          </td>
        </tr>                 
        <?php }else{ ?>
		<tr>
          <td align="right" valign="top"><?php echo _CD_FORM_FREQUENCY; ?>:</td>
          <td align="left">
          <select name="interval" id="interval">
          	<option value="0"><?php echo _CD_FORM_FREQ_NEVER; ?></option>
          	<option value="1"><?php echo _CD_FORM_FREQ_EVERY; ?></option>
          </select>
           <select name="length" id="length">
           <option value="">--</option>
              <?php
              	for($x = 1; $x <= 365; $x++){
              		echo '<option value="'.$x.'">'.$x.'</option>';
              	}
              ?>          
          </select>                    
          <select name="unit" id="unit">
            <option value="">--</option>
          	<option value="days"><?php echo _CD_FORM_FREQ_DAYS; ?></option>
          	<option value="months"><?php echo _CD_FORM_FREQ_MONTHS; ?></option>
          </select>   
 		<select name="duration" id="duration">
          	<option value="">--</option>
          	<option value="1"><?php echo _CD_FORM_FREQ_1_YEAR; ?></option>
          	<option value="2"><?php echo _CD_FORM_FREQ_2_YEAR; ?></option>
          	<option value="3"><?php echo _CD_FORM_FREQ_3_YEAR; ?></option>
          	<option value="4"><?php echo _CD_FORM_FREQ_4_YEAR; ?></option>
          	<option value="5"><?php echo _CD_FORM_FREQ_5_YEAR; ?></option>
          	<option value="9999"><?php echo _CD_FORM_FREQ_INDEF; ?></option>
          </select>             
          </td>
        </tr>   
                
        <?php if(@$cfg->show_comments == 1){ ?>
        <tr>
			<td align="right"><label for="comments"><?php echo _CD_FORM_COMMENTS; ?>:</label></td>
			<td align="left"><input type="text" size="30" maxlength="255" name="comments"  id="comments" />
			<?php showRequired('comments'); ?>
			</td>
        </tr>        
        <?php } ?>  
                
        <?php }
        }
        

		//should we try and update an ARB profile?
      	if(@$cfg->user_arbupdate == 1){

      		if(strlen(@$user_row->xaction_id) > 0){
      			
      			//TODO: optionally show the subscriber their subscription
      ?>
       	<input type="hidden" name="subscriptionid" id="subscriptionid" value="<?php echo $user_row->xaction_id; ?>" />
			<?php 
      		}
      	}

        if(@$cfg->show_outro_text == 1){
          ?>  
        <tr>
        	<td colspan="2">
        		<?php echo $cfg->outro_text; ?>
        	</td>
        </tr> 
          <?php }?>
        <tr>
          <td colspan="2" align="center"><div id="submit_layer"><input name="submit" type="submit" value="<?php echo _CD_FORM_SUBMIT; ?>" /></div></td>
        </tr>
     
      </table></td></tr></table>
      
      <?php 
      if($cfg->show_country == 0){
      	echo $country_html;
      }
      ?>
      <input type="hidden" name="country_currency" id="country_currency" value="<?php echo $cfg->country_currency;?>" />
      <input type="hidden" name="payment" id="payment" value="<?php echo @$cfg->processor; ?>" />
      <?php 
      if($user_loaded === true){
      	?>
      	<input type="hidden" name="user_id" id="user_id" value="<?php echo $user_id ?>" />
      	<?php
      }
      ?>

      <input type="hidden" name="configuration_id" id="configuration_id" value="<?php echo (int)$cfg->id;?>" />
      <input type="hidden" name="task" id="task" value="donate" />
      <input type="hidden" name="Itemid" id="Itemid" value="<?php echo htmlentities(mosGetParam($_REQUEST,'Itemid')); ?>" />
      <input type="hidden" name="option" id="option" value="com_donate" />
</form>

<?php if(@$cfg->show_tagline == 1){ ?>
	<div align="center"><a href="http://www.fatica.net" target="_blank" style="font-size:.5em; text-decoration:none; color:#CCCCCC;">Joomla Extensions by Fatica Consulting L.L.C.</a></div>
<?php  } ?>

<script language="javascript" type="text/javascript">
<!-- 
function validate(f){

var chosen = 0;
var msg = '';
var retval = true;

<?php  if(strlen(trim($cfg->amounts)) > 0 && $cfg->hide_amount_other != 1){ ?>
	try{

	    //check if a predefined value has been checked 
		if(f.idonate_amts){
			
			for(i=0; i < f.idonate_amts.length; i++){
				if(f.idonate_amts[i].checked){
					chosen = f.idonate_amts[i].value;
				}
			}
		}
	
	}catch(Err){}
	
	//check if there's been custom value checked
    if(f.amount){
    	
	    if(chosen <= 0 && (f.amount.value == "" || f.amount.value == null)){
	            msg += "<?php echo _CD_FORM_AMOUNT_ERR; ?>\n";
	            retval = false;
	    }
	    }else{
	
		if(chosen <=0){
			msg += "<?php echo _CD_FORM_AMOUNT_ERR; ?>\n";
			retval = false;
		}
	}

	<?php } ?>
	<?php if($cfg->show_user_account == 1 && $user_loaded !== true){ ?>
	
	if(document.getElementById('password_verify') && document.getElementById('password')){
		
		if(document.getElementById('password_verify').value != document.getElementById('password').value){
			msg += "<?php echo _CD_FORM_PASSWORD_NOMATCH; ?>\n";
			retval = false;		
		}

		if(document.getElementById('password').value.length <= 4){
			msg += "<?php echo _CD_FORM_PASSWORD_SHORT; ?>\n";
			retval = false;				
		}	
		
	}
	
	<?php if(@$cfg->validate_user_account == 1 && $user_loaded !== true){ ?>
		
		if(document.getElementById('username_valid')){
			
			if(document.getElementById('username_valid').value != 1){		
				
				if(document.getElementById('username').value.length > 0){
					
				msg += "<?php echo _CD_FORM_USERNAMETAKEN; ?>\n";
				retval = false;
	
				}
			}
		}
		
		<?php } ?>
	
	<?php }
	
	if (@$cfg->frequency_enabled == 1 && (@strtolower($cfg->processor) == "authorizenet" || @strtolower($cfg->processor) == "paypal_standard") || @strtolower($cfg->processor) == "paypal_pro"  || @strtolower($cfg->processor) == "dummy"  ){ ?>
	
		try{
		
			//validate the recurring donation fields
			if(document.getElementById('interval').options[document.getElementById('interval').selectedIndex].value == 1){
		
				if(document.getElementById('length').options[document.getElementById('length').selectedIndex].value == ""){
					msg += "<?php echo _CD_FORM_ERR_R_LENGTH;?>\n";
					document.getElementById('length').className="highlight";
					retval = false;
				}else{
					document.getElementById('length').className="";
				}
				
				var length = document.getElementById('length').options[document.getElementById('length').selectedIndex].value;
				var unit = document.getElementById('unit').options[document.getElementById('unit').selectedIndex].value;
				var duration = document.getElementById('duration').options[document.getElementById('duration').selectedIndex].value;
				
				if(length > 12 &&  unit == "months"){
					msg += "<?php echo _CD_FORM_ERR_R_MONTHS;?>\n";
					document.getElementById('length').className="highlight";
					retval = false;
				}	
				
				if(document.getElementById('unit').options[document.getElementById('unit').selectedIndex].value == ""){
					msg += "<?php echo _CD_FORM_ERR_R_DAYSORMONTHS;?>\n";
					document.getElementById('unit').className="highlight";
					retval = false;
				}else{
					document.getElementById('unit').className="";
				}
				
				if(document.getElementById('duration').options[document.getElementById('duration').selectedIndex].value == ""){
					msg += "<?php echo _CD_FORM_ERR_R_DURATION;?>\n";
					document.getElementById('duration').className="highlight";
					retval = false;
				}else{
					document.getElementById('duration').className="";
				}			
			}
		
		}catch(Err){}
	<?php } ?>
	
	//validate the ECHECK
	if(f.method.options){
	if(f.method.options[f.method.options.selectedIndex].value == "ECHECK"){
		
		var echeckFields = new Array('x_bank_aba_code','x_bank_name','x_bank_acct','x_bank_acct_name','x_bank_acct_num');

		for (var x = 0; x < echeckFields.length; x++){
			if(document.getElementById(echeckFields[x])){
				if(document.getElementById(echeckFields[x]).value == "" || document.getElementById(echeckFields[x]).value == null){
					document.getElementById(echeckFields[x]).className="highlight";
					msg += echeckFields[x] + " <?php echo _CD_FORM_ERR_ISREQUIRED;?>\n";
					retval = false;
				}
			}
		}	
	}else if(f.method.options[f.method.options.selectedIndex].value == "CC"){
		
		var ccFields = new Array('credit_card','cvv');
				
			for (var x = 0; x < ccFields.length; x++){
				if(document.getElementById(ccFields[x])){
					//alert(document.getElementById(ccFields[x]).value);
					if(document.getElementById(ccFields[x]).value == "" || document.getElementById(ccFields[x]).value == null){
						document.getElementById(ccFields[x]).className="highlight";
						msg += ccFields[x] + " <?php echo _CD_FORM_ERR_ISREQUIRED;?>\n";
						retval = false;
					}
				}
			}				
		}
	}
	<?php 
	
	$required = explode("|",$cfg->required_fields);
	
	foreach ($required as $field){

		if(strlen($field) > 0){
			?>
				
			if(f.<?php echo $field;?>){
				if(f.<?php echo $field;?>.value == "" || f.<?php echo $field;?>.value == null){
					
					//skip requiring an empty state list
					if('<?php echo $field?>' == 'state'){
						if(document.getElementById('state').options.length > 0){
							f.<?php echo $field;?>.className="highlight";
							msg += "<?php echo $field;?> <?php echo _CD_FORM_ERR_ISREQUIRED;?>\n";
							retval = false;								
						}else{
							f.<?php echo $field;?>.className="";
						}
					}else{
						
						f.<?php echo $field;?>.className="highlight";
						msg += "<?php echo $field;?> <?php echo _CD_FORM_ERR_ISREQUIRED;?>\n";
						retval = false;
					}
				}else{
					f.<?php echo $field;?>.className="";
				}
			}
			<?php
		}
	}
	?>
	
	try{
	
		//validate US postal codes
		if (document.getElementById('country')) {
			if(document.getElementById('country').value == "223"){
				if(document.getElementById('postalcode').value){
					if(!validateZIP(document.getElementById('postalcode').value)){
						retval = false;
						msg += "<?php echo _CD_FORM_ERR_POSTAL;?>";			
					}
				}
			}
		}
	
	}catch(Err){}
	
	try{
		
		if(document.getElementById('email')){
			
			if(document.getElementById('email').value){
				
				if(!echeck(document.getElementById('email').value)){
					retval = false;
					msg += "<?php echo _CD_FORM_ERR_EMAIL;?>";
				}
			}
		}
	}catch(Err){}
	
	if(msg.length > 0){
		alert("<?php echo _CD_FORM_ERRORS; ?>:\n" + msg);
		retval = false;
	}else{
		//no errors, hide the submit button to prevent double-clicking
		document.getElementById('submit_layer').style.display="none";
	}
	
return retval;

}

function validateZIP(field) {
	
	var valid = "0123456789-";
	var hyphencount = 0;
	
	if (field.length!=5 && field.length!=10) {
		return false;
	}
	for (var i=0; i < field.length; i++) {
		temp = "" + field.substring(i, i+1);
		if (temp == "-") hyphencount++;
	
		if (valid.indexOf(temp) == "-1") {
			return false;
		}
		
		if ((hyphencount > 1) || ((field.length==10) && ""+field.charAt(5)!="-")) {
			return false;
	   }
	}
return true;
}


function echeck(str) {

		var at="@";
		var dot=".";
		var lat=str.indexOf(at);
		var lstr=str.length;
		var ldot=str.indexOf(dot);
		if (str.indexOf(at)==-1){
		   return false;
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   return false;
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    return false;
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    return false;
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    return false;
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    return false;
		 }
		
		 if (str.indexOf(" ")!=-1){
		    return false;
		 }

 		 return true;					
	}

-->
    </script>
  	<?php
	}
	
}
?>