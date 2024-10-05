lexer grammar RegraLog;

TIMESTAMP  : '[' DIGIT DIGIT DIGIT DIGIT '-' DIGIT DIGIT '-' DIGIT DIGIT ' ' DIGIT DIGIT ':' DIGIT DIGIT ':' DIGIT DIGIT ']';
LOG_LEVEL  : 'ERROR' | 'WARN' | 'INFO';
MESSAGE    : (~[\r\n])+;  // Retorna o restante da linha após o LOG_LEVEL

fragment DIGIT : [0-9];