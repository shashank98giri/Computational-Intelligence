p([X,Y,Z,U,V],X,Y,Z,U,V).
first([H|T],H).
second([X,H|T],H).
nth(1,[T|_],T).
nth(N,[_|T],X) :- N1 is N-1,nth(N1,T,X).
