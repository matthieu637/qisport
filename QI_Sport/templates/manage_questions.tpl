{include file="header.tpl"}

<div id="right">

	<br />

	<h2>Manager les Questions :</h2>

	<br/>

	{if isset($CONNECT) && $CONNECT==TRUE}
		{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
		{assign var='ACCESSLEVEL' value=$ACCOUNT->accesslevel}
		{if $ACCESSLEVEL >= $smarty.const.RIGHT_ADD_QUESTION}
			<ul>
				<li><a href="?list"> Lister les questions non enregistrées dans les questionnaires</a> (possibilités : suppression, creation questionnaire)</li>
				<li><a href="?list_all"> Lister toutes les questions sans distinctions</a> (possibilité : édition) </li>
				<li><a href="?add">Ajouter une question</a></li>
			</ul>
			
			
			{if (isset($smarty.get.list) || isset($smarty.get.list_all) ) && isset($QUESTIONS)}
				
				<style type="text/css">
					table, td, th
					{php}echo "{"; {/php}
						border:black 1px solid;
						border-collapse:collapse;
						text-align:center;
					{php}echo "}"; {/php}
				</style>
				
				
				{if isset($smarty.get.list)}
				<ul><ul>
					<li><a href="?create_questionnaire"> Créer des questionnaires avec ses questions : </a></li>
				</ul></ul>
				
				
				<table>
					<tr><th>ID Question</th><th>Question</th><th>Sport</th><th>Supprimer</th></tr>
					{section loop=$QUESTIONS name=i}
					<tr >
						<td>{$QUESTIONS[i]->id}</td>
						<td>{$QUESTIONS[i]->question}</td>
						<td>{$QUESTIONS[i]->sport}</td>
						<td><input type="button" onClick="if(confirm('Voulez-vous vraiment supprimer la question {$QUESTIONS[i]->id} ?'))document.location='manage_questions.php?id={$QUESTIONS[i]->id}&a=del'" value="Supprimer"></td>
					</tr>
					{/section}
				</table>
				
				{else}
				
				<table>
					<tr><th>ID Question</th><th>Question</th><th>Sport</th><th>Editer</th></tr>
					{section loop=$QUESTIONS name=i}
					<tr >
						<td>{$QUESTIONS[i]->id}</td>
						<td>{$QUESTIONS[i]->question}</td>
						<td>{$QUESTIONS[i]->sport}</td>
						<td><a href="manage_questions.php?id={$QUESTIONS[i]->id}&a=edit">X</a></td>
					</tr>
					{/section}
				</table>
				
				{/if}
			
			{else if isset($QUESTIONS)}
			
			<br />
				{section loop=$QUESTIONS name=i max=1}
					<fieldset>
						<legend>Edition de Question n° {$QUESTIONS[i]->id}</legend>
			
						<form action="manage_questions.php?a=f_edit&id={$QUESTIONS[i]->id}" method="POST" id="edition_question" name="edition_question">
						<table align="center" width="100%">
							<tr>
								<td><label for="quizz">Question :</td><td><textarea cols="40" rows="7" name="quizz" id="quizz" >{$QUESTIONS[i]->question}</textarea></td>
							</tr>
							<tr>
								<td><label for="reponse">Réponse :</td><td><input type="text" name="reponse" id="reponse" value="{$QUESTIONS[i]->answer}" /></td>
							</tr>
							<tr>
								<td><label for="sport">Sport :</td><td>
									<select name="sport" id="sport" >
										<option selected="selected">{$QUESTIONS[i]->sport}</selected>
										<option>Basket-Ball</option>
										<option>Cyclisme</option>
										<option>Football</option>
										<option>Rugby</option>
										<option>Sports d'Hiver</option>
										<option>Tennis</option>
									</select>
								</td></tr>
						</table>
							<center><input type="button" value="Modifier" onClick="if(confirm('Etes-vous sûr de vouloir modifier cette question ?'))document.edition_question.submit();" /></center>
						</form>
					
					</fieldset>
					
				{/section}
				
			{/if}
			
			{if isset($ADD) && $ADD == TRUE}

				<fieldset>
						<legend>Ajouter une question</legend>
			
						<form action="manage_questions.php?f_add" method="POST" id="ajouter_question" name="ajouter_question">
						<table align="center" width="100%">
							<tr>
								<td><label for="quizz">Question :</td><td><textarea cols="40" rows="7" name="quizz" id="quizz" ></textarea></td>
							</tr>
							<tr>
								<td><label for="reponse">Réponse :</td><td><input type="text" name="reponse" id="reponse" /></td>
							</tr>
							<tr>
								<td><label for="sport">Sport :</td><td>
									<select name="sport" id="sport" >
										<option>Basket-Ball</option>
										<option>Cyclisme</option>
										<option>Football</option>
										<option>Rugby</option>
										<option>Sports d'Hiver</option>
										<option>Tennis</option>
									</select>
								</td></tr>
						</table>
							<center><input type="button" value="Ajouter" onClick="if(confirm('Etes-vous sûr de vouloir ajouter cette question ?'))document.ajouter_question.submit();" /></center>
						</form>
					
					</fieldset>
				
			{/if}
			
		{else}
				Vous n'avez pas les droits necessaires.
		{/if}
	{else}
		Vous n'êtes pas connecté.
	{/if}
	
</div>

{include file="footer.tpl"}
