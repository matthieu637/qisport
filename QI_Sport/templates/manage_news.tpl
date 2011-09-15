{include file="header.tpl"}

<div id="right">

	<br />
		
	<h2 align="center">Gérer les news Q.I Sport</h2>

	<br />
	
	{if isset($CONNECT) && $CONNECT==TRUE}
		{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
		{assign var='ACCESSLEVEL' value=$ACCOUNT->accesslevel}
		
		{if $ACCESSLEVEL >= $smarty.const.RIGHT_MANAGE_NEWS}
		
			{if isset($EDIT) && $EDIT==TRUE}
		
				{section name=i loop=$NEWS max=1}
					<form action="add_news.php?id={$NEWS[i]->id}" method="POST" >
						<p align="center">
							<table style="text-align:center" width="100%" >
								<tr>
									<td><label for="title" > Titre :	</label></td>
									<td><input maxlength="250" size="100%" id="title" name="title" value="{$NEWS[i]->title}" /></td>
								</tr>
								<tr>
									<td colspan="2" ><label> Contenu : </label></td>
								</tr>
								<tr>
									<td colspan="2" for="content" >
										<textarea rows="20" cols="85%" id="content" name="content" >{$NEWS[i]->content}</textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" >
										<input type="submit" value="Editer" name="Editer" />
									</td>
								</tr>
							</table>
						</p>
					</form>
				{/section}
		
			{else}
		
				{section name=i loop=$NEWS}
					<h2> {$NEWS[i]->title} le {$NEWS[i]->write_date}</h2>
					<br />
					<p style="margin-left : 50px "> {$NEWS[i]->content} </p>
					<h2 align="right" > {$NEWS[i]->author} </h2>
					<h2 align="left" > 
						<input type="button" value="Editer" onclick="
						if(confirm('Voulez-vous vraiment editer cette news ?')) 
							document.location='manage_news.php?a=e&id={$NEWS[i]->id}';
						" />
						<input type="button" value="Supprimer" onclick="
							if(confirm('Voulez-vous vraiment supprimer cette news ?')) 
									document.location='manage_news.php?a=d&id={$NEWS[i]->id}';
						" />
					</h2>
					<hr />
				{/section}
			
			{/if}
	
		{else}
			Vous n'avez pas les droits nécessaires.
		{/if}
	{else}
		Vous n'êtes pas connecté.
	{/if}
</div>

{include file="footer.tpl"}

