femme(anne).
femme(lisa).
femme(sylvie).
femme(julie).
femme(betty).
femme(eve).
femme(valerie).

homme(marc).
homme(jean).
homme(jules).
homme(jacques).
homme(leon).
homme(herve).
homme(paul).
homme(luc).
homme(loic).
homme(gerard).

mari_de(anne,marc).
mari_de(lisa,jules).
mari_de(sylvie,leon).
mari_de(julie,paul).
mari_de(betty,luc).
mari_de(eve,loic).

femme_de(Homme,Femme) :-
  mari_de(Femme,Homme).

beaupere_de(Femme,Beaupere) :-
  mari_de(Femme,Homme),enfant_de(Beaupere,Homme),homme(Beaupere).
beaupere_de(Homme,Beaupere) :-
  femme_de(Homme,Femme),enfant_de(Beaupere,Femme),homme(Beaupere).

bellemere_de(Homme,Bellemere) :-
  femme_de(Homme,Femme),enfant_de(Bellemere,Femme),femme(Bellemere).
  % Verifie que Beaupere est le beau-pere de Femme.

enfant_de(marc,jean).
enfant_de(marc,jules).
enfant_de(marc,leon).
enfant_de(jules,jacques).
enfant_de(luc,lisa).
enfant_de(luc,loic).
enfant_de(luc,gerard).
enfant_de(leon,heve).
enfant_de(leon,julie).
enfant_de(loic,paul).
enfant_de(loic,valerie).

enfant_de(Mere,Enfant) :-
  mari_de(Mere,Pere),
  enfant_de(Pere,Enfant).

ancetre_de(Enfant,Parent) :-
  enfant_de(Parent,Enfant).
ancetre_de(Enfant,Parent) :-
  enfant_de(X,Enfant),ancetre_de(X,Parent).