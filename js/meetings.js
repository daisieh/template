var meeting;
var Meeting=new Class({
	initialize:function(mode,div,input,many_input,others){
		//mode:0=set available times,1=set personal times,2=view overlapping times
		this.div=div;
		this.input=input;
		this.many_input=many_input;
		this.others=others;
		this.start=new Date();
		this.start.setHours(8);
		this.start.setMinutes(0);
		this.start.setSeconds(0);
		this.finish=new Date();
		this.finish.setHours(21);
		this.finish.setMinutes(0);
		this.finish.setSeconds(0);
		this.colors=['#de1808','#29b529','#ff94ce','#ffe572','#947bbd','6bce5a','ffb500','ff3900'];
		this.dragging=false;
		this.input.validate=function(){return this.validate();}.bind(this);
		document.addEvent('mouseup',function(e){meeting.dragging=false;});
		document.addEvent('load',windowLoaded);
		this.selected=false;
		this.setMode(mode);
	},
	addDay:function(){
		var t=prompt('enter date or day of the week','Monday');
		if (!t)
			return;
		if(this.div.firstChild&&this.div.firstChild.tagName!='TABLE')
			this.div.removeChildren();
		if (this.isEmpty())
			this.addTimes();
		this.newDayEditable(t,true);
	},
	addTimes:function(){
		var t=new Date(this.start.getTime());
		var e=document.createElement('TABLE');
		e.onselectstart = function() {
			return false;
		};
		e.unselectable = "on";
		e.style.MozUserSelect = "none";
		e.style.cursor = "default";
		e.className='meeting';
		e.cellSpacing=0;
		e.cellPadding=0;
		var tr=e.insertRow(-1);
		var td=tr.insertCell(-1);
		td.style.textAlign='center';
		if(this.mode==0 && (this.start.getHours() || this.start.getMinutes()))
			td.innerHTML='<a href="#" onclick="meeting.rebuild(-30,0,true)">+</a>';
		else
			td.innerHTML='&nbsp;';
		while(t<=this.finish){
			var h=t.getHours();
			var m=t.getMinutes();
			tr=e.insertRow(-1);
			td=tr.insertCell(-1);
			td.className='time';
			td.style.textAlign='right';
			td.innerHTML=(h==0?12:h>12?h-12:h)+':'+(m?m:'00')+(h>=12?'&nbsp;PM':'&nbsp;AM');
			t.setMinutes(t.getMinutes()+30);
		}
		tr=e.insertRow(-1);
		td=tr.insertCell(-1);
		td.style.textAlign='center';
		if(this.mode==0 && this.finish.getHours())
			td.innerHTML='<a href="#" onclick="meeting.rebuild(0,30,true)">+</a>';
		else
			td.innerHTML='&nbsp;';
		this.div.appendChild(e);
		this.rows=e.rows;
		$('legend').setStyle('display','');
	},
	buildDay:function(d,x,mode){//0=add color 0 div,1=build overlap table,2=select,3=overlap select
		if(mode==1)
			this.person=0;
		var selected=false;
		var p=1;
		var period=d[p++].split('-');
		var hm=period[0].split(':');
		var i=1;
		var t=new Date(this.start.getTime());
		while(t<this.finish){
			if(t.getHours()==hm[0]&&t.getMinutes()==hm[1]){
				if(selected){
					if(p<d.length){
						period=d[p++].split('-');
						hm=period[0].split(':');
					}
				}else
					hm=period[1].split(':');
				selected=!selected;
			}
			if(selected){
				if(mode==0)
					this.rows[i].cells[x].appendChild(this.newDiv(0,100));
				else if(mode==1){
					var e=document.createElement('TABLE');
					e.cellSpacing=0;
					e.cellPadding=0;
					e.width="100%";
					var tr=e.insertRow(-1);
					tr.insertCell(-1).innerHTML='&nbsp;';
					for(var j=0;j<this.others.length;j++)
						tr.insertCell(-1).innerHTML='&nbsp;';
					this.rows[i].cells[x].appendChild(e);
				}else if(mode==2){
					var c=this.rows[i].cells[x].firstChild;
					c.selected=true;
					c.style.backgroundColor=this.colors[1];
				}else{
					var c=this.rows[i].cells[x].firstChild;
					c.rows[0].cells[this.person].style.backgroundColor=this.getColor(this.person);
				}
			}
			++i;
			t.setMinutes(t.getMinutes()+30);
		}
		if(mode==3)
			++this.person;
	},
	buildDays:function(){
		var s=this.input.value.split('|');
		for(var i=0;i<s.length;i++)
			if (s[i].length){
				if (this.isEmpty())
					this.addTimes();
				var d=s[i].split(',');
				if(this.mode==0)
					this.newDayEditable(d[0],false);
				else{
					this.newDayEmpty(d[0]);
					if(d.length>1)
						this.buildDay(d,i+1,this.mode==2?1:0);
				}
			}
	},
	calcStartFinish:function(s){
		this.start.setHours(23);
		this.start.setMinutes(59);
		this.start.setSeconds(0);
		this.finish.setDate(this.finish.getDate()-1);
		this.finish.setHours(23);
		this.finish.setMinutes(59);
		this.finish.setSeconds(0);
		s=s.split('|');
		for(var i=0;i<s.length;i++){
			var d=s[i].split(',');
			if(d.length>1){
				var period=d[1].split('-');
				var hm=period[0].split(':');
				var t=new Date();
				t.setHours(hm[0]);
				t.setMinutes(hm[1]);
				t.setSeconds(0);
				if(t<this.start)
					this.start=t;
				period=d[d.length-1].split('-');
				hm=period[1].split(':');
				t=new Date();
				t.setHours(hm[0]);
				t.setMinutes(hm[1]);
				t.setSeconds(0);
				if(t.getHours()==0)
					t.setDate(t.getDate()+1);
				if(t>this.finish)
					this.finish=t;
			}
		}
	},
	delDay:function(event){
		var e=(window.event?window.event.srcElement:event.target).parentNode.parentNode;
		var x=0;
		while (e.previousSibling){
			x++;
			e=e.previousSibling;
		}
		for (var i=0;i<this.rows.length;i++)
			this.rows[i].deleteCell(x);
		if (this.rows[0].cells.length==1)
			this.empty();
	},
	dragSelect:function(event){
		if(this.dragging){
			var t=window.event?window.event.srcElement:event.target;
			t.selected=this.selected;
			t.style.backgroundColor=this.colors[this.selected?1:0];
		}
	},
	empty:function(){
		if(this.div.firstChild)
			this.div.removeChild(this.div.firstChild);
	},
	getColor:function(x){
		return this.colors[x%(this.colors.length-1)+1];
	},
	getDay:function(x){
		var d;
		if (this.rows[0].cells[x].firstChild.value)
			d=this.rows[0].cells[x].firstChild.value;
		else
			d=this.rows[0].cells[x].innerHTML;
		var s=false;
		var t=new Date(this.start.getTime());
		for(var i=1;i<this.rows.length-2;i++){
			var c=this.rows[i].cells[x];
			if(c.firstChild&&c.firstChild.selected!=s){
				d+=(s?'-':',')+t.getHours()+':'+(t.getMinutes()?t.getMinutes():'00');
				s=c.firstChild.selected;
			}
			t.setMinutes(t.getMinutes()+30);
		}
		if(s)
			d+='-'+t.getHours()+':'+(t.getMinutes()?t.getMinutes():'00');
		return d;
	},
	getDays:function(){
		var d='';
		if (!this.isEmpty());
			for(var i=1;i<this.rows[0].cells.length;i++){
				if(i>1)
					d+='|';
				d+=this.getDay(i);
			}
		return d;
	},
	isEmpty:function(){
		return !this.div.hasChildNodes();
	},
	newDayEditable:function(t){
		var td=this.rows[0].insertCell(-1);
		var d=document.createElement('input');
		d.style.width=100;
		d.value=t;
		td.appendChild(d);
		for(var i=1;i<this.rows.length-2;i++){
			td=this.rows[i].insertCell(-1);
			td.className='meeting';
			td.appendChild(this.newDiv(0,100));
		}
		td=this.rows[this.rows.length-2].insertCell(-1);
		td.align='center';
		var a=document.createElement('a');
		a.onclick=this.delDay.bind(this);
		a.innerHTML='<img src="'+context+'/images/delete.gif" border="0" onmousedown="this.src=\''+context+'/images/delete_down.gif\'" onmouseout="this.src=\''+context+'/images/delete.gif\'" />';
		td.appendChild(a);
	},
	newDayEmpty:function(t){
		var td=this.rows[0].insertCell(-1);
		td.style.fontWeight='bold';
		td.innerHTML=t;
		td.style.textAlign='center';
		for(var i=1;i<this.rows.length-2;i++){
			td=this.rows[i].insertCell(-1);
			td.className='meeting';
		}
	},
	newDiv:function(c,w){
		var d=document.createElement('div');
		if(w==100){
			d.onmousedown=this.swap.bind(this);
			d.onmouseover=this.dragSelect.bind(this);
			d.selected=false;
		}
		d.style.backgroundColor=this.colors[c];
		d.style.height='20px';
		d.style.width=w;
		return d;
	},
	rebuild:function(before,after,select){
		if (before)
			this.start.setMinutes(this.start.getMinutes()+before);
		else if (after)
			this.finish.setMinutes(this.finish.getMinutes()+after);
		else if (this.input.value)
			this.calcStartFinish(this.input.value);
		this.empty();
		this.buildDays();
		if(select)
			this.selectDays(this.input.value);
	},
	selectDays:function(s){
		s=s.split('|');
		for(var i=0;i<s.length;i++)
			if (s[i].length){
				var d=s[i].split(',');
				if(d.length>1)
					this.buildDay(d,i+1,this.mode==2?3:2);
			}
	},
	setMode:function(mode){
		if(!this.isEmpty())
			this.validate();
		this.mode=mode;
		if(mode==0)
			this.rebuild(0,0,true);
		else if(mode==1){
			this.rebuild(0,0,false);
			this.selectDays(this.many_input.value);
		} else {
			this.rebuild(0,0,false);
			this.selectDays(this.many_input.value);
			for(var i=0;i<this.others.length;i++)
				this.selectDays(this.others[i]);
		}
		$('add_span').setStyle('visibility', mode==0?'':'hidden');
	},
	swap:function(event){
		var t=window.event?window.event.srcElement:event.target;
		this.selected=!t.selected;
		t.selected=this.selected;
		t.style.backgroundColor=this.colors[t.selected?1:0];
		this.dragging=true;
	},
	validate:function(){
		if (this.mode == 0)
			this.input.value=this.getDays();
		else if (this.mode == 1)
			this.many_input.value=this.getDays();
		return true;
	}
});
function windowLoaded(e) {
    document.body.ondrag = function(){return false;};
    document.body.onselectstart = function(){return false;};
}
