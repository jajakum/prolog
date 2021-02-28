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