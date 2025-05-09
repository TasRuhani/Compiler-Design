/* To count the number of lines, words, characters, and spaces */

/* Definition Section */
%{
    #include<stdio.h>
    int lines = 0, words = 0, chars = 0, spaces = 0;
%}

/* Rule Section */
%%
[^ \t\n]+       { words++; chars += yyleng; }
[ \t]           { spaces++; } 
\n              { lines++; }
%%

/* Main Section */
int main() {
    printf("Enter the String:\n");
    yylex();
    printf("\nThe number of lines: %d\n", lines);
    printf("The number of words: %d\n", words);
    printf("The number of characters: %d\n", chars);
    printf("The number of spaces: %d\n", spaces);
    return 0;
}

int yywrap() {
    return 1;
}
