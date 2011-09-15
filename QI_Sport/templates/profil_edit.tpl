{include file="header.tpl"}

		
<div id="right">

	<br />

	<h2>Profil</h2>
	
	<br />
	
	{if isset($CONNECT) && $CONNECT==TRUE}
	{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
		<p>
			<br/>
			Les informations qui ont était retenues sur vous sont les suivantes :
			<br />
			<br />
			
			<form action="profil.php" method="POST" >
			<fieldset>
				<legend>{$ACCOUNT->login}</legend>
				<table style="margin-left:154px;">
				<tr>
					<td>Sexe :</td>
					<td>
						<label for="sexe.M" >Homme</label>
						<input type="radio" name="sexe" value="M" id="sexe.M"
						{if $ACCOUNT->sex == 'M' }
							checked="checked"
						{/if}
						 />
						
						<label for="sexe.F" >Femme</label>
						<input type="radio" name="sexe" value="F"  id="sexe.F"
						{if $ACCOUNT->sex == 'F' }
							checked="checked"
						{/if}
						 />
					</td>
					<td></td>
				</tr>
				<tr>
					<td><label for="jour">Date de naissance :</label></td>
					<td>
						<input type="text" name="jours" size="1" maxlength="2" value="
						{if $ACCOUNT->days != 'jj' }
							{$ACCOUNT->days}
						{else}
							jj
						{/if}
						" id="jour" onkeyup="checkDate();" /> / 
						
						<input type="text" name="mois" size="1" maxlength="2" value="
						{if $ACCOUNT->months != 'mm' }
							{$ACCOUNT->months}
						{else}
							mm
						{/if}
						" id="mois" onkeyup="checkDate();" /> / 
						
						<input type="text" name="annee" size="2" maxlength="4" value="
						{if $ACCOUNT->years != 'aaaa' }
							{$ACCOUNT->years}
						{else}
							aaaa
						{/if}
						" id="annee" onkeyup="checkDate();" />
					</td>
					<td><span id="js_date"></h2></td>
				</tr>
				<tr>
					<td><label for="pays" >Nationalité :</label></td>
					<td>
					{include file="pays.html"}
					</td>
					<td></td>
				</tr>
				<tr>
					<td><label for="sport" >Sport favori</label>:</td>
					<td><select name="sport" id="sport" onchange="changeImSport(this);" onkeyup="changeImSport(this);">
						<option>{$ACCOUNT->sport}</option>
						<option>Basket-Ball</option>
						<option>Cyclisme</option>
						<option>Football</option>
						<option>Rugby</option>
						<option>Sport d'Hiver</option>
						<option>Tennis</option>
					</select></td>
					<td></td>
				</tr>
				<tr>
					<td style="text-align: center; padding-top: 20px; padding-left: 0px; width: 150px" colspan="2">
						<img id="image_change" src="images/avatars/{$ACCOUNT->sport}.png" alt="Avatar" />
					</td>
					<td></td>
				</tr>
				<tr>
					<td><label for="fan" >Fan de :</label></td>
					<td><input type="text" name="fan" id="fan" maxlength="20" value="{$ACCOUNT->fan}" /></td>
					<td></td>
				</tr>
				</table>
				<br />
				<p align="center">
					<input type="checkbox" 
					{if $ACCOUNT->newsletter}
					checked="checked"
					{/if}
					name="newsletter" id="newsletter" />
					<label for="newsletter">Je souhaite être informé par e-mail des nouveautés hebdomadaires de Q.I Sport.</label>
					
					<br />
					
					<input type="submit" name="profil_edit"  value="Modifier" id="valide_button" disabled="disabled" />
					<input type="button" value="Retour" onclick="window.location.replace('profil.php');" />
				</p>
			</fieldset>
			</form>
		</p>
	{else}
		Vous n'êtes pas connecté.
	{/if}
	</div>

{include file="footer.tpl"}
