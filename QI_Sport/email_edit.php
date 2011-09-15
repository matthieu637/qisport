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

$SHOW_EMAIL_EDIT_FORM=FALSE;
$ERROR_EMAIL_EDIT=0;

if( isset($_SESSION['ACCOUNT']) && isset($_POST['email_edit_email1']) && isset($_POST['email_edit_email2']) && $_POST['email_edit_email2']==$_POST['email_edit_email1'] )
{
	if(Accounts::existField('email', $_POST['email_edit_email1'] )==FALSE)
	{
		$oAccount = new Accounts();
		$oAccount->id=$_SESSION['ACCOUNT']->id;
		$oAccount->email=$_POST['email_edit_email1'];
		$oAccount->save();
		
		$_SESSION['ACCOUNT']->email=$_POST['email_edit_email1'];
		
		$ERROR_EMAIL_EDIT=2;
	}
	else
	{
		$ERROR_EMAIL_EDIT=1;
		$SHOW_EMAIL_EDIT_FORM=TRUE;
	}
}
else $SHOW_EMAIL_EDIT_FORM=TRUE;


$oSmarty = new Smarty();
init_smarty($oSmarty);

$oSmarty->assign('JS_FILES',array('formulaire.js','email_edit.js'));
$oSmarty->assign('ERROR_EMAIL_EDIT',$ERROR_EMAIL_EDIT);
$oSmarty->assign('SHOW_EMAIL_EDIT_FORM',$SHOW_EMAIL_EDIT_FORM);
$oSmarty->display('email_edit.tpl');

?>