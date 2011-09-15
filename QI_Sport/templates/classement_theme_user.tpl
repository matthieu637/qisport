
{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
<h2 align="center" >Mon classement</h2>

<br />

<style type="text/css">
	{literal}
		table.classement_user, table.classement_user td, table.classement_user th
		{
			border:black 1px solid;
			border-collapse:collapse;
			text-align:center;
		}
		
		table.classement_user th
		{
			border:black 1px solid;
			color:#c10a0a;
			border-collapse:collapse;
			text-align:center;
		}
	{/literal}
</style>

<center>
	<table class="classement_user" width="80%" align="center" style="border:none;" >
		<tr>
			<th  style="border:none;"></th>
			{section name=j loop=$SPORTS}
				<th>{$SPORTS[j]}</th>
			{/section}
		</tr>
		<tr>
			<td><b style="color:black;">Mes points</b></td>
			{section name=j loop=$MYPOINTS}
				<td>{$MYPOINTS[j]}</td>
			{/section}
		</tr>
		<tr>
			<td><b style="color:black;">Mon Classement</b></td>
			{section name=j loop=$MYCLASSEMENT}
				<td>{$MYCLASSEMENT[j]}</td>
			{/section}
		</tr>
	</table>
</center>

<br />