

{include file="classement_general_user.tpl"}


<h2 align="center">Classement général</h2>

<br />

	<center>
		<label for="limit" >Montrer le : </label>
		<select id="limit" onchange="var t = $('#limit');document.location =changeUrlParams('limit',t.val());" >
			<option value="20"  {if $smarty.get.limit == 20}selected="selected"{/if}>top 20</option>
			<option value="100" {if $smarty.get.limit == 100}selected="selected"{/if} >top 100</option>
			<option value="250" {if $smarty.get.limit == 250}selected="selected"{/if}>top 250</option>
			<option value="500" {if $smarty.get.limit == 500}selected="selected"{/if}>top 500</option>
		</select>
	</center>
	
<br />

<center>
	<table class="classement" width="80%">
		<tr>
			<th width="8%" >Position</th>
			{foreach from=$CLASSEMENT[0] key=cle item=v}
				{if $cle == "Score total" }
					{if !isset($smarty.get.2)} 
						<th>{$cle}<img src="images/fleche.png" > </th>
					{else}
						<th><a href="classement_general.php" style="text-decoration:none" >{$cle}</a></th>
					{/if} 
				{elseif $cle == "Score moyen"}
					{if isset($smarty.get.2)} 
						<th>{$cle}<img src="images/fleche.png" > </th>
					{else}
						<th><a href="?2" style="text-decoration:none" >{$cle} </a></th>
					{/if}
				{else}
					<th>{$cle}</th>
				{/if}
			{/foreach}
		</tr>
		{section name=i loop=$CLASSEMENT}
			<tr>
				{assign var=position value=`$smarty.section.i.index+1`}
				<td>{$position}</td>
					{foreach from=$CLASSEMENT[i] key=cle item=v}
						{if $cle == Identifiant }
							<td><b style="color:black;"> {$v}</b> </td>
						{elseif $cle == "Score total"}
							<td><i>{$v}</i> </td>
						{else}
						<td>{$v}</td>
						{/if}
					{/foreach}
			</tr>
		{/section}
	</table>
</center>

