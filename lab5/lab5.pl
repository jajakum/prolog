sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).

pr_friends:- Friends=[_,_,_],
		in_list(Friends,[belokurov,_]),
		in_list(Friends,[chernov,_]),
		in_list(Friends,[ryzhov,_]),
		in_list(Friends,[_,white]),
		in_list(Friends,[_,black]),
		in_list(Friends,[_,red]),
		not(in_list(Friends,[belokurov,white])),
		not(in_list(Friends,[chernov,black])),
		not(in_list(Friends,[ryzhov,red])),

		write(Friends),!.

pr_girl:-Girls=[_,_,_],
    		in_list(Girls,[anya,_,_]),
    		in_list(Girls,[valya,_,_]),
    		in_list(Girls,[_,white,_]),
    		in_list(Girls,[_,green,_]),
    		in_list(Girls,[_,blue,_]),
    		in_list(Girls,[_,_,white]),
    		in_list(Girls,[_,_,green]),
    		in_list(Girls,[_,_,blue]),
    		in_list(Girls,[natasha,green,_]),
(
        	not(in_list(Girls,[valya,_,white])),
        	not(in_list(Girls,[valya,white,_])),
        	in_list(Girls,[anya,blue,blue]);
        	in_list(Girls,[anya, white,white])),
write(Girls),!.
       		
pr_work:-Worker=[_,_,_],
   		in_list(Worker,[ivanov,_,_,_]),
    		in_list(Worker,[semenov,_,_,_]),
    		in_list(Worker,[_,tokar,_,_]),
    		in_list(Worker,[_,svarshik,_,_]),
    		in_list(Worker,[_,_,_,2]),
    		in_list(Worker,[_,_,_,3]),
    		in_list(Worker,[_,slesar,[],1]),
    		in_list(Worker,[borisov,_,[sister],_]),
    		in_list(Worker,[semenov,_,_,N1]),
    		in_list(Worker,[_,tokar,_,N2]),N1>N2,
write(Worker),!.

pr_zhidkost:-Zhidkost=[_,_,_,_],
    		in_list(Zhidkost,[_,butilka]),
    		in_list(Zhidkost,[_,stakan]),
    		in_list(Zhidkost,[_,kuvshin]),
    		in_list(Zhidkost,[_,banka]),

    		in_list(Zhidkost,[milk,_]),
    		in_list(Zhidkost,[limonad,_]),
    		in_list(Zhidkost,[kvas,_]),
    		in_list(Zhidkost,[water,_]),

    		not(in_list(Zhidkost,[water,bottle])),
    		not(in_list(Zhidkost,[milk,bottle])),
    		not(in_list(Zhidkost,[limonad,banka])),
    		not(in_list(Zhidkost,[water,banka])),
    
    		next_to([limonad,_],[_,kuvshin],Zhidkost),
    		next_to([limonad,_],[kvas,_],Zhidkost),
    		next_to([_,stakan],[milk,_],Zhidkost),
    		next_to([_,stakan],[_,banka],Zhidkost),
  write(Zhidkost),!.

pr_people:-People=[_,_,_,_],
    		in_list(People,[_,dancer]),
    		in_list(People,[_,artist]),
    		in_list(People,[_,singer]),
    		in_list(People,[_,writer]),

    		in_list(People,[voronov,_]),
    		in_list(People,[pavlov,_]),
    		in_list(People,[livec,_]),
    		in_list(People,[sugar,_]),

    		not(in_list(People,[voronov,singer])),
    		not(in_list(People,[livec,singer])),

    		not(in_list(People,[pavlov,artist])),
    		not(in_list(People,[pavlov,writer])),

    		not(in_list(People,[sugar,writer])),
    		not(in_list(People,[voronov,writer])),

    		not(in_list(People,[voronov,artist])),

write(People).

pr_sport:-Sport=[_,_,_],

    		Sport=[_,_,_],
    		in_list(Sport,[maikl,_,basketball,_]),
    		in_list(Sport,[saimon,izrail,_,_]),
    		in_list(Sport,[richard,_,_,_]),
    		in_list(Sport,[_,australia,_,_]),
    		in_list(Sport,[_,_,criket,1]),
    		in_list(Sport,[_,america,_,_]),
    		in_list(Sport,[_,_,tennis,_]),
    		in_list(Sport,[_,_,_,2]),
    		in_list(Sport,[_,_,_,3]),

    		in_list(Sport,[maikl,_,_,N1]),
    		in_list(Sport,[_,america,_,N2]),N1<N2,
    		in_list(Sport,[saimon,_,_,N3]),
    		in_list(Sport,[_,_,tennis,N4]),N3<N4,

    		not(in_list(Sport,[saimon,_,tennis,_])),
    		not(in_list(Sport,[maikl,america,_,_])),

    		in_list(Sport,[X,australia,_,_]),write("Australian is "), write(X),nl,
    		in_list(Sport,[richard,_,X1,_]),write("Richard plays in "), write(X1),nl,write(Sport).

pr_box:-Box=[_,_,_,_],
		in_list(Box,[thomas,_,_,_]),
		in_list(Box,[gerbert,_,_,_]),
		in_list(Box,[frensis,_,_,_]),
		in_list(Box,[james,_,_,_]),