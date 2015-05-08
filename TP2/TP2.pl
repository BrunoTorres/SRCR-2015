										
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	STAND DE AUTOMÓVEIS USADOS	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Universidade do Minho
% SRCR - LEI 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% TP2 Abril 2015

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Sistema de Representação de Conhecimento e Raciocínio com capacidade para caraterizar um universo de comércio automóvel.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes dos predicados

:- op( 900,xfy,'::' ).
:- dynamic automovel/8.
:- dynamic matricula/3.
:- dynamic cor/2.
:- dynamic conservacao/2.
:- dynamic preco/2.
:- dynamic registoCompra/3.
:- dynamic registoVenda/3.
:- dynamic '-'/1.
:- dynamic excecao/1.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%%%%%%%%%%%%%%%%%%%%%%%%%%  INVARIANTES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Invariante estrutural: nao permitir a insercao de conhecimento repetido

+automovel( CA, C, MA, MO, AF, CB, P, L ) :: (solucoes( (CA, C, MA, MO, AF, CB, P, L ),(automovel( CA, C, MA, MO, AF, CB, P, L  )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).

+matricula( M, A, AR ) :: (solucoes( (M, A, AR),(matricula( M, A, AR )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).

+cor( C, A ) :: (solucoes( ( C, A ), (cor( C, A )),S ),
					comprimento( S,N ),
					N==1
					).

+conservacao( C, A ) :: (solucoes( ( C, A ), (conservacao( C, A )),S ),
					comprimento( S,N ),
					N==1
					).

+preco( P, A ) :: (solucoes( ( P, A ), ( preco( P, A ) ), S ),
					comprimento( S,N ),
					N==1
					).
+registoVenda( V, A, P ) :: (solucoes( ( V, A, P ), ( registoVenda( V, A, P ) ), S ),
					comprimento( S,N ),
					N==1
					).
+registoCompra( V, A, P ) :: (solucoes( ( V, A, P ), ( registoCompra( V, A, P ) ), S ),
					comprimento( S,N ),
					N==1
					).

% Invariante: nao permitir a associação de uma mesma matrícula a um carro
+matricula( M, A, AR ) :: (solucoes( ( As, ARs ),(matricula( M, As, ARs )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).


% Invariante: nao permitir dois automóveis com o mesmo códigoAutomóvel
+automovel( CA, C, MA, MO, AF, CB, P, L ) :: (solucoes( ( Cs, MAs, MOs, AFs, CBs, Ps, Ls ),(automovel( CA, Cs, MAs, MOs, AFs, CBs, Ps, Ls  )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).

% Invariante: nao permitir que um mesmo código de automóvel exista em dois registos
+registoVenda( V, A, P ) :: (solucoes( ( Vs, A, Ps ), ( registoVenda( Vs, A, Ps ) ), S ),
					comprimento( S,N ),
					N==1
					).
+registoCompra( V, A, P ) :: (solucoes( ( Vs, A, Ps ), ( registoCompra( Vs, A, Ps ) ), S ),
					comprimento( S,N ),
					N==1
					).
+excecao( Termo ) :: (solucoes( Termo, ( excecao( Termo ) ), S ),
					comprimento( S,N ),
					N==1
					).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado automovel:  CodigoAutomovel, Construtor, Marca, Modelo, AnoDeFabrico, Combustivel, Potencia, Lugares-> {V,F,D}
	-automovel( CA, C, MA, MO, AF, CB, P, L ) :-
    nao( automovel( CA, C, MA, MO, AF, CB, P, L ) ),
    nao( excecao( automovel( CA, C, MA, MO, AF, CB, P, L ) ) ).

	automovel(a0001, 'Fiat', 'Ferrari', '458 Italia', 2014, gasolina, 577, 2).
	automovel(a0002, 'Fiat', 'Fiat', 'Punto', 1997, gasolina, 54, 5).
	automovel(a0003, 'Volkswagen', 'Lamborghini', 'Aventador', 2013, gasolina, 700, 2).
	automovel(a0004, 'Fiat', 'Fiat', 'Uno', 1993, gasolina, 45, 5).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado matricula: Matricula, Automovel, AnoDeRegisto -> {V,F,D}

	-matricula( M, A, AR ) :-
    nao( matricula( M, A, AR ) ),
    nao( excecao( matricula( M, A, AR ) ) ).

	matricula('00-PL-00', a0001, 2015).
	matricula('AA-00-00', a0002, 2000).
	matricula('00-OG-00', a0003, 2014).

	matricula(300,a0002,matdesc).

	excecao( matricula( V, C, P ) ):-
	    matricula( V, C, matdesc ).
	
	-matricula('qq',a0004,1999).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado cor: Cor, Automovel -> {V,F,D}

	-cor( C, A ) :-
    nao( cor( C, A ) ),
    nao( excecao( cor( C, A ) ) ).

	cor('Vermelho', a0001).	
	cor('Arancio Atlas',a0003).
	%% Não se sabe a cor do fiat punto apenas se sabe que é um tom de vermelho -> Conhecimento Impreciso
	excecao(cor('Carmesim', a0002)).
	excecao(cor('Coral Claro', a0002)).
	excecao(cor('Salmao', a0002)).
	excecao(cor('Vermelho Indiano', a0002)).

	-cor('Azul',a0005).


	excecao( cor( V, C ) ):-
	    cor( cordesc, C ).
	
	cor(cordesc,carro3).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado conservacao: Estado, Automovel -> {V,F,D}
% Escala do estado de 0 a 20, 20-> ótimo estado

	-conservacao( C, A ) :-
    nao( conservacao( C, A ) ),
    nao( excecao( conservacao( C, A ) ) ).

	conservacao(19, a0001).
	conservacao(3,a0002).
	conservacao(17,a0003).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado preco: Preco, Automovel -> {V,F,D}

	-preco( P, A ) :-
    nao( preco( P, A ) ),
    nao( excecao( preco( P, A ) ) ).

	preco(200000,a0001).
	preco(700,a0002).
	preco(390000,a0003).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado registoCompra: Preco, Automovel, ProprietárioAntigo -> {V,F,D}

	-registoCompra( V, C, P ) :-
	    nao( registoCompra( V, C, P ) ),
	    nao( excecao( registoCompra( V, C, P ) ) ).

	registoCompra(195000,a0001,amilcar).

	%% O fiat foi apreendido pela polícia e entregue ao stand por um preço muito baixo, o dono é desconhecido -> Conhecimento Incerto
	registoCompra(300,a0002,proprietariodesc).

	excecao( registoCompra( V, C, P ) ):-
	    registoCompra( Vs, C, proprietariodesc ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado registoVenda: Preco, Automovel, ProprietárioNovo -> {V,F,D}

	-registoVenda( V, A, P ) :-
	    nao( registoVenda( V, A, P ) ),
	    nao( excecao( registoVenda( V, A, P ) ) ).

	registoVenda(370000,a0003,ricardo).

	%% Uma celebridade atualmente na falência comprou um carro neste stand que considera fora do seu nível e, como não quer que a sua condição seja exposta ao público,
	%% exige que o registo seja bloqueado agora e sempre a qualquer pessoa.
	registoVenda(200,a0004,interdito).
	excecao(registoVenda(V,A,P)):-
		registoVenda(Vs,A,interdito).
	nulo(interdito).
	+registoVenda( V, A, P ) :: (solucoes( Ps,( registoVenda(V,a0004,Ps), nao( nulo(Ps) ) ), S ),
                  comprimento( S,N ), N == 0 
                  ).


%%%%%%%%%%%%%%%%   Predicados exteriores ao contexto %%%%%%%%%%%%%%%%%

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).
 %  ------------------------------------------ MATRICULA ----------------------------------------

% Introduçao de conhecimento negativo e tem-se na base conhecimento imperfeito do tipo Incerto para o ano
evolEvol(matricula(X,Y,Z),falso) :-
	excecao(matricula(X,Y,V)),
	remover(matricula(X,Y,V)),
	evolucao(-matricula(X,Y,Z)).

% Introduçao de conhecimento negativo e tem-se na base conhecimento imperfeito do tipo Incerto para o automovel
evolEvol(matricula(X,Y,Z),falso) :-
	excecao(matricula(X,V,Z)),
	remover(matricula(X,V,Z)),
	evolucao(-matricula(X,Y,Z)).

% Introduçao de conhecimento negativo e tem-se na base conhecimento positivo
evolEvol(matricula(X,Y,Z),falso) :-
	remover(matricula(X,Y,Z)),
	evolucao(-matricula(X,Y,Z)).

% Introduçao de conhecimento positivo e tem-se na base conhecimento imperfeito do tipo Incerto para o ano
evolEvol(matricula(X,Y,Z),verdadeiro) :-
	excecao(matricula(X,Y,V)),
	remover(matricula(X,Y,V)),
	evolucao(matricula(X,Y,Z)).

% Introduçao de conhecimento verdadeiro e tem-se na base conhecimento imperfeito do tipo Incerto para o automovel
evolEvol(matricula(X,Y,Z),verdadeiro) :-
	excecao(matricula(X,V,Z)),
	remover(matricula(X,V,Z)),
	evolucao(matricula(X,Y,Z)).

% Introduçao de conhecimento verdadeiro e tem-se na base conhecimento negativo
evolEvol(matricula(X,Y,Z),verdadeiro) :-
	remover( -matricula(X,Y,Z)),
	evolucao(matricula(X,Y,Z)).

 %  ------------------------------------------ Cor ----------------------------------------


% Introduçao de conhecimento negativo e tem-se na base conhecimento imperfeito do tipo Incerto para a cor
evolEvol(cor(X,Y),falso) :-
	excecao(cor(V,Y)),
	remover(cor(V,Y)),
	evolucao(-cor(X,Y)).

% Introduçao de conhecimento negativo e tem-se na base conhecimento positivo
evolEvol(cor(X,Y),falso) :-
	remover(cor(X,Y)),
	evolucao(-cor(X,Y)).

% Introduçao de conhecimento positivo e tem-se na base conhecimento imperfeito do tipo Incerto para a cor
evolEvol(cor(X,Y),verdadeiro) :-
	excecao(cor(V,Y)),
	remover(cor(V,Y)),
	evolucao(cor(X,Y)).


% Introduçao de conhecimento verdadeiro e tem-se na base conhecimento negativo
evolEvol(cor(X,Y),verdadeiro) :-
	remover( -cor(X,Y)),
	evolucao(cor(X,Y)).


% Introduçao de conhecimento desconhecido do tipo impreciso e tem-se na base conhecimento incerto
evolEvol(excecao(cor(X,Y)),desconhecido) :-
	excecao(cor(V,Y)),
	remover(cor(V,Y)),
	evolucao(excecao(cor(X,Y))). % As restantes variações devem ser introduzidas como evolEvol de conhecimento deconhecido com conhecimento perfeito na base de conhecimento

	
evolEvol(excecao(cor(X,Y)),desconhecido) :-
	nao(cor(_,Y)),
	evolucao(excecao(cor(X,Y))),
	nao(-cor(_,Y)).


% Introduçao de conhecimento positivo e tem-se na base conhecimento impreciso
evolEvol(cor(X,Y),verdadeiro) :-
	excecao(cor(_,Y)),
	retractall(excecao(cor(_,Y))),
	evolucao(cor(X,Y)).

% Introduçao de conhecimento negativo e tem-se na base conhecimento impreciso
evolEvol(cor(X,Y),falso) :-
	excecao(cor(X,Y)),
	retract(excecao(cor(X,Y))),
	evolucao(-cor(X,Y)).


insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ),!,fail.

teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao, falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolucao do meta-predicado demo com o operador e: ListaQuestoes,Resposta -> {V,F}

demoE([],verdadeiro).

demoE([E|RL],verdadeiro):-
		demo(E,verdadeiro), demoE(RL,verdadeiro).

demoE([E|RL],falso):-
		demo(E,falso), nao(demoE(RL,desconhecido)).
demoE([E|RL],falso):-
		demo(E,verdadeiro), demoE(RL,falso).

demoE([E|RL],desconhecido):-
		demo(E,desconhecido).
demoE([E|RL],desconhecido):-
		nao(demo(E,desconhecido)), demoE(RL,desconhecido).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolucao do meta-predicado demo com o operador ou: ListaQuestoes,Resposta -> {V,F}

demoOu([],falso).
demoOu([E|RL],verdadeiro):-
		demo(E,verdadeiro).
demoOu([E|RL],verdadeiro):-
		nao(demo(E,verdadeiro)), demoOu(RL,verdadeiro).

demoOu([E|RL],falso):-
		demo(E,falso), demoOu(RL,falso).

demoOu([E|RL],desconhecido):-
		demo(E,desconhecido), nao(demoOu(RL,verdadeiro)).
demoOu([E|RL],desconhecido):-
		nao(demo(E,desconhecido)), demoOu(RL,desconhecido).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado pertence: L,X ->{V,F}

pertence([],X):- fail.
pertence([Y|L],X):- Y=X.
pertence([Y|L],X):- pertence(L,X).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado remover que remove um dado facto

remover( F ) :-
	retract(F).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

comprimento( S,N ) :-
    length( S,N ).

