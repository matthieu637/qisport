load_function(function(){
	
	var form = new Formulaire('email_edit');
	
	form.build('email1',{email:'',ajax:'false',equals:'email2'});
	form.build('email2',{email:'',ajax:'false',equals:'email1'});
	
	
});