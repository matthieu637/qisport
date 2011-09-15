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

$ACTIONS = array('list','all','sport','me');

if(isset($_GET['action']) && in_array($_GET['action'],$ACTIONS))
	$action=$_GET['action'];
else $action = 'list';

if(isset($_GET['classement']) && is_numeric($_GET['classement']) && $_GET['classement'] > 0 && $_GET['classement'] < 6)
	$classement=$_GET['classement'];
else $classement = 'no_classement';

$CLASSEMENTS = array('Ceux qui ont le plus joué',
				     'Ceux qui ont mis le plus de points en une question',
				     'Ceux qui ont mis le plus de points sur un questionnaire',
					 'Ceux qui ont obtenu le plus de bonne réponses');


$cache = new Cache("CLASSEMENT_ANNEXE_$classement"."_$action"."_$limit.cache",1000);

if($cache->open())
{
	require_once(CLASS_PATH."Classement.php");

	$oSmartyCache = new Smarty();

	if($action=='all')
	{
		switch ($classement) 
		{
			case 0:  
				$oSmartyCache->assign('CLASSEMENT',Classement::getMorePlayedGame($limit));
				break;
			case 1:
				$oSmartyCache->assign('CLASSEMENT',Classement::getMostPointPerQuestion($limit));
				break;
			case 2:
				$oSmartyCache->assign('CLASSEMENT',Classement::getMostPointPerQuestionnaire($limit));
				break;
			case 3:
				$oSmartyCache->assign('CLASSEMENT',Classement::getMoreGoodAnswer($limit));
				break;
		}
	}
	else if($action=='sport')
	{
		$oSmartyCache->assign('SPORTS',$SPORTS);
		
		$table = array();
	
		for($i=0;$i<sizeof($SPORTS);$i++)
			switch ($classement) 
			{
				case 0: 
					$table[$i] = Classement::getMorePlayedGameBySport($limit,$SPORTS[$i]);
					break;
				case 1:
					$table[$i] = Classement::getMostPointPerQuestionBySport($limit,$SPORTS[$i]);
					break;
				case 2:
					$table[$i] = Classement::getMostPointPerQuestionnaireBySport($limit,$SPORTS[$i]);
					break;
				case 3:
					$table[$i] = Classement::getMoreGoodAnswerBySport($limit,$SPORTS[$i]);
					break;
			}
		
		$oSmartyCache->assign('CLASSEMENT',$table);
	}
	
	
	$oSmartyCache->assign('CLASSEMENTS',$CLASSEMENTS);
	$oSmartyCache->display('classement_annexe.tpl');
}

$oSmarty->assign('JS_FILES',array('url_functions.js'));
$oSmarty->assign('CLASSEMENT',$cache->close());

$oSmarty->display('classement.tpl');

?>