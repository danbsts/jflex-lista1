package br.ufpe.cin.if688.jflex;

%%

/*
A linha atual pode ser acessada por yyline
e a coluna atual com yycolumn.
*/
%line
%column
%unicode
//%debug
%public
%standalone
%class MiniJava
%eofclose

/*-*
 * PADROES NOMEADOS:
 */
letter          = [A-Za-z] | "_"
digit           = [1-9]
digit2          = [0-9]
integer         = {digit2}+
whitespace      = [ \n\t\r\f]
reservado       = "boolean"|"class"|"public"|"extends"|"static"|"void"|"main"|"String"|"int"|"while"|"if"|"else"|"return"|"length"|"true"|"false"|"this"|"new"|"System.out.println"
operators       = "&&" | "<" | "==" | "!=" | "+" | "-" | "*" | "!"
delimitadores   = ";" | "." | "," | "=" | "(" | "{" |"[" | ")" | "}" |"]"
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+"/"
CommentContent   = ( [^*] | \*+ [^/*] )*
comment         = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
identificador   = ({letter})({letter} | {digit2})*


%%
/**
 * REGRAS LEXICAS:
 */

 /* reservado */
{reservado}     { System.out.println("token gerado foi um reservado: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }

/* operators */
{operators}  { System.out.println("token gerado foi um operador: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }

/* delimitadores */
{delimitadores} { System.out.println("token gerado foi um delimitador: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }

{identificador} { System.out.println("token gerado foi um id: '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
{integer}       { System.out.println("token gerado foi um integer: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn); }
{comment}       { }
{whitespace}    { }
