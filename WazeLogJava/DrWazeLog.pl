% Hecho       : rutaCorta
% Descripci�n : Es un hecho din�mico usado para guardar las rutas con
%                  menos costo entre los nodos del grafo

:- dynamic
	rutaCorta/2.

% Regla       : verRutasCortas
% Entradas    : RutaCorta -> Lista de la ruta con nodos del grafo
%               Costo -> Sumatoria de los costos de la ruta
% Descripci�n : Tendr� �xito si la ruta dada junto a su costo es
%                  un hecho en la base de datos din�mica

verRutasCortas(RutaCorta,Costo):-
	rutaCorta(RutaCorta,Costo).

% Hecho       : ruta
% Descripci�n : Representa todas las direcciones (arcos) disponibles
%                  entre los lugares del mapa y su respectivo costo.

ruta(logramos, cartago, 23).
ruta(si , logramos, 1111).
ruta(cartago, paraiso, 10).
ruta(cartago, pacayas, 13).
ruta(cartago, belen, 8).
ruta(cartago, desamparados, 20).
ruta(cartago, prusia, 10).
ruta(pacayas, cervantes, 8).
ruta(pacayas, cartago, 13).
ruta(pacayas, belen, 15).
ruta(cervantes, coris, 5).
ruta(cervantes, cachi, 7).
ruta(cervantes, pacayas, 8).
ruta(turrialba, pacayas, 18).
ruta(coris, turrialba, 4).
ruta(paraiso, cervantes, 4).
ruta(paraiso, cachi, 10).
ruta(paraiso, orosi, 8).
ruta(desamparados, corralillo, 22).
ruta(desamparados, cartago, 20).
ruta(belen, desamparados, 8).
ruta(belen, pacayas, 15).
ruta(prusia, cartago, 10).
ruta(prusia, corralillo, 6).
ruta(corralillo, prusia, 6).
ruta(corralillo, desamparados, 22).
ruta(orosi, paraiso, 8).
ruta(orosi, cachi, 12).
ruta(cachi, turrialba, 40).
ruta(cachi, cervantes, 7).
ruta(cachi, paraiso, 10).
ruta(cachi, orosi, 12).

% Regla       : viajar

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Final -> Punto de llegada en el mapa
%               Ruta -> Ruta recorrida desde el inicio al final
%               CostoSumado -> Costo total de la ruta recorrida
% Descripci�n : Tendr� �xito si encuentra alguna ruta entre el punto
%		   inicial y el final

viajar(Inicio, Final, Ruta, CostoSumado):-
	recorrer(Inicio),
	rutaCorta(Ruta, Costo),
	inversa(Ruta,[Final|_]),
	CostoSumado is round(Costo).

% Entradas    : Cuatro argumentos cualquiera
% Descripci�n : Tendr� �xito siempre, y se ejecuta cuando no se
%                  encuentra una ruta entre dos puntos del mapa.

viajar(_, _, _, _):- !, fail.

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Final -> Punto de llegada en el mapa
%               RutaTotal -> Ruta recorrida con anterioridad
%               CostoTotal -> Costo de la ruta recorrida
% Descripci�n : Tendr� �xito si existe una ruta entre el nodo inicial y
%	           el nodo final, pero solo si no se solicitan nodos
%	           intermedios.

viajar(Inicio, [], Final, [], 0, RutaTotal, CostoTotal):-
	!, viajar(Inicio, Final, RutaTotal, CostoEncontrado),
	CostoTotal is round(CostoEncontrado).

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Final -> Punto de llegada en el mapa
%               RutaEncontrada -> Ultima ruta recorrida
%               CostoEncontrado -> Costo de la ultima ruta recorrida
% Descripci�n : Condici�n de parada para viajar. Analiza la �ltima ruta
%		   para completar la ruta total m�s corta posible entre
%		   los puntos inicio y final definidos al inicio de la
%		   recursi�n. Si existe una ruta, la imprime en la
%		   consola.

viajar(Inicio, [], Final, _, _, RutaEncontrada, CostoEncontrado):-
	!, viajar(Inicio, Final, [_|RutaEncontrada], CostoEncontrado), !.

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Siguiente -> Primer punto intermedio en el viaje
%               Demas -> Resto de puntos intermedios en el viaje
%               Final -> Punto de llegada en el mapa
%               RutaTotal -> Camino que falta por recorrer
%               CostoTotal -> Costo de las futuras rutas
% Descripci�n : Inicio de la recursi�n para determinar la ruta
%		   total. Tiene �xito si encuentra una ruta entre el
%		   punto de inicio y el final pasando por todos los
%		   puntos intermedios.

