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

if( isset($_SESSION['ACCOUNT']) && isset($_GET['action']) && $_GET['action'] == 'confirm_delete' )
{
	Accounts::delete_id($_SESSION['ACCOUNT']->id);
	
	require_once 'deconnexion.php';
}
else if(isset($_POST['profil_edit']) && isset($_SESSION['ACCOUNT']))
{
	$oAccount = $_SESSION['ACCOUNT'];
	
	$fields = array(
			'sport' => $_POST['sport'],
			'newsletter' => (isset($_POST['newsletter']) && $_POST['newsletter']=="on")?TRUE:0);
	
	if(isset($_POST['sexe']) && ($_POST['sexe']=='M' || $_POST['sexe']=='F'))
		$fields['sex']=$_POST['sexe'];
		
	if(isset($_POST['annee']) && is_numeric($_POST['annee']))
	{
		$fields['years']=$_POST['annee'];
			
		if(isset($_POST['mois']) && isset($_POST['jours']) && is_numeric($_POST['mois']) && is_numeric($_POST['jours']))
		{
			$fields['days']=$_POST['jours'];
			$fields['months']=$_POST['mois'];
		}
	}
	
	if(isset($_POST['pays']) && $_POST['pays']!='')
		$fields['nationality']=$_POST['pays'];
		
	if(isset($_POST['fan']) && $_POST['fan']!='')
		$fields['fan']=$_POST['fan'];
		
	$oAccount->setAllFields($fields);
	$oAccount->save();
	
	$_SESSION['ACCOUNT']=$oAccount;
}

$oSmarty = new Smarty();
init_smarty($oSmarty);
$oSmarty->display('profil.tpl');

?>