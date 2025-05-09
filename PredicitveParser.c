#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

char *input;
int pos = 0;

// Imagine these are the LEGO instructions for building our expression
void E();        // E → T E'
void Eprime();   // E' → + T E' | ε
void T();        // T → F T'
void Tprime();   // T' → * F T' | ε
void F();        // F → (E) | id

// When something doesn't go right, we cry and quit
void error() {
    printf("Error at position %d\n", pos);
    exit(1);
}

// Match a letter from input only if it's what we expect
void match(char expected) {
    if (input[pos] == expected) {
        pos++;  // Yay! Got what we wanted, move ahead
    } else {
        error();  // Oops! Something's wrong
    }
}

void E() {
    T();        // Build a T LEGO piece
    Eprime();   // Then build the E' part if needed
}

void Eprime() {
    if (input[pos] == '+') {
        match('+');   // Found a '+'? Match it
        T();          // Build another T
        Eprime();     // Try more '+' if they exist
    }
    // else: it's ε (do nothing)
}

void T() {
    F();        // Build F piece
    Tprime();   // Then try * part
}

void Tprime() {
    if (input[pos] == '*') {
        match('*');   // Found '*'? Match it
        F();          // Build another F
        Tprime();     // Try more '*' if they exist
    }
    // else: it's ε (do nothing)
}

void F() {
    if (input[pos] == '(') {
        match('(');   // Found '(', now go deep
        E();          // Do full E inside brackets
        match(')');   // Must end with ')'
    } else if (isalpha(input[pos])) {
        match(input[pos]);  // Found id (like x, y, z...)
    } else {
        error();  // Not valid!
    }
}

int main() {
    char str[100];
    printf("Enter the Expression: ");
    scanf("%s", str);   // Read input like "a+b*c"
    input = str;

    E();  // Start parsing!

    if (input[pos] == '\0') {
        printf("Accepted...!!!\n");
    } else {
        printf("Rejected...!!!\n");
    }

    return 0;
}
