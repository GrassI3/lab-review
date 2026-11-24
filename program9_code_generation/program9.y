%{
#include<stdio.h>
#include<string.h>
void yyerror(char*);
void Gen(char*);
int i=1,c=0,j,f,count=0,prev,label=100;
char *Array[10][10],*temp,temp1[50],temp2[50];
extern FILE *yyin;
%}

%union {
  char *string_value;
}
%type <string_value> exp exp1
%token <string_value> ID
%token <string_value> INTEGER

%%

stmt : stmt exp1 { }
     |
     ;

exp1 :ID '=' exp { sprintf(temp2,"\n%s=%s",$1,$3); $$="t"; Gen(temp2); sprintf(temp2,"\tmov %s, %s",$1,$3); Gen(temp2); }

exp : exp '+' exp {sprintf(temp2,"\nt=%s+%s",$1,$3); $$="t"; Gen(temp2);sprintf(temp2,"\tmov A, %s add A, %s mov t, A",$1,$3);Gen(temp2);}
    | exp '-' exp {sprintf(temp2,"\nt=%s-%s",$1,$3); $$="t"; Gen(temp2);sprintf(temp2,"\tmov A, %s sub A, %s mov t, A",$1,$3);Gen(temp2);}
    | exp '*' exp {sprintf(temp2,"\nt=%s*%s",$1,$3); $$="t"; Gen(temp2);sprintf(temp2,"\tmov A, %s mul A, %s mov t, A",$1,$3);Gen(temp2);}
    | ID { $$=$1; }
    | INTEGER	{ $$=$1; }
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
}

int main( int argc, char **argv ) {
	yyparse();
	return 1;
}
