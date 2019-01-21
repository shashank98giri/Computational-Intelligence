
visited(0,0).

state(2,0).
state(X,Y) :- 
			(X<4,((not(visited(4,Y)),assert(visited(4,Y)),write("Fill 4L jug\n"),state(4,Y));
				(X1 is min(X+Y,4),Y1 is max(Y-4+X,0),not(visited(X1,Y1)),assert(visited(X1,Y1)),write("Empty 3L jug into 4L jug until 4L is full\n"),state(X1,Y1))));
			(Y<3,((not(visited(X,3)),assert(visited(X,3)),write("Fill 3L jug\n"),state(X,3));
				(X1 is max(X+Y-3,0),Y1 is min(Y+X,3),not(visited(X1,Y1)),assert(visited(X1,Y1)),write("Empty 4L jug into 3L jug until 3L is full\n"),state(X1,Y1))));
			(Y>0,not(visited(X,0)),assert(visited(X,0)),write("Empty 3L jug\n"),state(X,0));
			(X>0,not(visited(0,Y)),assert(visited(0,Y)),write("Empty 4L jug\n"),state(0,Y)).


