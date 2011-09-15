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

//TODO:auto database save
require_once(CLASS_PATH.'DB.php');

/**
 * @author Matthieu637
 *
 */
abstract class Tables
{
	/*********************************** Fonctions statiques ***********************************/
	
	/**
	 * @param int $id
	 * @return void
	 */
	public static function delete_id($id)
	{
		assert('isset($id) && $id >= 0');
//TODO:ajout sauvegarde sql pour suppression des accounts
		$request = DB::getInstance()->prepare('DELETE FROM '.get_called_class().' WHERE id = ?');
		$request->execute(array($id));
		$request->closeCursor();
	}

	/**
	 * @param int $id
	 * @return Tables' son instance
	 */
	public static function getInstanceOfID($id)
	{
		assert('isset($id) && $id >= 0');

		$class_name = get_called_class();
		$instance = new $class_name();

		$request = DB::getInstance()->prepare("SELECT * FROM $class_name WHERE id = ?");
		$request->execute(array($id));
		$line = $request->fetch(PDO::FETCH_OBJ);
		$fields = get_object_vars($instance);

		foreach($fields as $key => $value)
		{
			$instance->$key=$line->$key;
		}

		$request->closeCursor();
		return $instance;
	}
	
	

	/**
	 * @param array $where
	 * @param array $operator
	 * @param array $value
	 * @param array $more
	 * @return array
	 */
	public static function getAll($where,$operator,$value,$more)
	{
		$class_name = get_called_class();
		
		$sql="SELECT * FROM $class_name ";
		
		if(count($where)>0)
		{
			$sql.="WHERE";
			
			for($i=0;$i<count($where);$i++)
				$sql.=" ".$where[$i]." ".$operator[$i]." ? AND";
			
			$sql=substr($sql,0,-3);
		}
		
		$sql.=" ".$more." ;";
		
		$request = DB::getInstance()->prepare($sql);
		$request->execute($value);
		
		$array = Array();
		$i=0;
		
		while($line=$request->fetch(PDO::FETCH_OBJ))
		{
			$array[$i++]=self::getInstanceOfID($line->id);
		}
		
		return $array;
	
	}

	/**
	 * @param int $id
	 * @return boolean
	 */
	public static function existID($id)
	{
		assert('isset($id) && $id >= 0');	
		return self::select(array('id'),array('id'),array('='),$id);
	}
	
	/**
	 * @param string $field
	 * @param string $value
	 * @return boolean
	 */
	public static function existField($field,$value)
	{
		assert('property_exists(get_called_class(),$field) && isset($value)');
		return self::select(array($field),array($field),array('ILIKE'),array($value));
	}
	
