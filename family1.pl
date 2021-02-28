man(artur).
man(ashot).
man(david).
man(artyom).
man(dmitry).
man(vlad).
man(nikita).
man(daniel).
man(vladimir).
man(kolya).

woman(nastya).
woman(lera).
woman(diana).
woman(marina).
woman(dasha).
woman(gulnara).
woman(tanya).
woman(natasha).
woman(masha).
woman(alisa).
woman(irina).


parent(artur,lera).
parent(nastya,lera).

parent(dmitry,vlad).
parent(dmitry,daniel).
parent(diana,vlad).
parent(diana,daniel).

parent(nikita,dasha).
parent(masha,dasha).

parent(lera,ashot).
parent(lera,david).
parent(lera,artyom).
parent(vlad,ashot).
parent(vlad,david).
parent(vlad,artyom).

parent(daniel,marina).
parent(daniel,gulnara).
parent(dasha,marina).
parent(dasha,gulnara).


parent(artyom,alisa).
parent(artyom,kolya).
parent(artyom,vladimir).
parent(marina,alisa).
parent(marina,kolya).
parent(marina,vladimir).

parent(david,natasha).
parent(david,irina).
parent(david,tanya).
parent(gulnara,natasha).
parent(gulnara,irina).
parent(gulnara,tanya).

men():-man(X),write(X),nl,fail.
women():-woman(X),write(X),nl,fail.
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
grand_pa(X,Y):-parent(Z,Y), parent(X,Z), man(X).
grand_pas(X):-parent(Y,X), parent(Z,Y), man(Z), write(Z), nl, fail.
grand_so(X,Y):-parent(Z,X), parent(Y,Z), man(X), man(Y).
grand_sons(X):-parent(X,Y), parent(Y,Z), man(Z), write(Z), nl, fail.
grand_pa_and_son(X,Y):-(parent(X,Z),parent(Z,Y),man(X),man(Y))|(parent(Z,X),parent(Y,Z),man(X),man(Y)).
grand_ma_and_son(X,Y):-grand_ma(X,Y),man(Y).
grand_ma_and_son(X,Y):-grand_ma(Y,X),man(X).
uncle(X,Y):-parent(Z,Y),brother(X,Z).
uncles(X):-uncle(Z,X),write(Z),nl,fail.
aunt(X,Y):-parent(Z,Y),sister(X,Z).
aunts(X):-aunt(Z,X),write(Z),nl,fail.