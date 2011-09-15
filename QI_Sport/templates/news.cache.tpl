

{section name=i loop=$NEWS}
	<h2> {$NEWS[i]->title} <span style="color:#595959" > le {$NEWS[i]->to_char}</span></h2>
	<br />
	<p style="margin-left : 50px "> {$NEWS[i]->content} </p>
	<p align="right" > <i>{$NEWS[i]->author}</i> </p>
	<hr></hr>
{/section}





