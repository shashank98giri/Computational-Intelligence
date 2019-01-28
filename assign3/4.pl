insert(X,T,1,[X|T]).
insert(X,[H|T],N,[G|L]) :- N1 is N-1, insert(X,T,N1,L), G is H.