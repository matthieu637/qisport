{include file="header.tpl"}

<div id="right">

	<br />

	<h2>Profil</h2>
	
	<br />
	
	{if isset($CONNECT) && $CONNECT==TRUE}
	{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
		<p>	
			<br/>
			Les informations qui ont �tait retenues sur vous sont les suivantes :
			<br />
			<br />
			
			<fieldset>
				<legend>{$ACCOUNT->login}</legend>
				<ul style='font-size:0.9em;margin-left:20px;width:400px;'>
					{foreach from=$ACCOUNT->getAllFields() key=key item=value}
						
							{if $key=='email'}
								<li>Votre adresse e-mail est la suivante : {$value}</li>
							{elseif $key=='sport'}
								<li>Votre sport pr�f�r� est le {$value}</li>
							{elseif $key=='newsletter' && $value==1}
								<li>Vous avez souscrit � la newsletter.</li>
							{elseif $key=='newsletter' && $value==0}
								<li>Vous n'avez pas souscrit � la newsletter.</li>
							{elseif $key=='years'}
								<li>Vous �tes n�e en {$value} le {$ACCOUNT->days} du {$ACCOUNT->months}.</li>
							{elseif $key=='sex' && $value=='M'}
								<li>Vous �tes un Homme.</li>
							{elseif $key=='sex' && $value=='F'}
								<li>Vous �tes une Femme.</li>
							{elseif $key=='fan'}
								<li>Vous �tes fan de {$value}.</li>
							{elseif $key=='nationality'}
								<li>Vous habitez en {$value}.</li>
							{/if}
						
					{/foreach}
				</ul>
			</fieldset>
			
			<br />
			
			</p>
			
			<p align="center" >
				<a href="profil_edit.php">Modifier mon profil</a> - 
				<a href="password_edit.php">Modifier mon mot de passe</a> -
				<a href="email_edit.php">Modifier mon adresse e-mail</a> -
				<a href="profil.php?action=unregister">Me d�sinscrire</a>
			</p>
			
			{if isset($smarty.get.action) && $smarty.get.action == 'unregister'}
			<p align="center" >
			<br/>
			<br/>
				Et�s-vous certain de vouloir vous d�sinscrire? <a href="profil.php?action=confirm_delete">Oui</a> - <a href="profil.php">Non</a>
			</p>
			{/if}
		</p>
	{else}
		Vous n'�tes pas connect�.
	{/if}
</div>

{include file="footer.tpl"}
