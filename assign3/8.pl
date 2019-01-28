sp(1,"one").
sp(2,"two").
sp(3,"three").
sp(4,"four").
sp(5,"five").
sp(6,"six").
sp(7,"seven").
sp(8,"eight").
sp(0,"zero").

spell(0).
spell(N) :- N1 is div(N,10),spell(N1),N2 is rem(N,10),sp(N2,X),write(X-"").