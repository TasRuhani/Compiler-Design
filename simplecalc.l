/* Simple Calculator */

/* Definition Section */
%{
    #include<stdio.h>
    #include<stdlib.h>    // For atoi or atof etc
    float num1, num2;
    int num_flag = 0;
    char op;
%}

/* Rule Section */
%%
[0-9]+ {
    if(num_flag == 0){
        num1 = atof(yytext);
        num_flag = 1;
    } else {
        num2 = atof(yytext);
    }
}

[+\-*/] { op = yytext[0]; }    // get char, not string pointer

[ \t\n] {}    // Ignore whitespace
%%

/* Main Section */
int main(){
    printf("Enter the Expression:\n");   
    yylex();                             

    float result;
    switch(op){
        case '+': result = num1 + num2; break;
        case '-': result = num1 - num2; break;
        case '*': result = num1 * num2; break;
        case '/':
            if(num2 != 0){
                result = num1 / num2;
            } else {
                printf("Division by zero error\n");
                return 1;
            }
            break;
        default:
            printf("Invalid operator\n");
            return 1;
    }

    printf("Result: %.2f\n", result);
    return 0;
}

int yywrap() {
    return 1;
}
