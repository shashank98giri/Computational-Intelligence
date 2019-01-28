replace([],X,Y,[]).
replace([H|T],H,Y,[G|L]) :- replace(T,H,Y,L), G is Y,!.
replace([H|T],X,Y,[G|L]) :- replace(T,H,Y,L), G is H.