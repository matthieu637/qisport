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

require_once(INCLUDE_PATH.'function_ip.php');
require_once(CLASS_PATH.'tables/Connected.php');

function number_connected()
{
	if(Connected::existField('ip',getIP()))
	{
		Connected::update(array('connect_time'),array('NOW'),array('ip'),array('ILIKE'),array(getIP()));
	}
	else
	{
		$oConnected = new Connected();
		$oConnected->setAllFields(array('connect_time'=>'NOW','ip'=>getIP()));
		$oConnected->insert();
	}
	
	Connected::delete(array('connect_time'),array('<'),array(date('Y-m-d H:i:s',time()-5*60)));
	
	return Connected::count(array(),array(),array());
}

?>