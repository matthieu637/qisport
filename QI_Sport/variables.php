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
/**
 * @author Matthieu637
 *
 */

define("SGBDR","pgsql");
define("HOST", "localhost");
define("DBNAME", "qisport_db");
define("USER", "qisport");
define("PASSWORD", "mnemosyne");

define("DEBUG","TRUE");

define("MAIN_PATH","../QI_Sport/");
define("INCLUDE_PATH",MAIN_PATH."includes/");
define("CLASS_PATH",INCLUDE_PATH."classes/");
define("SITE_PATH","http://www.qisport.fr/");

//define("HOST_APPLET","82.232.147.48");
define("HOST_APPLET","localhost");
define("APPLET_PATH","/QiS-GameApplet/applet.jar");
define("PORT_APPLET","6002");

define("CACHE_FOLDER", MAIN_PATH."cache/");

require_once(INCLUDE_PATH.'smarty.libs/Smarty.class.php');
require_once(CLASS_PATH.'Cache.php');
debug_config();

date_default_timezone_set('Europe/Paris');
		
global $SPORTS;
$SPORTS = array('Basket-Ball','Cyclisme','Football','Rugby',"Sports d'Hiver",'Tennis');

function define_admin_rights()
{
	define("RIGHT_ADD_NEWS",30);
	define("RIGHT_CLEAR_CACHE",30);
	define("RIGHT_MANAGE_NEWS",40);
	define("RIGHT_ADD_QUESTION",80);
	define("MANAGE_PROGRAMMING",85);
	define("RIGHT_BAN_ACCOUNT",90);
	define("RIGHT_UNBAN_ACCOUNT",90);
	define("RIGHT_SET_ACCESSLEVEL",95);
	define("RIGHT_SAVE_DATA",100);
}

/**
 * @return void
 */
function debug_config()
{
	if(DEBUG)
	{
		if(!assert_options(ASSERT_ACTIVE))
		assert_options(ASSERT_ACTIVE,1);
	}
	else if(assert_options(ASSERT_ACTIVE))
	assert_options(ASSERT_ACTIVE,0);
}

/**
 * @return unknown_type
 */
function init()
{
	require_once(CLASS_PATH.'tables/Accounts.php');
	
	session_start();
	require_once(INCLUDE_PATH."connect.php");
	require_once(INCLUDE_PATH."number_connected.php");
	
	if(isset($_SESSION['ACCOUNT']))
		define_admin_rights();
	
	admin_trap();
}

function admin_trap()
{
		if(isset($_GET['admin_action']) && $_GET['admin_action']=='clear_cache' && isset($GLOBALS['CONNECT']) && $GLOBALS['CONNECT'] && 
																$_SESSION['ACCOUNT']->accesslevel >= RIGHT_CLEAR_CACHE  )
		{
			Cache::clear_cache();
		}
}

/**
 * @param $oSmarty
 * @return unknown_type
 */
function init_smarty($oSmarty)
{
	assert('isset($oSmarty) && $oSmarty instanceof Smarty');
	
	$oSmarty->assign('CONNECT',$GLOBALS['CONNECT']);
	$oSmarty->assign('LOGIN_ERREUR',$GLOBALS['LOGIN_ERREUR']);
	
	
	$oSmarty->assign('NUMBER_CONNECTED',number_connected());
	
	
	$cache = new Cache('NUMBER_ACCOUNTS.cache',15);
	if($cache->open())
		echo Accounts::count(array(),array(),array());
	$oSmarty->assign('NUMBER_ACCOUNTS',$cache->close());
	
	$cache = new Cache('NUMBER_ACCOUNTS_THIS_MONTH.cache',60);
	if($cache->open())
		echo Accounts::count(array('register_date'),array('>'),array(date('Y-m-d H:i:s',time()-30*24*60*60)));
	$oSmarty->assign('NUMBER_ACCOUNTS_THIS_MONTH',$cache->close());
}
?>
