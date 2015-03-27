femme(anne).
femme(betty).
femme(lisa).
femme(sylvie).
femme(eve).
femme(julie).
femme(valerie).

homme(marc).
homme(luc).
homme(jean).
homme(jules).
homme(leon).
homme(loic).
homme(gerard).
homme(jacques).
homme(herve).
homme(paul).

mari_de(anne,marc).
mari_de(betty,luc).
mari_de(lisa,jules).
mari_de(sylvie,leon).
mari_de(eve,loic).
mari_de(julie,paul).

femme_de(Mec,Femme) :-
  mari_de(Femme,Mec).

enfant_de(anne,jean).
enfant_de(anne,jules).
enfant_de(anne,leon).
enfant_de(lisa,jacques).
enfant_de(sylvie,herve).
enfant_de(sylvie,julie).
enfant_de(betty,lisa).
enfant_de(betty,loic).
enfant_de(betty,gerard).
enfant_de(eve,paul).
enfant_de(eve,valerie).

enfant_de(Homme,Enfant) :-
  femme_de(Homme,X),enfant_de(X,Enfant).

beaupere_de(Enfant,Homme) :-
  homme(Homme),enfant_de(femme_de(Enfant),Homme).
beaupere_de(Enfant,Homme) :-
  homme(Homme),enfant_de(mari_de(Enfant),Homme).

bellemere_de(Enfant,Femme) :-
  femme(Femme),enfant_de(femme_de(Enfant),Femme).
bellemere_de(Enfant,Femme) :-
  femme(Femme),enfant_de(mari_de(Enfant),Femme).

ancetre_de(Enfant,Parent) :-
  enfant_de(Parent,Enfant).
ancetre_de(Enfant,Parent) :-
  enfant_de(X,Enfant),ancetre_de(X,Parent).