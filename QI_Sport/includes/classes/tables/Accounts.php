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
class Accounts extends Tables
{
	public 		$id, 				//SERIAL PRIMARY KEY
				$login, 			//VARCHAR(20) NOT NULL
				$password,			//VARCHAR(40) NOT NULL
				$email,				//VARCHAR(40) NOT NULL
				$sex,				//ENUM ('M','F');
				$years,				//INTEGER CHECK((years <= 2010 AND years >= 1930) OR years = NULL)
				$months,			//INTEGER CHECK((months >= 1 AND months <= 12) OR months = NULL)
				$days,				//INTEGER CHECK((days >= 1 AND days <= 31) OR days = NULL)
				$nationality,		//VARCHAR(40) NULL
				$sport,				//ENUM ('Basket-Ball','Cyclisme','Football','Rugby',Sport d''Hiver,'Tennis')
				$fan,				//VARCHAR(20) NULL
				$newsletter,		//BOOLEAN NOT NULL
				$ip,				//VARCHAR(16) NOT NULL
				$ban_time,			//TIMESTAMP NULL
				$register_date,		//TIMESTAMP NOT NULL
				$last_connection,	//TIMESTAMP NOT NULL
				$accesslevel;		//INTEGER CHECK( accesslevel >= 0 AND accesslevel <= 100 )
				
	public static function ipDejaUtilise($ip)
	{
		//7 jours
		return self::count(array('ip','last_connection'),array('ILIKE','>'),array($ip,date('Y-m-d H:i:s',time()-7*24*60*60))) > 0;
	}
	
	public static function ipUtiliseSurUnAutreCompte($ip, $login)
	{
		//7 jours
		return self::count(array('ip','login','last_connection'),array('ILIKE','NOT ILIKE','>'),array($ip,$login,date('Y-m-d H:i:s',time()-7*24*60*60)))>0;
	}
	
	public static function selectLoginIpUtiliseSurUnAutreCompte($ip, $login)
	{
		$line = self::select(array('login'),array('ip','login','last_connection'),array('ILIKE','NOT ILIKE','>'),array($ip,$login,date('Y-m-d H:i:s',time()-7*24*60*60)));
		return $line->login;
	}
	
	public static function banLogin($login,$time)
	{
		$line = self::select(array('id'),array('login'),array('ILIKE'),array($login));
		
		if(isset($line))
		{
			
			$oAccount = new Accounts();
					
			$oAccount->id=$line->id;
			$oAccount->ban_time=date('Y-m-d H:i:s',time()+$time);
			$oAccount->save();
			
			return true;
		}
		else return false;
	}
	
	public static function isLoginBan($id)
	{
		$line = self::select(array('ban_time'),array('id'),array('='),array($id));
		$ban_time = $line->ban_time;
		
		if(!isset($ban_time))
			return false;
 
//		echo date('Y-m-d H:i:s',strtotime($ban_time)).'<br/>';
//		echo strtotime($ban_time).'<br/>';
//		echo time().'<br/>';
		
		return strtotime($ban_time) > time();
	}
}