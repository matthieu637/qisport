var function_on_load = new Array();

function load_function(fonction) 
{ 
    function_on_load[function_on_load.length] = fonction;
}

$(document).ready(function()
{
	for(var i = 0;i<function_on_load.length;i++)
   		function_on_load[i]();
});