viajar(Inicio, [Siguiente|Demas], Final, [], 0, RutaTotal, CostoTotal):-
	!, viajar(Inicio, Siguiente, RutaEncontrada, CostoEncontrado), !,
	concatenar(RutaEncontrada, SiguienteRuta, RutaTotal),
	viajar(Siguiente, Demas, Final, RutaEncontrada, round(CostoEncontrado), SiguienteRuta, CostoSiguiente),
	CostoTotal is round(CostoEncontrado + CostoSiguiente).

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Siguiente -> Primer punto intermedio en el viaje
%               Demas -> Resto de puntos intermedios en el viaje
%               Final -> Punto de llegada en el mapa
%               Ruta -> Ruta recorrida con anterioridad
%               Costo -> Costo de la ruta recorrida
%               RutaFutura -> Camino que falta por recorrer
%               CostoFuturo -> Costo de las futuras rutas
% Descripci�n : Tendr� �xito si encuentra rutas entre el punto de inicio
%	           y el primer punto intermedio, y este con el siguiente
%	           punto intermedio, etc; y si existe una ruta entre el
%	           �ltimo punto intermedio y el punto de llegada.

viajar(Inicio, [Siguiente|Demas], Final, Ruta, Costo, RutaFutura, CostoFuturo):-
	!, viajar(Inicio, Siguiente, [_|RutaEncontrada], CostoEncontrado), !,
	concatenar(Ruta, RutaEncontrada, RutaTotal),
	concatenar(RutaEncontrada, RutaSiguiente, RutaFutura),
	viajar(Siguiente, Demas, Final, RutaTotal, round(CostoEncontrado + Costo), RutaSiguiente, CostoSiguiente),
	CostoFuturo is round(CostoEncontrado + CostoSiguiente).

% Regla       : respuestaWazeLog

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Final -> Punto de llegada en el mapa
% Descripci�n : Imprime en consola que no se encontr� una ruta entre los
%                  nodos inicial y final

respuestaWazeLog(Inicio, Final, 0, 0):-
	write('No hay rutas para ir desde '),
	write(Inicio),
	write(' hasta '),
        write(Final),
	write(' .\n').

% Entradas    : Inicio -> Punto de inicio en el mapa
%               Final -> Punto de llegada en el mapa
%               Ruta -> Ruta recorrida con anterioridad
%               Costo -> Costo de la ruta recorrida
% Descripci�n : Imprime en consola la ruta requerida para realizar el
%                  recorrido deseado por el cliente, adem�s de su costo
%		   correspondiente.

respuestaWazeLog(Inicio, Final, Ruta, Costo):-
	write('La mejor ruta para ir desde '),
	write(Inicio),
	write(' hasta '),
	write(Final),
	write(' es '),
	escribirRuta(Ruta),
	write(', con un costo de '),
	write(Costo),
	write(' horas.\n').

% Regla       : concatenar

% Entradas    : Lista -> lista de elementos
% Descripci�n : Tendr� �xito si la primer lista es vac�a y las otras dos
%                  listas son iguales

concatenar([],Lista,Lista).

% Entradas    : Elemento -> Primer elemento de las listas 1 y 3
%		Resto1, Resto3 -> Colas de las listas 1 y 3
%		Lista2 -> Lista de elementos
% Descripci�n : Analiza 'concatenar' para la cola de la lista 1, la
%		   lista 2 y la cola de la lista 3 si el primer elemento
%		   de la lista 1 y 3 son iguales

concatenar([Elemento|Resto1],Lista2,[Elemento|Resto3]):- concatenar(Resto1,Lista2,Resto3).

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
	retractall(rutaCorta(_, _)),
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
	rutaCorta(RutaCortaEncontrada, CostoEncontrado),
	inversa(RutaCortaEncontrada, [Primer|_]), !,
	Costo < CostoEncontrado,
        retract(rutaCorta(RutaCortaEncontrada, _)),
	inversa([Primer|Ruta], NuevaRutaCorta),
	assert(rutaCorta(NuevaRutaCorta, Costo)).

% Entradas    : Ruta -> Ruta seguida hasta llegar al nodo actual
%               Costo -> Costo total de la ruta correspondiente
% Descripci�n : A�ade la actual ruta a la base de datos din�micas de las
%                  rutas m�s cortas

rutaMasCorta(Ruta, Costo):-
	inversa(Ruta,RutaCorta),
	assert(rutaCorta(RutaCorta,Costo)).

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
