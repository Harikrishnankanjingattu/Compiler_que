LEX CODE 
%{
#include "y.tab.h"
%}
%%
[0-9]		return digit;
[a-zA-Z]	return letter;
.		return yytext[0];
\n		return 0;
%%
int yywrap()
{
return 0;
}


YACC CODE
%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(const char *s);
int valid=1; 
%}
%token digit letter
%%
start : letter s
s     : letter s | digit s |;
%%
int yyerror(const char *s)
{
printf("Invalid\n");
valid=0;
return 0;
}
int main()
{
printf("Enter the Identifier \n");
yyparse();
if(valid)
{
printf("Valid\n");
}}
