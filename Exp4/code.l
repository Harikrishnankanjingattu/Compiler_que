%{
#include <stdio.h>
%}

%%
\n 	;
[ \t]	;
.	{printf("%s",yytext);} 
%%
int yywrap()
{
return 1;
}
int main()
{
yyin=fopen("in.txt","r");
yylex();
}
