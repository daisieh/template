/*
---
description: TextboxList

authors:
  - Guillermo Rauch

requires:
  core/1.3: '*'

provides:
  - TextboxList
...
*/

var $chk = function(obj) {
    return !!(obj || obj === 0);
};

var TextboxList = new Class({

	Implements: [Options, Events],

	plugins: [],
	options: {
		/** events
		onFocus: function(){},
		onBlur: function(){},
		onBitFocus: function(){},
		onBitBlur: function(){},
		onBitAdd: function(){},
		onBitRemove: function(){},
		onBitBoxFocus: function(){},
		onBitBoxBlur: function(){},
		onBitBoxAdd: function(){},
		onBitBoxRemove: function(){},
		onBitEditableFocus: function(){},
		onBitEditableBlue: function(){},
		onBitEditableAdd: function(){},
		onBitEditableRemove: function(){},
		**/
		bitsOptions: {editable: {}, box: {}},
		check: function(s) {
			return s.clean().replace(/,/g, '') != '';
		},
		decode: function(o) {
			return o.split(',');
		},
		encode: function(o) {
				return o.map(function(v) {
				v = ($chk(v[0]) ? v[0] : v[1]);
				return $chk(v) ? v : null;
			}).clean().join(',');
		},
		endEditableBit: true,
		hideEditableBits: true,
		inBetweenEditableBits: true,
		keys: {previous: 'left', next: 'right'},
		max: null,
		plugins: {},
		prefix: 'textboxlist',
		startEditableBit: true,
		unique: false,
		uniqueInsensitive: true
	},

	add: function(plain, id, html, afterEl) {
		var box = this.create('box', [id, plain, html]);
		if (box) {
			if ( ! afterEl) {
				afterEl = this.list.getLast('.'+this.options.prefix+'-bit-box');
			}
			box.inject(afterEl || this.list, afterEl ? 'after' : 'top');
		}
		return this;
	},

	afterInit: function(){
		if (this.options.unique) {
			this.index = [];
		}
		if (this.options.endEditableBit) {
			this.create('editable', null, {tabIndex: this.original.tabIndex}).inject(this.list);
		}
		var update = this.update.bind(this);
		this.addEvent('bitAdd', update, true).addEvent('bitRemove', update, true);
		document.addEvents({
			click: function(e) {
				if ( ! this.focused) return;
				if (e.target.className.contains(this.options.prefix)){
					if (e.target == this.container) return;
					var parent = e.target.getParent('.'+this.options.prefix);
					if (parent == this.container) return;
				}
				this.blur();
			}.bind(this),
			keydown: function(ev) {
				if ( ! this.focused || ! this.current) return;
				var caret = this.current.is('editable') ? this.current.getCaret() : null;
				var value = this.current.getValue()[1];
				var special = ['shift', 'alt', 'meta', 'ctrl'].some(function(e) {
					return ev[e];
				});
				var custom = special || (this.current.is('editable') && this.current.isSelected());
				switch (ev.key) {
					case 'backspace':
						if (this.current.is('box')) {
							ev.stop();
							return this.current.remove();
						}
					case this.options.keys.previous:
						if (this.current.is('box') || ((caret == 0 || !value.length) && ! custom)) {
							ev.stop();
							this.focusRelative('previous');
						}
						break;
					case 'delete':
						if (this.current.is('box')) {
							ev.stop();
							return this.current.remove();
						}
					case this.options.keys.next:
						if (this.current.is('box') || (caret == value.length && ! custom)) {
							ev.stop();
							this.focusRelative('next');
						}
				}
			}.bind(this)
		});
		this.setValues(this.options.decode(this.original.get('value')));
	},

	blur: function() {
		if ( ! this.focused) return this;
		if (this.current) {
			this.current.blur();
		}
		this.focused = false;
		return this.fireEvent('blur');
	},

	create: function(klass, value, options) {
		if (klass == 'box') {
			if (( ! value[0] && ! value[1]) || ($chk(value[1]) && ! this.options.check(value[1]))) return false;
			if ($chk(this.options.max) && this.list.getChildren('.'+this.options.prefix+'-bit-box').length + 1 > this.options.max) return false;
			if (this.options.unique && this.index.contains(this.uniqueValue(value))) return false;
		}
		return new TextboxListBit[klass.capitalize()](value, this, Object.merge(this.options.bitsOptions[klass], options));
	},

	enablePlugin: function(name, options) {
		this.plugins[name] = new TextboxList[name.camelCase().capitalize()](this, options);
	},

	focusLast: function() {
		var lastElement = this.list.getLast();
		if (lastElement) {
			this.getBit(lastElement).focus();
		}
		return this;
	},

	focusRelative: function(dir, to) {
		var bit = this.getBit(document.id([to, this.current].pick())['get'+dir.capitalize()]());
		if (bit) {
			bit.focus();
		}
		return this;
	},

	getBit: function(obj) {
		return (typeOf(obj) == 'element') ? obj.retrieve('textboxlist:bit') : obj;
	},

	getValues: function() {
		return this.list.getChildren().map(function(el) {
			var bit = this.getBit(el);
			if (bit.is('editable')) return null;
			return bit.getValue();
		}, this).clean();
	},

	initialize: function(element, options) {
		this.setOptions(options);
		this.original = document.id(element).setStyle('display', 'none').set('autocomplete', 'off').addEvent('focus', this.focusLast.bind(this));
		this.container = new Element('div.'+this.options.prefix).inject(element, 'after');
		this.container.addEvent('click', function(e) {
			if ((e.target == this.list || e.target == this.container) && ( ! this.focused || document.id(this.current) != this.list.getLast())) {
				this.focusLast();
			}
		}.bind(this));
		this.list = new Element('ul.'+this.options.prefix+'-bits').inject(this.container);
		for (var name in this.options.plugins) {
			this.enablePlugin(name, this.options.plugins[name]);
		}
		['check', 'encode', 'decode'].each(function(i) {
			this.options[i] = this.options[i].bind(this);
		}, this);
		this.afterInit();
	},

	onAdd: function(bit) {
		if (this.options.unique && bit.is('box')) {
			this.index.push(this.uniqueValue(bit.value));
		}
		if (bit.is('box')) {
			var prior = this.getBit(document.id(bit).getPrevious());
			if ((prior && prior.is('box') && this.options.inBetweenEditableBits) || ( ! prior && this.options.startEditableBit)) {
				var b = this.create('editable').inject(prior || this.list, prior ? 'after' : 'top');
				if (this.options.hideEditableBits) {
					b.hide();
				}
			}
		}
	},

	onBlur: function(bit, all) {
		this.current = null;
		this.container.removeClass(this.options.prefix+'-focus');
		this.blurtimer = this.blur.delay(all ? 0 : 200, this);
	},

	onFocus: function(bit) {
		if (this.current) this.current.blur();
		clearTimeout(this.blurtimer);
		this.current = bit;
		this.container.addClass(this.options.prefix+'-focus');
		if ( ! this.focused){
			this.focused = true;
			this.fireEvent('focus', bit);
		}
	},

	onRemove: function(bit) {
		if ( ! this.focused) return;
		if (this.options.unique && bit.is('box')) {
			this.index.erase(this.uniqueValue(bit.value));
		}
		var prior = this.getBit(document.id(bit).getPrevious());
		if (prior && prior.is('editable')) {
			prior.remove();
		}
		this.focusRelative('next', bit);
	},

	setValues: function(values) {
		if ( ! values) return;
		values.each(function(value) {
			if (value) {
				this.add.apply(this, typeOf(value) == 'array' ? [value[1], value[0], value[2]] : [value]);
			}
		}, this);
	},

	uniqueValue: function(value) {
		return $chk(value[0]) ? value[0] : (this.options.uniqueInsensitive ? value[1].toLowerCase() : value[1]);
	},

	update: function(){
		this.original.set('value', this.options.encode(this.getValues()));
	}

});

