%% Author: Angel Camilo Chavez, Summer 2021
% Original base source by: Javier Tibau
% Original tokenizer source by: Bruno Dufuour, Fall 2005

% Importar archivos
:- consult('lexer').
:- consult('rules').
:- consult('tokenizer').

% main(+FileName).
% Recepta un file, procede a tokenizar los contenidos, luego arroja true o false dependiendo si la expresion es un assignment valido o no
main(FileName):- 
        open(FileName, 'read', InputStream),
        read_stream_to_codes(InputStream, ProgramString),
        close(InputStream),
        phrase(tokenize(TSBefore), ProgramString),
        write(TSBefore),
        assignStmt(TSBefore, []). %scope por ahora se reduce a solo asignaciones (avance 1)

% run_tests().
% Corre pruebas (WIP)
run_tests():- 
        main('../tests/test1.txt').