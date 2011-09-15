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
require_once(CLASS_PATH.'Singleton.php');

/**
 * @author Matthieu637
 *
 */
class DB extends Singleton
{
	/**
	 * @var unique PDO instance
	 */
	private $_PDO;

	/**
	 * @return DB's instance
	 */
	protected function __construct()
	{
		try
		{
			$this->_PDO = new PDO(SGBDR.':host='.HOST.';dbname='.DBNAME,USER,PASSWORD);
			
			if(SGBDR=='pgsql')
				$this->_PDO->exec("set client_encoding TO 'LATIN1';");
		}
		catch(PDOException $e)
		{
			echo 'Erreur : '.$e->getMessage().'<br />';
			die();
		}
	}

	/**
	 * @param string $sql
	 * @return PDOStatement
	 */
	public function prepare($sql)
	{
		assert('isset($sql) && $sql!="" && isset($this->_PDO)');

		return $this->_PDO->prepare($sql);
	}
	
	public function lastInsertId($name)
	{
		return $this->_PDO->lastInsertId($name);
	}
}
?>