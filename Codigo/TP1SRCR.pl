%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Universidade do Minho
% SRCR - LEI 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% TP1 Março 2015

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic filho/2.
:- dynamic pai/2.
:- dynamic avo/2.
:- dynamic irmao/2.
:- dynamic tio/2.
:- dynamic sobrinho/2.
:- dynamic bisavo/2.
:- dynamic trisavo/2.
:- dynamic tetravo/2.
:- dynamic neto/2.
:- dynamic descendente/2.
:- dynamic grau/3.
:- dynamic primo/2.
:- dynamic relacao/3.
:- dynamic naturalidade/2.
:- dynamic equalNaturalidade/2.
:- dynamic solucoes/3.
:- dynamic insere/1.
:- dynamic teste/1.
:- dynamic evolucao/1.
:- dynamic comprimento/2.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante estrutural: nao permitir a insercao de conhecimento repetido

+filho( F,P ) :: (solucoes( (F,P),(filho( F,P )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).

+pai( P,F ) :: (solucoes( (P,F),(pai( P,F )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).

+avo( A,N ) :: (solucoes( ( A,N ), (avo( A,N )),S ),
					comprimento( S,C ),
					C==1
					).

+bisavo( BA,BN ) :: (solucoes( ( BA,BN ), (bisavo( BA,BN )),S ),
					comprimento( S,C ),
					C==1
					).

+trisavo( T,N ) :: (solucoes( ( T,N ), (trisavo( T,N )),S ),
					comprimento( S,C ),
					C==1
					).

+tetravo( T,N ) :: (solucoes( ( T,N ), (tetravo( T,N )),S ),
					comprimento( S,C ),
					C==1
					).                  

+neto( N,A ) :: (solucoes( ( N,A ), (neto( N,A )),S ),
					comprimento( S,C ),
					C==1
					).

+descendente( D,A ) :: (solucoes( ( D,A ), (descendente( D,A )),S ),
					comprimento( S,N ),
					N==1
					).

+grau( D,A,G ) :: (solucoes( ( D,A,G ), (grau( D,A,G )),S ),
					comprimento( S,N ),
					N==1
					).

+irmao( X,Y ) :: (solucoes( ( X,Y ), (irmao( X,Y )),S ),
					comprimento( S,C ),
					C==1
					).

+genero( P,G ) :: (solucoes( ( P,G ), (genero( P,G )),S ),
					comprimento( S,N ),
					N==1
					).

+naturalidade( P,N ) :: (solucoes( ( P,N ), (naturalidade( P,N )),S ),
					comprimento( S,C ),
					C==1
					).


+irmao( X,Y ) :: (solucoes( (X,Y), (irmao( X,Y )),S ),
					comprimento( S,C ),
					C==1
					).

+tio( X,Y ) :: (solucoes( (X,Y), (tio( X,Y )),S ),
					comprimento( S,C ),
					C==1
					).

+primo( X,Y ) :: (solucoes( (X,Y), (primo( X,Y )),S ),
					comprimento( S,C ),
					C==1
					).

+relacao( X,Y ) :: (solucoes( (X,Y), (relacao( X,Y )),S ),
					comprimento( S,C ),
					C==1
					).

+sobrinho( X,Y ) :: (solucoes( (X,Y), (sobrinho( X,Y )),S ),
					comprimento( S,C ),
					C==1
					).

+pai( P,F ) :: (solucoes( Ps, (pai( Ps,F )),S ),
					comprimento( S,C ),
					C=<2
					).

+neto( N,A ) :: (solucoes( As, (avo( As,N )),S ),
					comprimento( S,C ),
					C=<4
					).

+avo( A,N ) :: (solucoes( As, (avo( As,N )),S ),
					comprimento( S,C ),
					C=<4
					).

+bisavo( BA,BN ) :: (solucoes( BAs, (bisavo( BAs,BN )),S ),
					comprimento( S,C ),
					C=<8
					).

+trisavo( TA,TN ) :: (solucoes( TAs, (trisavo( TAs,TN )),S ),
					comprimento( S,C ),
					C=<16
					).

+tetravo( TA,TN ) :: (solucoes( TAs, (trisavo( TAs,TN )),S ),
					comprimento( S,C ),
					C=<32
					).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}
	filho(Henrique,Sandra).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}listing

pai( P,F ) :-
    filho( F,P ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A,N ) :-
	filho( N,X ) , pai( A,X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado irmao: Irmao1,Irmao2 -> {V,F}

irmao(X,Y):- pai(P,X), pai(P,Y), X\==Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado tio: Tio,Sobrinho -> {V,F}

tio(T,S):- irmao(T,X), pai(X,S).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sobrinho: Sobrinho,Tio -> {V,F}

sobrinho(S,T):- tio(T,S).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo( B,N ) :-
	avo( A,N ) , filho( A,B ).

bisavo( B,N ) :-
	avo( B,X ) , filho( N,X ).
	
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado trisavo: Trisavo,Trisneto -> {V,F}

trisavo( T,N ) :-
	bisavo( A,N ), filho( A,T ).

trisavo( T,N ) :-
	bisavo( T,X ), filho( N,X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado tetravo: Tetravo,Tetraneto -> {V,F}

tetravo( T,N ) :-
	filho( N,X ), trisavo( T,X ).
tetravo( T,N ) :-
	filho( A,T ), trisavo( A,N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado neto: Neto,Avo -> {V,F}

neto( N,A ) :-
	avo( A,N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

descendente( D,A ) :-	
	filho(D,A). 

descendente( D,A ) :-
	filho( D,X ) , descendente( X,A ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendente: Ascendente,Descendente -> {V,F}

ascendente( A,D ) :-	
	descendente(A,D). 
	
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado grau: Descendente,Ascendente,Grau -> {V,F}

grau( D,A,1 ) :-
	 filho( D,A ).

grau( D,A,G ) :-
	filho( D,X ) , grau( X,A,N ), N is G+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado primo: Primo1,Primo2 -> {V,F}

primo(P1,P2):- pai(X,P1), tio(X,P2).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado relacao: Pessoa1,Pessoa2,Relacao -> {V,F}

relacao( P1, P2, filho ) :-	
			filho(P1,P2).

relacao( P1, P2, pai ) :-	
			pai(P1,P2).

relacao( P1, P2, avo ) :-
			avo(P1,P2).	

relacao( P1, P2, bisavo ) :-
			bisavo(P1,P2).	

relacao( P1, P2, trisavo ) :-
			trisavo(P1,P2).	

relacao( P1, P2, tetravo ) :-
			tetravo(P1,P2).	

relacao( P1, P2, neto ) :-
			neto(P1,P2).	

relacao( P1, P2, descendente ) :-
			descendente(P1,P2).	

relacao( P1, P2, irmao ) :-
			irmao(P1,P2).	

relacao( P1, P2, tio ) :-
			tio(P1,P2).	

relacao( P1, P2, primo ) :-
			primo(P1,P2).	

relacao( P1, P2, sobrinho ) :-
			sobrinho(P1,P2).	

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado naturalidade: Pessoa,Naturalidade -> {V,F}

naturalidade(joao,braga).
naturalidade(jose,porto).
naturalidade(maria,braganca).
naturalidade(joana,braga).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado equalNaturalidade: Pessoa1,Pessoa2 -> {V,F}


equalNaturalidade(P1,P2) :- 
				naturalidade(P1,X), naturalidade(P2,X).








%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Extensao do predicado solucoes: Termo,Questao,Listasolucoes ->{V,F} 


%solucoes( T,Q,S ):-
%			T, 
%			assert(temp(X)),
%			fail.
%solucoes( T,Q,S ):-
%			assert(temp())

solucoes(T,Q,S):-
		findall(T,Q,S).

insere(T):-
	assert(T).
insere(T):- retract(T),!,fail.

teste([]).
teste([I|R]):- I,teste(R).

evolucao( T ) :-
	solucoes(I,+T::I,S),
	insere(T),
	teste(S).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Extensao do predicado comprimento: Lista,Comprimento ->{V,F} 

comprimento([],0).
comprimento([X],1).
comprimento([Y|L],C):-
		comprimento(L,N), C is N+1.




















%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Extensao do predicado pertence: Lista,Elemento ->{V,F} 	

pertence([],X):- fail.
pertence([Y|L],X):- Y=X.
pertence([Y|L],X):- pertence(L,X).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagar: Elemento,L1,L2 -> {V,F}

apagar(E,[],[]).
apagar(E,[E|L],L).
apagar(E,[X|L],[X|R]):- apagar(E,L,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado equalsLista: L1,L2 -> {V,F}

equalsLista([],[]).
equalsLista(L1,L2):- sublista(L1,L2), sublista(L2,L1).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado subLista: L1,L2 -> {V,F}

sublista(L,S) :- concatenar(L3,L2,L),
		concatenar(L1,S,L3).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado concatenar: L1,L2,R -> {V,F}

concatenar(L,[],L).
concatenar([],L,L).
concatenar([X|T],R,[X|Z]):- concatenar(T,R,Z).
