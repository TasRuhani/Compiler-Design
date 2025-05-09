/*To recognise whether a given sentence is simple or compound*/

/*Definitaion Section*/
%{
#include<stdio.h>
int flag = 0;
%}

/*Rule Section*/
%%
[a-zA-Z0-9]+[[:space:]]+(and|but|or|because|if|then|nevertheless)[[:space:]]+[a-zA-Z0-9]+    { flag = 1; }
.|\n    ; // ignore all other input
%%

/*Main Section*/
int main(){
    printf("Enter the String: ");
    yylex();
    if(flag == 0){
        printf("The sentence is a simple sentence.\n");
    }
    else {
        printf("The sentence is a compound sentence.\n");
    }
    return 0;
}

int yywrap(){
    return 1;
}