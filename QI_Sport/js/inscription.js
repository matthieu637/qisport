load_function(function()
{
	
	var form = new Formulaire('inscription');
	form.build('login',{ajax:'false'});
	form.build('password1',{equals:'password2'});
	form.build('password2',{equals:'password1'});
	form.build('email1',{email:'',ajax:'false',equals:'email2'});
	form.build('email2',{email:'',ajax:'false',equals:'email1'});
	form.build('code',{fix_size:'6'});
	form.build_date();
	form.build_checkbox('rules');
	form.build_reset();
	
	var balise_sport = $('#inscription_sport');
	var img_change = $('#image_change');
	
	balise_sport.keyup(function()
	{
		img_change.attr('src',"images/avatars/"+balise_sport.val()+".png");
	});
	
	balise_sport.click(function()
	{
		img_change.attr('src',"images/avatars/"+balise_sport.val()+".png");
	});
	
	var button_change_code = $('#change_code_img');
	var img_code =$('#code_antibot');
	
	button_change_code.click(function()
	{
		$.post('ajax.php',{request : 'restart_code_antibot'},function(data)
		{
			img_code.attr('src','antiBot.php?'+Math.random()*10000000);
		});
	});
});
