/* DFA that ends with 00 over {0,1} */

/* Definition Section */
%{
#include <stdio.h>
int accept = 0;
%}

/* Rule Section */
%%
^[01]*00$ { accept++; }
.|\n    {  }
%%

/* Main Section */
int main () {
    printf("Enter the String: ");
    yylex();
    if (accept != 0){
        printf("ACCEPTED POOKIE!!\n");
    }
    else {
        printf("REJECTED NINCOMPOOP!!\n");
    }
    return 0;
}
int yywrap(){
    return 1;
}