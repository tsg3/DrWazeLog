:-['DrWaze.pl'].
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       lugares       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Hecho       : lugar
% Descripción : lugares en la base de datos

lugar("cartago").
lugar("paraiso").
lugar("pacayas").
lugar("cervantes").
lugar("turrialba").
lugar("corralillo").
lugar("orosi").
lugar("cachi").
lugar("belen").
lugar("prusia").
lugar("desamparados").
lugar("coris").


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       respuesta 1       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Gramatica ldc : oracion1
% Descripción   : corresponde a las posibles respuesta para la pregunta
%                 de donde se encuentra

oracion1(S0,S):- head1(S0,S1), body1(head,S1,S).
oracion1(S0,S):- body1(S0,S).

head1(S0,S):- saludo(S0,S1),
             nombre(S1,S).

head1(S0,S):- saludo(S0,S).

body1(head,S0,S):- sintagma_verbal1(S0,S1), lugar(S1,S).
body1(S0,S):- sintagma_verbal1(S0,S1), lugar(S1,S).
body1(S0,S):- lugar(S0,S).

sintagma_verbal1(S0,S):- verbo1(S0,S1),
                         aux(S1,S).

sintagma_verbal1(S0,S):- aux2(S0,S1),
						 verbo1(con_me,S1,S2),
                         aux(S2,S).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       respuesta 2       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Gramatica ldc : oracion1
% Descripción   : corresponde a las posibles respuesta para la pregunta
%                 de a donde se dirige

oracion2(S0,S):- sintagma_verbal2(S0,S1), lugar(S1,S).
oracion2(S0,S):- aux3(S0,S1), lugar(S1,S).
oracion2(S0,S):- lugar(S0,S).

sintagma_verbal2(S0,S):- verbo2(S0,S1),
                         aux3(S1,S).
sintagma_verbal2(S0,S):- aux2(S0,S1),
						 verbo2(con_me,S1,S2),
                         aux3(S2,S).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       respuesta 3       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Gramatica ldc : oracion1
% Descripción   : corresponde a las posibles respuesta para la pregunta
%                 de a donde se encuentra X lugar

oracion3(S0,S):- sintagma_verbal3(S0,S1), lugar(S1,S).
oracion3(S0,S):- lugar(S0,S).

sintagma_verbal3(S0,S):- aux4(S0,S1),
						 verbo3(S1,S2),
                         aux(S2,S).

sintagma_verbal3(S0,S):- aux(S0,S).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       respuesta 4       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Gramatica ldc : oracion1
% Descripción   : corresponde a las posibles respuesta para la pregunta
%                 de cual es el destino intermedio

oracion4(S0,S):- sintagma_verbal4(S0,S1), lugar(S1,S).
oracion4(S0,S):- lugar(S0,S).

sintagma_verbal4(S0,S):- aux2(S0, S1),
						 verbo4(S1,S2),
                         verbo5(S2,S3),
                         aux5(S3,S).

sintagma_verbal4(S0,S):- aux2(S0, S1),
						 verbo4(S1,S).

sintagma_verbal4(S0,S):- verbo6(S0,S1),
						 verbo5(S1,S2),
						 aux5(S2, S).

sintagma_verbal4(S0,S):- verbo6(con_que,S0,S1),
						 aux6(S1, S2),
						 verbo5(S2,S3),
						 aux5(S3, S).

sintagma_verbal4(S0,S):- aux2(S0, S1),
						 verbo6(con_me,S1,S2),
						 verbo5(S2,S3),
						 aux5(S3, S).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       respuesta 5       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Gramatica ldc : oracion1
% Descripción   : corresponde a las posibles respuesta para la pregunta
%                 de si hay o no un destino intermedio

oracion5(S0,S):- negacion(S0, S).

oracion5(S0,S):- si_no(S0, S).

oracion5(S0,S):- si_no(S0, S1),
				 verbo7(S1,S2),
				 palabra1(S2,S3),
				 palabra2(S3,S4),
				 palabra3(S4,S).

oracion5(S0,S):- si_no(S0, S1),
				 verbo7(S1,S2),
				 palabra1(S2,S3),
				 palabra2(S3,S).

