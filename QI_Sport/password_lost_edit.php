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

$SHOW_PASSWORD_FORM=FALSE;
$PASSWORD_CHANGED=FALSE;


if (	isset($_POST['i']) && isset($_POST['e']) && isset($_POST['p']) && is_numeric($_POST['i']) && 
		strlen($_POST['p']) == 40 && filter_var($_POST['e'], FILTER_VALIDATE_EMAIL) && isset($_POST['password_lost_edit_password1']) 
		&& isset($_POST['password_lost_edit_password2']) && strlen($_POST['password_lost_edit_password2'])> 3 && 
		$_POST['password_lost_edit_password2'] == $_POST['password_lost_edit_password1'] )
{
	
	if($line = Accounts::select(array('id'),array('id','email','password'),array('=','ILIKE','ILIKE'),
																array($_POST['i'],$_POST['e'],$_POST['p'])))
	{
		$oAccount = new Accounts();
		$oAccount->id=$line->id;
		$oAccount->password=sha1($_POST['password_lost_edit_password1']);
		$oAccount->save();
		
		$PASSWORD_CHANGED=TRUE;
		$SHOW_PASSWORD_FORM=FALSE;
	}
	else
	{
		$PASSWORD_CHANGED=FALSE;
		$SHOW_PASSWORD_FORM=FALSE;
	}
}
else if(isset($_GET['i']) && isset($_GET['e']) && isset($_GET['p']) && is_numeric($_GET['i']) && strlen($_GET['p']) == 40 &&
		filter_var($_GET['e'], FILTER_VALIDATE_EMAIL))
{
	$SHOW_PASSWORD_FORM=TRUE;
}


$oSmarty = new Smarty();
init_smarty($oSmarty);

$oSmarty->assign('JS_FILES',array('password_lost_edit.js'));
$oSmarty->assign('SHOW_PASSWORD_FORM',$SHOW_PASSWORD_FORM);
$oSmarty->assign('PASSWORD_CHANGED',$PASSWORD_CHANGED);

$oSmarty->display('password_lost_edit.tpl');

?>