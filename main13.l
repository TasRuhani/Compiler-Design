/* DFA to accept valid Python Variables Name */

/* Definition Section */
%{
#include <stdio.h>
int flag = 0;
%}

/* Rule Section */
%%
[^a-zA-Z] { flag++; }
%%

/* Main Section */
int main() {
    printf("Enter the Varaible Name: ");
    yylex();
    if (flag == 1){
        printf("This is not a Python accepted Variable.");
    } else {
        printf("This is a Python accepted Variable.");
    }
    return 0;
}

int yywrap(){
    return 0;
}