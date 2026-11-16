%{
#include <stdio.h>
int lc=0,wc=0,cc=0,v_count=0,c_count=0,line_word=0,line_has=0;
%}

%%
\n	{
	lc++;
	line_word=0;
	line_has=0;
	}
[ \t]	{
	cc++;
	line_word=0;
	line_has=1;
	}
[aeiouAEIOU]	{
		v_count++;
		cc++;
		line_has=1;
		if(!line_word)
		{
		wc++;
		line_word=1;
		}

		}		

[a-zA-Z] 	{
		c_count++;
		cc++;
		line_has=1;
		if(!line_word)
		{
		wc++;
		line_word=1;
		}
		}
.		{
		cc++;
		line_has=1;
		if(!line_word)
		{
		wc++;
		line_word=1;
		}}
%%
int main()
{
yyin=fopen("in.txt","r");
yylex();
    printf("Number of Lines: %d\n", lc);
    printf("Number of Words: %d\n", wc);
    printf("Number of Characters: %d\n", cc);
    printf("Number of Vowels: %d\n", v_count);
    printf("Number of Consonants: %d\n", c_count);
}
int yywrap()
{
return 1;
}
