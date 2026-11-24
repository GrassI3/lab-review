%{
#include "y.tab.h"
void yyerror(char*);

%}

alpha	[a-zA-Z_]
digit	[0-9]

%%

{alpha}({alpha}|{digit})*	{	return ID;	}
{digit}+	{	return NUM	}
[,;\n]	{	return *yytext;	}
[ \t]	{	;	}
.	{	yyerror("invalid character"); exit(0);	}

%%

int yywrap(void)
{ return 1; }
