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

require_once(CLASS_PATH."Tables.php");

/**
 * @author Matthieu637
 *
 */
class LoginLog extends Tables
{
	public	 	$id,				//SERIAL PRIMARY KEY
				$log_time,			//TIMESTAMP NOT NULL
				$ip,				//VARCHAR(16) NOT NULL
				$login,				//VARCHAR(20) NOT NULL
				$password,			//VARCHAR(40) NULL
				$account_exist,		//BOOLEAN NOT NULL
				$right_password;	//BOOLEAN NULL
				
	/** BruteForceProtect
	 * 
	 * @param $ip
	 * @return unknown_type
	 */
	public static function isIPBanned($ip)
	{
		//15minutes
		return self::count(array('log_time','ip','right_password'),array('>','ILIKE','!='),array(date('Y-m-d H:i:s',time()-15*60),$ip,'TRUE'))>10;
	}
	
	public static function isIPAlreadyRegister($ip)
	{
		//1 jour : 24*60*60
		return self::count(array('log_time','ip'),array('>','ILIKE'),array(date('Y-m-d H:i:s',time()-24*60*60),$ip))>0;
	}
	
	public static function isIPAlreadyRegisterOnOtherAccount($ip,$login)
	{
		//1 jour : 24*60*60
		return self::count(array('log_time','ip','account_exist','right_password','login'),
							array('>','ILIKE','=','=','NOT ILIKE'),
							array(date('Y-m-d H:i:s',time()-24*60*60),$ip,'TRUE','TRUE',$login))>0;
	}
	
	public static function selectLoginIsIPAlreadyRegisterOnOtherAccount($ip,$login)
	{
		//1 jour : 24*60*60
		$line= self::select(array('login'),array('log_time','ip','account_exist','right_password','login'),
							array('>','ILIKE','=','=','NOT ILIKE'),
							array(date('Y-m-d H:i:s',time()-24*60*60),$ip,'TRUE','TRUE',$login));
							
		return $line->login;
	}
}

?>