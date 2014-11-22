package IC.Parser;

%%

%class Lexer
%public
%function next_token
%type Token
%line
%scanerror LexicalError

%eofval{
  	return new Symbol(sym.EOF);  	
%eofval}


%%

"(" { return new Token(sym.LP,yyline); }
")" { return new Token(sym.RP,yyline); }