oracion5(S0,S):- si_no(S0, S1),
				 verbo7(S1,S2),
				 palabra1(S2,S).

oracion5(S0,S):- si_no(S0, S1),
				 palabra1(S1,S2),
				 palabra2(S2,S).

oracion5(S0,S):- si_no(S0, S1),
				 palabra1(S1,S).

oracion5(S0,S):- si_no(S0, S1),
				 verbo7(S1,S).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       palabras       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Hechos
% Descripción : palabras registradas en la base de datos

saludo(["hola"|S],S).
nombre(["wazelog"|S],S).

verbo1(["estoy"|S],S).
verbo1(con_me, ["encuentro"|S],S).
verbo1(con_me, ["ubico"|S],S).

verbo2(["voy"|S],S).
verbo2(con_me, ["dirijo"|S],S).
verbo2(con_me, ["traslado"|S],S).

verbo3(["encuentra"|S],S).
verbo3(["ubica"|S],S).
verbo3(["localiza"|S],S).

verbo4(["gustaria"|S],S).
verbo4(["encantaria"|S],S).

verbo5(["pasar"|S],S).
verbo5(["ir"|S],S).
verbo5(["dirigirme"|S],S).

verbo6(["necesito"|S],S).
verbo6(con_que, ["tengo"|S],S).
verbo6(con_me, ["urge"|S],S).

verbo7(["hay"|S],S).

aux(["en"|S],S).
aux2(["me"|S],S).
aux3(["a"|S],S).
aux3(["hacia"|S],S).
aux4(["se"|S],S).
aux5(["a"|S],S).
aux6(["que"|S],S).

si_no(["no"|S],S).
si_no(["si"|S],S).
negacion(["ninguno"|S],S).

palabra1(["mas"|S],S).
palabra2(["destinos"|S],S).
palabra3(["intermedios"|S],S).

lugar(["cartago"|S], S).
lugar(["paraiso"|S], S).
lugar(["pacayas"|S], S).
lugar(["cervantes"|S], S).
lugar(["turrialba"|S], S).
lugar(["corralillo"|S], S).
lugar(["orosi"|S], S).
lugar(["cachi"|S], S).
lugar(["belen"|S], S).
lugar(["prusia"|S], S).
lugar(["desamparados"|S], S).
lugar(["coris"|S], S).

lugar([_|S],S).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       logica de la conversacion       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Regla       : consulta
% Descripción : funcion madre que inicia de la conversacion y redirige a consulta2

consulta:- write('\nBienvenido a WazeLog, la mejor opcion para viajar.\n'), consulta2.


% Regla       : consulta 2
% Descripción : consulta el lugar de partida y destino y hace las restricciones correspondientes

consulta2:-write('Por favor indiqueme donde se encuentra: \n'),
		   read(A),
		   parse(A, B),
		   valida1(B, C),
		   valida_lugar(C, D),       % D es el lugar de partida

		   write('\nOk, a donde se dirige?: \n'),
		   read(E),
		   parse(E, F),
		   valida2(F, H),
		   valida_lugar(H, G),      % G es el lugar de partida

		   valida_lugares_iguales(D, G).


% Regla       : consulta 3
% Entradas    : X -> Punto de partida
%               Y -> Punto de llegada
%               Z -> Lista de puntos intermadios, en este caso esta vacia
% Descripción : pregunta si hay o no destinos intermadios

consulta3(X, Y, Z):-write('\nDe acuerdo, hay algun destino intermedio?:\n'),
				 read(A),
			     parse(A, B),
			     valida4(B, C),
			     valida_si_no(C, X, Y, Z).


% Regla       : consulta 4
% Entradas    : X -> Punto de partida
%               Y -> Punto de llegada
%               Z -> Lista de puntos intermadios
% Descripción : pregunta si hay o no destinos intermadios

consulta4(X, Y, Z):-write('\nAlgun otro destino intermedio?:\n'),
				read(A),
			        parse(A, B),
			        valida4(B, C),
			        valida_si_no(C, X, Y, Z).


