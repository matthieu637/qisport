{include file="header.tpl"}

<div id="right">

	<br />
	
	<h2 align="center" > Ajouter une news </h2>
	
	<br />

	{if isset($CONNECT) && $CONNECT==TRUE}
		{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
		{assign var='ACCESSLEVEL' value=$ACCOUNT->accesslevel}
		
		{if $ACCESSLEVEL >= $smarty.const.RIGHT_ADD_NEWS}
		
			{if isset($NEWS_WRITE) && $NEWS_WRITE==TRUE}
			
				La news a bien était ajouté. <br />
				<a href="news.php" >Voir la news</a>.
			
			{else}
			
			{if isset($NEWS_WRITE)}
				<span>ATTENTION : La news n'a pas était posté. Il manque une information (titre ou contenu).</span>
				
				<br />
			{/if}
			
		
			{if isset($smarty.post.content) || isset($smarty.post.title) }
				<h2>Prévisualisation : </h2>
				<br />
				
				<fieldset>
					<h2> {$smarty.post.title} <span style="color:#595959" >le {$smarty.now|date_format:'%d-%m-%Y'} </span></h2>
					<br />
					<p style="margin-left : 50px "> {$smarty.post.content} </p>
					<p align="right" ><i> {$ACCOUNT->login} </i></p>
					<hr />
				</fieldset>
				
				<br />
				<br />
				
				<h2>Editer la news : </h2>
				<br />
			{/if}
		
			<form action="add_news.php" method="POST" >
				<p align="center">
					<table style="text-align:center" width="100%" >
						<tr>
							<td><label for="title" > Titre :	</label></td>
							<td><input maxlength="250" size="100%" id="title" name="title" value="{$smarty.post.title}" /></td>
						</tr>
						<tr>
							<td colspan="2" ><label> Contenu : </label></td>
						</tr>
						<tr>
							<td colspan="2" for="content" >
								<textarea rows="20" cols="85%" id="content" name="content" >{$smarty.post.content}</textarea>
							</td>
						</tr>
					</table>
					
					<br />
					
					<table style="text-align:center" width="100%" >
						<tr>
							<td>
								<input type="submit" value="Prévisualiser" />
							</td>
							<td>
								<input type="submit" value="Poster" name="Poster"
								
								{if !isset($smarty.post.content)}
									disabled="disabled" 
								{/if}
								
								/>
							</td>
						</tr>
					</table>
				</p>
			</form>
			
			{/if}
			
			
			<br />
			
			<br />
			
			<fieldset>
				<legend>Aide</legend>
				
				Pour construire votre news, vous pouvez utiliser toutes les balises HTML standard.
				<br />
				<br />
				Exemple :
					<ul>
						<li> <code> &lt;b&gt; texte &lt;/b&gt; </code> : <b>mettre un texte en gras</b></li>
						<li> <code> &lt;u&gt; texte &lt;/u&gt; </code> : <u>souligner un texte</u></li>
						<li> <code> &lt;br/&gt;  </code> : saut de ligne</li>
						<li> <code> &lt;i&gt;  </code> : <i> texte en italique</i></li>
						<li> <code> &lt;a href="adresse_du_lien"&gt; texte &lt;/a&gt; </code> : faire un <a href="#	">lien</a></li>
						<li> ... </li>
					</ul>
				
				Tableau, liste, image, ... <br />
				Vous pouvez retrouver un récapitulatif <a href="http://www.siteduzero.com/tutoriel-3-13661-liste-des-balises-xhtml.html#ss_part_3" >ici</a>.
			</fieldset>
		
		{else}
			Vous n'avez pas les droits necessaires.
		{/if}
	{else}
		Vous n'êtes pas connecté.
	{/if}


</div>

{include file="footer.tpl"}
