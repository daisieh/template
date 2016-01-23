var Gallery = {
	initialize: function(options){
		this.options = options || {};
		this.closed = true;
		this.prepareHTML();
		this.prepareEffects();
		this.prepareEvents();
	},

	cancelAllEffects:function(){
		this.modal.get('morph').cancel();
		this.modal.get('tween').cancel();
//		this.modal.retrieve('showBottom').cancel();
		this.image.get('tween').cancel();
	},

	close:function(){
		this.cancelAllEffects();
//		this.bottom.setStyles({'visibility':'hidden','display':''});
		this.image.setStyles({'opacity':0, 'width':'', 'height':''});
 		this.image.empty();
 		$$(this.modal,this.comments,this.overlay).setStyle('display','none');
		this.closed = true;
	},
	
	go:function(i){
		this.comments.setStyle('display','none');
		this.image.empty();
		this.image.fade('hide');
		this.description.empty();
		this.count.empty();
		this.modal.addClass('gallery_loading');
		this.loadImage(this.files[i]);
	},

	loadImage:function(file){
		var loadImage = new Asset.image(this.options.url_base?this.options.url_base+'/'+file:file, { onload:function(img){
			this.currentImage = img;
			this.currentImage.set('morph',{ duration:500,link:'chain',transition:'sine:in:out' });
//			$$(this.description,this.navigation).setStyle('visibility','hidden');
//			this.navigation.setStyle('height','');
			$$(this.next_link,this.prev_link,this.close_link).setStyle('backgroundPosition','0 0');
			this.showImage(this.currentImage);
		}.bind(this)});
	},

	next:function(){
		this.go((this.image_index != this.files.length-1) ? this.image_index += 1 : this.image_index = 0);
	},

	open:function(index,hilite_comment_id){
		this.overlay.setStyle('display','block');
		this.modal.addClass('gallery_loading');
//		this.bottom.fade('hide');
		this.modal.setStyles({display:'',height:250,left:window.getSize().x/2-125,opacity:0,top:80,width:250});
		this.modal.fade('show');
		this.image_index = index;
		var border = this.modal.getStyle('border-right-width').toInt();
		var w;
		if(this.files.length == 1) {
			$$(this.prev_link, this.next_link, this.count).setStyles({'display':'none'});
			w = this.close_link.getSize().x+border;
		} else {
			$$(this.prev_link, this.next_link, this.count).setStyles({'display':'block'});
			w = this.prev_link.getSize().x+this.next_link.getSize().x+this.close_link.getSize().x+border;
		}		
		this.navigation.setStyle('width',w);
		this.description.setStyle('margin-right',w);
		this.loadImage(this.files[index]);
		this.closed = false;
	},

	prepareEffects:function(){
		this.modal.set('tween',{ duration:'short',link:'chain' });
		this.modal.set('morph',{ duration:500,link:'chain',transition:'sine:in:out' });
//		this.modal.store('showBottom',new Fx.Tween(this.modal,{property:'height',duration:'short'}));
		this.image.set('tween',{ link:'chain' });
		this.image.set('morph',{ duration:500,link:'chain',transition:'sine:in:out' });
//		this.comments.set('tween',{ link:'chain' });
	},
	
	prepareEvents:function(){
		this.next_link.addEvent('click',this.next.bind(this));
		this.prev_link.addEvent('click',this.prev.bind(this));
		
		this.modal.get('morph').addEvent('onComplete',function(){
			this.image.setStyle('width',this.modal.getSize().x-20);
			this.image.grab(this.currentImage);
			this.image.fade('in');
			if(this.show_bottom)
				this.showBottom();
			if(this.options.show_comments){
				var s = this.modal.getSize();
				this.comments.setStyles({display:'',left:this.modal.getPosition().x+s.x,'max-height':s.y,opacity:0,top:80,width:320});
				this.comments.fade('in');
				var url=context + '/pictures_comments?id='+this.ids[this.image_index];
				this.comments.replace(url,{ignore:true});
			}
		}.bind(this));
		
//		this.modal.retrieve('showBottom').addEvent('onComplete',function(){
//			this.bottom.fade('show');
//			$$(this.description,this.navigation).setStyle('visibility','visible');
//		}.bind(this));

		$$(this.overlay,this.image,this.close_link).addEvent('click',function(){ this.close(); }.bind(this));
	},

	prepareHTML:function(){
		this.overlay = new Element('div', {'class':'gallery_overlay'}).inject(document.body);
		this.modal = new Element('div', {'class':'gallery_modal', styles:{display:'none',position:'fixed'}}).inject($(document.body));
		if (this.options.show_comments)
			this.comments = new Element('div', {'id':'c_gallery_comments', 'class':'comments gallery_comments', 'styles':{display:'none',opacity:0,overflow:'auto'}}).inject($(document.body));
		this.image = new Element('div', {'id':'gallery_image'}).inject(this.modal);
		this.bottom = new Element('div',{'id':'gallery_bottom'}).inject(this.modal);
		this.navigation = new Element('div',{'id':'gallery_navigation'});
		this.description = new Element('div',{'id':'gallery_description'});
		this.bottom.adopt(this.navigation, this.description, new Element('div',{'class':'clear'}));
		this.close_link = new Element('a',{'id':'gallery_close_link'});
		this.next_link = new Element('a',{'id':'gallery_next_link'});
		this.prev_link = new Element('a',{'id':'gallery_prev_link'});
		this.count = new Element('span',{'id':'gallery_count'});
		$$(this.next_link, this.prev_link, this.count).setStyle('display','none');
		this.navigation.adopt(this.close_link, this.next_link, this.prev_link,new Element('div',{'class':'clear'}), this.count);
	},

	prev:function(){
		this.go((this.image_index != 0) ? this.image_index -= 1 : this.image_index = this.files.length-1);
	},

	rotateClockwise:function(i){
		XHR_post(context+'/Gallery','action=rotate clockwise&db_key_value='+this.ids[i],function(){location.reload(true);});
	},

	rotateCounterclockwise:function(i){
		XHR_post(context+'/Gallery','action=rotate counterclockwise&db_key_value='+this.ids[i],function(){location.reload(true);});
	},
	
	setFiles:function(files,ids,titles){
		this.files = files;
		this.ids = ids;
		this.titles = titles;
		this.currentImage = null;
		this.image_index = null;
	},

	showBottom:function(){
		this.show_bottom = false;
		if(this.files.length>0) 
		 	this.count.set('text',(this.image_index+1)+' of '+this.files.length);
		//var modal_h = this.modal.getSize().y;
		var bottom_h = this.bottom.getSize().y;
		//this.modal.retrieve('showBottom').start(modal_h,this.image.getSize().y+bottom_h+20);
		this.modal.setStyle('height',this.image.getSize().y+bottom_h+20);
	},

	showImage:function(image){
		if(this.closed)
			return; 		
		if(this.titles && this.titles[this.image_index])
			this.description.innerHTML=this.titles[this.image_index];
		if(this.files.length>0)
		 	this.count.set('text',(this.image_index+1)+' of '+this.files.length);
		var imageSize_width = image.getProperty('width').toInt();
		var imageSize_height = image.getProperty('height').toInt();
		var max=window.getSize().x-320;
		if (imageSize_width > max){
			imageSize_height*=max/imageSize_width;
			imageSize_width=max;
			image.setStyles({width:imageSize_width,height:imageSize_height});
		}
		max=window.getSize().y-60-this.bottom.getSize().y;
		if (imageSize_height > max){
			imageSize_width*=max/imageSize_height;
			imageSize_height=max;
			image.setStyles({width:imageSize_width,height:imageSize_height});
		}
		var target = {};
		if(imageSize_width != this.modal.getStyle('width'))
			target.width = imageSize_width+20;
		target.left = window.getScrollSize().x/2-((imageSize_width+(this.options.show_comments?340:0))/2)-10;
		target.height = imageSize_height + this.bottom.getSize().y + 20;
 		this.image.setStyles({'width':imageSize_width, 'height':imageSize_height});
		this.modal.removeClass('gallery_loading');
 		this.show_bottom=true;
		this.modal.morph(target);
	}
};
