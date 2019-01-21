

move(state(middle,onbox,middle,hasnot),get,state(middle,onbox,middle,has)).
move(state(P,onfloor,P,hasnot),climb,state(P,onbox,P,hasnot)).
move(state(P1,onfloor,P1,hasnot),push(P1,P2),state(P2,onfloor,P2,hasnot)) 
move(state(P,onfloor,B,hasnot),walk(P,P1),state(P1,onfloor,B,hasnot)) 

ispossible(state(_,_,_,has)) :- write("get").
ispossible(State) :- move(State,Move,State1),ispossible(State1),write(Move),nl.