var TextboxListBit = new Class({

	Implements: Options,

	blur: function() {
		if ( ! this.focused) return this;
		this.focused = false;
		this.textboxlist.onBlur(this);
		this.bit.removeClass(this.prefix+'-focus').removeClass(this.prefix+'-'+this.type+'-focus');
		return this.fireBitEvent('blur');
	},

	fireBitEvent: function(type) {
		type = type.capitalize();
		this.textboxlist.fireEvent('bit'+type, this).fireEvent('bit'+this.name+type, this);
		return this;
	},

	focus: function() {
		if (this.focused) return this;
		this.show();
		this.focused = true;
		this.textboxlist.onFocus(this);
		this.bit.addClass(this.prefix+'-focus').addClass(this.prefix+'-'+this.type+'-focus');
		return this.fireBitEvent('focus');
	},

	getValue: function() {
		return this.value;
	},

	hide: function() {
		this.bit.setStyle('display', 'none');
		return this;
	},

	initialize: function(value, textboxlist, options){
		this.name = this.type.capitalize();
		this.value = value;
		this.textboxlist = textboxlist;
		this.setOptions(options);
		this.prefix = this.textboxlist.options.prefix+'-bit';
		this.typeprefix = this.prefix+'-'+this.type;
		this.bit = new Element('li.'+this.prefix+'.'+this.typeprefix).store('textboxlist:bit', this);
		this.bit.addEvents({
			mouseenter: function() {
				this.bit.addClass(this.prefix+'-hover').addClass(this.typeprefix+'-hover');
			}.bind(this),
			mouseleave: function() {
				this.bit.removeClass(this.prefix+'-hover').removeClass(this.typeprefix+'-hover');
			}.bind(this)
		});
	},

	inject: function(element, where) {
		this.bit.inject(element, where);
		this.textboxlist.onAdd(this);
		return this.fireBitEvent('add');
	},

	is: function(type) {
		return this.type == type;
	},

	remove: function(event) {
		if(event)
			event.preventDefault();
		this.blur();		
		this.textboxlist.onRemove(this);
		this.bit.destroy();
		return this.fireBitEvent('remove');
	},

	setValue: function(value) {
		this.value = value;
		return this;
	},

	show: function() {
		this.bit.setStyle('display', 'block');
		return this;
	},

	toElement: function() {
		return this.bit;
	}

});

