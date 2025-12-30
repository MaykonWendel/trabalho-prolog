%fatos
%Grafo guarda cada aresta uma vez, preferindo ter x < y.

aresta(0,1).
aresta(0,2).
aresta(0,4).
aresta(1,2).
aresta(1,3).
aresta(2,4).
aresta(2,3).
aresta(3,4).

%vertice_adjacente

adjacente(X,Y) :- aresta(X,Y) ; aresta(Y,X).

%vertices_diferentes

diferentes([]).
diferentes([Inicial|Final]) :- \+ member(Inicial,Final) , diferentes(Final).

%caminho para a lista

caminho([_]).
caminho([A,B|Resto]) :- adjacente(A,B), caminho([B|Resto]).
caminho_simples(L) :- caminho(L), diferentes(L).

%Grau do vértice

grau(V,G) :- findall(N, adjacente(V, N), Ns), sort(Ns, Unico), length(Unico, G).