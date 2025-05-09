/* Lex Program to recognise and display keywords, numbers, and words in a given statement */

/*Definition Section*/

%{
    #include<stdio.h>
%}

/*Rule Section*/

%%
if |
else |
printf {printf("\n%s is a keyword", yytext);}
[0-9]+ {printf("\n%s is a number", yytext);}
[a-zA-Z0-9_]* {printf("\n%s is a word", yytext);}
. | \n {ECHO;}
%%

/*Main Section*/

int main (){
    printf("Enter the string: ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}