% peon, chou, chevre, loup a gauche
% chevre, loup seuls => Game Over
% chevre, chou seuls => Game Over
% peon, chou, chevre, loup a droite => Game Won
% Barque contient peon obligatoirement
% Barque peut contenir un autre passager optionellement.

%peon = 0
%loup = 1
%chevre = 2
%chou = 3

change(e,w).
change(w,e).

move([X,X,Chevre,Chou],loup,[Y,Y,Chevre,Chou]) :- change(X,Y).
move([X,Loup,X,Chou],chevre,[Y,Loup,Y,Chou]) :- change(X,Y).
move([X,Loup,Chevre,X],chou,[Y,Loup,Chevre,Y]) :- change(X,Y).
move([X,Loup,Chevre,Chou],rien,[Y,Loup,Chevre,Chou]) :- change(X,Y).

eviteUnCarnage(X,_,X).
eviteUnCarnage(X,X,_).

legal([Peon, Loup, Chevre, Chou]) :-
  eviteUnCarnage(Peon, Loup, Chevre),
  eviteUnCarnage(Peon, Chevre, Chou).

solutions([e,e,e,e], []).

solutions(Position, [FirstMove|OtherMoves]) :-
  move(Position,FirstMove,NextPos),
  legal(NextPos),
  solutions(NextPos, OtherMoves).

resolve :-
  length(Solutions,7),
  solutions([w,w,w,w], Solutions),
  afficherTableau(Solutions).

afficherTableau([Head|Tail]) :-
  write(Head),nl,afficherTableau(Tail).
