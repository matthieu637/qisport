
/*
var date = false;

function checkAll()
{
	//alert(login+" "+mdp1+" "+mdp2+" "+confmdp+" "+mail1+" "+mail2+" "+confmail);
	
	if(date)
		document.getElementById('valide_button').disabled=false;
	else document.getElementById('valide_button').disabled=true;
}

function checkDate()
{
	var reg_date = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
	
	var jour = document.getElementById('jour').value;
	var mois = document.getElementById('mois').value;
	var annee = document.getElementById('annee').value;
	
	if((jour=='' && mois=='' && annee=='' ) || (jour=="jj" && mois=="mm" && annee=="aaaa") || mois=="mm" || annee=="aaaa")
	{
		document.getElementById('js_date').innerHTML = "";
		date=true;
		checkAll();
	} 
	else if( reg_date.test(jour+"/"+mois+"/"+annee) && annee >1900 && annee < 2005 && jour > 0 && jour < 32 && mois > 0 && mois <13 )
	{
		document.getElementById('js_date').innerHTML = "";
		date=true;
		checkAll();
	}
	else
	{
		document.getElementById('js_date').innerHTML = "<font color='#c10a0a' >Date de naissance invalide</font>";
		date=false;
		checkAll();
	}
}

function changeImSport(balise)
{
	document.getElementById('image_change').src="images/avatars/"+balise.value+".png";
}
*/