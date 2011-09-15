{include file="header.tpl"}

<div id="right">

	<br />
	
	<br />
	
	{if isset($CONNECT) && $CONNECT==TRUE}
	<p>
		{if isset($SPORT)}
	<applet name="Game" codebase="." code="com.qis.gameapplet.QiSGameApplet" 
       height="400px" width="650px" archive="{$smarty.const.APPLET_PATH}" 
	   alt="Le jeu ne peut pas se lancer.
	   Veuillez vérifier que vous avez bien installé <a href='http://www.java.com/fr/download/' >java</a> et qu'il est activé dans votre navigateur." >
		
		<param name="PHPSESSID" value="{$smarty.cookies.PHPSESSID}" />
		<param name="HOST" value="{$smarty.const.HOST_APPLET}" />
		
		{if isset($smarty.get.g)}
			<param name="GAMETYPE" value="002" />
		{else}
			<param name="GAMETYPE" value="001" />
		{/if}
		
		<param name="SPORT" value="{$SPORT}" />
		<param name="PORT" value="{$smarty.const.PORT_APPLET}" />
	</applet>
		{else}
			Sport invalide.
		{/if}
	</p>
	{else}
		Vous n'êtes pas connecté.
	{/if}

</div>

{include file="footer.tpl"}
