%{

#include<stdio.h>

#include<string.h>

char* temp[50];

%}

%token ID INT FLOAT CHAR SC NL COMMA

%%

s1: |s1 s NL	{printf("Valid\n");}

s: INT V1
    |FLOAT V2
    |CHAR V3

V1: ID SC	{ sprintf(temp,"\n%c\tint\t%d",$1,sizeof(int));Gen(temp); }
    |ID COMMA V1	{ sprintf(temp,"\n%c\tint\t%d",$1,sizeof(int));Gen(temp); }

V2: ID SC	{ sprintf(temp,"\n%c\tfloat\t%d",$1,sizeof(float));Gen(temp); }
    | ID COMMA V2	{ sprintf(temp,"\n%c\tfloat\t%d",$1,sizeof(float));Gen(temp); }

V3: ID SC	{ sprintf(temp,"\n%c\tchar\t%d",$1,sizeof(char));Gen(temp); }
    | ID COMMA V3	{ sprintf(temp,"\n%c\tchar\t%d",$1,sizeof(char));Gen(temp); }

%%

void yyerror()
{
printf("Error\n");
}

int yywrap()
{
return 1;
}

void Gen(char *val)
{
	FILE *fo ;
	fo=fopen("output.txt","a");
	fputs(val,fo);
	fclose(fo);
}

main()
{
	yyparse();
}
