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
    printf("Enter the String: ");
    yylex();
    if (flag == 1){
        printf("Accepted.");
    } else {
        printf("Rejected.");
    }
    return 0;
}

int yywrap(){
    return 0;
}