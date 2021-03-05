read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1,read_list(N1,Tail).

write_list([]):-!.
write_list([Head|Tail]):-write(Head),nl,write_list(Tail).

sum_lis_down(List,Sum):-sum_list_down(List,0,Sum).
sum_list_down([],Sum,Sum):-!.
sum_list_down([Head|Tail],S,Sum):-S1 is S+Head,sum_list_down(Tail,S1,Sum).

list_el_number(List,Elem,Number):-list_el_number(List,Elem,0,Number).
list_el_number([H|_],H,Number,Number):-!.
list_el_number([_|T],Elem,I,Number):-I1 is I+1,list_el_number(T,Elem,I1,Number).

pr4_4:-write("kolvo is "),read(N), nl,read_list(N,List),write("elem is "),nl,read(Elem),list_el_number(List,Elem,Number),write(Number),!.
pr4_4:-write("No matches!").

pr4_5:-write("kolvo is "),read(N),nl,read_list(N,List),write("nom is "),nl,read(Number),list_el_number(List,Elem,Number),write(Elem),!.
pr4_5:-write("No matches!").

min_list_up([H],H):-!.
min_list_up([H|T],Min):-min_list_up(T,Min1),(H<Min1->Min=H; Min=Min1).

min_list_down([H|T],Min):-min_list_down(T,H,Min).
min_list_down([],Min,Min):-!.
min_list_down([H|T],Temp,Min):-H<Temp,min_list_down(T,H,Min),!.
min_list_down([_|T],Temp,Min):-min_list_down(T,Temp,Min).

pr8_4:-write("kolvo is "),read(N), nl,read_list(N,List),min_list_up(List,Min),write("Min="),write(Min).

find_el([El|_],El):-!.
find_el([_|T], El):-find_el(T, El).

mirror(List,List1):-mirror(List,[],List1).
mirror([],List1,List1).
mirror([H|List],Temp,List1):-mirror(List,[H|Temp],List1).

p([],_):-!.
p([Head|Tail],List):-find_el(List,Head),p(Tail,List).

del(0,[_|Z], Z):-!.
del(X,[H|Y],[H|Z]):-X1 is X-1,del(X1,Y,Z).

del_elem([],_,[]).
del_elem([H|T],X,List):-(H=X->del_elem(T,X,List);List=[H|T1],del_elem(T,X,T1)).

chek(_,[]):-!.
chek([H|T]):-chek(H,T),chek(T).
chek(X,[H|T]):- X\= H,chek(X,T).
chek([]):-!.

unik([],[]):-!.
unik([H|T],T1):-find_el(T,H),unik(T,T1),!.
unik([H|T],[H|T1]):-unik(T,T1),!.

count([],_,Kolvo,Kolvo):-!.
count(List,El,Kolvo):-count(List,El,0,Kolvo).
count([H|T],El,Num,Kolvo):-(H=:=El->Num1 is Num+1;Num1 is Num),count(T,El,Num1,Kolvo).