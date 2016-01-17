/*

    MAC, MCSs, MRes -
    Module 531: Laboratory (Prolog)

    Comp 2: 276 Introduction to Prolog

    File: family.pl - cjh

*/

child_of( emmeline, frank ).
child_of( amelia, frank ).
child_of( harold, frank ).
child_of( chris, amelia ).
child_of( chris, john ).
child_of( emlyn, chris ).
child_of( emlyn, elizabeth ).
child_of( brendon, chris ).
child_of( brendon, elizabeth ).
child_of( irene, maurice ).
child_of( les, maurice ).
child_of( elizabeth, irene ).
child_of( elizabeth, george ).
child_of( margaret, irene ).
child_of( margaret, george ).
child_of( rebecca, margaret ).
child_of( louise, margaret ).
child_of( nick, margaret ).
child_of( rebecca, peter ).
child_of( louise, peter ).
child_of( nick, peter ).

male( frank ).
male( harold ).
male( chris ).
male( john ).
male( emlyn ).
male( brendon ).
male( maurice ).
male( les ).
male( nick ).
male( peter ).
male( george ).

female( emmeline ).
female( amelia ).
female( elizabeth ).
female( irene ).
female( margaret ).
female( rebecca ).
female( louise ).

mother_of(M, X) :-
  female(M),
  child_of(X, M).

grandparent_of(GP, X) :-
  child_of(X, P),
  child_of(P, GP).

daughter_of(D, X) :-
  female(D),
  child_of(D, X).

% Assumes married couples have children
married_to(X, Y) :-
  child_of(C, X),
  child_of(C, Y),
  X \= Y.

sibling_of(S, X) :-
  child_of(S, P),
  child_of(X, P),
  S \= X.

uncle_of(Unc, X) :-
  male(Unc),
  child_of(X, P),
  child_of(P, GP),
  child_of(Unc, GP),
  P \= Unc.

uncle_of(Unc, X) :-
  male(Unc),
  child_of(X, P),
  child_of(P, GP),
  child_of(S, GP),
  married_to(Unc, S),
  P \= S.

niece_of(N, X) :-
  daughter_of(N, P),
  child_of(P, GP),
  child_of(X, GP),
  P \= X.

% end of data
