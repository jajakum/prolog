max(X,Y,Z):-X>=Y,Z is X.
max(X,Y,Z):-Z is Y.

max(X,Y,Z,X):-X>=Y,X>=Z.
max(_,Y,Z,Y):-Y>=Z.
max(_,_,Z,Z).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.

fact1(N,X):-fact1(0,1,N,X).
fact1(N,X,N,X):-!.
fact1(I,F,N,X):-I1 is I+1,F1 is F*I1,fact1(I1,F1,N,X).

fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2, fib(N1,X1),fib(N2,X2), X is X1+X2.

fib1(N,X):-fib1(1,1,N,X,1).
fib1(X,_,N,X,N):-!.
fib1(I,F,N,X,Q):-Q1 is Q+1,Z is I,I1 is F,F1 is F+Z,fib1(I1,F1,N,X,Q1).

sum(0,0):-!.
sum(N,X):-N1 is N div 10,sum(N1,X1),X is X1+N mod 10.

sum1(N,X):-sum1(N,0,X).
sum1(0,X,X):-!.
sum1(A,Sum,X):-Am is A mod 10,Ad is A div 10,S is Sum+Am,sum1(Ad,S,X).

pr(0,X):-X is 1,!.
pr(N,X):-N1 is N div 10,pr(N1,X1),X is X1*(N mod 10).

p(N,X):-p(N,1,X).
p(0,X,X):-!.
p(A,Sum,X):-Am is A mod 10,Ad is A div 10,S is Sum*Am,p(Ad,S,X).

del2(X,Y):-X1 is X mod 10 mod 2,X1 \= 0, X>3, Y is 1.
del2(_,Y):-Y is 0,!.

kolvo_up(0,0):-!.
kolvo_up(N,X):-N1 is N div 10, kolvo_up(N1,X1), del2(N,Y), X is X1+Y,!.

kolvo_down(N,X):-kolvo_down(N,0,X).
kolvo_down(0,X,X):-!.
kolvo_down(A,S,X):- Ad is A div 10,del2(A,Y),S1 is S+Y, kolvo_down(Ad,S1,X),!.

nod(A,A,A):-A\=0,!.
nod(0,B,B):-!.
nod(A,0,A):-!.
nod(A,B,Nod):-A>B,C is A mod B, nod(C,B,Nod),!.
nod(A,B,Nod):-A<B,C is B mod A, nod(A,C,Nod),!.

prost(N,X):- N mod X =:= 0,!.
prost(N,X):- X*X=<N,X1 is X+1,prost(N,X1).

prost(1):-!.
prost(N):-not(prost(N,2)).

kol_del(_,0,0):-!.
kol_del(N,I,X):-N mod I =:= 0,I1 is I-1, kol_del(N,I1,X1), X is X1+1; N mod I=\= 0, I1 is I-1, kol_del(N,I1,X1), X is X1.
kol_del(N,X):-kol_del(N,N,X),!.

sum_pr_down(_,0,0):-!.
sum_pr_down(N,I,Sum):-N mod I =:=0,prost(I),I1 is I-1,sum_pr_down(N,I1,Sum1),Sum is Sum1+I;I1 is I-1,sum_pr_down(N,I1,Sum1), Sum is Sum1.
sum_pr_down(N,X):-sum_pr_down(N,N,X),!.

pr_del(_,0,1):-!.
pr_del(N,X):-pr_del(N,N,X),!.
pr_del(N,I,Pr):- sum(N,X3),(N mod I =:=0,sum(I,X1),X1<X3->I1 is I-1,pr_del(N,I1,Pr1),Pr is Pr1*I;I1 is I-1,pr_del(N,I1,Pr1), Pr is Pr1).


%Задание 13.
% Предикат kollanz(+Number) - находит число, при котором цепочка
% Коллатца имеет максимальную длину
%Последовательность начинается с 1, размером 1.
kollanz(Number):-kollanz(1,1,1,Number).

kollanz(1000000,Iteration,_,Iteration):-!. %Условие остановки, если число больше миллиона

% Предикат kollanz(+Number,+Iteration,+Max_Iteration,-Max_Number) - рекурсия вниз
% Number - счетчик от 1 до 1000000
% Iteration - число, при котором цепь максимальна
% Lenght - максимальная длина цепочки на данный момент
% Max_Number - результат вычислений

kollanz(Number,Iteration,Max_Iteration,Max_Number):-New_number is Number+1,kollanz_chain(New_number,1,Lenght),
    (Lenght>Max_Iteration -> kollanz(New_number,New_number,Lenght,Max_Number);
    kollanz(New_number,Iteration,Max_Iteration,Max_Number)).


% Предикат kollanz_chain(+Number,+Lenght,-Result),возвращает длину цепочки,
% которая начинается с Number,
kollanz_chain(1,Result,Result):-!.
kollanz_chain(Number,Lenght,Result):-Lenght1 is Lenght+1,(Number mod 2 =:= 0 -> New_Number is Number/2,kollanz_chain(New_Number,Lenght1,Result);New_Number is (Number*3+1),kollanz_chain(New_Number,Lenght1,Result)).