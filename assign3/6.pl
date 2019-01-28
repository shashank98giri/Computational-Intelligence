forbidden-state([east,west,west,_]).
forbidden-state([east,_,west,west]).
forbidden-state([west,_,east,east]).
forbidden-state([west,east,east,_]).

check([X1,X2,X3,X4]) :- not(forbidden-state([X1,X2,X3,X4])).
inv1(X1,Y1) :- (X1==east,Y1 = west); (X1==west,Y1 = east).

visited([west,west,west,west]).
move([east,east,east,east]).
move([X1,X1,X3,X4]) :-inv1(X1,Y1),check([Y1,Y1,X3,X4]),not(visited([Y1,Y1,X3,X4])),assert(visited([Y1,Y1,X3,X4])),
					move([Y1,Y1,X3,X4]),
					write("carry cabbage from":X1-Y1),nl,!. 
move([X1,X2,X1,X4]) :- inv1(X1,Y1),check([Y1,X2,Y1,X4]),not(visited([Y1,X2,Y1,X4])),assert(visited([Y1,X2,Y1,X4])),
					move([Y1,X2,Y1,X4]),
					write("carry goat from":X1-Y1),nl,!.
move([X1,X2,X3,X1]) :- inv1(X1,Y1),check([Y1,X2,X3,Y1]),not(visited([Y1,X2,X3,Y1])),assert(visited([Y1,X2,X3,Y1])),
					move([Y1,X2,X3,Y1]),
					write("carry tiger from":X1-Y1),nl,!.
move([X1,X2,X3,X4]) :- inv1(X1,Y1),check([Y1,X2,X3,X4]),not(visited([Y1,X2,X3,X4])),assert(visited([Y1,X2,X3,X4])),
					move([Y1,X2,X3,X4]),
					write("move fisherman from":X1-Y1),nl,!.
					
