load_function(function(){
	
	var form = new Formulaire('password_lost');
	
	form.build('login',{ajax:'true',message:['Identifiant trouv�','Identifiant non existant']});
	form.build('email',{email:'',ajax:'true',message:['Email trouv�e','Email non trouv�e']});
	
	
});
