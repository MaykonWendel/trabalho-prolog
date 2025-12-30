%fatos
%adicionar(X, L1, L2)
%L2 é a lista que contém X e os elementos de L1.

adiciona(X, L1, [X|L1]).

%apagar(X, L1, L2).
%L2 é L1 sem o elemento X.

apaga(_, [], []).
apaga(X, [X|Resto], Resto) :- !.
apaga(X, [Inicial|Resto], [Inicial|R]) :- apaga(X, Resto, R).

%concatena(L1, L2, L3).
%L3 é a concatenação de L1 com L2.

concatena([], L, L).
concatena([Inicial|Resto], L2, [Inicial|R]) :- concatena(Resto, L2, R).

%membro(X, L)
%verifica se X é membro da lista L.

membro(X, [X|_]).
membro(X, [_|Resto]) :- membro(X, Resto).

%comprimento(N, L)
%N é o número de elementos da lista L.

comprimento(0, []).
comprimento(N, [_|Resto]) :- comprimento(N1, Resto), N is N1 + 1.