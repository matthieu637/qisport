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
header("Content-type: image/png");

putenv('GDFONTPATH='.realpath('.'));

include('includes/restart_code.php');
restart_code();


$img = imagecreate(215, 60);

imagecolorallocate($img, 255, 255, 255);

$code = $_SESSION['code_antibot'];

for($i = 0; $i < strlen($code); $i++)
{
	$letter_color = imagecolorallocate($img, 10 + mt_rand(0, 225), 10 + mt_rand(0, 225), 10 + mt_rand(0, 225));
	
	imagettftext($img, 24 + mt_rand(-2, 8), mt_rand(-35, 35) ,($i * 35) + 10, 34 + mt_rand(0, 15), $letter_color, 'antibot.font', $code[$i]);
}

imagepng($img);
imagedestroy($img);
?>
