/* NFA that accepts strings with the 3rd last symbol is a over {a,b} */

/* Definition Section */
%{
#include <stdio.h>
int flag = 0;
%}

/* Rule Section */
%%
^[ab]*a[ab][ab]$  { flag++; }
%%

/* Main Section */
int main() {
    printf("Enter the String: ");
    yylex();
    if (flag == 1){
        printf("Accepted\n");
    } else {
        printf("Rejected\n.");
    }
    return 0;
}

int yywrap(){
    return 1;
}