load_function(function(){
	
	var form = new Formulaire('password_lost');
	
	form.build('login',{ajax:'true',message:['Identifiant trouvé','Identifiant non existant']});
	form.build('email',{email:'',ajax:'true',message:['Email trouvée','Email non trouvée']});
	
	
});
