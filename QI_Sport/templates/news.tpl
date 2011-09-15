{include file="header.tpl"}

<div id="right">

	<br />
		
		
	<h2 align="center">News Q.I Sport</h2>

	{if isset($smarty.session.ACCOUNT)}
	<br />
	
		{$NEWS}
	
	{else}
		Vous devez être connecté pour voir cette page.
	{/if}
</div>

{include file="footer.tpl"}