% Regla       : consulta 5
% Entradas    : X -> Punto de partida
%               Y -> Punto de llegada
%               Z -> Lista de puntos intermadios
% Descripción : pregunta cual es el destino intermedio y lo valida

consulta5(X, Y, Z):-write('\nCual seria ese destino?:\n'),
				read(A),
			        parse(A, B),
			        valida5(B, C),
			        valida_lugar(C, D),      % D es un destino intermedio
			        valida_lugares_iguales(X, Y, Z, D).


% Regla       : consulta 6
% Entradas    : X -> Punto de partida
%               Y -> Punto de llegada
%               Z -> Lista de puntos intermadios
% Descripción : calculo de la ruta y resumen en el log

consulta6(X, Y, Z):- inversaAtom(Z, [], L),
                     atom_string(NX, X),
                     atom_string(NY, Y),
                     viajar(NX, L, NY, [], 0, R, C),
                     respuestaWazeLog(X, Y, R, C).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       validaciones/restricciones        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Regla       : valida1
% Entradas    : A -> Oracion por validar
%               B -> Respuesta de la oracion validada
% Descripción : valida si la oracion ingresada por el usuario es correcta segun la base de datos
%               y sino da un mesaje de error y prenguta recursivamente hasta que de una respuesta valida

valida1(A, B):- (oracion1(A, []) -> B = A).
valida1(_, B):-write('\nNo le entiendo. Por favor se mas especifico. Indiqueme donde se encuentras: \n'),
	           read(C),
	           parse(C, D),
	           valida1(D, B).


% Regla       : valida2
% Entradas    : A -> Oracion por validar
%               B -> Respuesta de la oracion validada
% Descripción : valida si la oracion ingresada por el usuario es correcta segun la base de datos
%               y sino da un mesaje de error y prenguta recursivamente hasta que de una respuesta valida

valida2(A, B):- (oracion2(A, []) -> B = A).
valida2(_, B):-write('\nNo le entiendo. Por favor se mas especifico. Intentelo de nuevo, a donde se dirige?: \n'),
	           read(C),
	           parse(C, D),
	           valida2(D, B).


% Regla       : valida3
% Entradas    : A -> Oracion por validar
%               B -> Respuesta de la oracion validada
% Descripción : valida si la oracion ingresada por el usuario es correcta segun la base de datos
%               y sino da un mesaje de error y prenguta recursivamente hasta que de una respuesta valida

valida3(A, B, _):- (oracion3(A, []) -> B = A).
valida3(_, B, X):-write('\nNo le entiendo. Intentelo de nuevo, a donde se encuentra '),
				  write(X),
				  write(': \n'),
	              read(C),
	              parse(C, D),
	              valida3(D, B, X).


% Regla       : valida4
% Entradas    : A -> Oracion por validar
%               B -> Respuesta de la oracion validada
% Descripción : valida si la oracion ingresada por el usuario es correcta segun la base de datos
%               y sino da un mesaje de error y prenguta recursivamente hasta que de una respuesta valida

valida4(A, B):- (oracion5(A, []) -> B = A).
valida4(_, B):-write('\nNo le entiendo. Hay algun otro destino intermedio? debe responer si o no: \n'),
	           read(C),
	           parse(C, D),
	           valida4(D, B).


% Regla       : valida5
% Entradas    : A -> Oracion por validar
%               B -> Respuesta de la oracion validada
% Descripción : valida si la oracion ingresada por el usuario es correcta segun la base de datos
%               y sino da un mesaje de error y prenguta recursivamente hasta que de una respuesta valida

valida5(A, B):-(oracion4(A, []) -> B = A).
valida5(_, B):-write('\nNo le entiendo. Cual es el destino intermedio?: \n'),
	           read(C),
	           parse(C, D),
	           valida5(D, B).


% Regla       : valida_lugar
% Entradas    : A -> Oracion por validar
%               B -> Respuesta del lugar ya validado
% Descripción : valida si en la oracion ingresada por el usuario hay un lugar valido y si el lugar
%               no se entra en la base de datos pregunta recursivamente donde se encuentra ese lugar
%               hasta que se de una respuesta valida

