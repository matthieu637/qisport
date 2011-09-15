<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
<head>
	<title>{$FRAME_TITLE}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta http-equiv="content-language" content="fr" />
	<link rel="stylesheet" href="style.css" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/load_scripts.js" ></script>
	{if isset($CONNECT) && $CONNECT==TRUE}
	{else}
	<script type="text/javascript" src="js/formulaire.js" ></script>
	<script type="text/javascript" src="js/login.js" ></script>
	{/if}
	<script type="text/javascript" src="js/horloge.js" ></script>
	{if isset($JS_FILES) && sizeof($JS_FILES)>0}
		{section name=index_js_files loop=$JS_FILES}
			<script type="text/javascript" src="js/{$JS_FILES[index_js_files]}" ></script>
		{/section}
	{/if}
</head>
<body>

<div id="conteneur">
	<div id="header" style="text-align:right;">
		<div style='padding-top:102px;padding-right:55px;color:#c10a0a;font:bold 12px "trebuchet ms";' > 
			{if $NUMBER_CONNECTED==1 || $NUMBER_CONNECTED == 0 }  
				{$NUMBER_CONNECTED} connecté
			{else}
				{$NUMBER_CONNECTED} connectés
			{/if}
			-
			<span id="ur" ></span>
		</div>
	</div>
	
	<div id="contenu">
		{include file="left_menu.tpl"}
