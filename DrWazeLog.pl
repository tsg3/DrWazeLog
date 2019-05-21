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

camino(X,Y,Z):- ruta(X,Y,Z).

concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).

inversa(L1,L2):- inversa(L1,[],L2).
inversa([],L,L).
inversa([H1|T1],L2,L3):- inversa(T1,[H1|L2],L3).

miembro(Elemento, [Elemento|_]).
miembro(Elemento, [_|Cola]):- miembro(Elemento, Cola).

rpath([target|reversed_path], distance).

shorterPath([H|Path], Dist) :-
	rpath([H|_], D), !, Dist < D,
        retract(rpath([H|_],_)),
	assert(rpath([H|Path], Dist)).
shorterPath(Path, Dist) :-
	assert(rpath(Path,Dist)).

traverse(From, Path, Dist) :-
	camino(From, T, D),
	not(miembro(T, Path)),
	shorterPath([T,From|Path], Dist+D),
	traverse(T,[From|Path],Dist+D).

traverse(From) :-
	retractall(rpath(_,_)),
	traverse(From,[],0).

traverse(_).

go(From, To) :-
	traverse(From),
	rpath([To|RPath], Dist), inversa([To|RPath], Path), Distance is round(Dist), writef('Shortest path is %w with distance %w = %w\n', [Path, Dist, Distance]).

go(From, To) :- writef('There is no route from %w to %w\n', [From, To]).

