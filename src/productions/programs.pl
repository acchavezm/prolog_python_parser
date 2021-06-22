% BNF taken from: https://cs.au.dk/~amoeller/RegAut/JavaBNF.html

% <compilation unit> ::= <package declaration>? <import declarations>? <type declarations>?
compilation_unit(A) --> package_declarations(A).
% import_declarations(B), type_declarations.

% <package declaration> ::= package <package name> ;
package_declarations([A|Rest]) --> package, rspace, package_name(Rest), semicolon.

% <import declarations> ::= <import declaration> | <import declarations> <import declaration>
import_declarations(Package|Rest) --> import_declaration(Type|Rest).
import_declarations(Package|Rest) --> import_declarations(Package|Rest), import_declaration(Package|Rest).

% <import declaration> ::= <single type import declaration> | <type import on demand declaration>
import_declaration(Rest) --> single_type_import_declaration(Rest).
import_declaration(Rest) --> type_import_on_demand_declaration(Rest).

% <single type import declaration> ::= import <type name> ;
single_type_import_declaration(Rest) --> import, space, type_name(Rest).

% <type import on demand declaration> ::= import <package name> . * ;
type_import_on_demand_declaration(Rest) --> import, space, package_name(Rest), dot, asterisk.

type_declarations --> [].

%% Tokens
% <package name> ::= <identifier> | <package name> . <identifier>
package_name(A) --> identifier(A).
%package_name([A|Rest]) --> package_name(A), dot, identifier(Rest).

% <type name> ::= <identifier> | <package name> . <identifier>
type_name(Type) --> identifier(Type).
type_name(Type|Rest) --> package_name(Type), dot, identifier(Rest).

% Keywords
% <keyword> ::= abstract | boolean | break | byte | case | catch | char | class | const | continue | default | do | double | else | extends | final | finally | float | for | goto | if | implements | import | instanceof | int | interface | long | native | new | package | private | protected | public | return | short | static | super | switch | synchronized | this | throw | throws | transient | try | void | volatile | while
keyword --> abstract.
keyword --> boolean.
keyword --> break.
keyword --> byte.
keyword --> case.
keyword --> catch.
keyword --> char.
keyword --> class.
keyword --> const.
keyword --> continue.
keyword --> default.
keyword --> do.
keyword --> double.
keyword --> else.
keyword --> extends.
keyword --> final.
keyword --> finally.
keyword --> float.
keyword --> for.
keyword --> goto.
keyword --> if.
keyword --> implements.
keyword --> import.
keyword --> instanceof.
keyword --> int.
keyword --> interface.
keyword --> long.
keyword --> native.
keyword --> new.
keyword --> package.
keyword --> private.
keyword --> protected.
keyword --> public.
keyword --> return.
keyword --> short.
keyword --> static.
keyword --> super.
keyword --> switch.
keyword --> synchronized.
keyword --> this.
keyword --> throw.
keyword --> throws.
keyword --> transient.
keyword --> try.
keyword --> void.
keyword --> volatile.
keyword --> while.

import --> "import".
package --> "package".

% Special characters
asterisk --> "*".
dot --> ".".
semicolon --> ";".

% Parsers
whitespace --> " ", space.
whitespace --> [].

space --> blank, space.
space --> [].

% Required space.
rspace --> blank, space.
rspace --> blank.

blank --> " ".
blank --> "\n".
blank --> "\f".
blank --> "\r".
blank --> "\t".
blank --> "\v".

% Modifiers
modifiers([Modifier|Rest]) -->
    modifier(Modifier),
    rspace,
    modifiers(Rest).
  modifiers([Modifier]) --> modifier(Modifier).
  modifiers([]) --> [].
  
  modifier('abstract') --> "abstract".
  modifier('final') --> "final".
  modifier('interface') --> "interface".
  modifier('native') --> "native".
  modifier('private') --> "private".
  modifier('protected') --> "protected".
  modifier('public') --> "public".
  modifier('static') --> "static".
  modifier('strictfp') --> "strictfp".
  modifier('synchronized') --> "synchronized".
  modifier('transient') --> "transient".
  modifier('volatile') --> "volatile".

% Identifiers
identifier(Identifier) -->
    identifier_head(Characters),
    { atom_chars(Identifier, Characters) }.
  
identifier_head([Letter|Rest]) --> letter(Letter), identifier_tail(Rest).
identifier_head([Letter]) --> letter(Letter).

identifier_tail([Alphanumeric|Rest]) --> alphanumeric(Alphanumeric), identifier_tail(Rest).
identifier_tail([Alphanumeric]) --> alphanumeric(Alphanumeric).

letter(Letter) --> lowercase(Letter).
letter(Letter) --> uppercase(Letter).

alphanumeric(Alphanumeric) --> letter(Alphanumeric).
alphanumeric(Alphanumeric) --> digit(Alphanumeric).

uppercase('A') --> "A".
uppercase('B') --> "B".
uppercase('C') --> "C".
uppercase('D') --> "D".
uppercase('E') --> "E".
uppercase('F') --> "F".
uppercase('G') --> "G".
uppercase('H') --> "H".
uppercase('I') --> "I".
uppercase('J') --> "J".
uppercase('K') --> "K".
uppercase('L') --> "L".
uppercase('M') --> "M".
uppercase('N') --> "N".
uppercase('O') --> "O".
uppercase('P') --> "P".
uppercase('Q') --> "Q".
uppercase('R') --> "R".
uppercase('S') --> "S".
uppercase('T') --> "T".
uppercase('U') --> "U".
uppercase('V') --> "V".
uppercase('W') --> "W".
uppercase('X') --> "X".
uppercase('Y') --> "Y".
uppercase('Z') --> "Z".

lowercase('a') --> "a".
lowercase('b') --> "b".
lowercase('c') --> "c".
lowercase('d') --> "d".
lowercase('e') --> "e".
lowercase('f') --> "f".
lowercase('g') --> "g".
lowercase('h') --> "h".
lowercase('i') --> "i".
lowercase('j') --> "j".
lowercase('k') --> "k".
lowercase('l') --> "l".
lowercase('m') --> "m".
lowercase('n') --> "n".
lowercase('o') --> "o".
lowercase('p') --> "p".
lowercase('q') --> "q".
lowercase('r') --> "r".
lowercase('s') --> "s".
lowercase('t') --> "t".
lowercase('u') --> "u".
lowercase('v') --> "v".
lowercase('w') --> "w".
lowercase('x') --> "x".
lowercase('y') --> "y".
lowercase('z') --> "z".

digit('0') --> "0".
digit('1') --> "1".
digit('2') --> "2".
digit('3') --> "3".
digit('4') --> "4".
digit('5') --> "5".
digit('6') --> "6".
digit('7') --> "7".
digit('8') --> "8".
digit('9') --> "9".