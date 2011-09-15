/**
 *  @author:Matthieu637 
 * */
//
//TODO::et 

function Formulaire(form_id)
{
	this.form_id=form_id;
	this.balises=new Array();
	this.valide=new Array();
	
	this.balises['submit']=$(':submit[name='+form_id+'_submit]');
}


Formulaire.MININAL_CHAR=4;
Formulaire.ERROR_COLOR="#c10a0a";
Formulaire.VALIDE_COLOR="green";


Formulaire.string_valide = function(string_test)
{
	for(i=0;i<string_test.length;i++)
	{
		if ((string_test.charCodeAt(i) > 96 && string_test.charCodeAt(i) < 123) || 
			(string_test.charCodeAt(i) > 64 && string_test.charCodeAt(i) < 91) || 
			(string_test.charCodeAt(i) > 47 && string_test.charCodeAt(i) < 58) ||
			(string_test.charCodeAt(i) == 233) ||( string_test.charCodeAt(i) == 232))
                        {}
		else return false;
	}
	
	return true;
}

Formulaire.email_valide = function(string_test)
{
	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	return reg.test(string_test);
}

Formulaire.toCorrectName = function(string)
{
	if(string.indexOf('login',0) >= 0)
		return 'Identifiant';
	else if(string.indexOf('email',0) >= 0 )
		return 'E-mail';
	else if(string.indexOf('password',0) >= 0 )
		return 'Mot de passe';
	else if(string.indexOf('code',0) >= 0 )
		return 'Code';
	else return string;
}


