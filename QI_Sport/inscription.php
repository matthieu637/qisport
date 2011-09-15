<?php
/*
Copyright (c) 2011  <Matthieu Zimmer>

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the "Software"), to deal in 
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.
*/
?>
<?php

require_once('variables.php');
init();


if(!isset($_SESSION['ACCOUNT']))
{
	$SHOW_REGISTER_FORM=TRUE;
	$oAccount;
	
	/*
	foreach($_REQUEST as $key => $value)
		echo $key." : ".$value." <br>";
	*/
	
	
	if( isset($_POST['inscription_submit']) && isset($_POST['inscription_login']) && isset($_POST['inscription_password1']) && isset($_POST['inscription_password2']) && isset($_POST['inscription_email1']) && isset($_POST['inscription_email2']) && 
		isset($_POST['inscription_sport']) && isset($_POST['inscription_code']) && isset($_POST['inscription_rules']) && $_POST['inscription_password1']==$_POST['inscription_password2'] && 
		strlen($_POST['inscription_login']) > 3 && strlen($_POST['inscription_password1']) > 3  && $_POST['inscription_email1']==$_POST['inscription_email2'] && $_POST['inscription_rules']=="on"  &&
		filter_var($_POST['inscription_email1'], FILTER_VALIDATE_EMAIL) && strtoupper($_POST['inscription_code']) == strtoupper($_SESSION['code_antibot']) )
	{
		require_once(CLASS_PATH.'tables/Accounts.php');
	
		if(!Accounts::existField('login',$_POST['inscription_login']) && !Accounts::existField('email',$_POST['inscription_email1']))
		{
			require_once(INCLUDE_PATH.'function_ip.php');
			
			$fields = array(
			'login' => $_POST['inscription_login'],
			'password' => sha1($_POST['inscription_password1']),
			'email' => $_POST['inscription_email1'],
			'sport' => $_POST['inscription_sport'],
			'newsletter' => (isset($_POST['inscription_newsletter']) && $_POST['inscription_newsletter']=="on")?TRUE:0,
			'ip' => getIP(),
			'register_date' => 'NOW',
			'last_connection' => 'NOW',
			'accesslevel' => '0'
			);
			
			if(isset($_POST['inscription_sexe']) && ($_POST['inscription_sexe']=='M' || $_POST['inscription_sexe']=='F'))
				$fields['sex']=$_POST['inscription_sexe'];
			
				
			if(isset($_POST['inscription_annees']) && is_numeric($_POST['inscription_annees']))
			{
				$fields['years']=$_POST['inscription_annees'];
					
				if(isset($_POST['inscription_mois']) && isset($_POST['inscription_jours']) && is_numeric($_POST['inscription_mois']) && is_numeric($_POST['inscription_jours']))
				{
					$fields['days']=$_POST['inscription_jours'];
					$fields['months']=$_POST['inscription_mois'];
				}
			}
				
			if(isset($_POST['inscription_pays']) && $_POST['inscription_pays']!='')
				$fields['nationality']=$_POST['inscription_pays'];
				
			if(isset($_POST['inscription_fan']) && $_POST['inscription_fan']!='')
				$fields['fan']=$_POST['inscription_fan'];
			
			//TODO:SEND MAIL TO CONFIRM
			
			$oAccount = new Accounts();
			$oAccount->setAllFields($fields);
			$id = $oAccount->insert();
			
			//id necessaire pour applet
			$oAccount->id=$id;
			
			$SHOW_REGISTER_FORM=FALSE;
			$_SESSION['ACCOUNT']=$oAccount;
			
			require_once(INCLUDE_PATH.'cookies.php');
			write_login_cookie($oAccount->login,$oAccount->password);
			
			require_once(CLASS_PATH.'Cache.php');
			Cache::clear_cache();
		}
		else die();
	}

}
else $SHOW_REGISTER_FORM=FALSE;


//Protection multi compte
if($SHOW_REGISTER_FORM==TRUE)
{
	if(isset($_COOKIE['login_password']) || isset($_COOKIE['login_login']))
	{
		$SHOW_REGISTER_FORM=FALSE;
	}
	else
	{	
		require_once(CLASS_PATH.'tables/Accounts.php');
		require_once(INCLUDE_PATH.'function_ip.php');
		require_once(CLASS_PATH.'tables/LoginLog.php');
		
		if(LoginLog::isIPAlreadyRegister(getIP()) || Accounts::ipDejaUtilise(getIP()))
			$SHOW_REGISTER_FORM=FALSE;
	}
}


$oSmarty = new Smarty();
init_smarty($oSmarty);

$oSmarty->assign('SHOW_REGISTER_FORM',$SHOW_REGISTER_FORM);
$oSmarty->assign('JS_FILES',array('inscription.js'));

if(!$SHOW_REGISTER_FORM && isset($oAccount))
{
	$oSmarty->assign('ACCOUNT',$oAccount);
	$oSmarty->assign('CONNECT',TRUE);
}

if(isset($_POST['valide']) && $SHOW_REGISTER_FORM)
{
		//TODO:finir validation des autres formulaires
		$oSmarty->assign('JS_BODY_OPTIONS','');
		$oSmarty->assign('ERROR_CODE',TRUE);
}

$oSmarty->display('inscription.tpl');

?>