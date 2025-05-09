/*Count Number of Vowels and Consonants in a given String*/

/*Definition Section*/
%{
#include <stdio.h>
int v = 0, c = 0;
%}

/*Rule Section*/
%%
[aieouAEIOU] { v++; }
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]  { c++; }
[\t\n ]+ {/*Ignore the white spaces*/}
. | \n | \t {ECHO}
%%

/*Main Section*/

int main(){
    printf("Enter the String: ");
    yylex();
    printf("The Number of Vowels are %d \n", v);
    printf("The Number of Consonants are %d \n", c);
    return 0;
}
int yywrap(){
    return 1;
}
