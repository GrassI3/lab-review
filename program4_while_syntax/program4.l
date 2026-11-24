%{

#include "y.tab.h"
void yyerror(char *);
%}

%%

[\t ]+	/* ignore */ ;

while	{ return While; }
End	{ return End; }
"<"	{ yylval.string_value=strdup(yytext);
		return Rel; }
[-=+*\n,;]	{ return *yytext; }

int	{ return INT; }
float	{ return FLOAT; }

[a-zA-Z0-9]+	{
		yylval.string_value = strdup(yytext );
		return ID;
		};
.	{ yyerror("Invalid Tokens"); }
%%
