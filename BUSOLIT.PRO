domains
	element=integer
	lista=element*

database
	is_fact(symbol,symbol)
	is_not(symbol, symbol)
	organizing(symbol,symbol)
	technical(symbol,symbol)

predicates
	jobs
	jobs1
	init
	identify(symbol)
	out_message(symbol)
	forget
	group(symbol)
	intrebare1(symbol)
	intrebare2(symbol)
	intrebare3(symbol)
	intrebare4(symbol)
	intrebare5(symbol)


	group_message(symbol, symbol)
	act_on(symbol,symbol,symbol)
	redo
	run_again(symbol)
clauses
	jobs:- init,jobs1.
	jobs1:-identify(Job),
		out_message(Job),
		forget.
	init:- nl,
		

	write("Atunci cand aveti de realizat un proiect in echipa preferati sa: "),nl,nl,
	write("Introduceti 'yes' daca prima afirmatie vi se potriveste sau 'no' daca este cazul celei de-a doua."),nl,nl,
	write("Apasati Enter pentru a  continua"),nl,nl,

		readchar(_),nl,nl.

identify("Product Owner") :- group(organizing),
		intrebare1( "Imi organizez eficent munca."),
		intrebare2( "Sunt convingator cand transmit un mesaj celorlalti."),
		intrebare3( "Identific corect nevoile celorlalti."),
		intrebare4( "Cand sunt convins ca am dreptate, reusesc sa-i conving si pe ceilalti."),
		intrebare5( "Iau usor decizii in situatii  de stres. ").
							

identify("Project Manager") :- group(organizing),
		intrebare1( "Argumentele mele sunt intotdeauna convingatoare."),
		intrebare2( "Intr-o echipa eu sunt adesea cel care ii determina pe ceilalti sa se implice."),
		intrebare3( "Imi place ca oamenii sa apeleze la mine pentru sprijin in rezolvarea unor situatii problematice."),
		intrebare4( "Consider ca am capacitatea de a decide etapele de  realizare a unui proiect."),
		intrebare5( "Imi place sa monitorizez  si sa controlez activitatea unei echipe.").
			
identify("Business Analyst") :- group(organizing),
		intrebare1( "Reusesc sa respect termenele limita."),
		intrebare2( "Mi-e usor sa  analizez diferite situatii pentru a identifica solutia optima."),
		intrebare3( "Atunci cand lucrez la un proiect, selectez informatiile cu atentie."),
		intrebare4( "Mi-e usor sa verific realizarea sarcinilor membrilor  echipei."),
		intrebare5( "Sunt  inreresat  de ultimele directii pe piata IT si impactul lor economic."). 	
							
identify("Software Developer") :- group(technical),
		intrebare1( "Imi place sa fiu informat/a cu privire la ultimele tehnologii in domeniul IT."),
		intrebare2( "Caut mereu sa fac ceva nou si interesant."),
		intrebare3( "Oamenii ma considera o persoana perspicace (profunda)."),
		intrebare4( "Sunt interesat de functionarea noilor tehnologii din domeniul informatic."),
		intrebare5( "Imi place sa gasesc variante noi de rezolvare a unor probleme.").  

identify("Software Tester") :- group(technical),
		intrebare1( "Sunt atent/a la detalii."),
		intrebare2( "Imi plac sarcinile de munca care ma determina sa gasesc solutii variate de realizare."),
		intrebare3( "Reusesc sa identific rapid erorile de functionare a unor programe/ aplicatii."),
		intrebare4( "Prefer să indeplinesc sacinile decât să gestionez monitorizarea realizarii lor in cadrul unei echipe."),
		intrebare5( "Ma simt mai bine atunci cand altcineva preia conducerea in cadrul echipei în care lucrez."). 

identify("DevOps") :- group(technical),
		intrebare1( "Fac usor conexiuni intre notiunile invatate, chiar daca sunt din domenii diferite."),
		intrebare2( "Atunci cand intampin o problema tenica, gasesc usor rezolvarea."),
		intrebare3( "Imi place sa gestionez dificultatile care apar pe parcuscul realizarii unui proiect."),
		intrebare4( "Imi place sa interactionez cu oamenii."),
		intrebare5( "Sunt preocupat sa cunosc cat mai multe despre noile tehnologii disponibile pe piata."). 

