{include file="header.tpl"}

<div id="right">

<br />

<h2>INSCRIPTION :</h2><br />

	<p style="text-indent:40px;">
	Pour assurer l'<b>égalité entre chaque participant</b>, et éviter tout possible cas de tricherie, Q.I Sport limite l'accès à <b>un compte par personne</b>. De plus, toute connexion sur un ordinateur qui a déjà crée un compte sera aussi sanctionné.
	</p>
	<p style="text-indent:40px;">
	La sanction est un bannissement du site pendant 2 jours, avec une impossibilité de se connecter avec les deux comptes en question. Si la fraude est répétée, la sanction peut aller jusqu'au bannissement définitif.
	</p>
	<center> <b>A vous de jouer le jeu ! </b></center>
	<br />

{if $SHOW_REGISTER_FORM==true}

<p align="center">Pour vous inscrire et rejoindre la grande communauté Q.I Sport, veuillez remplir le formulaire ci-dessous : <br/><br/></p>

{if $ERROR_CODE==true}
<p align="center">Erreur lors de l'inscription : Le code que vous avez inscrit n'est pas le bon. Veuillez recommencer.<br/><br/></p>
{/if}



<form action="inscription.php" method="post" id="inscription">
	<table style="margin-left:154px;">
		<tr>
			<td><label for="inscription_login">Identifiant</label><font color="#c10a0a">*</font> :</td>
			<td><input type="text" name="inscription_login" id="inscription_login" maxlength="20" value="{$smarty.post.inscription_login}" /></td>
		</tr>
		<tr>
			<td><label for="inscription_password1"> Mot de passe</label><font color="#c10a0a">*</font> :</td>
			<td><input type="password" name="inscription_password1" id="inscription_password1" maxlength="40" value="{$smarty.post.inscription_password1}" /></td>
		</tr>
		<tr>
			<td><label for="inscription_password2"> Confirmation du mot de passe</label><font color="#c10a0a">*</font> :</td>
			<td><input type="password" name="inscription_password2" id="inscription_password2" maxlength="40" value="{$smarty.post.password2}" /></td>
		</tr>
		<tr>
			<td><label for="inscription_email1" >Adresse Email</label><font color="#c10a0a">*</font> :</td>
			<td><input type="text" name="inscription_email1" id="inscription_email1" maxlength="40" value="{$smarty.post.inscription_email1}" /></td>
		</tr>
		<tr>
			<td><label for="inscription_email2" >Confirmation de l'adresse e-mail</label><font color="#c10a0a">*</font> :</td>
			<td><input type="text" name="inscription_email2" id="inscription_email2" maxlength="40" value="{$smarty.post.inscription_email2}" /></td>
		</tr>
		<tr>
			<td>Sexe :</td>
			<td>
				<label for="inscription_sexe_M" >Homme</label>
				<input type="radio" name="inscription_sexe" value="M" id="inscription_sexe_M"
				{if isset($smarty.post.inscription_sexe) && $smarty.post.inscription_sexe == 'M' }
					checked="checked"
				{/if}
				 />
				
				<label for="inscription_sexe_F" >Femme</label>
				<input type="radio" name="inscription_sexe" value="F"  id="inscription_sexe_F"
				{if isset($smarty.post.inscription_sexe) && $smarty.post.inscription_sexe == 'F' }
					checked="checked"
				{/if}
				 />
			</td>
		</tr>
		<tr>
			<td><label for="inscription_jours">Date de naissance :</label></td>
			<td>
				<input type="text" name="inscription_jours" size="1" maxlength="2" value="jj" /> / 
				<input type="text" name="inscription_mois" size="1" maxlength="2" value="mm" /> / 
				<input type="text" name="inscription_annees" size="2" maxlength="4" value="aaaa" />
			</td>
		</tr>
		<tr>
			<td><label for="inscription_pays" >Nationalité :</label></td>
			<td>
			{include file="pays.html"}
			</td>
		</tr>
		<tr>
			<td><br />
			</td>
			<td></td>
		</tr>
		<tr>
			<td><label for="inscription_sport" >Sport favori</label><font color="#c10a0a">*</font> :</td>
			<td><select name="inscription_sport" id="inscription_sport" >
				<option>Basket-Ball</option>
				<option>Cyclisme</option>
				<option>Football</option>
				<option>Rugby</option>
				<option>Sports d'Hiver</option>
				<option>Tennis</option>
			</select></td>
		</tr>
		<tr>
			<td><label for="inscription_fan" >Fan de :</label></td>
			<td><input type="text" name="inscription_fan" id="inscription_fan" maxlength="20" value="{$smarty.post.fan}" /></td>
		</tr>
		<tr>
			<td style="text-align: center; padding-top: 20px; padding-left: 0px; width: 150px" colspan="2">
				<img id="image_change" src="images/avatars/Basket-Ball.png" alt="Avatar" />
			</td>
			<td></td>
		</tr>
	</table>
	<table style="margin-left:105px;">
		<tr>
			<td><input type="checkbox" name="inscription_rules" id="inscription_rules" /></td>
			<td>
				<label for="inscription_rules" >J'assure avoir lu et accepté les <a href="rules.php" target="blank">règles</a> et <a href="conditions.php" target="blank">conditions
				d'utilisation</a> du jeu.<font color="#c10a0a">*</font></label>
			</td>
		</tr>
		<tr>
			<td><input type="checkbox" checked="checked" name="inscription_newsletter" id="inscription_newsletter" /></td>
			<td><label for="inscription_newsletter">Je souhaite être informé par e-mail des nouveautés hebdomadaires de Q.I Sport.</label></td>
		</tr>
	</table>
	<br />


	<table style="margin-left:183px;text-align:center">
		<tr>
			<td>Veuillez recopier le code de confirmation à 6 caractères<font color="#c10a0a">*</font> :</td>
		</tr>
		<tr>
			<td><label for="inscription_code"><img src="antibot.php" width="210" height="60" id="code_antibot" alt="Image de Code-Antibot" /></label></td>
		</tr>
		<tr>
			<td>
				<input type="text" name="inscription_code" id="inscription_code" maxlength="6" size="5" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="Rafraichir l'image" id="change_code_img" />
			</td>
		</tr>
	</table>

	<br />
	<p align="center">
		<input type="submit" name="inscription_submit" value="Valider" disabled="disabled" /> 
		<input type="reset" value="Recommencer" name="inscription_reset" /> 
		<input type="button" value="Annuler" onclick="window.location.replace('.');" />
	</p>
