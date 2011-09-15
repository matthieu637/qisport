function extractUrlParams(){	

	var t = location.search.substring(1).split('&');
	
	var f = [];
	
	if(t[0]=='' && t.length==1)
		return f;

	for (var i=0; i<t.length; i++){

		var x = t[ i ].split('=');

		f[x[0]]=x[1];

	}
	
	return f;
}

function changeUrlParams(param, value)
{
		var f = extractUrlParams();
			
		f[param]=value;
		
		var result=location.pathname+'?';
		
		for(x in f)
			result+=x+'='+f[x]+'&'
			
		return result.substr(0,result.length-1);
}

