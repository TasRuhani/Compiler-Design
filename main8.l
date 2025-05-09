/*To implement a DFA that recognises valid email addresses*/

/*Definition Section*/
%{
#include<stdio.h>
#include<string.h>
int flag = 0;
char email[20];
%}

/*Rule Section*/
%%
^(?!.*\.\.)[a-zA-Z](\.?[a-zA-Z0-9._%+-])*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ {flag = 1; strcpy(email, yytext);}
%%

/*Main Section*/
int main(){
    printf("\nEnter the Email Address: ");
    yylex();
    if (flag == 0){
        printf("The given email is invalid Dumb Nigga!!\n");
    }
    else{
        printf("The email \"%s\" is valid.\n", email);
    }
    return 0;
}

int yywrap(){
    return 1;
}