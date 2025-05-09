/* To count the number of comment lines in a C program */

/* Definition Section */
%{
#include <stdio.h>
int nc = 0;               // To count number of comment lines
FILE *yyin;               // This must be named 'yyin' for Flex to use it as input
%}

/* Rule Section */
%%
"//"[^\n]*                { nc++; }  // Single-line comment
"/*".*[\n]*.*"*/"         { nc++; }  // Multi Line
.|\n                      { /* Ignore all other characters */ }
%%

/* Main Section */
int main(int argc, char *argv[]) {
    // argc is the number of command-line arguments
    // argv is an array of strings (arguments)

    if (argc == 2) {
        yyin = fopen(argv[1], "r");  // Open the file provided as argument
        if (!yyin) {
            perror("File open failed");
            return 1;
        }
    } else {
        printf("Enter the program itself as input:\n");
        yyin = stdin;
    }

    yylex();  // Start scanning
    printf("Total number of comment lines: %d\n", nc);
    return 0;
}

int yywrap() {
    return 1;  // Tell Flex input is done
}