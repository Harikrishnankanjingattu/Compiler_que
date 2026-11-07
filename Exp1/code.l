%{
#include <stdio.h>
int vc=0;
int cc=0;
int cc1=0;
int wc=0;
int lc=0;
int inword=0;
%}

%%
[aeiouAEIOU]  {vc++; cc++; if(!inword) wc++; inword=1;}
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] {cc1++; cc++; if(!inword) wc++; inword=1;}
[ \t]+        {inword=0; cc+=yyleng;}
\n            {lc++; inword=0; cc++;}
.             {cc++; if(!inword) wc++; inword=1;}
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin=fopen("in.txt","r");
    if(yyin == NULL)
    {
        printf("File not found");
        return 1;
    }

    yylex();

    printf("\n%d line count",lc);
    printf("\n%d word count",wc);
    printf("\n%d char count",cc);
    printf("\n%d consonants count",cc1);
    printf("\n%d vowels count",vc);

    fclose(yyin);
    return 0;
}
