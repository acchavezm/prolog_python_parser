:- consult('productions/programs').

% parse_from_file(+FileName). - entregable 2
parse_from_file(FileName):-
    read_file_to_string(FileName, Source, []),
    write(Source),
    parse_compilation_unit(Source).

parse_compilation_unit(Source) :-
    string_codes(Source, Codes),
    write(Codes),
    phrase(compilation_unit(Source), Codes).