Formulaire.prototype =
{	
	add_message : function(balise,message)
	{
		if(balise==undefined)
			return;
		
		if(balise.next().val()==undefined)
			balise.after(message);
		else balise.next().html(message);
	},
	
	valide_all : function(instance)
	{

		var form_valid=true;
		
		for(x in instance.valide)
			if(!instance.valide[x])
			{
				form_valid=false;
				break;
			}

		if(form_valid)
			instance.balises['submit'].attr('disabled',false);
		else instance.balises['submit'].attr('disabled',true);
	},
	
	valide_date : function(balise_jour,balise_mois,balise_annee)
	{
		var reg_date = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
		
		var jour = balise_jour.val();
		var mois =	balise_mois.val();
		var annee = balise_annee.val();
		
		if((jour=='' && mois=='' && annee=='' ) || (jour=="jj" && mois=="mm" && annee=="aaaa") || mois=="mm" || annee=="aaaa")
		{
			this.add_message(balise_annee,'<font color="'+Formulaire.VALIDE_COLOR+'" ></font>');
			this.valide['date']=true;
		} 
		else if( reg_date.test(jour+"/"+mois+"/"+annee) && annee >1900 && annee < 2005 && jour > 0 && jour < 32 && mois > 0 && mois <13 )
		{
			this.add_message(balise_annee,'<font color="'+Formulaire.VALIDE_COLOR+'" ></font>');
			this.valide['date']=true;
		}
		else
		{
			this.add_message(balise_annee,'<font color="'+Formulaire.ERROR_COLOR+'" >Date invalide</font>');
			this.valide['date']=false;
		}
		
		Formulaire.prototype.valide_all(this);
	},
	
	check_balise : function(balise,balise_name,ajax,ajax_need_value,email,equals,equals_with,fix_size,fix_size_val,message,message_details)
	{
		var instance = this;
		
		var as = function ()
		{
			if(fix_size?balise.val().length!=fix_size_val:balise.val().length<Formulaire.MININAL_CHAR)
			{
				instance.valide[balise_name]=false;
				if(message)
					Formulaire.prototype.add_message(balise,'<font color="'+Formulaire.ERROR_COLOR+'" >'+Formulaire.toCorrectName(balise_name)+' trop court</font>');
			}
			else
			{
				if(email?Formulaire.email_valide(balise.val()):Formulaire.string_valide(balise.val()))
				{
					if(!equals || (instance.balises[equals_with]!=null && balise.val()==instance.balises[equals_with].val()))
					{
						if(ajax)
						{
							$.post('ajax.php',{ request : balise_name, args : balise.val()},
							function (data)
							{		
								if(data==ajax_need_value)
								{
									instance.valide[balise_name]=true;
									if(message)
									{
										if(message_details == undefined)
											Formulaire.prototype.add_message(balise,'<font color="'+Formulaire.VALIDE_COLOR+'" >'+Formulaire.toCorrectName(balise_name)+' disponible</font>');
										else Formulaire.prototype.add_message(balise,'<font color="'+Formulaire.VALIDE_COLOR+'" > '+message_details[0]+' </font>');
									}
								
									if(equals)
									{
										instance.valide[equals_with]=true;
										if(message)
											Formulaire.prototype.add_message(instance.balises[equals_with],'<font color="'+Formulaire.VALIDE_COLOR+'" ></font>');
									}
								}
								else
								{
									instance.valide[balise_name]=false;
									if(message)
									{
										if(message_details == undefined)
											Formulaire.prototype.add_message(balise,'<font color="'+Formulaire.ERROR_COLOR+'" >'+Formulaire.toCorrectName(balise_name)+' indisponible</font>');
										else
											Formulaire.prototype.add_message(balise,'<font color="'+Formulaire.ERROR_COLOR+'" >'+message_details[1]+' </font>');
									}
								}
								
								Formulaire.prototype.valide_all(instance);
							});
						}
						else
						{
							instance.valide[balise_name]=true;
							if(message)
								Formulaire.prototype.add_message(balise,'<font color="'+Formulaire.VALIDE_COLOR+'" ></font>');
							
							if(equals)
							{
								instance.valide[equals_with]=true;
								if(message)
									Formulaire.prototype.add_message(instance.balises[equals_with],'<font color="'+Formulaire.VALIDE_COLOR+'" ></font>');
							}
						}
					}
					else
					{
						instance.valide[balise_name]=false;
						if(message)
							Formulaire.prototype.add_message(balise,'<font color="'+Formulaire.ERROR_COLOR+'" >'+Formulaire.toCorrectName(balise_name)+' différents</font>');
						
						instance.valide[equals_with]=false;
						if(message)
							Formulaire.prototype.add_message(instance.balises[equals_with],'<font color="'+Formulaire.ERROR_COLOR+'" >'+Formulaire.toCorrectName(balise_name)+' différents</font>');
					}
				}
				else 
				{
					instance.valide[balise_name]=false;
					
					if(message)
					{
						if(!email)
							Formulaire.prototype.add_message(balise,'<font color="'+Formulaire.ERROR_COLOR+'" >Caractére(s) invalide(s)</font>');
						else Formulaire.prototype.add_message(balise,'<font color="'+Formulaire.ERROR_COLOR+'" >Email invalide</font>');
					}
				}
			}
		
			Formulaire.prototype.valide_all(instance);
		};
		
		balise.keyup(as);
		balise.click(as);
		balise.change(as);
		
		if(balise.val()!=undefined && balise.val().length > 0)
			as();
		
	},
	
	
	build : function(balise_name)
	{

		var balise = $('input[name='+this.form_id+'_'+balise_name+']');
		
		if(balise!=undefined)
		{
			this.balises[balise_name]=balise;
			this.valide[balise_name]=false;
			
			var args = this.build.arguments[1];
			var ajax=false;
			var ajax_need_value=false;
			var email=false;
			var equals=false;
			var equals_with=false;
			var fix_size=false;
			var fix_size_val=false;
			var message=true;
			var message_details=null;
			
			for(x in args)
				if(x=='ajax')
				{
					ajax=true;
					ajax_need_value=args[x];
				}
				else if(x=='email')
					email=true;
				else if(x=='equals')
				{
					equals=true;
					equals_with=args[x];
				}
				else if(x=='fix_size')
				{
					fix_size=true;
					fix_size_val=args[x];
				}
				else if(x=='no_message')
					message=false;
				else if(x=='message')
					message_details=args[x];
				
			
			this.check_balise(balise,balise_name,ajax,ajax_need_value,email,equals,equals_with,fix_size,fix_size_val,message,message_details);
		}
	},
	
	
	build_date : function()
	{
	
		var balise_jour = $('input[name='+this.form_id+'_jours]');
		var balise_mois = $(':text[name='+this.form_id+'_mois]');
		var balise_annee = $(':text[name='+this.form_id+'_annees]');
		
		balise_annee.keyup(function()
		{
			Formulaire.prototype.valide_date(balise_jour,balise_mois,balise_annee);
		});
		
		balise_jour.keyup(function()
		{
			Formulaire.prototype.valide_date(balise_jour,balise_mois,balise_annee);
		});
		
		balise_mois.keyup(function()
		{
			Formulaire.prototype.valide_date(balise_jour,balise_mois,balise_annee);
		});
	},
	
	
	build_checkbox : function(balise_name)
	{
		var balise = $(':checkbox[name='+this.form_id+'_'+balise_name+']');
		var instance = this;
		
		if(balise!=undefined)
		{
			this.valide[balise_name]=false;
			
			balise.click(function()
			{
				instance.valide[balise_name]=balise.attr('checked');
				Formulaire.prototype.valide_all(instance);
			});
		}
	},
	
	build_reset : function()
	{
		var reset = $('input[name='+this.form_id+'_reset]');
		var instance=this;
		
		reset.click(function()
		{
			for(x in instance.balises)
				Formulaire.prototype.add_message(instance.balises[x],'');
		});
	}/*,
	
	lock_build : function()
	{
		for(x in this.balises)
			if(x == "submit")
				alert(x);
	}*/
}

