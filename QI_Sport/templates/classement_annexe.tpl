<h2 align="center">Classements annexes</h2>

	<br />
	
	<ul>
			{section name=k loop=$CLASSEMENTS }
				<li>
					{$CLASSEMENTS[k]} 
					( <a href="?action=all&classement={$smarty.section.k.index}" >général</a> - 
						<a href="?action=sport&classement={$smarty.section.k.index}" > par sport </a> - 
						<a href="?action=me&classement={$smarty.section.k.index}"> ma position</a> )
				</li>
			{/section}
	</ul>
	
	{if isset($smarty.get.classement)}
	
	<br />
	
	<h2>{$CLASSEMENTS[$smarty.get.classement]}</h2>
	
	<br />
	
	<center>
		<label for="limit" >Limite du classement : </label>
		<select id="limit" onchange="var t = $('#limit');document.location =changeUrlParams('limit',t.val());" >
			<option value="20"  {if $smarty.get.limit == 20}selected="selected"{/if}>top 20</option>
			<option value="100" {if $smarty.get.limit == 100}selected="selected"{/if} >top 100</option>
			<option value="250" {if $smarty.get.limit == 250}selected="selected"{/if}>top 250</option>
			<option value="500" {if $smarty.get.limit == 500}selected="selected"{/if}>top 500</option>
		</select>
	</center>
	
	<br />
	
		{if !isset($SPORTS)}
		
		<center>
			<table class="classement" width="80%">
			<tr>
				<th>Position</th>
				{section name=i loop=$CLASSEMENT max=1}
					{foreach from=$CLASSEMENT[i] key=cle item=v}
						<th>{$cle}</th>
					{/foreach}
				{/section}
			</tr>
				{section name=i loop=$CLASSEMENT}
					<tr>
						{assign var=position value=`$smarty.section.i.index+1`}
						<td>{$position}</td>
						{foreach from=$CLASSEMENT[i] key=cle item=v}
							{if $cle == Identifiant }
								<td><b style="color:black;"> {$v}</b> </td>
							{else}
								<td>{$v}</td>
							{/if}
						{/foreach}
					</tr>
				{/section}
			</table>
		</center>
		
		{else}
		
			<center>
				{section loop=$SPORTS name=sp max=5}
					<a href="#{$SPORTS[sp]}">{$SPORTS[sp]}</a> -
				{/section}
				<a href="#{$SPORTS[5]}">{$SPORTS[5]}</a>
			</center>
			
			<br />
			
			{section name=x loop=$SPORTS}

				{if isset($CLASSEMENT[x][0])}
			
				<h2 id="{$SPORTS[x]}" >{$SPORTS[x]}</h2>
				<br />

					<center>
						<table class="classement" width="80%">
							<tr>
								<th>Position</th>
								{section name=i loop=$CLASSEMENT[x] max=1}
									{foreach from=$CLASSEMENT[x][i] key=cle item=v}
										<th>{$cle}</th>
									{/foreach}
								{/section}
							</tr>
							
							{section name=i loop=$CLASSEMENT[x]}
								<tr>
									{assign var=position value=`$smarty.section.i.index+1`}
									<td>{$position}</td>
									{foreach from=$CLASSEMENT[x][i] key=cle item=v}
										{if $cle == Identifiant }
											<td><b style="color:black;"> {$v}</b> </td>
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
		
		{/if}
	
	{/if}
	
	