valida_lugar([X|_], B):- (lugar(X) -> B = X).
valida_lugar([X|A], B):- valida_lugar(A, B, X).

valida_lugar([X|_], B, _):- (lugar(X) -> B = X).
valida_lugar([X|A], B, _):- valida_lugar(A, B, X).

valida_lugar([], B, X):-write('\nDebe ingresar un lugar valido, donde se encuentra '),
						write(X),
						write(': \n'),
					    read(C),
					    parse(C, D),
					    valida3(D, E, X),
					    valida_lugar(E, B).


% Regla       : valida_lugares_iguales
% Entradas    : A, X -> lugares de partida
%               B, Y -> lugares de destino
%               Z    -> lista de lugares intermedios por validar
% Descripción : valida si el lugar de partida y destino son diferentes y si no vuelve a prenguntar por esos lugares
%               tambien valida lo mismo para los  lugares intermedios

valida_lugares_iguales(A, A):-vuelve_a_empezar(1).
valida_lugares_iguales(A, B):-consulta3(A, B, []).

valida_lugares_iguales(X, _, _, X):-vuelve_a_empezar(2).
valida_lugares_iguales(_, Y, _, Y):-vuelve_a_empezar(2).
valida_lugares_iguales(_, _, Z, A):-(es_miembro(Z, A) -> vuelve_a_empezar(2)).
valida_lugares_iguales(X, Y, Z, A):-(longitud(Z, 0) -> consulta4(X, Y, [A])).
valida_lugares_iguales(X, Y, Z, A):-consulta4(X, Y, [A|Z]).


% Regla       : valida_si_no
% Entradas    : A -> Oracion por validar
%               X -> lugares de partida
%               Y -> lugares de destino
%               Z -> lista de lugares intermedios
% Descripción : valida la respuesta de la prenguta de si hay no mas mas destinos intermedios
%               si hay mas destinos entonces repite el proceso de pregunar por ese lugar y validarlo
%               si no se dirige a dar un resumen de los lugares y calcular la ruta

valida_si_no(["si"|_], X, Y, Z):-consulta5(X, Y, Z).
valida_si_no(["no"|_], X, Y, Z):-consulta6(X, Y, Z).
valida_si_no(["ninguno"|_], X, Y, Z):-consulta6(X, Y, Z).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       funciones basicas        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Regla       : vuelve_a_empezar
% Entradas    : 1 -> si el lugar de partida y destino son iguales
%               2 -> si algun lugar intermendio se repite
% Descripción : en casa de que haya error con los lugares ingresados redirige a volver a preguntar por esos lugares

vuelve_a_empezar(1):- write('\nEl lugar de destino y el lugar de partida no puede ser el mismo. Por favor intentelo de nuevo\n'), consulta2.
vuelve_a_empezar(2):- write('\nLos lugares intermedios no pueden ser iguales a los lugares de pertida y destino. Por favor intentelo de nuevo\n'), consulta2.


% Regla       : parse
% Entradas    : X -> oracion a parsear
%               Y -> respuesta de la lista de la oracion ya parseada
% Descripción : parsea un oracion en un lista de palabras

parse(X, Y):- split_string(X, " ", ".,\s\t\n", Y).


% Regla       : es_miembro
% Entradas    : X -> lista
%               Y -> miembro a consultar
% Descripción : consulta si un elemento es miembro de una lista

es_miembro([X|_], X).
es_miembro([_|A], B):- es_miembro(A, B).


% Regla       : longitud
% Entradas    : X -> lista
%               Y -> tamano de la lista
% Descripción : consulta si una lista tiene Y elementos

longitud([],0).
longitud([_|Resto],N):-longitud(Resto,N1), N is N1+1.


% Regla       : inversa
% Entradas    : A -> lista
%               Y -> lista invertida
%               Y -> respuesta de la lista invertida
% Descripción : inverte una lista

inversaAtom([], B, C):-(C = B).
inversaAtom([X|A], B, C):- atom_string(NX, X), inversaAtom(A, [NX|B], C).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       final        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
