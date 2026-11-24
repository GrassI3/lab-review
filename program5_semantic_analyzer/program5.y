%{
#include<stdlib.h>
#include<stdio.h>
int yylex(void);
void yyerror(char*);
%}
%token ID
%token FLOAT INT

%%

S : E '\n'	{ printf(" Value of Expression is = %d",$1); }
  ;

E : E `+' E	{ $$=$1 + $3; }
  | E `-' E	{ $$=$1 - $3; }
  | id		{ $$=$1; }
  | num		{ $$=$1; }
  ;

%%

void yyerror(char* s)
{
	fprintf(stderr,"%s",s);
}

int main()
{
	yyparse();
	return 0;
}
