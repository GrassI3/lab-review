%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
extern int lineno;
extern FILE *yyin;
%}

%token ALTER TABLE ADD CONSTRAINT CHECK SELECT FROM WHERE AND OR
%token ID NUMBER STRING
%token GE LE NE EQ GT LT LP RP SEMI COMMA STAR

%left OR
%left AND

%%
program     : stmt_list
            ;

stmt_list   : stmt_list stmt
            | stmt
            ;

stmt        : alter_stmt opt_semi   { printf(">> Parsed: ALTER TABLE statement\n"); }
            | select_stmt opt_semi  { printf(">> Parsed: SELECT statement\n"); }
            ;

opt_semi    : SEMI
            | /* empty */
            ;

alter_stmt  : ALTER TABLE ID ADD CONSTRAINT ID CHECK LP cond RP
            ;

select_stmt : SELECT sel_list FROM ID opt_where
            ;

sel_list    : STAR
            | id_list
            | /* empty: column list omitted, as in the given statement */
            ;

id_list     : id_list COMMA ID
            | ID
            ;

opt_where   : WHERE cond
            | /* empty */
            ;

cond        : cond OR cond
            | cond AND cond
            | LP cond RP
            | ID relop value
            ;

relop       : GE | LE | NE | EQ | GT | LT ;

value       : NUMBER | STRING | ID ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax error at line %d: %s\n", lineno, s);
}

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) { perror("fopen"); return 1; }
    }
    printf("=== LEXICAL PHASE: TOKENS ===\n%-12s %s\n", "TOKEN TYPE", "LEXEME");
    if (yyparse() == 0)
        printf("\nParsing completed successfully.\n");
    else
        printf("\nParsing failed.\n");
    return 0;
}
