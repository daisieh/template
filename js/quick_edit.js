var qe_table_columns=[];
var qe_text_area;
function ensure_view(e)
{
	var h=window.event?document.body.clientHeight:window.innerHeight;
	var o=window.event?document.body.scrollTop:window.pageYOffset;
	var y=e.getPosition().y;
	if(o>y)
		window.scroll(0,y);
	else if(o+h<y+e.offsetHeight)
		window.scrollTo(0,y-h+e.offsetHeight);
}
function qe_add(t,c)
{
	qe_table_columns[t]=c;
}
function quick_edit(e,vd)
{
	e=e||window.event;
	var t=e.target||e.srcElement;
	if(t.tagName=='TR')
		return;
	t=$(t).ancestor('TD');
	if(t.parentNode.className==null || t.parentNode.className.indexOf('row')==-1)
		return
	var c=t.firstChild;
	if(c&&c.tagName)
		return;
	var n=t.nodeIndex();
	var cols=qe_table_columns[c_(t).id.substring(2)];
	if(n*2>=cols.length)
		return;
	if(cols[n*2+1]=='b')
		return;
	qe_text_area=new Element('TEXTAREA');
	var p=t.getPosition();
	qe_text_area.setStyles({position:'absolute',fontSize:'9pt',top:p.y,left:p.x,width:t.offsetWidth,height:t.offsetHeight});
	qe_text_area.td=t;
	if(t.childNodes.length>1||(c&&c.nodeValue.charCodeAt(0)!=160)){
		var s=t.firstChild.nodeValue;
		for(var i=1;i<t.childNodes.length;i++)
			if(t.childNodes[i].nodeType==3)
				s+=t.childNodes[i].nodeValue;
			else
				s+='\r\n';
		qe_text_area.value=s;
	}
	qe_text_area.c=cols[n*2];
	qe_text_area.kv=t.parentNode.getAttribute('kv');
	qe_text_area.onblur=qe_hide;
	qe_text_area.onkeypress=qe_key;
	qe_text_area.cancel=true;
	qe_text_area.vd=vd;
	document.body.appendChild(qe_text_area);
	qe_text_area.focus();
	ensure_view(qe_text_area);
}
function qe_hide(e)
{
	qe_text_area.parentNode.removeChild(qe_text_area);
}
function qe_key(e)
{
	if(!qe_text_area)
		return true;
	if(window.event)
		e=window.event;
	if(e.keyCode==27)
		qe_text_area.blur();
	if(e.keyCode==13){
		e.cancelBubble=true;
		e.returnValue=false;
		if(e.stopPropagation)
			e.stopPropagation();
		if(e.preventDefault)
			e.preventDefault();
		qe_text_area.cancel=false;
		qe_text_area.td.removeChildren();
		var v=qe_text_area.value.replace(/\r/g,'');
		qe_send(qe_text_area.vd,qe_text_area.c,v,qe_text_area.kv);
		qe_text_area.td.removeChildren();
		var i=v.indexOf('\n');
		while (i!=-1) {
			qe_text_area.td.appendChild(document.createTextNode(v.substr(0,i)));
			qe_text_area.td.appendChild(document.createElement('BR'));
			v=v.substr(i+1);
			i=v.indexOf('\n');
		}
		qe_text_area.td.appendChild(document.createTextNode(v));
		qe_text_area.blur();
		qe_text_area=null;
		return false;
	}
}
function qe_send(vd,c,v,kv)
{
	XHR_post(context+'/db', 'db_view_def='+vd+'&db_cmd=update&db_key_value='+kv+'&'+c+'='+encodeURIComponent(v));
}
function qe_send_b(vd,cb)
{
	var cols=qe_table_columns[vd];
	qe_send(vd,cols[$(cb).ancestor('TD').nodeIndex()*2],cb.checked,cb.ancestor('TR').getAttribute('kv'));
}
