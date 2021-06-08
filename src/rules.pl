%% Author: Angel Camilo Chavez, Summer 2021
% Original base source by: Javier Tibau
% Original tokenizer source by: Bruno Dufuour, Fall 2005

% Definicion de operadores
% <op1> --> + | -
op1(+).
op1(-).
% <op2> --> * | /
op2(*).
op2(/).
% op puede ser un op1 u op2
op(OP):- op1(OP) | op2(OP).

% Definicion de id (identificador para alguna variable o constante)
id(ID):- atom(ID),\+ op(ID).

% <expr0> --> <id> | <entero> | <numDecimal> | <stringLiteral> | (<expr>)
expr0([X|TSEnd_Before],TSEnd):- op1(X),expr(TSEnd_Before,TSEnd).
expr0([X|TSEnd],TSEnd):- id(X).
expr0([X|TSEnd],TSEnd):- integer(X).
expr0([X|TSEnd],TSEnd):- float(X).
expr0([X|TSEnd],TSEnd):- string(X).
expr0(['('|TSBefore], TSEnd ):- expr(TSBefore, [ ')' | TSEnd ]).

% <expr1> --> <expr1> <op2> <expr0> | <expr0>
expr1(TSBefore,TSEnd):- expr0(TSBefore,[OP|TSEnd_Before]), op2(OP), expr1(TSEnd_Before,TSEnd).
expr1(TSBefore,TSEnd):- expr0(TSBefore,TSEnd).

% <expr> --> <expr> <op1> <expr1> | <expr1>
expr(TSBefore,TSEnd):- expr1(TSBefore,[OP|TSEnd_Before]), op1(OP), expr(TSEnd_Before,TSEnd).
expr(TSBefore,TSEnd):- expr1(TSBefore,TSEnd).

% <assignStmt> --> <id> = <expr>
assignStmt([TSBefore, =|TSAfter], TSEnd):- id(TSBefore), expr(TSAfter, TSEnd).