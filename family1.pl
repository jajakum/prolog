man(artur).
man(ashot).
man(david).
man(artyom).
man(dmitry).
man(vlad).
man(nikita).
man(daniel).
man(vladimir).
man(kolya)

woman(nastya).
woman(lera).
woman(diana).
woman(marina).
woman(dasha).
woman(gulnara).
woman(tanya).
woman(natasha).
woman(masha).
woman(alisa)
woman(irina)


parent(ashot,dmitry).
parent(ashot,gulnara).
parent(ashot,dmitry).
parent(ashot,natasha).

parent(marina,dmitry).
parent(marina,gulnara).
parent(marina,daniel).
parent(marina,natasha).

parent(vlad,vladimir).
parent(vlad,daniel).
parent(lera,dasha).
parent(lera,daniel).

parent(david,nikita).
parent(david,nastya).
parent(dasha,nikita).
parent(dasha,nastya).

parent(dmitry,masha).
parent(dmitry,tanya).
parent(dmitry,irina).
parent(natasha,masha).
parent(natasha,tanya).
parent(natasha, irina).

parent(artyom,kolya).
parent(artyom,alisa).
parent(artyom,dasha).
parent(artyom,artur).
parent(diana,vladimir).
parent(diana,artur).
parent(diana,alisa).
parent(diana,kolya).


child(X,Y):-parent(Y,X).
children(X):-parent(X,Y), write(Y), nl, fail.
mother(X,Y):-parent(X,Y), woman(X).
mother(X):-parent(Y,X),woman(Y), write(Y), nl.
brother(X,Y):-parent(Z,X), parent(Z,Y), man(X).
brothers(X):-parent(Z,X),parent(Z,Y), man(Y), X\=Y, write(Y), nl, fail.
sister(X,Y):-parent(Z,X),parent(Z,Y), woman(X).
sisters(X):-parent(Z,X), parent(Z,Y), woman(Y), X\=Y, write(Y), nl, fail.
father(X,Y):-parent(X,Y),man(X).
father(X):-parent(Y,X),man(Y),write(Y).
b_s(X,Y):-parent(Z,X),parent(Z,Y).
b_s(X):-parent(Z,X),parent(Z,Y),X\=Y, write(Y),nl,fail.