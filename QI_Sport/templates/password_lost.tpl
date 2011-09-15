{include file="header.tpl"}

<div id="right">
	
	<br />
	<h2>Mot de passe perdu ?</h2>
	
	<br />
	<br />
	
	{if isset($PASSWORD_ERREUR)}
		{if $PASSWORD_ERREUR==1}
		Erreur ! <br />
			Caract�res invalides.
		{elseif $PASSWORD_ERREUR==2}
		Erreur ! <br />
			Ce compte ne correspond pas � cette e-mail.
		{elseif $PASSWORD_ERREUR==3}
		Erreur ! <br />
			Veuillez r�essayer plus tard, notre serveur mail est surcharg�.
		{elseif $PASSWORD_ERREUR==0}
			Nous venons d'envoyer un email � {$smarty.post.password_lost_email}. Si vous ne trouvez pas l'e-mail,
			n'oubliez pas de regarder dans votre courrier ind�sirable.
		{/if}
	{else}
		<form method="post" action="password_lost.php" id="password_lost" >
		<p>
			Pour d�finir un nouveau mot de passe veuillez vous munir de votre nom de compte ainsi que 
			l'adresse e-mail avec laquelle vous vous �tes inscrit(e). Une e-mail vous serra envoy�
			qui permettra une r�initialisation du mot de passe.
			<br />
			<br />
		</p>
			<table style="margin-left:235px" >
				<tr>
					<td><label for="password_lost_login">Identifiant</label>:</td>
					<td><input type="text" name="password_lost_login" id ="password_lost_login" maxlength="20" /></td>
				</tr>	
				<tr>
					<td><label for="password_lost_email">Adresse e-mail</label>:</td>
					<td><input type="text" name="password_lost_email" id ="password_lost_email" maxlength="40" /></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="Valider" name="password_lost_submit" id="password_lost_submit" disabled="disabled" /></td>
				</tr>
			</table>
			
		</form>
	{/if}

</div>

{include file="footer.tpl"}
