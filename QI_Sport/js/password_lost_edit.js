load_function(function(){
	
	var form = new Formulaire('password_lost_edit');
	
	form.build('password1',{equals:'password2'});
	form.build('password2',{equals:'password1'});
	
	
});
