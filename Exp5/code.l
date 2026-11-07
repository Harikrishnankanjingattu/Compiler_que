%{
#include <stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9]* 	{printf("%d",yyleng);}
%%
int yywrap() 
{
return 1;
}
int main()
{
printf("Enter \n");
yylex();
}
