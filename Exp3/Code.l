%{
#include <stdio.h>
int total=0;
int credit=0;
int debit=0;
%}

%%
[0-9]* 		{credit++;}
-[0-9]*		{debit++;}
\n		;
.		;
%%
int yywrap()
{
return 1;
}
int main()
{
printf("Enter the Credit and Debit count\n");
yylex();
total=credit + debit;
printf("Credit count %d\n",credit);
printf("Debit count %d\n",debit);
printf("Total Transaction %d\n",total);
}
