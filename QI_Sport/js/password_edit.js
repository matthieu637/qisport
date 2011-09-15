load_function(function(){
	
	var form = new Formulaire('password_edit');
	
	form.build('password_last');
	form.build('password1',{equals:'password2'});
	form.build('password2',{equals:'password1'});
	
	
});