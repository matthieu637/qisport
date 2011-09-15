
	
	{include file="classement_theme_user.tpl"}
	

	<h2 align="center">Classement général des meilleurs scores totaux par sport</h2>

	<br />
	

	<center>
		<a href="#Basket-Ball" >Basket-Ball</a> -
		<a href="#Cyclisme" >Cyclisme</a> -
		<a href="#Football" >Football</a> -
		<a href="#Rugby" >Rugby</a> -
		<a href="#Sports d'Hiver" >Sports d'Hiver</a> -
		<a href="#Tennis" >Tennis</a>
	</center>

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
	
	
	{section name=j loop=$SPORTS}

		{if $CLASSEMENT[j]|@count > 0}
	
			<h2 id="{$SPORTS[j]}" >{$SPORTS[j]}</h2>
			<br />

			<center>
				<table class="classement" width="80%">
					<tr>
						<th>Position</th>
						{section name=i loop=$CLASSEMENT[j] max=1}
							{foreach from=$CLASSEMENT[j][i] key=cle item=v}
								<th>{$cle}</th>
							{/foreach}
						{/section}
					</tr>
					
					{section name=i loop=$CLASSEMENT[j]}
						<tr>
							{assign var=position value=`$smarty.section.i.index+1`}
							<td>{$position}</td>
							
							{foreach from=$CLASSEMENT[j][i] key=cle item=v}
								{if $cle == Identifiant }
									<td><b style="color:black;">{$v}</b></td>
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

			<br />
		{/if}

	{/section}

