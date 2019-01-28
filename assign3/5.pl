range(L,H,L1) :- L>H, L1=[],!.
range(L,H,L1) :- L2 is L+1,range(L2,H,T),L1=[L|T].  