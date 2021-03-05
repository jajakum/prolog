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