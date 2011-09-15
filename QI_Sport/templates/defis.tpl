{include file="header.tpl"}

<div id="right">

	<br />

	<h2>Le défis du dimanche</h2>
	
	<br />

	<p>Veuillez choisir votre sport de défis :</p>
	
	<br />
	
	<form action="game.php" method="GET" >
	
		<center>
		<select name="s" >
					<option value="b" >Basket-Ball</option>
					<option value="c" >Cyclisme</option>
					<option value="f" >Football</option>
					<option value="r" >Rugby</option>
					<option value="s" >Sports d'Hiver</option>
					<option value="t" >Tennis</option>
		</select>
		
		<input type="hidden" name="g" value="1" />
		
		<input type="submit" value="Valider" />
		
		</center>
		
	</form>

</div>

{include file="footer.tpl"}
