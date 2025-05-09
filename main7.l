/* To recognize a valid arithmetic expression and display the identifiers and operators */

/* Definition Section */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    int ic = 0, oc = 0, flag = 0;
    int i[10];           // to store integers
    char o[10][2];       // to store operators as strings
%}

/* Rule Section */
%%
[0-9]+     {
                flag++;
                i[ic++] = atoi(yytext);  // convert string to int
           }

[+*/-]     {
                flag--;
                strcpy(o[oc++], yytext);  // store operator string
           }

[ \t\n]+   { /* ignore whitespace */ }

.          { /* ignore other characters or handle error */ }

%%

/* Main Section */
int main() {
    printf("Enter the Expression:\n");
    yylex();

    if (flag != 1) {
        printf("Not a valid Expression\n");
    } else {
        printf("Identifiers: ");
        for (int j = 0; j < ic; j++) {
            printf("%d ", i[j]);
        }

        printf("\nOperators: ");
        for (int j = 0; j < oc; j++) {
            printf("%s ", o[j]);
        }

        printf("\n");
    }

    return 0;
}

int yywrap() {
    return 1;
}