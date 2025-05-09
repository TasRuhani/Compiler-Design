%{
#include "y.tab.h"  // Include the Yacc-generated header
%}

%%

[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[ \t\n]         {  };
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MUL; }
"/"             { return DIV; }
"("             { return LPAREN; }
")"             { return RPAREN; }
.               { printf("Invalid Character: %s\n", yytext); }

%%
