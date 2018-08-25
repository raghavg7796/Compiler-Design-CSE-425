%{
    int numlines = 0;
%}
digit			[0-9]
operator        (\+|\*|\-|\^|&|%|\/|\<|\>|=|==|\+\+|\-\-|\<\<|\>\>|!|\||\|\|)
integer         [+-]?{digit}+
identifier      [_a-zA-Z][_0-9a-zA-Z]*
float           [-+]?{digit}*\.?{digit}+([eE][-+]?{digit}+)?
bool            (true|false)
character       \'[^\']\'|\'\\.\'
string          \"[^\"]+\"
keyword         (int|char|float|double|long|short|sizeof|switch|unsigned|typedef|break|continue|if|else|static|struct|goto|for|while|main|void|bool|return|endif|do)
symbols         [\,\;\:\[\]\{\}\(\)\'\"]
cons            {integer}|{character}|{string}|{bool}|{float}
space           [ \t]+

%%
{space}         ;
{symbols}       ;
{keyword}       printf("  * keyword %s\n", yytext);
{operator}      printf("  * Operator %s\n", yytext); 
{identifier}    printf("  * Identifier %s\n", yytext); 
{cons}          printf("  * Constant %s\n", yytext);
.               printf("  * Incorrect %s\n", yytext);
\n              {printf("-%d\n", ++numlines);}  
%%

int main()
{
    yylex();
    printf("%d lines\n",numlines);
}
