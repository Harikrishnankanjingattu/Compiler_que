%{
#include <stdio.h>
int vc = 0, cc = 0, wc = 0, lc = 0;
%}

%option noyywrap

%%
[aeiouAEIOU]    { vc++; }
[a-zA-Z]        { cc++; }
[ \t\r]+        { wc++; }
\n              { lc++; wc++; }
.               ;
%%

int main() {
    yyin = fopen("in.txt", "r");
    yylex();
    printf("\n%d line count\n%d word count\n%d char count\n%d consonants count\n%d vowels count\n", lc, wc, vc + cc, cc, vc);
    return 0;
}
