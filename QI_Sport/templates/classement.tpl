{include file="header.tpl"}

<div id="right">

<br />

{if isset($CONNECT) && $CONNECT==TRUE}

{$CLASSEMENT}

{else}
	Vous n'êtes pas connecté.
{/if}
</div>

{include file="footer.tpl"}
