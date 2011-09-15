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

require_once(CLASS_PATH.'Tables.php');
require_once(CLASS_PATH.'tables/Questions.php');

/**
 * @author Matthieu637
 *
 */
class Questionnaires extends Tables
{
	public	 	$id,			//SERIAL PRIMARY KEY
				$sport;			//sport NOT NULL
				
	
	public static function create_all_questionnaire()
	{
		$dep = Questions::getAll(null,null,null,'WHERE id_questionnaire IS NULL ORDER BY sport');
		
		$quest = array();
		$quest['Basket-Ball']=self::sort_sport($dep,'Basket-Ball');
		$quest['Cyclisme']=self::sort_sport($dep,'Cyclisme');
		$quest['Football']=self::sort_sport($dep,'Football');
		$quest['Rugby']=self::sort_sport($dep,'Rugby');
		$quest["Sports d'Hiver"]=self::sort_sport($dep,"Sports d'Hiver");
		$quest['Tennis']=self::sort_sport($dep,'Tennis');
		
		foreach($quest as $key => $value)
		{
			while(count($quest[$key]) >= 5)
			{
				$conteneur = new Questionnaires();
				$conteneur->sport=$key;
				$conteneur->id=$conteneur->insert();
				
				
				for($i=0;$i<5;$i++)
				{
					$quest[$key][$i]->id_questionnaire=$conteneur->id;
					$quest[$key][$i]->save();
					unset($quest[$key][$i]);
				}
				
				$quest[$key]=array_values($quest[$key]);
				
				unset($conteneur);
			}
		}
		
	}
	
	public static function sort_sport(&$array,$sport)
	{
		$result = array();
			
		$j=0;
		$smart_lenght=count($array);
		for($i=0;$i<$smart_lenght;$i++)
			if($array[$i]->sport == $sport)
			{
				$result[$j++]=$array[$i];
				unset($array[$i]);
			}
			
		$array = array_values($array);
		
		return $result;
	}
	
	public static function getUnregisterQuestionnaire()
	{
		$request = DB::getInstance()->prepare(
		'SELECT Questionnaires.id AS "id" ,Questionnaires.sport AS "sport" ,Questions.question AS "question" 
		FROM Questionnaires,Questions
		WHERE Questionnaires.id = Questions.id_questionnaire AND 
			Questionnaires.id NOT IN (SELECT BasketBall FROM Programming )	AND
			Questionnaires.id NOT IN (SELECT Cyclisme FROM Programming )	AND
			Questionnaires.id NOT IN (SELECT Football FROM Programming) 	AND
			Questionnaires.id NOT IN (SELECT Rugby FROM Programming) 	AND
			Questionnaires.id NOT IN (SELECT SportsHiver FROM Programming) 	AND
			Questionnaires.id NOT IN (SELECT Tennis FROM Programming)
		ORDER BY Questionnaires.id;');
		
		$request->execute();

		return $request->fetchAll(PDO::FETCH_OBJ);
	}
	
	public static function getUnregisterIDSportQuestionnaires()
	{
		$request = DB::getInstance()->prepare(
		'SELECT id , sport 
		FROM Questionnaires
		WHERE
			Questionnaires.id NOT IN (SELECT BasketBall FROM Programming )	AND
			Questionnaires.id NOT IN (SELECT Cyclisme FROM Programming )	AND
			Questionnaires.id NOT IN (SELECT Football FROM Programming) 	AND
			Questionnaires.id NOT IN (SELECT Rugby FROM Programming) 	AND
			Questionnaires.id NOT IN (SELECT SportsHiver FROM Programming) 	AND
			Questionnaires.id NOT IN (SELECT Tennis FROM Programming)
		ORDER BY Questionnaires.sport;');
		
		$request->execute();

		return $request->fetchAll(PDO::FETCH_OBJ);
	}
}

?>