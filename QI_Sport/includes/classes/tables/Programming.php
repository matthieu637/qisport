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

require_once('Questionnaires.php');

class Programming extends Tables
{
	public		$id,
				$week,
				$BasketBall,
				$Cyclisme,
				$Football,
				$Rugby,
				$SportsHiver,
				$Tennis;
	
	public static function getAllPrograms()
	{
		$request = DB::getInstance()->prepare(
		'SELECT Programming.week, Questionnaires.id, Questionnaires.sport, Questions.question FROM Programming,Questionnaires,Questions
		WHERE  Questionnaires.id = Questions.id_questionnaire AND
			(Questionnaires.id = Programming.BasketBall OR Questionnaires.id = Programming.Cyclisme OR Questionnaires.id = Programming.FootBall 
			OR Questionnaires.id = Programming.Rugby OR Questionnaires.id = Programming.SportsHiver OR Questionnaires.id = Programming.Tennis)
		ORDER BY Programming.id , Questionnaires.id;');
		
		$request->execute();
		
		return $request->fetchAll(PDO::FETCH_OBJ);
	}
	
	public static function create_all_programs()
	{
		$dep = Questionnaires::getUnregisterIDSportQuestionnaires();
		
		$quest = array();
		$quest['Basket-Ball']=Questionnaires::sort_sport($dep,'Basket-Ball');
		$quest['Cyclisme']=Questionnaires::sort_sport($dep,'Cyclisme');
		$quest['Football']=Questionnaires::sort_sport($dep,'Football');
		$quest['Rugby']=Questionnaires::sort_sport($dep,'Rugby');
		$quest["Sports d'Hiver"]=Questionnaires::sort_sport($dep,"Sports d'Hiver");
		$quest['Tennis']=Questionnaires::sort_sport($dep,'Tennis');
		
		$lenght = min(array(count($quest['Basket-Ball']),count($quest['Cyclisme']),count($quest['Football']),
					count($quest['Rugby']),count($quest["Sports d'Hiver"]),count($quest['Tennis'])));
					
		for($i=0;$i<$lenght;$i++)
		{
			$conteneur = new Programming();
			$conteneur->week = self::getNewWeekRegister();
			$conteneur->BasketBall=$quest['Basket-Ball'][$i]->id;
			$conteneur->Cyclisme=$quest['Cyclisme'][$i]->id;
			$conteneur->Football=$quest['Football'][$i]->id;
			$conteneur->Rugby=$quest['Rugby'][$i]->id;
			$conteneur->SportsHiver=$quest["Sports d'Hiver"][$i]->id;
			$conteneur->Tennis=$quest['Tennis'][$i]->id;
			
			$conteneur->insert();
		}
	}
	
	private static function getNewWeekRegister()
	{
		$request = DB::getInstance()->prepare("SELECT max(week) FROM Programming;");
		$request->execute();
		
		$line = $request->fetch(PDO::FETCH_OBJ);
		
		if( $line->max == null)
			return date('Y-m-d',time());
		else 
		{
			list($year, $month, $day) = explode('-', $line->max);
			
			$date=mktime(0,0,0,$month,$day,$year) + 60*60*24*7;
			return date('Y-m-d',$date);
		}
	}
}


?>