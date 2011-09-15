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

require_once(CLASS_PATH.'DB.php');

class Classement
{
	private static function createSQLRequestLimit($request,$limit)
	{
		if($limit==0)
		return $request;
		else return substr($request,0,-1)." LIMIT $limit; ";
	}

	public static function getGeneralClassement($limit)
	{
		$sql = self::createSQLRequestLimit('SELECT login  AS "Identifiant", SUM(score)AS "Score total", ROUND(AVG(score),2) AS "Score moyen" , sport AS "Spécialité" ,to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"
		FROM scores,accounts 
		WHERE scores.id_account = accounts.id 
		GROUP BY id_account,accounts.login,accounts.sport,accounts.register_date
		ORDER BY "Score total" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute();
		return $request->fetchAll(PDO::FETCH_OBJ);
	}
	
	public static function getGeneralPointMoyenClassement($limit)
	{
		$sql = self::createSQLRequestLimit('SELECT login  AS "Identifiant", SUM(score)AS "Score total", ROUND(AVG(score),2) AS "Score moyen" , sport AS "Spécialité" ,to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"
		FROM scores,accounts 
		WHERE scores.id_account = accounts.id 
		GROUP BY id_account,accounts.login,accounts.sport,accounts.register_date
		ORDER BY "Score moyen" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute();
		return $request->fetchAll(PDO::FETCH_OBJ);
	}
	
	public static function getMyPoints($classement, $account, $field)
	{
		for($i=0;$i<sizeof($classement);$i++)
			if($classement[$i]->Identifiant == $account)
				return $classement[$i]->$field;

		return 0;
	}

	public static function getMyPosition($classement, $account)
	{
		for($i=0;$i<sizeof($classement);$i++)
			if($classement[$i]->Identifiant == $account)
			{	
				if($i==0)
					return '1er';
				else return ($i+1).'ème';
			}

		return "Aucun";
	}

	public static function getGeneralClassementBySport($limit, $sport)
	{
		$sql = self::createSQLRequestLimit('SELECT login AS "Identifiant", SUM(score)AS "Score total" , ROUND(AVG(score),2) AS "Score moyen" , accounts.sport AS "Spécialité",to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"
		FROM scores,accounts,questionnaires 
		WHERE scores.id_account = accounts.id AND scores.id_questionnaire = questionnaires.id AND questionnaires.sport = ?
		GROUP BY id_account,accounts.login,accounts.sport,accounts.register_date
		ORDER BY "Score total" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute(array($sport));
		return $request->fetchAll(PDO::FETCH_OBJ);
	}

	public static function getMorePlayedGame($limit)
	{
		$sql = self::createSQLRequestLimit('SELECT login AS "Identifiant",COUNT(score)AS "Nombre de parties" , sport AS "Spécialité",to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"
		FROM scores,accounts 
		WHERE scores.id_account = accounts.id 
		GROUP BY id_account,accounts.login,accounts.sport,accounts.register_date
		ORDER BY "Nombre de parties" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute();
		return $request->fetchAll(PDO::FETCH_OBJ);
	}

	public static function getMorePlayedGameBySport($limit,$sport)
	{
		$sql = self::createSQLRequestLimit('SELECT login AS "Identifiant", COUNT(score)AS "Nombre de parties" , accounts.sport AS "Spécialité",to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"
		FROM scores,accounts ,questionnaires
		WHERE scores.id_account = accounts.id  AND questionnaires.id = scores.id_questionnaire AND questionnaires.sport = ?
		GROUP BY id_account,accounts.login,accounts.sport,accounts.register_date
		ORDER BY "Nombre de parties" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute(array($sport));
		return $request->fetchAll(PDO::FETCH_OBJ);
	}

	public static function getMostQuickly($limit)
	{
		$sql = self::createSQLRequestLimit("SELECT login, ( finish_time - start_time ) AS \"rapid\", accounts.sport, to_char (register_date, \'DD-MM-YYYY\' ), questionnaires.sport AS \"sport_questionnaire\"
		FROM scores,accounts,questionnaires
		WHERE scores.id_account = accounts.id AND questionnaires.id = scores.id_questionnaire AND score_details[0] > 0 AND score_details[1] > 0 AND score_details[2] > 0 AND score_details[3] > 0 AND score_details[4] > 0
		GROUP BY accounts.login, start_time, finish_time, accounts.sport, register_date, questionnaires.sport
		ORDER BY rapid;",$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute();
		return $request->fetchAll(PDO::FETCH_OBJ);
	}

	public static function getMostPointPerQuestion($limit)
	{
		$sql = self::createSQLRequestLimit('SELECT login AS "Identifiant", unnest (score_details) AS "Points en une question", accounts.sport AS "Spécialité",questionnaires.sport AS "Sport du questionnaire",to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"
		FROM scores,accounts,questionnaires
		WHERE scores.id_account = accounts.id AND questionnaires.id = scores.id_questionnaire
		GROUP BY login, score_details,accounts.sport,register_date,questionnaires.sport
		ORDER BY "Points en une question" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute();
		return $request->fetchAll(PDO::FETCH_OBJ);
	}

	public static function getMostPointPerQuestionBySport($limit,$sport)
	{
		$sql = self::createSQLRequestLimit('SELECT login AS "Identifiant", unnest (score_details) AS "Points en une question", accounts.sport AS "Spécialité",to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"
		FROM scores,accounts,questionnaires
		WHERE scores.id_account = accounts.id AND questionnaires.id = scores.id_questionnaire AND questionnaires.sport = ?
		GROUP BY login, score_details,accounts.sport,register_date,questionnaires.sport
		ORDER BY "Points en une question" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute(array($sport));
		return $request->fetchAll(PDO::FETCH_OBJ);
	}

	public static function getMostPointPerQuestionnaire($limit)
	{
		$sql = self::createSQLRequestLimit('SELECT login AS "Identifiant" , scores.score AS "Score du questionnaire" ,accounts.sport AS "Spécialité",questionnaires.sport AS "Sport du questionnaire" ,to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"
		FROM scores,accounts,questionnaires
		WHERE scores.id_account = accounts.id AND questionnaires.id = scores.id_questionnaire
		GROUP BY login,scores.score,accounts.sport,register_date, questionnaires.sport
		ORDER BY "Score du questionnaire" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute();
		return $request->fetchAll(PDO::FETCH_OBJ);
	}

	public static function getMostPointPerQuestionnaireBySport($limit,$sport)
	{
		$sql = self::createSQLRequestLimit('SELECT login AS "Identifiant" , scores.score AS "Score du questionnaire" , accounts.sport AS "Spécialité",to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"
		FROM scores,accounts,questionnaires
		WHERE scores.id_account = accounts.id AND questionnaires.id = scores.id_questionnaire AND questionnaires.sport = ?
		GROUP BY login,scores.score,accounts.sport,register_date
		ORDER BY "Score du questionnaire" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute(array($sport));
		return $request->fetchAll(PDO::FETCH_OBJ);
	}

	public static function getMoreGoodAnswer($limit)
	{
		$sql = self::createSQLRequestLimit('SELECT login AS "Identifiant", COUNT(unnest) AS "Nombre de bonne réponses",  asp AS "Spécialité", to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"  FROM
		(
		SELECT unnest (score_details), login, accounts.sport AS "asp" ,register_date 
				FROM scores,accounts
				WHERE scores.id_account = accounts.id
				GROUP BY login, score_details,accounts.sport,register_date
		) AS "s"
		WHERE unnest > 0
		GROUP BY login , asp ,register_date
		ORDER BY "Nombre de bonne réponses" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute();
		return $request->fetchAll(PDO::FETCH_OBJ);
	}

	public static function getMoreGoodAnswerBySport($limit,$sport)
	{
		$sql = self::createSQLRequestLimit('SELECT login AS "Identifiant", COUNT(unnest) AS "Nombre de bonne réponses",  asp AS "Spécialité", to_char (register_date, \'DD-MM-YYYY\' ) AS "Enregistré depuis"  FROM
		(
		SELECT unnest (score_details), login, accounts.sport AS "asp" ,register_date 
				FROM scores,accounts, questionnaires
				WHERE scores.id_account = accounts.id AND questionnaires.id= scores.id_questionnaire AND questionnaires.sport = ?
				GROUP BY login, score_details,accounts.sport,register_date
		) AS "s"
		WHERE unnest > 0
		GROUP BY login , asp ,register_date
		ORDER BY "Nombre de bonne réponses" DESC;',$limit);

		$request = DB::getInstance()->prepare($sql);
		$request->execute(array($sport));
		return $request->fetchAll(PDO::FETCH_OBJ);
	}
}

?>