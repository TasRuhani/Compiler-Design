/* To see if a word is a palindrome or not */

/* Definition Section */
%{
#include<stdio.h>
#include<string.h>
int pal = 0;
int isPalindrome (char *word){
    int left = 0;
    int right = strlen(word) - 1;
    while (left < right){
        if (word[left] == word[right]){
            left++;
            right--;
        }
        else {
            return 1;
        }
    } 
    return 0;
}
%}

/* Rule Section */
%%
[a-zA-Z]+       { if(!isPalindrome(yytext)){ pal++; } }
[0-9]+          { printf("This is a Number"); }
[0-9]*\.[0-9]+  { printf("This is a Floating Digit"); }
.               {  }
%%

/* Main Section */
int main () {
    printf("Enter the Word to be Checked: ");
    yylex();
    if (pal != 0){
        printf("The word is a Palindrome!\n");
    } else {
        printf("The word is NOT a Palindrome!\n");
    }
    return 0;
}
int yywrap(){
    return 1;
}