% Hecho       : rutaInversa
% Descripci�n : Es un hecho din�mico usado para guardar las rutas con
%                  menos costo entre los nodos del grafo

:- dynamic
	rutaInversa/2.

% Regla       : verRutasCortas
% Entradas    : RutaInversa -> Lista de la ruta con nodos del grafo
%               Costo -> Sumatoria de los costos de la ruta
% Descripci�n : Tendr� �xito si la ruta inversa dada junto a su costo es
%                  un hecho en la base de datos din�mica

verRutasCortas(RutaInversa,Costo):-
	rutaInversa(RutaInversa,Costo).

% Hecho       : ruta
% Descripci�n : Representa todas las direcciones (arcos) disponibles
%                  entre los lugares del mapa y su respectivo costo.

ruta(cartago, paraiso, 10).
ruta(cartago, pacayas, 13).
ruta(cartago, tres_rios, 8).
ruta(cartago, san_jose, 20).
ruta(cartago, musgo_verde, 10).
ruta(pacayas, cervantes, 8).
ruta(pacayas, cartago, 13).
ruta(pacayas, tres_rios, 15).
ruta(cervantes, juan_vinas, 5).
ruta(cervantes, cachi, 7).
ruta(cervantes, pacayas, 8).
ruta(turrialba, pacayas, 18).
ruta(juan_vinas, turrialba, 4).
ruta(paraiso, cervantes, 4).
ruta(paraiso, cachi, 10).
ruta(paraiso, orosi, 8).
ruta(san_jose, corralillo, 22).
ruta(san_jose, cartago, 20).
ruta(tres_rios, san_jose, 8).
ruta(musgo_verde, cartago, 10).
ruta(musgo_verde, corralillo, 6).
ruta(corralillo, musgo_verde, 6).
ruta(corralillo, san_jose, 22).
ruta(orosi, paraiso, 8).
ruta(orosi, cachi, 12).
ruta(cachi, turrialba, 40).
ruta(cachi, cervantes, 7).
ruta(cachi, paraiso, 10).
ruta(cachi, orosi, 12).

% Regla       : viajar

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Final -> Punto de llegada en el mapa
% Descripci�n : Tendr� �xito si encuentra alguna ruta entre el punto
%		   inicial y el final y la retorna al cliente en la
%		   consola

viajar(Inicio, Final):-
	recorrer(Inicio),
	rutaInversa([Final|RutaInversa], Costo),
	inversa([Final|RutaInversa], Ruta),
	CostoSumado is round(Costo),
	write('La mejor ruta para ir desde '),
	write(Inicio),
	write(' hasta '),
	write(Final),
	write(' es '),
	escribirRuta(Ruta),
	write(', con un costo de '),
	write(CostoSumado),
	write(' horas.\n').

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Final -> Punto de llegada en el mapa
% Descripci�n : Tendr� �xito si no encuentra alguna ruta entre el punto
%		   inicial y el final e imprime el error en la consola

viajar(Inicio, Final):-
	write('No hay rutas para ir desde '),
	write(Inicio),
	write(' hasta '),
        write(Final),
	write(' .\n').

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Final -> Punto de llegada en el mapa
% Descripci�n : Condici�n de parada para 'viajar' con puntos intermedios

viajar(Inicio, [], Final):-
	viajar(Inicio, Final).

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Siguiente -> Primer punto intermedio en el viaje
%               Demas -> Resto de puntos intermedios en el viaje
%               Final -> Punto de llegada en el mapa
% Descripci�n : Tendr� �xito si encuentra rutas entre el punto de inicio
%	           y el primer punto intermedio, y este con el siguiente
%	           punto intermedio, etc; y si existe una ruta entre el
%	           �ltimo punto intermedio y el punto de llegada.

viajar(Inicio, [Siguiente|Demas], Final):-
	viajar(Inicio, Siguiente),
	viajar(Siguiente, Demas, Final).

% Regla       : recorrer

% Entradas    : Inicio -> Punto actual en el mapa
%               Ruta -> Camino seguido hasta el punto actual en el mapa
%               Costo -> Costo de la ruta actual analizada
% Descripci�n : Tendr� �xito y proceder� a buscar las rutas m�s cortas
%		   pr�ximas al punto actual si existe alg�n punto
%		   vecino al punto actual que no sea miembro de la ruta
%		   ya analizada

recorrer(Inicio, Ruta, Costo):-
	ruta(Inicio, RutaEncontrada, CostoEncontrada),
	not(miembro(RutaEncontrada, Ruta)),
	rutaMasCorta([RutaEncontrada, Inicio|Ruta], Costo + CostoEncontrada),
	recorrer(RutaEncontrada, [Inicio|Ruta], Costo + CostoEncontrada).