identify("Software engineer") :- group(technical),
			intrebare1( "Sunt preocupat de modul de functionare al tehnologiilor si dispozitivelor."),
			intrebare2( "Imi place sa configurez componente hardware si sa le conectez in retea"),
			intrebare3( "Cand se iau decizii legate de functionarea sistemlor informatice, imi place sa ma implic."),
			intrebare4( "Imi place sa realizez activitati de documentare cu privire la  functionarea sistemelor informatice."),
			intrebare5( "Colaborez  cu membrii echipei cand se intampina o problema a componentelor hardware.").  

identify("Software designer") :- group(technical),
			intrebare1( "Sunt preocupat de modul in care sunt orientate vizual elemenetele unui site web."),
			intrebare2( "Ma gandesc cum ar trebui sa arate o aplicatie pentru a fi user-friendly."),
			intrebare3( "Am capacitatea de a identifica rapid cea mai buna modalitate de proiectare a aplicatiei."),
			intrebare4( "Imi plac provocarile."),
			intrebare5( "Nu sunt orientat/a spre munca in echipa.").
							
identify(no) :-!.

group(Group):- is_fact(group,Group), !.
group(Group):- is_not(group, Group), ! , fail.
group(Group):- not(is_fact(group,_)),nl,
group_message(Group, Mess),
			write("Prefer sa ma ocup de "),
			write(Mess),
			write ("."),nl,
			readln(Response),
			act_on(Response, group, Group).

group_message(organizing,"identificarea cerintelor,coordonarea echipei si planificare").
group_message(technical,"implementare si sa gasesc solutia optima a unei probleme").

intrebare1(Type):- is_fact(intrebare1,Type), !.
intrebare1(Type):- is_not(intrebare1, Type), ! , fail.
intrebare1(Type):- nl,
				write("Introduceti 'yes' daca afirmatia vi se potriveste sau 'no' daca nu vi se potriveste"),nl,nl,
				write(Type),
				readln(Response),
				act_on(Response, intrebare1, Type).

intrebare2(Type) :- is_fact(intrebare2, Type), !.
intrebare2(Type) :-	is_not (intrebare2, Type), !, fail.
intrebare2(Type) :- nl,
				write(Type),
				readln(Response),
				act_on(Response, intrebare2, Type).
intrebare3(Type) :- is_fact(intrebare3, Type), !.
intrebare3(Type) :-	is_not (intrebare3, Type), !, fail.
intrebare3(Type) :- nl,
				write(Type),
				readln(Response),
				act_on(Response, intrebare3, Type).
intrebare4(Type) :- is_fact(intrebare4, Type), !.
intrebare4(Type) :-	is_not (intrebare4, Type), !, fail.
intrebare4(Type) :- nl,
				write(Type),
				readln(Response),
				act_on(Response, intrebare4, Type).
intrebare5(Type) :- is_fact(intrebare5, Type), !.
intrebare5(Type) :-	is_not (intrebare5, Type), !, fail.
intrebare5(Type) :- nl,
				write(Type),
				readln(Response),
				act_on(Response, intrebare5, Type).


act_on(yes,Attribute,Type):-
	asserta(is_fact(Attribute, Type)).
act_on(no,Attribute,Type):-
	asserta(is_not(Attribute,Type)),fail.

out_message(no) :- !,nl,nl,
					write("****"),
					nl,nl,
					write("Eroare!"),nl,nl,
					write("Analiza nu s-a putut realiza."),nl,nl.

out_message(Job):- nl,nl,
					write("****"),
					nl,nl,
					write("Profesia de "),
					write(Job ),
                    write(" v-ar valorifica cel mai mult calitatile.").

forget:- retractall(is_fact(_,_)),
		retractall(is_not(_,_)),
		nl,write("Programul s-a incheiat"),nl,nl,
		redo.
redo :- write("Doriti sa incepeti din nou?"),
		readln (Response),
		run_again(Response).
run_again(yes) :- nl,nl,!,
				jobs1.
run_again(no):-nl,nl.