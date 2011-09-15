{include file="header.tpl"}

<div id="right">

	<br />

	<h2>Manager la programmation :</h2>

	<br/>
	<br/>

	{if isset($CONNECT) && $CONNECT==TRUE}
		{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
		{assign var='ACCESSLEVEL' value=$ACCOUNT->accesslevel}
		{if $ACCESSLEVEL >= $smarty.const.MANAGE_PROGRAMMING}
		
		<ul>
			<li><a href="?list_unregister"> Lister les questionnaires non enregistré dans des programmes </a></li>
			<li><a href="?list"> Lister les programmes enregistrés </a></li>
			<li><a href="?create" >Créer les programmes des semaines à venir automatiquement</a></li>
		</ul>
		
		<style type="text/css">
		table, td, th
		{php}echo "{"; {/php}
			border:black 1px solid;
			border-collapse:collapse;
			text-align:center;
		{php}echo "}"; {/php}
		</style>
		
		{if isset($smarty.get.list_unregister) && isset($QUESTIONNAIRES)}
			
			<table width="100%">
				<caption>Liste des questionnaires non enregistré dans des programmes</caption>
				<tr><th>ID Questionnaire</th><th>Sport</th><th>Question</th></tr>
			
				{section loop=$QUESTIONNAIRES name=i}
				<tr>
				
					{if $smarty.section.i.index is div by 5}
					<td rowspan="5" >{$QUESTIONNAIRES[i]->id}</td>
					<td rowspan="5" >{$QUESTIONNAIRES[i]->sport}</td>
					{/if}
					<td>{$QUESTIONNAIRES[i]->question}</td>
				</tr>
				{/section}
			</table>
		{elseif isset($smarty.get.list) && isset($PROGRAMS)}
			
			<table width="100%">
				<caption>Liste des programmes enregistrés</caption>
				<tr><th>Semaine</th><th>ID Questionnaire</th><th>Sport</th><th>Question</th></tr>
				{section loop=$PROGRAMS name=i}
				<tr>
					{if $smarty.section.i.index is div by 5}
						
						{if $smarty.section.i.index is div by 30}
							<td rowspan="30">{$PROGRAMS[i]->week}</td>
						{/if}
						
						<td rowspan="5">{$PROGRAMS[i]->id}</td>
						<td rowspan="5">{$PROGRAMS[i]->sport}</td>
					{/if}
					<td>{$PROGRAMS[i]->question}</td>
				</tr>
				{/section}
			</table>
		{/if}
		
		{else}
			Vous n'avez pas les droits necessaires.
		{/if}
	{else}
		Vous n'êtes pas connecté.
	{/if}
	
</div>

{include file="footer.tpl"}
