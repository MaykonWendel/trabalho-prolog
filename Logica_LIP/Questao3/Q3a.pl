%fatos
%Item_A
%progenitor(X, Y)

progenitor(jose, joao).
progenitor(maria, joao).
progenitor(jose, ana).
progenitor(maria, ana).
progenitor(ana, helena).
progenitor(ana, joana).
progenitor(joao, mario).
progenitor(helena, carlos).
progenitor(mario, carlos).

%sexo

masculino(jose).
feminino(maria).
masculino(joao).
feminino(ana).
feminino(helena).
feminino(joana).
masculino(mario).
masculino(carlos).

%pai e mae

mae(Mae, Filho) :- feminino(Mae), progenitor(Mae, Filho).
pai(Pai, Filho) :- masculino(Pai), progenitor(Pai, Filho).

%irma e irmao
irmao(X, Y) :- masculino(X), progenitor(Z, X), progenitor(Z, Y), X \= Y.
irma(X, Y) :- feminino(X), progenitor(Z, X), progenitor(Z, Y), X \= Y.

%descendente
descendente(X, Y) :- progenitor(Y, X).
descendente(X, Y) :- progenitor(Y, Z), descendente(X, Z).

%avo e avoa
avo(Avo, Neto) :- masculino(Avo), progenitor(Avo, Pai), progenitor(Pai, Neto).
avoa(Avoa, Neto) :- feminino(Avoa), progenitor(Avoa, Mae), progenitor(Mae, Neto).

%tio e tia
tio(Tio, Sobrinho) :- masculino(Tio), irmao(Tio, Pai), progenitor(Pai, Sobrinho).
tia(Tia, Sobrinho) :- feminino(Tia), irma(Tia, Pai), progenitor(Pai, Sobrinho).

%primo e prima
primo(X, Y) :-
    masculino(X),
    progenitor(PX, X),
    progenitor(PY, Y),
    (irmao(PX, PY) ; irma(PX, PY)),
    X \= Y.
prima(X, Y) :-
    feminino(X),
    progenitor(PX, X),
    progenitor(PY, Y),
    (irmao(PX, PY) ; irma(PX, PY)),
    X \= Y.