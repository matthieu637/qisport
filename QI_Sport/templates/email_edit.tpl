{include file="header.tpl"}

<div id="right">

	<br />

	<h2>Modification de votre email :</h2>
	
	<br />
	{if isset($CONNECT) && $CONNECT==TRUE}
	{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
	
	{if isset($ERROR_EMAIL_EDIT) && $ERROR_EMAIL_EDIT == 2}
	Votre adresse e-mail a bien était mis à jour.
	<br/>
	<a href="profil.php" >Revenir au profil</a>
	{else}
	
		{if isset($ERROR_EMAIL_EDIT) && $ERROR_EMAIL_EDIT == 1}
			Cette adresse e-mail existe déjà.
		{/if}
		
		{if isset($SHOW_EMAIL_EDIT_FORM) && $SHOW_EMAIL_EDIT_FORM == TRUE }
		
		<form action="email_edit.php" method="POST" id="email_edit" >
			<fieldset>
			<legend>{$ACCOUNT->login}</legend>
				<table style="margin-left:154px;">
					<tr>
						<td><label for="email_edit_email1">Nouvelle adresse e-mail</label>:</td>
						<td><input type="email" name="email_edit_email1" id="email_edit_email1" maxlength="40" /></td>
					</tr>
					<tr>
						<td><label for="email_edit_email2"> Confirmation de la nouvelle adresse e-mail</label>:</td>
						<td><input type="email" name="email_edit_email2" id="email_edit_email2" maxlength="40" /></td>
					</tr>
				</table>
				<p align="center">
					<input type="submit" name="email_edit_submit" value="Valider" disabled="disabled" id="email_edit_submit" /> 
					<input type="button" value="Retour" onclick="window.location.replace('profil.php');" />
				</p>
			</fieldset>
		</form>
		{/if}
	
	{/if}
	{else}
		Vous n'êtes pas connecté.
	{/if}
</div>

{include file="footer.tpl"}
