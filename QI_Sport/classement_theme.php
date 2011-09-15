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

$LIMITS = array('20','100','250','500');

if(isset($_GET['limit']) && is_numeric($_GET['limit']) && in_array($_GET['limit'],$LIMITS) )
	$limit=$_GET['limit'];
else $limit = 20;

$cache = new Cache("CLASSEMENT_THEME_$limit.cache",1000);

if($cache->open())
{
	require_once(CLASS_PATH."Classement.php");

	$oSmartyCache = new Smarty();
	$oSmartyCache->assign('SPORTS',$SPORTS);

	$table = array();
	
	for($i=0;$i<sizeof($SPORTS);$i++)
		$table[$i] = Classement::getGeneralClassementBySport($limit,$SPORTS[$i]);
		
	$oSmartyCache->assign('CLASSEMENT',$table);
	
	if(isset($_SESSION['ACCOUNT']))
	{
		$myClassement = array();
		
		for($i=0;$i<sizeof($SPORTS);$i++)
			$myClassement[$i] = Classement::getMyPosition(Classement::getGeneralClassementBySport(0,$SPORTS[$i]),$_SESSION['ACCOUNT']->login);
		
		$oSmartyCache->assign('MYCLASSEMENT',$myClassement);
		
		$myPoints = array();
		
		for($i=0;$i<sizeof($SPORTS);$i++)
			$myPoints[$i] = Classement::getMyPoints(Classement::getGeneralClassementBySport(0,$SPORTS[$i]),$_SESSION['ACCOUNT']->login,'Score total');
		
		$oSmartyCache->assign('MYPOINTS',$myPoints);
	}
	
	$oSmartyCache->display('classement_theme.tpl');
}

$oSmarty->assign('JS_FILES',array('url_functions.js'));
$oSmarty->assign('CLASSEMENT',$cache->close());


$oSmarty->display('classement.tpl');

?>