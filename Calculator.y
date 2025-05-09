%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

int yylex();  // Declare yylex function
void yyerror(const char *s);  // Declare yyerror function
%}

%token NUMBER
%token PLUS MINUS DIV MUL LPAREN RPAREN

%left PLUS MINUS
%left DIV MUL

%%
input:
      | input expr '\n' { printf("Result: %d\n", $2); }
      ;

expr:
      expr PLUS expr  { $$ = $1 + $3; }
    | expr MINUS expr { $$ = $1 - $3; }
    | expr MUL expr   { $$ = $1 * $3; }
    | expr DIV expr   {
        if($3 == 0){
            yyerror("Can't Divide By Zero!!");
            exit(1);
        }
        $$ = $1 / $3;
    }
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER { $$ = $1; }
    ;

%%

int main() {
    printf("Enter expression: ");
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