% Entradas    : Inicio -> Punto de inicio en el mapa
% Descripci�n : Limpia la base de datos e inicia el recorrido del mapa
%                  para encontrar las nuevas rutas m�s cortas

recorrer(Inicio):-
	retractall(rutaInversa(_, _)),
	recorrer(Inicio, [], 0).

% Entradas    : Un elemento cualquiera (punto inicial por defecto)
% Descripci�n : Punto de parada para el recorrido y el backtracking del
%                  mapa en busca de las rutas m�s cortas

recorrer(_).

% Regla       : miembro

% Entradas    : Inicio -> Elemento cualquiera que representa el primer
%	           argumento y la cabeza de la lista en el segundo
%	           argumento.
% Descripci�n : Tendr� �xito si la cabeza de la
%	           lista y el elemento solicitado son iguales


miembro(Elemento, [Elemento|_]).

% Entradas    : Elemento -> Elemento a encontrar en la lista
%		Cola -> Cola de la lista en la que se quiere buscar el
%		   elemento
% Descripci�n : Vuelve a llamar a la regla miembro con la cola de la
%		   lista como la nueva lista, hasta que esta sea nula o
%		   su cabeza sea el elemento que se busca

miembro(Elemento, [_|Cola]):- miembro(Elemento, Cola).

% Regla       : rutaMasCorta

% Entradas    : Primera -> Nodo del grafo al que va a buscar una ruta m�s
%		   corta de la existente
%		Ruta -> Camino seguido hasta el nodo actual que se est�
%		   actualizando
% Descripci�n : Si existe alguna ruta hasta el nodo actual en la base
%		   de datos, se sobreescribe por esta nueva ruta si el
%		   costo de la ruta actual es menor a la de la ruta
%		   guardada

rutaMasCorta([Primer|Ruta], Costo):-
	rutaInversa([Primer|_], CostoEncontrado), !,
	Costo < CostoEncontrado,
        retract(rutaInversa([Primer|_], _)),
	assert(rutaInversa([Primer|Ruta], Costo)).

% Entradas    : Ruta -> Ruta seguida hasta llegar al nodo actual
%               Costo -> Costo total de la ruta correspondiente
% Descripci�n : A�ade la actual ruta a la base de datos din�micas de las
%                  rutas m�s cortas

rutaMasCorta(Ruta, Costo):-
	assert(rutaInversa(Ruta,Costo)).

% Regla       : inversa

% Entradas    : Lista1, Lista2 -> Listas que son inversas la una con la
%                  otra
% Descripci�n : Inicia el an�lisis para verificar si las listas son
%                  inversas

inversa(Lista1, Lista2):- inversa(Lista1, [], Lista2).

% Entradas    : Lista -> Lista de elementos
% Descripci�n : Condici�n de parada para la regla 'inversa'. Tendr�
%		   �xito cuando la lista en el segundo y tercer
%		   par�metro sean iguales y la primer lista sea vac�a

inversa([], Lista, Lista).

% Entradas    : Primer1 -> Cabeza de la primer lista
%               Cola1 -> Cola de la primer lista
%               Lista2 -> Segunda lista
%               Lista3 -> Tercer lista
% Descripci�n : Verifica la regla 'inversa' usando de primer lista la
%		   primer cola original; de segunda la concatenaci�n de
%		   la primer cabeza y la segunda lista original; y como
%		   la tercer lista la tercer lista original.

inversa([Primer1|Cola1], Lista2, Lista3):- inversa(Cola1, [Primer1|Lista2], Lista3).

% Regla       : escribirRuta
% Entradas    : Primer -> Punto de partida de la ruta actual
%               Ruta -> Ruta que se debe seguir para llegar al destino
% Descripci�n : Inicia la impresi�n de la ruta con el primer nodo

escribirRuta([Primer|Ruta]):-
	write(Primer),
	escribirRutaAux(Ruta).

% Regla       : escribirRutaAux

% Entradas    : Su argumento debe ser una lista vac�a
% Descripci�n : Finaliza la impresi�n de una ruta. Condici�n de parada
%                  para 'escribirRuta'

escribirRutaAux([]):- write('').

% Entradas    : Siguiente -> Nodo siguiente al �ltimo nodo impreso en
%                  consola
%		Ruta -> Resto de la ruta que hace falta imprimir
% Descripci�n : Imprime los dem�s elementos de una ruta mediante
%		   recursi�n despu�sde haber impreso el punto de partida
%		   ('escrbirRuta')

escribirRutaAux([Siguiente|Ruta]):-
	write(' -> '),
	write(Siguiente),
	escribirRutaAux(Ruta).

