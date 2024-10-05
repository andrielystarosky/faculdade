lexer grammar ExampleLexer;

NUMBER : [0-9]+ ;
ID     : [a-zA-Z]+ ;
PLUS   : '+' ;
MINUS  : '-' ;
WS     : [ \t\r\n]+ -> skip ;