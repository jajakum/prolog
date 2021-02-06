man(artur).
man(ashot).
man(david).
man(artyom).
man(dmitry).
man(vlad).
man(nikita).
man(daniel).
man(vladimir).

woman(nastya).
woman(lera).
woman(diana).
woman(marina).
woman(dasha).
woman(gulnara).
woman(tanya).
woman(natasha).
woman(masha).

parent(ashot,dmitry).
parent(ashot,gulnara).
parent(ashot,daniel).
parent(ashot,natasha).

parent(marina,dmitry).
parent(marina,gulnara).
parent(marina,daniel).
parent(marina,natasha).

parent(vlad,vladimir).
parent(vlad,daniel).
parent(lera,vladimir).
parent(lera,daniel).

parent(david,nikita).
parent(david,nastya).
parent(dasha,nikita).
parent(dasha,nastya).

parent(dmitry,masha).
parent(dmitry,tanya).
parent(natasha,masha).
parent(natasha,tanya).

parent(artyom,dasha).
parent(artyom,artur).
parent(diana,dasha).
parent(diana,artur).

child(X,Y):-parent(Y,X).
children(X):-parent(X,Y), write(Y), nl, fail.
mother(X,Y):-parent(X,Y), woman(X).
mother(X):-parent(Y,X),woman(Y), write(Y), nl.