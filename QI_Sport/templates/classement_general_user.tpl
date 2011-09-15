
{assign var='ACCOUNT' value=$smarty.session.ACCOUNT}
<h2 align="center" >Mon classement</h2>

<br />

<center>
	<table class="classement_user" align="center" style="min-width:400px;border:none;">
		<tr>
			<th style="border:none;" ></th>
			<th>Score total</th>
			<th>Score moyen</th>
		</tr>
		<tr>
			<td><b style="color:black;">Mes points</b></td>
				<td>{$POINTS}</td>
				<td>{$POINTS_MOYEN}</td>
		</tr>
		<tr>
			<td><b style="color:black;">Mon Classement</b></td>
				<td>{$POSITION}</td>
				<td>{$POSITION_MOYEN}</td>
		</tr>
	</table>
</center>

<br />