	/**
	 * @param $update_fields
	 * @param $update_values
	 * @param $where_fields
	 * @param $where_values
	 * @return unknown_type
	 */
	public static function update($update_fields,$update_values,$where_fields,$where_operations,$where_values)
	{
		assert('isset($update_fields) && isset($update_values) && isset($where_fields) && isset($where_values) &&
		isset($where_operations) &&
		sizeof($update_fields) > 0 && sizeof($where_fields) > 0 && sizeof($where_operations) > 0 &&
		sizeof($update_fields) == sizeof($update_values) && sizeof($where_fields) == sizeof($where_values) &&
		sizeof($where_fields) == sizeof($where_operations)
		');
		
		$class_name = get_called_class();
		
		$sql="UPDATE $class_name SET";
		
		for($i=0;$i<sizeof($update_fields);$i++)
		{
			assert('property_exists($class_name,$update_fields[$i])');
			$sql.=' '.$update_fields[$i].' = ? ,';
		}
		
		$sql=substr($sql,0,-1);
		
		$sql.=" WHERE ";
		
		for($i=0;$i<sizeof($where_fields);$i++)
		{
			assert('property_exists($class_name,$where_fields[$i])');
			$sql.=' '.$where_fields[$i].' '.$where_operations[$i].' ? AND';
		}
			
		
		$sql=substr($sql,0,-3);
		
		$request = DB::getInstance()->prepare($sql.';');
		$request->execute(array_merge($update_values,$where_values));
		
		if($line=$request->fetch(PDO::FETCH_OBJ))
		{
			$request->closeCursor();
			return $line;
		}
		
		return false;
	}
	
	/**
	 * @param $select_fields
	 * @param $where_fields
	 * @param $where_operations
	 * @param $where_values
	 * @return unknown_type
	 */
	public static function select($select_fields,$where_fields,$where_operations,$where_values)
	{
		$class_name = get_called_class();
		
		assert('isset($select_fields) && isset($where_fields) && isset($where_operations) && isset($where_values) &&
				 sizeof($select_fields) > 0 && sizeof($where_fields) > 0 &&
				 sizeof($where_fields) ==  sizeof($where_operations) &&
				 sizeof($where_fields) ==  sizeof($where_values)');
		
		$sql="SELECT ";
		for($i=0;$i<sizeof($select_fields);$i++)
		{
			assert('property_exists($class_name,$select_fields[$i])');
			$sql.=$select_fields[$i].',';
		}
			
		$sql=substr($sql,0,-1);
		
		$sql=$sql." FROM $class_name WHERE ";
		
		for($i=0;$i<sizeof($where_fields);$i++)
		{
			assert('property_exists($class_name,$where_fields[$i]) && isset($where_values[$i])');
			$sql.=' '.$where_fields[$i].' '.$where_operations[$i].' ? AND';
		}
		
		$sql=substr($sql,0,-3);
		
		$request = DB::getInstance()->prepare($sql.";");
		$request->execute($where_values);
		
		if($line=$request->fetch(PDO::FETCH_OBJ))
		{
			$request->closeCursor();
			return $line;
		}
		
		return false;
	}
	
	public static function delete($where_fields,$where_operations,$where_values)
	{
		assert('isset($where_fields) && isset($where_operations) && isset($where_values) &&
		sizeof($where_fields) > 0 &&
		sizeof($where_fields) == sizeof($where_operations) && sizeof($where_fields) == sizeof($where_values)');
		
		$class_name = get_called_class();
		
		$sql="DELETE FROM $class_name WHERE ";
		
		for($i=0;$i<sizeof($where_fields);$i++)
		{
			assert('property_exists($class_name,$where_fields[$i]) && isset($where_values[$i])');
			$sql.=' '.$where_fields[$i].' '.$where_operations[$i].' ? AND';
		}
		
		$sql=substr($sql,0,-3);
		
		$request = DB::getInstance()->prepare($sql.";");
		$request->execute($where_values);
		$request->closeCursor();
	}
	
	/**
	 * @param $where_fields
	 * @param $where_operations
	 * @param $where_values
	 * @return unknown_type
	 */
	public static function count($where_fields,$where_operations,$where_values)
	{
		assert('sizeof($where_fields) == sizeof($where_operations) && 
		sizeof($where_fields) == sizeof($where_values)');
		
		$class_name = get_called_class();
		
		$sql='SELECT COUNT(id) AS "COUNT" FROM '.$class_name;
		
		if(sizeof($where_fields) > 0)
			$sql.=' WHERE ';
			
		for($i=0;$i<sizeof($where_fields);$i++)
			$sql.=' '.$where_fields[$i].' '.$where_operations[$i].' ? AND';
			
		if(sizeof($where_fields) > 0)
			$sql=substr($sql,0,-3);
		
		$request = DB::getInstance()->prepare($sql.';');
		$request->execute($where_values);

		$line = $request->fetch(PDO::FETCH_OBJ);
		
//		echo $sql;
//		print_r($where_values);
		
		return $line->COUNT;
	}
	
	/*********************************** Fonctions non statiques ***********************************/
	
	/**
	 * @param [attribute]=value $array
	 * @return void
	 */
	public function setAllFields($array)
	{
		assert('isset($array)');
		
		foreach($array as $key => $value)
		{
			assert('property_exists(get_called_class(),$key)');
			$this->$key=$value;
		}		
	}
	
	public function getAllFields()
	{
		$table = get_object_vars($this);
		
		foreach($table as $key => $value)
			if(!isset($value))
				unset($table["$key"]);
		
		return $table;
	}
	
	/**
	 * @return void
	 */
	public function save()
	{
		assert('property_exists(get_called_class(),"id")');
		
		$class_name = get_called_class();
		
		$sql="UPDATE $class_name SET ";
		
		$fields = get_object_vars($this);
		
		foreach($fields as $key => $values)
			if($key!='id' && isset($values))
				$sql.=" $key = ? ,";
			
		$sql=substr($sql,0,-1);
		$sql.=" WHERE id = ? ";
		
		$request = DB::getInstance()->prepare($sql);
		
		$values = array_values($fields);
		$tmp = $values[0];
		unset($values[0]);
		$values = array_values($values);
		
		$length=sizeof($values);
		
		for($i=0;$i<$length;$i++)
			if(!isset($values[$i]))
				unset($values[$i]);
				
		$values = array_values($values);
		$values[sizeof($values)]=$tmp;
		
		$request->execute($values);
		$request->closeCursor();
	}
	
	/**
	 * @return void
	 */
	public function insert()
	{
		$class_name = get_called_class();
		
		$sql="INSERT INTO $class_name (id,";
		
		$fields = get_object_vars($this);
		
		foreach($fields as $key => $value)
			if(isset($value))
				$sql.="$key ,";
			
		$sql=substr($sql,0,-1);
		$sql.=") VALUES (DEFAULT ,";
		
		foreach($fields as $key => $value)
			if($key!='id' && isset($value))
				$sql.="? ,";
				
		$sql=substr($sql,0,-1);
		
		if(SGBDR=='pgsql')
			$sql.=") RETURNING id ;";
		else $sql.=");";
		
		$request = DB::getInstance()->prepare($sql);
		
		$values = array_values($fields);
		unset($values[0]);
		$values = array_values($values);
		
		$length=sizeof($values);
	
		for($i=0;$i<$length	;$i++)
			if(!isset($values[$i]))
				unset($values[$i]);
		
				
		$values = array_values($values);
		
		$request->execute($values);
		
		
		if(SGBDR=='pgsql')
			return $request->fetch(PDO::FETCH_OBJ)->id;
		else
		{
			return DB::getInstance()->lastInsertId();
		}
	}
}
