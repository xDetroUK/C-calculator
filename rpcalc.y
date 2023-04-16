%{
#include<stdio.h>
#include<math.h>
#include <stdbool.h>
int yylex (void);
extern int yyparse();
extern FILE* yyin;

void yyerror (char const *);
%}

%define api.value.type {double}

%token NUM
%token PLUS MINUS MULTIPLY DIVIDE
%token NEWLINE
%token AND OR NEG
%token TRUE FALSE
%start input


%%

input:
  %empty
| input line
;

line:
  NEWLINE
| exp NEWLINE {printf("%.10g\n", $1); printf("mew: ");}
;

exp:
  NUM
| TRUE { $$ = true; }
| FALSE { $$ = false; }
| exp exp PLUS {$$ = $1 + $2;}
| exp exp MINUS {$$ = $1 - $2;}
| exp exp MULTIPLY {$$ = $1 * $2;}
| exp exp DIVIDE {$$ = $1 / $2;}
| exp exp AND { $$ = $1 && $2; }
| exp exp OR { $$ = $1 || $2; }
| exp NEG {$$ = -$1;}
;
%%


void yyerror (char const *s){
  fprintf(stderr, "%s\n",s);
}

int main(void){
  printf("Input example: var var OPERATOR \n --help for more information \n");
  yyin = stdin;
  do {
	yyparse();
  } while (!feof(yyin));
  return 0;
}  
