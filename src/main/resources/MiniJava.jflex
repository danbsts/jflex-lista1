package br.ufpe.cin.if688.jflex;

%%

/* 
A linha atual pode ser acessada por yyline 
e a coluna atual com yycolumn. 
*/ 
%line
%column

/* Se quisermos 'interfacear' com um parser gerado pelo sistema CUP
%cup
*/ 

//encoding
%unicode

// faz com que a classe tenha uma função main e torna possivel que a classe gerada seja usada como reconhecedor
%standalone

//nomeia a classe
%class MiniJava

/* 
Declarações

código dentro de %{ e %}, é copiado para a classe gerada. 
a ideia é utilizar este recurso para declarar atributos e métodos usados nas ações 
*/ 
%{
int qtdeID=0;
%}


%eof{
System.out.println("Quantidade de Identificadores encontrados: "+qtdeID);
%eof}

/*-*
 * PADROES NOMEADOS:
 */
letter          = [A-Za-z]
digit           = [1-9]
digit2          = [0-9]
integer         = {digit}({digit2})
alphanumeric    = {letter}|{digit}
identifier      = {letter}({alphanumeric})*
whitespace      = [ \n \t \r \f]
reservado       = "boolean"|"class"|"public"|"extends"|"static"|"void"|"main"|"String"|"int"|"while"|"if"|"else"|"return"|"length"|"true"|"false"|"this"|"new"|"System.out.println"
operators       = "&&" | "<" | "==" | "!=" | "+" | "-" | "*" | "!"
delimitadores   = ";" | "." | "," | "=" | "(" | "{" |"[" | ")" | "}" |"]"


%%
/**
 * REGRAS LEXICAS:
 */

 /* reservado */
boolean         { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
class           { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
public          { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
extends         { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
static          { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
void            { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
main            { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
String          { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
int             { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
while           { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
if              { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
else            { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
return          { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
length          { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
true            { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
false           { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
this            { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
new             { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
System.out.println { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }


/* operators */
/*"&&"            { System.out.println(""); }
"<"             { System.out.println(""); }
"=="            { System.out.println(""); }
"!="            { System.out.println(""); }
"+"             { System.out.println(""); }
"-"             { System.out.println(""); }
"*"             { System.out.println(""); }
"!"             { System.out.println(""); }*/
{operators}  { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }


/* delimitadores */
{delimitadores} { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
/*"/"             { System.out.println("Token /"); }
"("             { System.out.println("Token ("); }
")"             { System.out.println("Token )"); }
";"             { System.out.println("Token )"); }
"."             { System.out.println("Token )"); }
","             { System.out.println("Token )"); }
"="             { System.out.println("Token )"); }
"["             { System.out.println("Token )"); }
"{"             { System.out.println("Token huyadgfaskgas"); }
"]"             { System.out.println("Token )"); }
"}"             { System.out.println("Token )"); }*/


{identifier}    { qtdeID++; System.out.println("Token ID ("+yytext()+")"); }
{integer}       { System.out.println("Token INT ("+yytext()+")"); }
/*{whitespace}    { /* Ignorar whitespace. */ }*/
.               { System.out.println("Illegal char, '" + yytext() +
                    "' line: " + yyline + ", column: " + yycolumn); }
