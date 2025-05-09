/* To Determine if an sentence is Question(ending in ?) or Statement(ending in .) */

/* Definition Section */
%{
#include<stdio.h>
#include<string.h>
int flag = 0;
char sentence[50];
%}

/* Rule Section */
%%
.*\?$    { flag = 1; strcpy(sentence, yytext); }
.*\.$    { flag = 2; strcpy(sentence, yytext); }
. |\n    { }
%%

/* Main Section */
int main() {
    printf("\nEnter the sentence:\n");
    yylex();
    if (flag == 0){
        printf("Invalid sentence..!\n");
    }
    else if(flag == 1){
        printf("%s is a Question..!", sentence);
    }
    else{
        printf("%s is a Statement..!", sentence);
    }

    return 0;
}

int yywrap(){
    return 1;
}