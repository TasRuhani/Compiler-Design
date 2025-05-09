/*Identify Capital words from the given Input String*/

/*Definition Section*/

%{
#include<stdio.h>
%}

/*Rule Section*/

%%
[A-Z]+ {printf("\n%s is in Upper Case", yytext);}
[a-z]+ {printf("\n%s is in Lower Case", yytext);}
[\t\n]+ {/*Ignore white spaces*/}
. {/*Ignore other characters*/}
%%

/*Main Section*/

int main () {
    printf("Enter the String: ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}