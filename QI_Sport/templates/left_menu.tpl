<div id="left">
	
	{if isset($CONNECT) && $CONNECT==TRUE}
		<div class="menuhaut">Compte
			{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
			: {$ACCOUNT->login}
		</div>
			<ul>
					<li><a href="profil.php">Profil</a></li>
					<li><a href="deconnexion.php">Déconnexion</a></li>
			</ul>
		<div class="menubas"></div>
	
		<div class="menuhaut">Thème</div>
			<ul>
				{assign var='DAY' value=$smarty.now|date_format:'%w' }
				{if $DAY==1 || $DAY==2}
					<li><a href="game.php?s=b" >Basket-Ball</a></li>
					<li><a href="game.php?s=r">Rugby</a></li>
				{else}
					<li class="item_menu">Basket-Ball</li>
					<li class="item_menu">Rugby</li>
				{/if}
				{if $DAY==3 || $DAY==4}
					<li><a href="game.php?s=c">Cyclisme</a></li>
					<li><a href="game.php?s=f">Football</a></li>
				{else}
					<li class="item_menu">Cyclisme</li>
					<li class="item_menu">Football</li>
				{/if}
				{if $DAY=='5' || $DAY==6}
					<li><a href="game.php?s=s">sports d'hiver</a></li>
					<li><a href="game.php?s=t">Tennis</a></li>
				{else}
					<li class="item_menu">sports d'hiver</li>
					<li class="item_menu">Tennis</li>
				{/if}
			</ul>
		<div class="menubas"></div>
	
	
	
	<div class="menuhaut" >Défis</div>
		<ul>
			{if $DAY=='0'}
				<li><a href="defis.php">Le défi du dimanche</a></li>
			{else}
				<li class="item_menu" >Le défi du dimanche</li>
			{/if}
			
			<li><a href="construction.php">Historique des défis</a></li>
		</ul>
	<div class="menubas"></div>
	
	{else}
	
	<div class="menuhaut">Connexion</div>
		<form class="connexion" action="" method="post" style='padding-bottom:5px;'>
			<table style="text-align:center;width:100%;" >
				<tr>
					<td><label for="login_login" >Identifiant : </label></td>
				</tr>
				<tr>
					<td><input type="text" name="login_login" size="10" id="login_login" value="{$smarty.post.login_login}" /></td>
				</tr>
				<tr>
					<td><label for="login_password">Mot de passe :</label></td>
				</tr>
				<tr>
					<td><input type="password" name="login_password" size="10" id="login_password" value="{$smarty.post.login_password}" /></td>
				</tr>
			</table>
			
			<p class="menu_height">
			<input type="submit" value="S'identifier" disabled="disabled" name="login_submit" />
			</p>
		</form>
		
		<ul>
			<li><a href="password_lost.php">Mot de passe perdu ?</a></li>
		</ul>
	<div class="menubas"></div>
	
	{if isset($LOGIN_ERREUR)}
	<p style="margin-left:10px;width:180px;text-align:center;color:#969696;">
		Connexion échoué !<br />
		
		{if isset($LOGIN_ERREUR[0])}
			Les deux comptes <b>{$LOGIN_ERREUR[0]}</b> et <b>{$LOGIN_ERREUR[1]}</b> ont étaient banni pour une durée de 2 jours.
		{else}
			{if $LOGIN_ERREUR==1}
				Informations insuffisantes.
			{elseif $LOGIN_ERREUR==2}
				Le compte {$smarty.post.login_login} n'existe pas.
				Vous pouvez le créer <a href="inscription.php">ici</a>.
			{elseif $LOGIN_ERREUR==3}
				Le mot de passe du compte {$smarty.post.login_login} n'est pas celui-ci.
			{elseif $LOGIN_ERREUR==4}
				Vous avez essayer de vous connecter plus de 10 fois sur un intervalle de 15 minutes.
				Veuillez donc attendre 15 minutes avant de réessayer. Merci pour votre compréhension.
			{elseif $LOGIN_ERREUR==5}
				Votre compte est actuellement banni.
			{/if}
		{/if}
	</p>
	{/if}
	
	<div class="menuhaut">Compte</div>
		<ul>
			<li><a href="inscription.php"><font color="#c10a0a"><b>Rejoignez-nous</b></font></a></li>
		</ul>
	<div class="menubas"></div>
	{/if}
	
	
	{if isset($CONNECT) && $CONNECT==TRUE}
	<div class="menuhaut">Classement</div>
	<ul>
		<li><a href="classement_general.php">Général</a></li>
		<li><a href="classement_theme.php">par Thème</a></li>
		<li><a href="construction.php">Annexes</a></li>
	</ul>
	<div class="menubas"></div>

	
	<div class="menuhaut">Forum</div>
		<ul>
			<li><a href="http://forum.qisport.fr/">Général</a></li>
			<li><a href="http://forum.qisport.fr/search.php?search_id=egosearch">Boite Messagerie</a></li>
			<li><a href="http://forum.qisport.fr/viewforum.php?f=15">Question Hebdo</a></li>
		</ul>
		<div class="menubas"></div>
	{/if}
		
	<div class="menuhaut">Annexes</div>
		<ul>
			{if isset($smarty.session.ACCOUNT)}
				<li><a href="news.php" >News Q.I Sport</a></li>
			{/if}
			<li><a href="rules.php" >Règles du jeu</a></li>
			<li><a href="conditions.php" >Conditions d'utilisation</a></li>
			<li><a href="partenaires.php" >Partenaires</a></li>
		</ul>
	<div class="menubas"></div>
	
	
	<div class="menuhaut">Statistiques</div>
		<div id="statistiques" style="padding-bottom:10px;">Nombre d'inscrits:<br />
		au total : {$NUMBER_ACCOUNTS}<br />
		ce mois-ci : {$NUMBER_ACCOUNTS_THIS_MONTH}<br />
		</div>
		<ul>
			<li><a href="statistiques.php" >Plus de statistiques</a></li>
		</ul>
	<div class="menubas"></div>
	
	{if isset($CONNECT) && $CONNECT==TRUE}
	{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
		{if $ACCOUNT->accesslevel > 0 }
		{assign var='ACCESSLEVEL' value=$ACCOUNT->accesslevel}
		<div class="menuhaut">Administration : {$ACCOUNT->accesslevel} </div>
			<ul>
				{if $ACCESSLEVEL >= $smarty.const.RIGHT_ADD_NEWS}
				<li><a href="add_news.php" >Ajouter une news ({$smarty.const.RIGHT_ADD_NEWS})</a></li>
				{/if}
				{if $ACCESSLEVEL >= $smarty.const.RIGHT_CLEAR_CACHE}
				<li><a href="?admin_action=clear_cache" >Vider le cache ({$smarty.const.RIGHT_CLEAR_CACHE})</a></li>
				{/if}
				{if $ACCESSLEVEL >= $smarty.const.RIGHT_MANAGE_NEWS}
				<li><a href="manage_news.php" >Gérer les news ({$smarty.const.RIGHT_MANAGE_NEWS})</a></li>
				{/if}
				{if $ACCESSLEVEL >= $smarty.const.RIGHT_ADD_QUESTION}
				<li><a href="manage_questions.php" >Gérer les questions ({$smarty.const.RIGHT_ADD_QUESTION})</a></li>
				{/if}
				{if $ACCESSLEVEL >= $smarty.const.MANAGE_PROGRAMMING}
				<li><a href="manage_programming.php" >Gérer les programmes ({$smarty.const.MANAGE_PROGRAMMING})</a></li>
				{/if}
				{if $ACCESSLEVEL >= $smarty.const.RIGHT_BAN_ACCOUNT}
				<li><a href="ban.php" >Bannir un compte ({$smarty.const.RIGHT_BAN_ACCOUNT})</a></li>
				{/if}
				{if $ACCESSLEVEL >= $smarty.const.RIGHT_UNBAN_ACCOUNT}
				<li><a href="unban.php" >Débannir un compte ({$smarty.const.RIGHT_UNBAN_ACCOUNT})</a></li>
				{/if}
				{if $ACCESSLEVEL >= $smarty.const.RIGHT_SET_ACCESSLEVEL}
				<li><a href="right" >Modifier droits de compte ({$smarty.const.RIGHT_SET_ACCESSLEVEL})</a></li>
				{/if}
				{if $ACCESSLEVEL >= $smarty.const.RIGHT_SAVE_DATA}
				<li><a href="savedata.cgi" >Sauvegarder la database ({$smarty.const.RIGHT_SAVE_DATA})</a></li>
				{/if}
			</ul>
		<div class="menubas"></div>
		{/if}
	{/if}
</div>
