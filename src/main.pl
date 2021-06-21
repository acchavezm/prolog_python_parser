%% Author: Angel Camilo Chavez, Summer 2021
% Original base source by: Javier Tibau
% Original tokenizer source by: Bruno Dufuour, Fall 2005

% Importar archivos
:- consult('lexer').
:- consult('rules').
:- consult('tokenizer').

% Importar modulos - entregable 2
:- use_module(grammars/class, [parse_class/7]).

% main(+FileName).
% Recepta un file, procede a tokenizar los contenidos, luego arroja true o false dependiendo si la expresion es un assignment valido o no
main(FileName):- 
        open(FileName, 'read', InputStream),
        read_stream_to_codes(InputStream, ProgramString),
        close(InputStream),
        phrase(tokenize(TSBefore), ProgramString),
        write(TSBefore),
        assignStmt(TSBefore, []). %scope por ahora se reduce a solo asignaciones (avance 1)

% start(+FileName). - entregable 2
start(FileName) :-
  read_file_to_string(FileName, Source, []),
  parse_class(Source, Modifiers, Name, Parent, Interfaces, Attributes, Methods),
  write("Modifiers are: "),
  writeln(Modifiers),
  write("Name is: "),
  writeln(Name),
  write("Extends: "),
  writeln(Parent),
  write("Implements interfaces: "),
  writeln(Interfaces),
  write("Attributes are: "),
  writeln(Attributes),
  write("Methods are: "),
  writeln(Methods).

% run_tests().
% Corre pruebas (WIP)
run_tests():- 
        main('../tests/test1.txt').