</form>

<br />
<font size="0.9em">Les champs suivis de <font color="#c10a0a">*</font> doivent être obligatoirement remplis.</font>
{elseif isset($ACCOUNT)}
	<p><br/>Bienvenue {$ACCOUNT->login},<br />vous avez bien était enregistré, les informations qui ont était retenues sont :<br />
	<fieldset>
	<legend>{$ACCOUNT->login}</legend>
	<ul style='font-size:0.9em;margin-left:20px;width:400px;'>
	{foreach from=$ACCOUNT->getAllFields() key=key item=value}
	
	{if $key=='email'}
	<li>Votre adresse e-mail est la suivante : {$value}</li>
	{elseif $key=='sport'}
	<li>Votre sport préféré est le {$value}</li>
	{elseif $key=='newsletter' && $value==1}
	<li>Vous avez souscrit à la newsletter.</li>
	{elseif $key=='newsletter' && $value==0}
	<li>Vous n'avez pas souscrit à la newsletter.</li>
	{elseif $key=='years'}
	<li>Vous êtes née en {$value} le {$ACCOUNT->days} du {$ACCOUNT->months}.</li>
	{elseif $key=='sex' && $value=='M'}
	<li>Vous êtes un Homme.</li>
	{elseif $key=='sex' && $value=='F'}
	<li>Vous êtes une Femme.</li>
	{elseif $key=='fan'}
	<li>Vous êtes fan de {$value}.</li>
	{elseif $key=='nationality'}
	<li>Vous habitez en {$value}.</li>
	{/if}
	
	{/foreach}
	</ul>
	</fieldset>
	</p>
{elseif isset($smarty.session.ACCOUNT)}
	{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
	Vous êtes déjà connecté sur le compte {$ACCOUNT->login}. <br/>
	Vous ne pouvez donc pas vous ré-inscrire.
{else}
	<center>
		Vous possédez déjà un compte sur Q.I Sport. Merci de vous référer aux <a href="conditions.php">règles</a>.<br/><br/>
		Si ce n'est pas le cas, merci de contacter <a href="mailto:webmaster@qisport.fr" >l'équipe Q.I Sport</a>.
	</center>
{/if}


</div>

{include file="footer.tpl"}