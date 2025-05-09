/* To accpet Binary Numbers that are divisible by 3 */

/* Definition Section */
%{
#include<stdio.h>
#include<math.h>
int decimal;
int bin_to_dec(const char *binary){
    int decimal = 0;
    int len = strlen(binary);

    for (int i = 0; i < len; i++){
        if (binary[i] == '1'){
            decimal += pow(2, len - i - 1);
        }
    }
    return decimal;
}
%}

/* Rule Section */
%%
[01]+       { decimal = bin_to_dec(yytext); }
.           { printf("Enter a Valid Binary number!!!\n"); exit(1); }
%%

/* Main Section */
int main () {
    printf("Enter the Binary Number: ");
    yylex();
    if (decimal % 3 != 0){
        printf("The Binary Number is NOT divisible by 3\n");
    } else {
        printf("The Binary Number is divisible by 3\n");
    }
    return 0;
}

int yywrap(){
    return 1;
}