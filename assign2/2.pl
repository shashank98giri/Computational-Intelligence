leng([],0).
leng([H|T],X) :- leng(T,X1),X is X1+1.


member([H|_],H).
member([_|T],H) :- member(T,H).

append([],L,L).
append([H|T],L2,[H|R]) :- append(T,L2,R).

las([X],X).
las([H|T],X) :- las(T,X).

rev([],L,L).
rev([H|R],F,L) :- rev(R,F,[H|L]).
