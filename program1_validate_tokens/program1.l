digit	[0-9]
alpha	[a-zA-Z_]

%%

{alpha}({alpha}|{digit})*	{	printf("Identifier=%s",yytext);	}
({digit})+	{	printf("Number=%s",yytext);	}

%%
int yywrap(void)
{ return 1; }

int main()
{
yylex();

return 0;
}
