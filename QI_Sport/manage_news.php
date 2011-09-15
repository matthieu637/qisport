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

$oSmarty = new Smarty();
init_smarty($oSmarty);

require_once(CLASS_PATH."tables/News.php");


if(isset($_SESSION['ACCOUNT']) && $_SESSION['ACCOUNT']->accesslevel >= RIGHT_MANAGE_NEWS && 
	isset($_GET['a']) && isset($_GET['id']))
{
	if($_GET['a'] == 'd')
	{
		require_once(CLASS_PATH.'tables/News.php');

		News::delete_id($_GET['id']);
		header('Location: manage_news.php');
		
	}
	else if($_GET['a'] == 'e')
	{
		$oSmarty->assign('EDIT',TRUE);
		$oSmarty->assign('NEWS',News::getAll(array('id'),array('='),array($_GET['id']),null));
	}
	else $oSmarty->assign('NEWS',News::getAll(null,null,null,"ORDER BY write_date DESC"));
}
else $oSmarty->assign('NEWS',News::getAll(null,null,null,"ORDER BY write_date DESC"));

$oSmarty->display('manage_news.tpl');

?>