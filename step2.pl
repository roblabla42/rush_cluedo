sameIndex([ E | _ ],[ F | _ ],E,F).

sameIndex([ _ | R ],[ _ | S ],E,F) :-
  sameIndex(R,S,E,F).

position([E|_],1,E).
position([_|L],Position,Elem) :-
  Position > 1,
  N is Position-1,
  position(L,N,Elem).

gauche(L, [_|R], E, F) :- sameIndex(L,R,E,F).
droite([_|R], L, E, F) :- sameIndex(R,L,E,F).

voisin(L1, L2, E, F) :- droite(L1, L2, E, F).
voisin(L1, L2, E, F) :- gauche(L1, L2, E, F).
                                                        
winner([E|_], E).
winner([_|Q], E) :- winner(Q, E).

resolve(Houses,Countries,Beverages,Cigars,Pets) :-
  length(Houses,5),length(Countries,5),length(Beverages,5),length(Cigars,5),length(Pets,5),
  sameIndex(Houses,Countries,rouge,anglais),
  sameIndex(Pets,Countries,chien,suedois),
  sameIndex(Beverages,Countries,the,danois),
  gauche(Houses,Houses,vert,blanc),
  sameIndex(Houses,Beverages,vert,cafe),
  sameIndex(Cigars,Pets,pall_Mall,oiseaux),
  sameIndex(Houses,Cigars,jaune,dunhill),
  position(Beverages,3,lait),
  position(Countries,1,norvegien),
  voisin(Cigars,Pets,blend,chats),
  voisin(Pets, Cigars,cheval, dunhill),
  sameIndex(Cigars,Beverages,blue_Master,biere),
  sameIndex(Countries,Cigars,allemand,prince),
  voisin(Countries,Houses,norvegien,bleue),
  voisin(Cigars,Beverages,blend,eau),
  winner(Pets, poisson).