TextboxListBit.Editable = new Class({

	Extends: TextboxListBit,

	options: {
		tabIndex: null,
		growing: true,
		growingOptions: {},
		stopEnter: true,
		addOnBlur: false,
		addKeys: 'enter'
	},

	type: 'editable',

	blur: function(noReal) {
		this.parent();
		if ( ! noReal) {
			this.element.blur();
		}
		if (this.hidden && ! this.element.value.length) {
			this.hide();
		}
		return this;
	},

	initialize: function(value, textboxlist, options) {
		this.parent(value, textboxlist, options);
		var self = this;
		this.element = new Element('textarea.'+this.typeprefix+'-input[value="'+(this.value ? this.value[1] : '')+'"][type=text][autocomplete=off]').inject(this.bit);
		if ($chk(this.options.tabIndex)) {
			this.element.tabIndex = this.options.tabIndex;
		}
		if (this.options.growing) {
			new GrowingInput(this.element, this.options.growingOptions);
		}
		this.element.addEvents({
			focus: function() {
				self.focus(true);
			},
			blur: function() {
				self.blur(true);
				if (self.options.addOnBlur) {
					self.toBox();
				}
			}
		});
		if (this.options.addKeys || this.options.stopEnter) {
			var keys = Array.from(self.options.addKeys);
			this.element.addEvent('keydown', function(ev) {
				if (!self.focused) return;
				if (self.options.stopEnter && ev.key === 'enter') {
					ev.stop();
				}
				if (keys.contains(ev.key) || keys.contains(ev.code)){
					ev.stop();
					self.toBox();
				}
			});
		}
	},

	focus: function(noReal) {
		this.parent();
		if ( ! noReal) {
			this.element.focus();
		}
		return this;
	},

	getCaret: function() {
		if (this.element.createTextRange) {
			var range = document.selection.createRange().duplicate();
			range.moveEnd('character', this.element.value.length);
			if (range.text === '') return this.element.value.length;
			return this.element.value.lastIndexOf(range.text);
		}
		else {
			return this.element.selectionStart;
		}
	},

	getCaretEnd: function() {
		if (this.element.createTextRange) {
			var range = document.selection.createRange().duplicate();
			range.moveStart('character', -this.element.value.length);
			return range.text.length;
		} else return this.element.selectionEnd;
	},

	getValue: function() {
		return [null, this.element.value, null];
	},

	hide: function() {
		this.parent();
		this.hidden = true;
		return this;
	},

	isSelected: function() {
		return this.focused && (this.getCaret() !== this.getCaretEnd());
	},

	setValue: function(val) {
		this.element.value = $chk(val[0]) ? val[0] : val[1];
		if (this.options.growing) {
			this.element.retrieve('growing').resize();
		}
		return this;
	},

	toBox: function() {
		var value = this.getValue();
		var box = this.textboxlist.create('box', value);
		if (box) {
			box.inject(this.bit, 'before');
			this.setValue([null, '', null]);
			return box;
		}
		return null;
	}

});

