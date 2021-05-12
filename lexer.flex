import java.util.ArrayList;
import java_cup.runtime.*;
%%
// se importa los recursos de java cup
%class Lexer
%line
%column
%cup
// Establece el enlace entre jflex y el java cup
%{
    public String errlex="";
    public ArrayList<Token> ts = new ArrayList<Token>();
    public Symbol symbol(int type){
        return new Symbol(type,yyline,yycolumn);
    }
%}

a = [a-zA-Z]
n = [0-9]
s= “_”
espacio = [\n\t\r]

numero = {n}+ ("."{n})?
id = {a} ({a}|{n}|"_")*
cad = "'"({a}|{n}|{s}|" ")* "'"
tipoDato = "Entero"|"Decimal"|"Cadena"

%%
{ts.add(new Token("",yytext())); return symbol(sym.)}

"Programa" {ts.add(new Token("Programa",yytext())); return symbol(sym.Programa)}
"FinPrograma" {ts.add(new Token("FinPrograma",yytext())); return symbol(sym.FinPrograma)}
"Mientras" {ts.add(new Token("Mientras",yytext())); return symbol(sym.Mientras)}
"hacer" {ts.add(new Token("Hacer",yytext())); return symbol(sym.hacer)}
"FinMientras" {ts.add(new Token("FinMientras",yytext())); return symbol(sym.FinMientras)}
"Para" {ts.add(new Token("Para",yytext())); return symbol(sym.Para)}
"hasta" {ts.add(new Token("Hasta",yytext())); return symbol(sym.hasta)}
"paso"  {ts.add(new Token("Paso",yytext())); return symbol(sym.paso)}
"FinPara"  {ts.add(new Token("FinPara",yytext())); return symbol(sym.FinPara)}
"Leer" {ts.add(new Token("Leer",yytext())); return symbol(sym.Leer)}
"Escribir" {ts.add(new Token("Escribir",yytext())); return symbol(sym.Escribir)}
"Si" {ts.add(new Token("Si",yytext())); return symbol(sym.Si)}
"Entonces" {ts.add(new Token("Entonces",yytext())); return symbol(sym.Entonces)}
"Sino" {ts.add(new Token("Sino",yytext())); return symbol(sym.Sino)}
"FinSi" {ts.add(new Token("FinSi",yytext())); return symbol(sym.FinSi)}
";" {ts.add(new Token("PComa",yytext())); return symbol(sym.pComa)}
"," {ts.add(new Token("Coma",yytext())); return symbol(sym.coma)}
"=" {ts.add(new Token("Igual",yytext())); return symbol(sym.igual)}
"+" {ts.add(new Token("Suma",yytext())); return symbol(sym.suma)}
"-" {ts.add(new Token("Resta",yytext())); return symbol(sym.resta)}
"/" {ts.add(new Token("Division",yytext())); return symbol(sym.division)}
"*" {ts.add(new Token("Multiplicacion",yytext())); return symbol(sym.multiplicacion)}
"(" {ts.add(new Token("DParentesis",yytext())); return symbol(sym.dParentesis)}
")" {ts.add(new Token("IParentesis",yytext())); return symbol(sym.iParentesis)}
"<" {ts.add(new Token("Menor",yytext())); return symbol(sym.menor)}
">" {ts.add(new Token("Mayor",yytext())); return symbol(sym.mayor)}
"==" {ts.add(new Token("IgualIgual",yytext())); return symbol(sym.igualIgual)}
"<=" {ts.add(new Token("MenorIgual",yytext())); return symbol(sym.menorIgual)}
">=" {ts.add(new Token("MayorIgual",yytext())); return symbol(sym.mayorIgual)}
{id} {ts.add(new Token("Identificador",yytext())); return symbol(sym.id)}
{tipoDato} {ts.add(new Token("TipoDato",yytext())); return symbol(sym.tipoDato)}
{cad} {ts.add(new Token("Cadena",yytext())); return symbol(sym.cad)}
{numero} {ts.add(new Token("Numero",yytext())); return symbol(sym.numero)}
{espacio} {}
. {errlex+="\nError lexico: " + yytext() + " caracter no valido en pos: " + (yyline+1) + ","
+ (yycolumn+1);}









