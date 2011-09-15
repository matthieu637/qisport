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
require_once(CLASS_PATH.'tables/Accounts.php');
init();

$SHOW_PASSWORD_EDIT_FORM=FALSE;
$ERROR_PASSWORD_EDIT=0;

if( isset($_SESSION['ACCOUNT']) && isset($_POST['password_edit_password_last']) && isset($_POST['password_edit_password1']) && isset($_POST['password_edit_password2']) && 
	$_POST['password_edit_password2']==$_POST['password_edit_password1'] )
{
	if(sha1($_POST['password_edit_password_last']) == $_SESSION['ACCOUNT']->password)
	{
		$oAccount = new Accounts();
		$oAccount->id=$_SESSION['ACCOUNT']->id;
		$oAccount->password=sha1($_POST['password_edit_password1']);
		$oAccount->save();
		
		
		$_SESSION['ACCOUNT']->password=sha1($_POST['password_edit_password1']);
		
		$ERROR_PASSWORD_EDIT=2;
	}
	else
	{
		$ERROR_PASSWORD_EDIT=1;
		$SHOW_PASSWORD_EDIT_FORM=TRUE;
	}
}
else $SHOW_PASSWORD_EDIT_FORM=TRUE;


$oSmarty = new Smarty();
init_smarty($oSmarty);

$oSmarty->assign('ERROR_PASSWORD_EDIT',$ERROR_PASSWORD_EDIT);
$oSmarty->assign('SHOW_PASSWORD_EDIT_FORM',$SHOW_PASSWORD_EDIT_FORM);

$oSmarty->assign('JS_FILES',array('formulaire.js','password_edit.js'));
$oSmarty->display('password_edit.tpl');

?>