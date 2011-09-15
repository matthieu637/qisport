{include file="header.tpl"}

<div id="right">

	<br />

	<h2>Modification de votre mot de passe :</h2>
	
	<br />
	
	{if isset($CONNECT) && $CONNECT==TRUE}
	{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
	
	{if isset($ERROR_PASSWORD_EDIT) && $ERROR_PASSWORD_EDIT == 2}
	Votre mot de passe a bien était mis à jour.
	<br/>
	<a href="profil.php" >Revenir au profil</a>
	{else}
	
		{if isset($ERROR_PASSWORD_EDIT) && $ERROR_PASSWORD_EDIT == 1}
			Vous n'avez pas fournit le bon mot de passe.
		{/if}
		
		{if isset($SHOW_PASSWORD_EDIT_FORM) && $SHOW_PASSWORD_EDIT_FORM == TRUE }
		
		<form action="password_edit.php" method="POST" id="password_edit" >
			<fieldset>
			<legend>{$ACCOUNT->login}</legend>
				<table style="margin-left:140px;">
					<tr>
						<td><label for="password_edit_password_last">Ancien mot de passe</label>:</td>
						<td><input type="password" name="password_edit_password_last" maxlength="40" id="password_edit_password_last"  /></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="password_edit_password1">Nouveau mot de passe</label>:</td>
						<td><input type="password" name="password_edit_password1" maxlength="40" id="password_edit_password1"  /></td>
					</tr>
					<tr>
						<td><label for="password_edit_password2"> Confirmation du nouvea mot de passe</label>:</td>
						<td><input type="password" name="password_edit_password2" maxlength="40" id="password_edit_password2" /></td>
					</tr>
				</table>
				<p align="center">
					<input type="submit" name="password_edit_submit" value="Valider" disabled="disabled" id="password_edit_submit" /> 
					<input type="button" value="Retour" onclick="window.location.replace('profil.php');" />
				</p>
			</fieldset>
		
		{/if}
	
	{/if}
	{else}
		Vous n'êtes pas connecté.
	{/if}
</div>

{include file="footer.tpl"}
