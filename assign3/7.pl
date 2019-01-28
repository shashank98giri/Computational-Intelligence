hanoi(X,Y,Z,1) :- write("move one disc from": X - Y),nl,!.
hanoi(X,Y,Z,N) :- N1 is N-1,hanoi(X,Z,Y,N1),hanoi(X,Y,Z,1),hanoi(Z,Y,X,N1).