% Couples
couple(marc,anne).
couple(luc,betty).
couple(jules,lisa).
couple(leon,sylvie).
couple(loic,eve).
couple(paul,julie).

% Solo
couple(jean,null).
couple(gerard,null).
couple(jacques,null).
couple(herve,null).
couple(null,valerie).

% Parent
pere_de(jean,marc).
pere_de(jules,marc).
pere_de(leon,marc).
pere_de(lisa,luc).
pere_de(loic,luc).
pere_de(gerard,luc).
pere_de(jacques,jules).
pere_de(herve,leon).
pere_de(julie,leon).
pere_de(paul,loic).
pere_de(valerie,loic).

homme(X) :-
  X \== null,couple(X,_).
femme(X) :-
  X \== null,couple(_,X).

mari_de(X,Y) :-
  X \== null,Y \== null,couple(X,Y).

femme_de(X,Y) :-
  mari_de(Y,X).

enfant_de(Pere,Enfant) :-
  pere_de(Enfant,Pere).
enfant_de(Mere,Enfant) :-
  couple(Pere,Mere),pere_de(Enfant,Pere).

beaupere_de(Homme,Beaupere) :-
  couple(Homme,Femme),pere_de(Femme,Beaupere).
beaupere_de(Femme,Beaupere) :-
  couple(Homme,Femme),pere_de(Homme,Beaupere).

bellemere_de(Pers,Bellemere) :-
  couple(Beaupere,Bellemere),beaupere_de(Pers,Beaupere).

ancetre_de(Enfant,Ancetre) :-
  enfant_de(Ancetre,Enfant).
ancetre_de(Enfant,Ancetre) :-
  enfant_de(Parent,Enfant),ancetre_de(Parent,Ancetre).