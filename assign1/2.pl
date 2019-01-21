parent(john,ann).
parent(jim,john).
parent(jim,keith).
parent(mary,ann).
parent(mary,sylvia).
parent(brian,sylvia).
female(sylvia).
female(ann).
male(brian).
male(keith).
male(jim).

brother(X,Y) :- parent(Z,X),parent(Z,Y),male(X),X\=Y.
%uncle
uncle(X,Y) :- parent(Z,Y),brother(X,Z).

xor(X,Y) :- (X,Y);not(X;Y).
mother(X,Y) :- female(X),parent(X,Y).
father(X,Y) :- male(X),parent(X,Y).

%half-sister
half-sister(X,Y) :- xor((mother(Z,Y),mother(Z,X)),(father(Z,Y),father(Z,X))).
