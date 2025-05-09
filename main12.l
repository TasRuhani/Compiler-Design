%{
#include<stdio.h>
#include<string.h>

int pflag = 0, exflag = 0, error = 0;
%}

%%

"("         { pflag++; }
")"         {
                pflag--;
                if (pflag < 0) {
                    error = 1;  // closing before opening
                }
            }

[a-zA-Z]+   { exflag++; }
[-+*/]+     { exflag--; }

[ \t\n]+    { /* skip whitespace */ }

.           { /* ignore other characters */ }

%%

int main() {
    printf("Enter the Expression:\n");
    yylex();

    if (pflag != 0 || error == 1) {
        printf("Invalid Parenthesis...!!!\n");
    }
    else if (exflag != 1) {
        printf("Invalid Expression...!!!\n");
    }
    else {
        printf("All Good...!!!\n");
    }

    return 0;
}

int yywrap(){
    return 1;
}