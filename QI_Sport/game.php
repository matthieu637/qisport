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

$valid_sport = array('b','r','c','f','s','t');

function contains($array, $value)
{
	foreach($array AS $val)
	if($val == $value)
	return true;
	return false;
}

function getSport($val)
{
		if($val == 'b')
			return 'Basket-Ball';
		elseif($val == 'r')
			return 'Rugby';
		elseif($val == 'c')
			return 'Cyclisme';
		elseif($val == 'f')
			return 'Football';
		elseif($val == 's')
			return "Sports d'Hiver";
		elseif($val == 't')
			return 'Tennis';
}

if(isset($_GET['s']) && contains($valid_sport,$_GET['s']))
{
	$oSmarty->assign('SPORT',getSport($_GET['s']));
}

$oSmarty->display('game.tpl');

?>