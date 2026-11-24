%{
#include<stdio.h>
#include<string.h>
void yyerror(char*);
void Gen(char*);
int i,j,f,k=0,count=0,l=0;
char *Array[50][50],temp[50];
char *prev="t0";
extern FILE *yyin;
%}

%union {
  char *string_value;
}

%token <string_value> ID
%token <string_value> Rel
%type <string_value> stmt S ExpStmt Exp
%type <string_value> C
%token INT FLOAT While End

%%

stmt : stmt S	{ printf("Valid While"); }
     | stmt '\n'	{ }
     |		{ }
     ;

S : While C ExpStmt End While '\n'	{ }
  ;

C : ID Rel ID '\n'	{ }
  ;

ExpStmt : ExpStmt Exp '\n'	{ }
        |			{ }
        ;

Exp: ID '=' Exp	{ }
   | Exp '+' Exp	{ }
   | Exp '-' Exp	{ }
   | ID		{ }
   ;

%%


int yywrap() { return 1; }

void yyerror(char *s)
{
	fprintf(stderr,"%s",s);
}
int main( int argc, char **argv ) {
	yyin=fopen(argv[1],"r");
	yyparse();
	return 1;
}