TextboxListBit.Box = new Class({

	Extends: TextboxListBit,

	options: {
		deleteButton: true
	},

	type: 'box',

	initialize: function(value, textboxlist, options) {
		this.parent(value, textboxlist, options);
		this.bit.set('html', $chk(this.value[2]) ? this.value[2] : this.value[1]);
		this.bit.addEvent('click', this.focus.bind(this));
		if (this.options.deleteButton) {
			this.bit.addClass(this.typeprefix+'-deletable');
			this.close = new Element('a.'+this.typeprefix+'-deletebutton[href=#]', {events: {click: this.remove.bind(this)}}).inject(this.bit);
		}
		this.bit.getChildren().addEvent('click', function(e) {
			e.stop();
		});
	}

});

if (window.GrowingInput == null) { (function() {

GrowingInput = new Class({

	Implements: [Options, Events],

	options: {
		min: 0,
		max: null,
		startWidth: 2,
		correction: 15
	},

	calculate: function(chars) {
		this.calc.set('html', chars);
		var width = this.calc.getStyle('width').toInt();
		return (width ? width : this.options.startWidth) + this.options.correction;
	},

	initialize: function(element, options) {
		this.setOptions(options);
		this.element = $(element).store('growing', this).set('autocomplete', 'off');
		this.calc = new Element('span', {
			'styles': {
				'float': 'left',
				'display': 'inline-block',
				'position': 'absolute',
				'left': -1000
			}
		}).inject(this.element, 'after');
		['font-size', 'font-family', 'padding-left', 'padding-top', 'padding-bottom',
		 'padding-right', 'border-left', 'border-right', 'border-top', 'border-bottom',
		 'word-spacing', 'letter-spacing', 'text-indent', 'text-transform'].each(function(property) {
			this.calc.setStyle(property, this.element.getStyle(property));
		}, this);
		this.resize();
		var resize = this.resize.bind(this);
		this.element.addEvents({blur: resize, keyup: resize, keydown: resize, keypress: resize});
	},

	resize: function() {
		this.lastvalue = this.value;
		this.value = this.element.value;
		var value = this.value;
		if ($chk(this.options.min) && this.value.length < this.options.min) {
			if ($chk(this.lastvalue) && (this.lastvalue.length <= this.options.min)) return this;
			value = str_pad(this.value, this.options.min, '-');
		}
		else if ($chk(this.options.max) && this.value.length > this.options.max) {
			if ($chk(this.lastvalue) && (this.lastvalue.length >= this.options.max)) return this;
			value = this.value.substr(0, this.options.max);
		}
		this.element.setStyle('width', this.calculate(value));
		return this;
	}

});

var str_pad = function(self, length, str, dir) {
	if (self.length >= length) return this;
	str = str || ' ';
	var pad = str_repeat(str, length - self.length).substr(0, length - self.length);
	if (!dir || dir == 'right') return self + pad;
	if (dir == 'left') return pad + self;
	return pad.substr(0, (pad.length / 2).floor()) + self + pad.substr(0, (pad.length / 2).ceil());
};

var str_repeat = function(str, times) {
	return new Array(times + 1).join(str);
};

})(); }


/*
---
description: TextboxList

authors:
  - Guillermo Rauch

requires:
  core/1.3: '*'

provides:
  - textboxlist.autocomplete
...
*/

