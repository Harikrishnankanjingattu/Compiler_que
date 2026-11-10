%{
#include <stdio.h>
%}

%s A B C

%%
<INITIAL>0	{ BEGIN A; }
<INITIAL>1	{ BEGIN B; }
<INITIAL>[^01\n]	{ BEGIN C ;} 
<INITIAL>\n	{BEGIN INITIAL; printf("Not  Accepted \n");} 

<A>0		{ BEGIN INITIAL ; }
<A>1		{ BEGIN C ; } 
<A>[^01\n]	{ BEGIN C ; } 
<A>\n		{ BEGIN INITIAL; printf("Not Accepted \n");}

<B>0		{ BEGIN C ; } 
<B>1		{ BEGIN INITIAL ; }
<B>[^01\n]	{ BEGIN C ; } 
<B>\n		{BEGIN INITIAL; printf("Not Accepted \n");}

<C>0 		{ BEGIN B; }
<C>1		{ BEGIN A; }
<C>[^01\n]	{ BEGIN C; }
<C>\n		{BEGIN INITIAL; printf("Accepted \n");}

%%
int yywrap()
{
return 1;
}
int main()
{
printf("Enter the String\n");
yylex();
}
