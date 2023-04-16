%{
  #include <stdio.h>
  #include "rpcalc.tab.h"
%}
%option noyywrap

%%

[ \t]	;
([1-9][0-9]*)|0x[0-9a-fA-F]+	{yylval = atoi(yytext); return NUM;}
\n				{return NEWLINE;}
"+"				{return PLUS;}
"-"				{return MINUS;}
"*"				{return MULTIPLY;}
"/"				{return DIVIDE;}
"n"				{return NEG;}
"and"			{return AND;}
"or"			{return OR;}
[tT][rR][uU][eE]	{return TRUE;}
[fF][aA][lL][sS][eE]	{return FALSE;}

%%
