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

global $PASSWORD_ERREUR;

if(isset($_POST['password_lost_login']) && isset($_POST['password_lost_email']))
{
	if(strlen($_POST['password_lost_login']) > 3 && strlen($_POST['password_lost_email']) > 3 && 
	filter_var($_POST['password_lost_email'], FILTER_VALIDATE_EMAIL)	)
	{
		require_once(CLASS_PATH.'tables/Accounts.php');
		

		if($line = Accounts::select(array('id','password','email'),array('login','email'),array('ILIKE','ILIKE'),
										array($_POST['password_lost_login'],$_POST['password_lost_email'])))
		{
			require_once(INCLUDE_PATH.'send_mail.php');	
			
			$titre = 'Redéfinition de votre mot de passe QI Sport';
			
			$contenu = "Bonjour ".$_POST['password_lost_login'].',
			<br />
			
			L\'équipe QI Sport vous envoie cette e-mail suite à votre demande de redéfinition de mot de passe.
			<br />
			<br />
			Pour suivre la procédure veuillez cliquer sur ce 
			<a href="'.SITE_PATH.'password_lost_edit.php?i='.$line->id.'&e='.$line->email.'&p='.$line->password.'" >lien</a>. <br/>
			
			Ceci est un message automatique, veuillez ne pas y répondre.<br/>
		  	Vous pouvez signaler tout abus sur notre site.<br/><br/>
		  	
		  	<center><strong><a href="'.SITE_PATH.'">QI Sport<a/></strong></center>
			';
			
			if(send_mail($titre,$contenu,$line->email))
		  		$PASSWORD_ERREUR=0;
		  	else $PASSWORD_ERREUR=3;
		}
		else $PASSWORD_ERREUR=2;
	}
	else $PASSWORD_ERREUR=1;
}

$oSmarty = new Smarty();
init_smarty($oSmarty);

$oSmarty->assign('JS_FILES',array('password_lost.js'));
$oSmarty->assign('PASSWORD_ERREUR',$PASSWORD_ERREUR);

$oSmarty->display('password_lost.tpl');

?>