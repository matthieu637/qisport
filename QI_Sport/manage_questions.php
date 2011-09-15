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

require_once(CLASS_PATH.'tables/Questionnaires.php');
require_once(CLASS_PATH."tables/Questions.php");

$oSmarty = new Smarty();
init_smarty($oSmarty);

if(isset($_SESSION['ACCOUNT']))
{
	$actions = array('edit','del','f_edit');
	
	if($_SESSION['ACCOUNT']->accesslevel >= RIGHT_ADD_QUESTION)
	{
		if( isset($_GET['list']))
		{	
			$oSmarty->assign('QUESTIONS',Questions::getAll(null,null,null,'WHERE id_questionnaire IS NULL ORDER BY sport'));
		}
		else if(isset($_GET['create_questionnaire']))
		{
			Questionnaires::create_all_questionnaire();
			header("Location: manage_questions.php?list");
		}
		else if(isset($_GET['list_all']))
		{
			$oSmarty->assign('QUESTIONS',Questions::getAll(null,null,null,'ORDER BY sport'));
		}
		else if(isset($_GET['add']))
		{
			$oSmarty->assign('ADD',TRUE);
		}
		else if(isset($_GET['f_add']) && isset($_POST['quizz']) && isset($_POST['reponse']) && $_POST['quizz']!='' && $_POST['reponse']!='' && isset($_POST['sport']))
		{
			$fields = array(
			
			'question' => $_POST['quizz'],
			'answer' => $_POST['reponse'],
			'sport' => $_POST['sport']
			);
			
			$oQuestion = new Questions();
			$oQuestion->setAllFields($fields);
			$oQuestion->insert();
		}
		else if(isset($_GET['a']) && isset($_GET['id']) && in_array($_GET['a'],$actions) && is_numeric($_GET['id']))
		{
			if($_GET['a']=='edit')
				$oSmarty->assign('QUESTIONS',Questions::getAll(array('id'),array('='),array($_GET['id']),null));
			else if($_GET['a'] =='del')
			{
				Questions::delete_id($_GET['id']);
				header('Location: manage_questions.php?list');
			}
			else if($_GET['a']=='f_edit' && isset($_POST['quizz']) && isset($_POST['reponse']) && $_POST['quizz']!='' 
						&& $_POST['reponse']!='' && isset($_POST['sport']) )
			{
				$quest = new Questions();
				$quest->id=$_GET['id'];
				$quest->question=$_POST['quizz'];
				$quest->answer=$_POST['reponse'];
				$quest->sport=$_POST['sport'];
				$quest->save();
				
				header('Location: manage_questions.php?list_all');
			}
		}
	}
}

$oSmarty->display('manage_questions.tpl');


?>