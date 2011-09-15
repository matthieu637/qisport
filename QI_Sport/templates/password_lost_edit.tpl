{include file="header.tpl"}

<div id="right">

	<br />
	<h2>Modification de mot de passe</h2>
	<br />
	<br />
	
	{if isset($SHOW_PASSWORD_FORM) && $SHOW_PASSWORD_FORM==TRUE }
	
	<form action="password_lost_edit.php" method="POST" id="password_lost_edit" >
	
	<input type="hidden" name="i" value="{$smarty.get.i}" />
	<input type="hidden" name="e" value="{$smarty.get.e}" />
	<input type="hidden" name="p" value="{$smarty.get.p}" />
	
		<table style="margin-left:160px;">
			<tr>
				<td><label for="password_lost_edit_password1" >Nouveau mot de passe :</label></td>
				<td><input type="password" id="password_lost_edit_password1" name="password_lost_edit_password1" maxlength="40" /></td>
			</tr>
			<tr>
				<td><label for="password_lost_edit_password2" >Confirmation du nouveau mot de passe :</label></td>
				<td><input type="password" id="password_lost_edit_password2" name="password_lost_edit_password2" maxlength="40" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="Changer" name="password_lost_edit_submit" id="password_lost_edit_submit" disabled="disabled" /></td>
			</tr>
		</table>
	</form>
	
	{/if}
	
	{if isset($PASSWORD_CHANGED) && $PASSWORD_CHANGED==TRUE }
		Votre mot de passe a bien était changé.
	{/if}
	
</div>

{include file="footer.tpl"}
