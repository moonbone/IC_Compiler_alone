package IC.Parser;


%%

%class Lexer
%public
%function next_token
%type Token
%line
%column
%scanerror LexicalError
%eofval{
  	return new Token(sym.EOF,yyline,yycolumn,yytext());
%eofval}



CAPITAL=[A-Z]
ALPHA=[A-Za-z] 
DIGIT=[0-9]
NONZERO=[1-9]
ALPHA_NUMERIC={ALPHA}|{DIGIT}
IDENT={ALPHA}(_|{ALPHA_NUMERIC})*
CIDENT={CAPITAL}(_|{ALPHA_NUMERIC})*
NUMBER=({DIGIT})+
NUMBER=[0-9]+
WHITESPACE=[\n\r\t ]
INTEGER=0|{NONZERO}{DIGIT}*

%{
 StringBuffer string = new StringBuffer();

%}

%state STRING
%state COMMENT


%%

<YYINITIAL>{
"class" { return new Token (sym.CLASS,yyline,yycolumn,yytext());}
"extends" { return new Token (sym.EXTENDS,yyline,yycolumn,yytext());}
"static" { return new Token (sym.STATIC,yyline,yycolumn,yytext());}
"void" { return new Token (sym.VOID,yyline,yycolumn,yytext());}
"int" { return new Token (sym.INT,yyline,yycolumn,yytext());}
"boolean" { return new Token (sym.BOOLEAN,yyline,yycolumn,yytext());}
"string" { return new Token (sym.STRING,yyline,yycolumn,yytext());}
"return" { return new Token (sym.RETURN,yyline,yycolumn,yytext());}
"if" { return new Token (sym.IF,yyline,yycolumn,yytext());}
"else" { return new Token (sym.ELSE,yyline,yycolumn,yytext());}
"while" { return new Token (sym.WHILE,yyline,yycolumn,yytext());}
"break" { return new Token (sym.BREAK,yyline,yycolumn,yytext());}
"continue" { return new Token (sym.CONTINUE,yyline,yycolumn,yytext());}
"this" { return new Token (sym.THIS,yyline,yycolumn,yytext());}
"new" { return new Token (sym.NEW,yyline,yycolumn,yytext());}
"length" { return new Token (sym.LENGTH,yyline,yycolumn,yytext());}
"true" { return new Token (sym.TRUE,yyline,yycolumn,yytext());}
"false" { return new Token (sym.FALSE,yyline,yycolumn,yytext());}
"null" { return new Token (sym.NULL,yyline,yycolumn,yytext());}

{CIDENT} { return new Token (sym.CIDENTIFIER,yyline,yycolumn,yytext());}
{IDENT} { return new Token (sym.IDENTIFIER,yyline,yycolumn,yytext());}
{INTEGER} { return new Token (sym.INTEGER,yyline,yycolumn,yytext());}

\" { string.setLength(0); string.append('"'); yybegin(STRING); }
"//".* {}
"/*"   {yybegin(COMMENT); }

"(" { return new Token (sym.LB,yyline,yycolumn,yytext());}
")" { return new Token (sym.RB,yyline,yycolumn,yytext());}
"[" { return new Token (sym.LSB,yyline,yycolumn,yytext());}
"]" { return new Token (sym.RSB,yyline,yycolumn,yytext());}
"{" { return new Token (sym.LCB,yyline,yycolumn,yytext());}
"}" { return new Token (sym.RCB,yyline,yycolumn,yytext());}
"." { return new Token (sym.PERIOD,yyline,yycolumn,yytext());}
";" { return new Token (sym.SEMI,yyline,yycolumn,yytext());}


"+" { return new Token (sym.PLUS,yyline,yycolumn,yytext());}
"-" { return new Token (sym.MINUS,yyline,yycolumn,yytext());}
"*" { return new Token (sym.MULT,yyline,yycolumn,yytext());}
"/" { return new Token (sym.DEV,yyline,yycolumn,yytext());}
"!" { return new Token (sym.NOT,yyline,yycolumn,yytext());}
"%" { return new Token (sym.REMAIN,yyline,yycolumn,yytext());}
"=" { return new Token (sym.ASSIGN,yyline,yycolumn,yytext());}
"==" { return new Token (sym.EQUAL,yyline,yycolumn,yytext());}
"||" { return new Token (sym.OR,yyline,yycolumn,yytext());}
"&&" { return new Token (sym.AND,yyline,yycolumn,yytext());}
"!=" { return new Token (sym.NEQUAL,yyline,yycolumn,yytext());}
"<" { return new Token (sym.LT,yyline,yycolumn,yytext());}
"<=" { return new Token (sym.LE,yyline,yycolumn,yytext());}
">" { return new Token (sym.GT,yyline,yycolumn,yytext());}
">=" { return new Token (sym.GE,yyline,yycolumn,yytext());}


"," { return new Token (sym.COMMA,yyline,yycolumn,yytext());}





{WHITESPACE} {}
}

<STRING>{
\"                             { yybegin(YYINITIAL); 
                                   return new Token (sym.STRING_CONTENT, yyline,yycolumn,string.toString()+'"');}
[^\\\"]+                   { string.append( yytext() ); }
\\\"					{ string.append( yytext() ); }
\\n					{ string.append( yytext() ); }
\\t					{ string.append( yytext() ); }
\\\\					{ string.append( yytext() ); }
}


<COMMENT>{
"*/" {yybegin(YYINITIAL);}
. {}
}
	