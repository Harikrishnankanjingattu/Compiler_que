%{
#include <stdio.h>
#include <stdlib.h>
int yyerror(const char *s);
int yylex();
%} 
%token NUMBER ID
%left '+''-'
%left '*''/''='
%%
exp : exp'+'exp
    | exp'-'exp
    | exp'*'exp
    | exp'/'exp
    | exp'='exp
    | NUMBER
    | ID;
%%
int yyerror(const char *s)
{
printf("error\n");
exit(0);
}
int main()
{
printf("Enter \n");
yyparse();
printf("Valid\n");
}
