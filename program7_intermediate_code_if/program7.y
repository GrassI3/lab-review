%{
#include<stdio.h>
#include<string.h>
void yyerror(char*);
void Gen(char*);
char temp2[50];
%}
%union
{
  char *string_value;
}

%type <string_value> exp
%type <string_value> COND
%type <string_value> s
%type <string_value> stmt
%token <string_value> ID
%token <string_value> OP
%token IF ob1 cb1 ob2 cb2 EQ SC

%%
s	: IF ob1 COND cb1 ob2 stmt cb2	{ sprintf(temp2,"\nt=if(%s){%s}",$3,$6);$$="t"; Gen(temp2); }
	;

stmt	:s
	|ID EQ exp SC stmt {	sprintf(temp2,"\nt=%s=%s",$1,$3); $$="t"; Gen(temp2);	}
	|
	;


exp	: exp '+' exp	{ sprintf(temp2,"\nt=%s+%s",$1,$3); $$="t"; Gen(temp2); }
	| exp '-' exp	{ sprintf(temp2,"\nt=%s-%s",$1,$3); $$="t"; Gen(temp2); }
	| exp '*' exp	{ sprintf(temp2,"\nt=%s*%s",$1,$3); $$="t"; Gen(temp2); }
	| ID	{ $$=$1; }
	;

COND	:ID OP ID	{ sprintf(temp2,"\nt=%s %s %s",$1,$2,$3); $$="t"; Gen(temp2); }
	;


%%

void Gen(char *val)
{
	FILE *f;
	f=fopen("output.txt","a");
	fputs(val,f);
	fclose(f);
}

int yywrap() { return 1; }

void yyerror(char *s)
{
	return;
}
int main( int argc, char **argv ) {
	yyparse();
	return 1;
}