(function(){

TextboxList.Autocomplete = new Class({

	Implements: Options,

	options: {
		highlight: true,
		highlightSelector: null,
		insensitive: true,
		maxResults: 10,
		minLength: 1,
		method: 'standard',
		mouseInteraction: true,
		onlyFromValues: false,
		placeholder: 'Type to receive suggestions',
		queryRemote: false,
		remote: {
			emptyResultPlaceholder: 'No matches found',
			extraParams: {},
			loadPlaceholder: 'Please wait...',
			method: 'post',
			param: 'search',
			url: ''
		},
		resultsFilter: null
	},

	addCurrent: function() {
		var value = this.current.retrieve('textboxlist:auto:value');
		var box = this.textboxlist.create('box', value.slice(0, 3));
		if (box) {
			box.autoValue = value;
			if (this.index != null) {
				this.index.push(value);
			}
			this.currentInput.setValue([null, '', null]);
			box.inject(document.id(this.currentInput), 'before');
		}
		this.blur();
		return this;
	},

	addResult: function(result, search) {
		var element = new Element('li.'+this.prefix+'-result[html="'+[result[3], result[1]].pick()+'"]').store('textboxlist:auto:value', result);
		this.list.adopt(element);
		if (this.options.highlight) {
			$$(this.options.highlightSelector ? element.getElements(this.options.highlightSelector) : element).each(function(el) {
				if (el.get('html')) {
					this.method.highlight(el, search, this.options.insensitive, this.prefix+'-highlight');
				}
			}, this);
		}
		if (this.options.mouseInteraction) {
			element.setStyle('cursor', 'pointer').addEvents({
				mouseenter: function() {
					this.focus(element);
				}.bind(this),
				mousedown: function(ev) {
					ev.stop();
					clearTimeout(this.hidetimer);
					this.doAdd = true;
				}.bind(this),
				mouseup: function() {
					if (this.doAdd) {
						this.addCurrent();
						this.currentInput.focus();
						this.search();
						this.doAdd = false;
					}
				}.bind(this)
			});
			if ( ! this.options.onlyFromValues) {
				element.addEvent('mouseleave', function() {
					if (this.current == element) {
						this.blur();
					}
				}.bind(this));
			}
		}
	},

	blur: function() {
		if (this.current) {
			this.current.removeClass(this.prefix+'-result-focus');
			this.current = null;
		}
	},

	focus: function(element) {
		if (element) {
			this.blur();
			this.current = element.addClass(this.prefix+'-result-focus');
		}
		return this;
	},

	focusFirst: function() {
		return this.focus(this.list.getFirst());
	},

	focusRelative: function(dir) {
		if ( ! this.current) return this;
		return this.focus(this.current['get'+dir.capitalize()]());
	},

	hide: function(ev) {
		this.hidetimer = (function() {
			this.hidePlaceholder();
			this.list.setStyle('display', 'none');
			this.currentSearch = null;
		}).delay(Browser.ie ? 150 : 0, this);
	},

	hidePlaceholder: function() {
		if (this.placeholder) {
			this.placeholder.setStyle('display', 'none');
		}
	},

	initialize: function(textboxlist, options) {
		this.setOptions(options);
		this.textboxlist = textboxlist;
		this.textboxlist.addEvent('bitEditableAdd', this.setupBit.bind(this), true)
			.addEvent('bitEditableFocus', this.search.bind(this), true)
			.addEvent('bitEditableBlur', this.hide.bind(this), true);
		if (Browser.ie) {
			this.textboxlist.setOptions({bitsOptions: {editable: {addOnBlur: false}}});
		}
		if (this.textboxlist.options.unique) {
			this.index = [];
			this.textboxlist.addEvent('bitBoxRemove', function(bit) {
				if (bit.autoValue) {
					this.index.erase(bit.autoValue);
				}
			}.bind(this), true);
		}
		this.prefix = this.textboxlist.options.prefix+'-autocomplete';
		this.method = TextboxList.Autocomplete.Methods[this.options.method];
		this.container = new Element('div.'+this.prefix).inject(this.textboxlist.container);
		if ((width = this.textboxlist.container.getStyle('width').toInt()) > 0) {
			this.container.setStyle('width', width);
		}
		if ($chk(this.options.placeholder) || this.options.queryServer) {
			this.placeholder = new Element('div.'+this.prefix+'-placeholder').inject(this.container);
		}
		this.list = new Element('ul.'+this.prefix+'-results').inject(this.container);
		this.list.addEvent('click', function(ev) {
			ev.stop();
		});
		this.values = this.results = this.searchValues = [];
		this.navigate = this.navigate.bind(this);
	},

	navigate: function(ev) {
		switch (ev.key) {
			case 'up':
				ev.stop();
				if ( ! this.options.onlyFromValues && this.current && this.current == this.list.getFirst()) {
					this.blur();
				}
				else {
					this.focusRelative('previous');
				}
				break;
			case 'down':
				ev.stop();
				if (this.current) {
					this.focusRelative('next');
				}
				else {
					this.focusFirst()
				}
				break;
			case 'enter':
				ev.stop();
				if (this.current) {
					this.addCurrent();
				}
				else if ( ! this.options.onlyFromValues) {
					var value = this.currentInput.getValue();
					var box = this.textboxlist.create('box', value);
					if (box){
						box.inject(document.id(this.currentInput), 'before');
						this.currentInput.setValue([null, '', null]);
					}
				}
		}
	},

	search: function(bit) {
		if (bit) {
			this.currentInput = bit;
		}
		if ( ! this.options.queryRemote && ! this.values.length) return;
		var search = this.currentInput.getValue()[1];
		if (search.length < this.options.minLength) {
			this.showPlaceholder(this.options.placeholder);
		}
		if (search == this.currentSearch) return;
		this.currentSearch = search;
		this.list.setStyle('display', 'none');
		if (search.length < this.options.minLength) return;
		if (this.options.queryRemote) {
			if (this.searchValues[search]) {
				this.values = this.searchValues[search];
			}
			else {
				var data = this.options.remote.extraParams, that = this;
				if (typeOf(data) == 'function') {
					data = data.run([], this);
				}
				data[this.options.remote.param] = search;
				if (this.currentRequest) {
					this.currentRequest.cancel();
				}
				this.currentRequest = new Request.JSON({
					data: data,
					method: that.options.remote.method,
					onRequest: function() {
						that.showPlaceholder(that.options.remote.loadPlaceholder);
						that.textboxlist.fireEvent('request');
					},
					onSuccess: function(data){
						that.searchValues[search] = data;
						that.values = data;
						that.textboxlist.fireEvent('response');
						that.showResults(search);
					},
					url: this.options.remote.url
				}).send();
			}
		}
		if (this.values.length) {
			this.showResults(search);
		}
	},

	setupBit: function(bit) {
		bit.element.addEvent('keydown', this.navigate, true).addEvent('keyup', function() {
			this.search();
		}.bind(this), true);
	},

	setValues: function(values) {
		this.values = values;
	},

	showPlaceholder: function(customHTML) {
		if (this.placeholder) {
			this.placeholder.setStyle('display', 'block');
			if (customHTML) {
				this.placeholder.set('html', customHTML);
			}
		}
	},

	showResults: function(search) {
		var results = this.method.filter(this.values, search, this.options.insensitive, this.options.maxResults);
		if (this.index) {
			var ids = this.index.map(function(value) {
				return value[0];
			});
			results = results.filter(function(value) {
				return ! ids.contains(value[0]);
			}, this);
		}
		if (typeOf(this.options.resultsFilter) == 'function') {
			results = this.options.resultsFilter(results);
		}
		this.hidePlaceholder();
		if ( ! results.length) {
			this.showPlaceholder(this.options.remote.emptyResultPlaceholder);
		}
		if ( ! results.length) return;
		this.blur();
		this.list.empty().setStyle('display', 'block');
		results.each(function(result) {
			this.addResult(result, search);
		}, this);
		if (this.options.onlyFromValues) {
			this.focusFirst();
		}
		this.results = results;
	}

});

TextboxList.Autocomplete.Methods = {

	standard: {
		filter: function(values, search, insensitive, max) {
			var newvals = [], regexp = new RegExp('\\b'+search.escapeRegExp(), insensitive ? 'i' : '');
			for (var i = 0; i < values.length; i++) {
				if (newvals.length === max) break;
				if (values[i][1].test(regexp)) {
					newvals.push(values[i]);
				}
			}
			return newvals;
		},

		highlight: function(element, search, insensitive, klass) {
			var regex = new RegExp('(<[^>]*>)|(\\b'+search.escapeRegExp()+')', insensitive ? 'ig' : 'g');
			return element.set('html', element.get('html').replace(regex, function(a, b, c) {
				return (a.charAt(0) == '<') ? a : '<strong class="'+klass+'">'+c+'</strong>'; 
			}));
		}
	}

};

})();
