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

inversa(Lista1, Lista2):- inversa(Lista1, [], Lista2).
inversa([], Lista, Lista).
inversa([Primer1|Cola1], Lista2, Lista3):- inversa(Cola1, [Primer1|Lista2], Lista3).

miembro(Elemento, [Elemento|_]).
miembro(Elemento, [_|Cola]):- miembro(Elemento, Cola).

:- dynamic
	rutaInversa/2.

rutaInversa([final|rutaInversa], costo).

rutaMasCorta([Primer|Ruta], Costo):-
	rutaInversa([Primer|_], CostoEncontrado), !,
	Costo < CostoEncontrado,
        retract(rutaInversa([Primer|_], _)),
	assert(rutaInversa([Primer|Ruta], Costo)).
rutaMasCorta(Ruta, Costo):-
	assert(rutaInversa(Ruta,Costo)).

recorrer(Inicio, Ruta, Costo):-
	ruta(Inicio, RutaEncontrada, CostoEncontrada),
	not(miembro(RutaEncontrada, Ruta)),
	rutaMasCorta([RutaEncontrada, Inicio|Ruta], Costo + CostoEncontrada),
	recorrer(RutaEncontrada, [Inicio|Ruta], Costo + CostoEncontrada).
recorrer(Inicio):-
	retractall(rutaInversa(_, _)),
	recorrer(Inicio, [], 0).
recorrer(_).

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
viajar(Inicio, Final):-
	write('No hay rutas para ir desde '),
	write(Inicio),
	write(' hasta '),
        write(Final),
	write(' .\n').

escribirRuta([Primer|Ruta]):-
	write(Primer),
	escribirRutaAux(Ruta).

escribirRutaAux([]):- write('').
escribirRutaAux(Ruta):- write(' -> '), escribirRuta(Ruta).
