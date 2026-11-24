/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ALTER = 258,                   /* ALTER  */
    TABLE = 259,                   /* TABLE  */
    ADD = 260,                     /* ADD  */
    CONSTRAINT = 261,              /* CONSTRAINT  */
    CHECK = 262,                   /* CHECK  */
    SELECT = 263,                  /* SELECT  */
    FROM = 264,                    /* FROM  */
    WHERE = 265,                   /* WHERE  */
    AND = 266,                     /* AND  */
    OR = 267,                      /* OR  */
    ID = 268,                      /* ID  */
    NUMBER = 269,                  /* NUMBER  */
    STRING = 270,                  /* STRING  */
    GE = 271,                      /* GE  */
    LE = 272,                      /* LE  */
    NE = 273,                      /* NE  */
    EQ = 274,                      /* EQ  */
    GT = 275,                      /* GT  */
    LT = 276,                      /* LT  */
    LP = 277,                      /* LP  */
    RP = 278,                      /* RP  */
    SEMI = 279,                    /* SEMI  */
    COMMA = 280,                   /* COMMA  */
    STAR = 281                     /* STAR  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define ALTER 258
#define TABLE 259
#define ADD 260
#define CONSTRAINT 261
#define CHECK 262
#define SELECT 263
#define FROM 264
#define WHERE 265
#define AND 266
#define OR 267
#define ID 268
#define NUMBER 269
#define STRING 270
#define GE 271
#define LE 272
#define NE 273
#define EQ 274
#define GT 275
#define LT 276
#define LP 277
#define RP 278
#define SEMI 279
#define COMMA 280
#define STAR 281

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
