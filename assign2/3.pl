
divisible(X,Y) :- X>Y,(0 is mod(X,Y);divisible(X,Y+1)).
prime(X) :- not(divisible(X,2)).

check(N,X,E) :- (X<div(N,2)+1),((prime(X),N1 is N-X,prime(N1),E =X+N1);(X1 is X+1,check(N,X1,E))).
goldbach(N,E) :- check(N,2,E).