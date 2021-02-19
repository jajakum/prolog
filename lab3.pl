max(X,Y,Z):-X>=Y,Z is X.
max(X,Y,Z):-Z is Y.

max(X,Y,Z,X):-X>=Y,X>=Z.
max(_,Y,Z,Y):-Y>=Z.
max(_,_,Z,Z).
