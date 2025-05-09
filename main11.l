/* DFA that detects if a word is repeated just after the word is just typed */

/* Definition Section */
%{
#include <stdio.h>
#include <string.h>

int flag = 0, count = 0;           // Flag to detect repetition
char last_word[100] = ""; // Stores the last word
char word[3][100]; // Stores the last word
%}

/* Rule Section */
%%
[^ \n\t]+ {
    if (strcmp(yytext, last_word) == 0) {
        flag = 1;
        strcpy(word[count++], yytext);
    }
    strcpy(last_word, yytext);
}

[ \n\t]+
%%

/* Main Section */
int main() {
    printf("Enter the sentence:\n");
    yylex();

    if (flag == 1) {
        for(int i = 0; i < count; i++){
        printf("Repeated word detected: %s\n", word[i]);
        }
    } else {
        printf("No repeated words found.\n");
    }

    return 0;
}

int yywrap() {
    return 1;
}
