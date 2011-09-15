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

/*
foreach($_REQUEST as $key => $value)
	echo $key." : ".$value." <br>";
*/

if(isset($_POST['request']))
{
	require_once('variables.php');

	$request = $_POST['request'];
	
	if(strstr($request,'login'))
	{
		if(isset($_POST['args']) && strlen($_POST['args']) >= 4 && strlen($_POST['args']) <= 20 && htmlspecialchars($_POST['args']) == $_POST['args'] )
		{
			require_once(CLASS_PATH.'tables/Accounts.php');

			if(Accounts::existField('login',$_POST['args']))
				echo "true";
			else echo "false";

		}
		else echo "true";
	}
	elseif(strstr($request,'email'))
	{
		if(isset($_POST['args']) && filter_var($_POST['args'], FILTER_VALIDATE_EMAIL) )
		{
			require_once(CLASS_PATH.'tables/Accounts.php');
			
			if(Accounts::existField('email',$_POST['args']))
				echo "true";
			else echo "false";
		}
		else echo "true";
	}
	elseif($request == 'restart_code_antibot')
	{
		include(INCLUDE_PATH.'restart_code.php');
		restart_code();
		
		echo ".";
	}
}

?>