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

require_once(CLASS_PATH.'tables/Accounts.php');
require_once(CLASS_PATH.'tables/LoginLog.php');
require_once(INCLUDE_PATH.'function_ip.php');

global $CONNECT;
global $LOGIN_ERREUR;
global $BAN;


if(!isset($_SESSION['ACCOUNT']))
{
	$BAN=FALSE;
	$CONNECT=FALSE;
	
	if((isset($_POST['login_login']) && isset($_POST['login_password'])) || 
			(isset($_COOKIE['login_login']) && isset($_COOKIE['login_password']) && $_COOKIE['login_login']!='' && $_COOKIE['login_password']))
	{
		if(LoginLog::isIPBanned(getIP()))
			$LOGIN_ERREUR=4;
		else
		{
			$login_test = isset($_POST['login_login'])?$_POST['login_login']:$_COOKIE['login_login'];
			$password_test = isset($_POST['login_password'])?$_POST['login_password']:$_COOKIE['login_password'];
			
			if(strlen($login_test) > 3 && strlen($password_test) > 3 && strlen($login_test) <= 20 && 
															isset($_POST['login_login'])?strlen($password_test) <= 20:strlen($password_test)==40)
			{
				$oLoginLog = new LoginLog();
				
				$oLoginLog->log_time='NOW';
				$oLoginLog->ip=getIP();
				$oLoginLog->login=$login_test;
				$oLoginLog->password=$password_test;
				
				if(Accounts::existField('login',$login_test))
				{
					$password_test=isset($_POST['login_login'])?sha1($password_test):$password_test;
					
					$oLoginLog->account_exist=TRUE;
					$line = Accounts::select(array('password','id'),array('login'),array('ILIKE'),array($login_test));
					
					if(	$password_test == $line->password )
					{
						
						//ban compte connexion multiple
						if(Accounts::ipUtiliseSurUnAutreCompte(getIP(),$login_test))
						{
							$login_ban = Accounts::selectLoginIpUtiliseSurUnAutreCompte(getIP(),$login_test);
							
							$time = 2*24*60*60;//2 jours
							Accounts::banLogin($login_ban,$time);
							Accounts::banLogin($login_test,$time);
							
							$LOGIN_ERREUR=array($login_ban,$login_test);
							$BAN=TRUE;
						}
						elseif(LoginLog::isIPAlreadyRegisterOnOtherAccount(getIP(),$login_test))
						{
							$login_ban = LoginLog::selectLoginIsIPAlreadyRegisterOnOtherAccount(getIP(),$login_test);
							
							$time = 2*24*60*60;//2 jours
							Accounts::banLogin($login_ban,$time);
							Accounts::banLogin($login_test,$time);
							
							$LOGIN_ERREUR=array($login_ban,$login_test);
							$BAN=TRUE;
						}
						else
						{
							if(Accounts::isLoginBan($line->id))
							{
								$LOGIN_ERREUR=5;
								$BAN=TRUE;
							}
							else
							{
								$oLoginLog->right_password=TRUE;
								$oLoginLog->password=$password_test;
								
								$oAccount = new Accounts();
								$oAccount->id=$line->id;
								$oAccount->last_connection='NOW';
								$oAccount->ip=getIP();
								$oAccount->save();
								
								$_SESSION['ACCOUNT']=Accounts::getInstanceOfID($line->id);
								
								require_once(INCLUDE_PATH.'cookies.php');
								write_login_cookie($login_test,$password_test);
								
								
								$CONNECT=TRUE;
								
								header('Location: '.MAIN_PATH.'news.php');
							}
						}
					}
					else 
					{
						$oLoginLog->right_password=0;
						$LOGIN_ERREUR=3;
					}
				}
				else 
				{
					$oLoginLog->account_exist=0;
					$LOGIN_ERREUR=2;
				}
				
				if(!$BAN)
					$oLoginLog->insert();
			}
			else $LOGIN_ERREUR=1;
		
	  	}
	}
}
else $CONNECT=TRUE;


?>