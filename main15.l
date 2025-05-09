/* An NFA that accepts strings containing either 110 or 101 as a sub-string */

/* Definition Section */
%{
#include <stdio.h>
int accept = 0;
%}

/* Rule Section */
%%
101|110 { accept++; }
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