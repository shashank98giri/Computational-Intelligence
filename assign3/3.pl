remove(1,[_|T],T).
remove(N,[H|T],[G|L]) :- N1 is N-1,remove(N1,T,L), G is H. 