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


if(isset($_SESSION['ACCOUNT']) && $_SESSION['ACCOUNT']->accesslevel >= RIGHT_ADD_NEWS && 
			(isset($_POST['Poster']) || isset($_POST['Editer'])) )
{
	if(isset($_POST['title']) && $_POST['title']!='' && isset($_POST['content']) && $_POST['content']!='')
	{
		require_once(CLASS_PATH.'tables/News.php');
		
		
		if(!isset($_GET['id']))
		{
			$news = new News();
			
			$news->setAllFields(
				array(	'title'=>$_POST['title'],
						'author'=>$_SESSION['ACCOUNT']->login,
						'content'=>$_POST['content'],
						'write_date'=>'NOW'
				));
			
			$news->insert();
		}
		else
		{
			$news = new News();
			$news->id=$_GET['id'];
			$news->content=$_POST['content'];
			$news->title=$_POST['title'];
			$news->save();
		}
		
		if(file_exists(CACHE_FOLDER.'NEWS.cache'))
			unlink(CACHE_FOLDER.'NEWS.cache');
		
		
		$oSmarty->assign('NEWS_WRITE',TRUE);
	}
	else $oSmarty->assign('NEWS_WRITE',FALSE);
}

$oSmarty->display('add_news.tpl');

?>