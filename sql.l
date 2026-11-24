%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
int lineno = 1;
%}

%option noyywrap
%option caseless

%%
[ \t\r]+            ;
\n                  { lineno++; }
"ALTER"             { printf("%-12s %s\n", "KEYWORD", yytext); return ALTER; }
"TABLE"             { printf("%-12s %s\n", "KEYWORD", yytext); return TABLE; }
"ADD"               { printf("%-12s %s\n", "KEYWORD", yytext); return ADD; }
"CONSTRAINT"        { printf("%-12s %s\n", "KEYWORD", yytext); return CONSTRAINT; }
"CHECK"             { printf("%-12s %s\n", "KEYWORD", yytext); return CHECK; }
"SELECT"            { printf("%-12s %s\n", "KEYWORD", yytext); return SELECT; }
"FROM"              { printf("%-12s %s\n", "KEYWORD", yytext); return FROM; }
"WHERE"             { printf("%-12s %s\n", "KEYWORD", yytext); return WHERE; }
"AND"               { printf("%-12s %s\n", "KEYWORD", yytext); return AND; }
"OR"                { printf("%-12s %s\n", "KEYWORD", yytext); return OR; }
[0-9]+(\.[0-9]+)?   { printf("%-12s %s\n", "NUMBER", yytext); return NUMBER; }
'[^'\n]*'           { printf("%-12s %s\n", "STRING", yytext); return STRING; }
[A-Za-z_][A-Za-z0-9_]* { printf("%-12s %s\n", "IDENTIFIER", yytext); return ID; }
">="                { printf("%-12s %s\n", "RELOP", yytext); return GE; }
"<="                { printf("%-12s %s\n", "RELOP", yytext); return LE; }
"<>"|"!="           { printf("%-12s %s\n", "RELOP", yytext); return NE; }
"="                 { printf("%-12s %s\n", "RELOP", yytext); return EQ; }
">"                 { printf("%-12s %s\n", "RELOP", yytext); return GT; }
"<"                 { printf("%-12s %s\n", "RELOP", yytext); return LT; }
"("                 { printf("%-12s %s\n", "LPAREN", yytext); return LP; }
")"                 { printf("%-12s %s\n", "RPAREN", yytext); return RP; }
";"                 { printf("%-12s %s\n", "SEMICOLON", yytext); return SEMI; }
","                 { printf("%-12s %s\n", "COMMA", yytext); return COMMA; }
"*"                 { printf("%-12s %s\n", "STAR", yytext); return STAR; }
.                   { printf("Lexical error: illegal character '%s' at line %d\n", yytext, lineno); }
%%
