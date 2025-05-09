/*To implement a DFA that validates HTML tags*/

/*Definition Section*/
%{
#include<stdio.h>
#include<string.h>
int flag = 0;
char tag[7];
%}

/*Rule Section*/
%%
^<\/?([a-zA-Z][a-zA-Z0-9]*)\s*[^>]*>$ {flag = 1; strcpy(tag, yytext);}
[ /t/n |.] {flag = 0;}
%%

/*Main Section*/
int main(){
    printf("\nEnter the given Tag: ");
    yylex();
    if (flag == 0){
        printf("The given tag is invalid!!\n");
    }
    else{
        printf("The tag \"%s\" is valid.\n", tag);
    }
    return 0;
}

int yywrap(){
    return 1;
}