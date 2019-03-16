#lang racket
#|Obligatorisk innlevering nr 1 			
Cindy Madeleine Svendsen Ceesay |#

;Oppgave 1a:
(*(+ 4 2) 5)
30

#|Dette skyldes at:
((4+2)*5) = (6*5) = 30
I utrykket så kommer operatoren først, før dataelementene som den skal legges sammen. Vi kaller dette for at utrykket
er skrevet i prefix. Parantesene er også anvendt korrekt, da vi har skrevet et utrykk inne i dem.|#

;Oppgave 1b:

 (*(+ 4 2) (5))
#|. . application: not a procedure;
 expected a procedure that can be applied to arguments
  given: 5
  arguments...: [none]

Dette skyldes at:
((4+2)*(5)) = (6*(5)) = 

Kommentar:

DrRacket utfører operasjonene i  normal order, det vil si at den utfører operasjonene på den parantesen til høyre. Dette takler den bra, fordi den har operatorer
inne I parantesen og kan dermed utføre operasjoner på begge tallene. Den klager derimot på den til venstre, fordi vi anvender en parantes ukorrekt. I scheme anvender
vi paranteser for å erklære at det er en prosedyre som foregår, altså at en utfører en operasjon med enten tall eller tekst. I uttrykket ovenfor står tallet 5 alene
i parantesen. Om uttrykket skulle ha fungert slik vi ønsket så hadde vi vært nødt til å skrive (*(+ 4 2) 5) eller ((*(+ 4 2) (+ 5)) 
|#

;Oppgave 1c: 

(*(4 + 2) 5)
#|. . application: not a procedure;
 expected a procedure that can be applied to arguments
  given: 4
  arguments.:

Dette skyldes at:
(*(4 + 2) 5) = Error!

kommentar:
Vi har operatoren I en infix order, det vil si mellom to dataelementer. Dette gjør at Dr Racket ikke vet hva vi skal gjøre med tallet 4. Om vi derimot hadde skrevet
pluss i prefix order(se beskrivelse fra 1a), hadde den ikke klaget. For at dette skulle ha fungert er vi nødt til å skrive (* (+ 4 2) 5).|#

;Oppgave 1d:

(define bar (/ 42 2))
bar

21

#|Dette skyldes at:

(define bar 21)
bar

Kommentar:
Vi definerer først bar til å ha verdien 21. Dette gjøres ved å først kalle på define, som gjør at et variabelnavn får tilegnet en verdi.
 I dette tilfellet er variabelnavnet bar, men for å finne ut hva slags verdi bar skal ha må DrRacket regne ut utrykket (/ 42 2). Dette lar seg gjøre
 fordi vi har skrevet operatoren I prefix order og vi vet dermed hva slags verdi begge tallene har. Da vi deretter gjentok bar, ble verdien 21 skrevet ut.
 Dette skyldes at bar vil bestandig ha verdien 21 etter den har blitt definert til å være lik 21, så lenge den ikke blir definert til å ha en annen verdi.
|#

;Oppgave 1e:

(- bar 11)
10

#|Dette skyldes at:

(- 21 11)
10

Kommentar:
Tidligere forklarte vi at bar ble definert til 21. I dette uttrykket vil verdien av bar gjentas, fordi define gjør at en streng tilskrives en verdi. Denne verdien
er gjeldende til man på nytt deklarerer verdien. Et annet viktig element med dette uttrykket er at det står skrevet i prefix order.
regnestykket (- 21 11) og svaret printes ut.

|#

;Oppgave 1f:

(/ (*bar 3 4 1) bar)

#|Dette skyldes at:

(/ (*21 3 4 1) bar)
(/ 420 21)
12

Kommentar:
Uttrykket fungerer, fordi bar fremdeles er definert til å være lik 21(se oppgave 1e), samtidig som det I hver av parantesene er utført en operasjon. Her regner man ut
 (/ x bar), samt x for seg selv. Dette gjør at den først multipliserer sammen alle tallene I parantesen inne I parantesen. Deretter dividerer
den svaret med bar. X er i denne kommentaren anvendt som en plassholder for (*21 3 4 1).
|#

;Oppgave 2a.1:

(or ;Spesialcaset til or er at den blir sann med en gang en verdi den sjekker blir sann.
 (= 1 2) ; Her sjekker kompilator om 1 er lik 2. Svaret er feil, så den slår inn på false.
 "piff!"    ; Alt annet enn false er true, så her slår den ut på"piff"	
"paff!"
(zero? (1 - 1)))

“piff”

#| Kommentar:
 Special Caset med or er at dersom en verdi er sann er utrykket sant, om alle verdiene derimot er usanne vil utrykket være usant. Kompilatoren hopper ut av utrykket når den finner et utrykk
som er sant.I dette utrykket vil DrRacket kjøre videre, siden alt annet enn #f er sant. Den finner “piff”, og slutter drRacket å lese videre da den fant ut at hele utrykket var sant.

Syntaktisk feil:
(zero? (1 – 1))) skal være skrevet (zero? (- 1 1))). Dette skyldes at DrRacket utfører operasjonene på operatorene I prefix order.

|#



;Oppgave 2a.2:

(and ;Spesialcaset til and er at alt må være sant for at den skal være sann.
 (= 1 2) ; (= 1 2) er false, så den dropper ut her.
"piff!"
"paff!"
(zero? (1 – 1)))

#f

#|
Kommentar:

Det som er spesielt med and er at alle utrykkene må være sanne for at utrykket skal være sant. Dette innebærer at dersom et av utrykkene er usanne,
så er utrykket usant. Om alle derimot er sanne er utrykket sant. Kompilatoren hopper ut med en gang den finner noe som er usant. I denne situasjonen
så vil DrRacket allerede slå ut ved (= 1 2), fordi den kontrollerer om 1 er lik 2. Det er den ikke, så utrykket er usant. Den printer derfor ut at
utrykket er usant, altså #f. 

Syntaktisk feil:
(zero? (1 – 1))) skal være skrevet (zero? (- 1 1))). Dette skyldes at DrRacket utfører operasjonene på operatorene I prefix order. |#

;Oppgave 2a.3

(if (positive? 42)
"poff!"	;Kommer hit når tallet er positivt.
(i-am-undefined)) ;Kommer hit når tallet er negativt.
“poff”

#|Kommentar:
Noe av det som er spesielt med if er at den definerer først hva den skal gjøre dersom utrykket er positivt,deretter definerer den hva den skal gjøre dersom
utrykket er negativt. Her sjekker vi først om 42 er et positivt tall, siden tallet er positivt går vi til utrykket “poff”. 

Udefinert prosedyre:
I-am-undefined er en udefinert prosedyre som vi kommer til dersom utrykket I if hadde vært false. Vi ser at den er udefinert, fordi vi har ikke definert
I-am-undefined til å være noe enda. Alt som ikke er definert til å være noe er en prosedyre. |#

;Oppgave 2b:
(define (sign x)
  (cond ((= x 0) 0)
        ((< x 0) -1)
        (else 1)))

;Alternativ 2:
(define (sign x)
     (if(= x 0)
        0
        (if(> x 0)
           1
           -1 )))


;Oppgave 2c: 
(define (sign x)
  (or (and(= x 0) 0)
      (and (< x 0) -1)
      (and(> x 0) 1)))


;Oppgave 3a:

(define (add1 x)
	(+ x 1))

(define (sub1 x)			
	(- x 1))

;Oppgave 3b: 

(define (pluss x y)
  (if(zero? y)
    x
    (pluss (add1 x)(sub1 y)))) ; her kaller metoden på seg selv.


;Oppgave 3c:

#|Metoden gir opphavet til en rekursiv metode, fordi vi ønsker å oppnå et bestemt resultat ved å gjenta en funksjon flere ganger. Dette skyldes at vi ønsker at y skal bli null,
ved å gjentatte ganger senke verdien til y med 1, samtidig som vi øker verdien til x med 1. En annen årsak til at den er rekursiv er at den kaller på seg selv. Dette skjer dersom
if er usann. Vi ser derfor at den benytter seg selv til sin egen utførelse, slik at hver operasjon må fullføres før hver operasjon fullføres. Basistilfellet i rekursjonen er if(zero? y) x.|#

;Iterativ:

(define (pluss2 x y)
  (define (sum x y)
     (cond((zero? y) x)
          (else (sum (add1 x)(sub1 y)))))
    
  (sum x y))

#| En iterativ prosess gjentar runder hvor man analyser en spesifikk ting eller gjentar operasjoner. Dette er en interativ prosess, siden sum stadig blir gjentatt til det kommer til
sitt mål, nemlig at y blir lik 0.  |# 

;Oppgave 3d:

(define (power-close-to b n)
  (define (power-iter e)
    (if (> (expt b e) n) ; b opphøyd i e > n
        e ; e returneres dersom sann.
      (power-iter (+ 1 e)))) ; kjører nytt kall dersom usann.
(power-iter 1))

#|Vi kan skrive om utrykket til blokkstruktur. Dette skyldes at vi kun benytter oss av b og n som kontrolltall. De blir aldri forandret, så vi har ikke noe behov for å lagre disse
variablene. Siden de allerede finnes I hovedblokken vil vi kunne hente disse variablene derfra.|#

#| I denne metoden fungerer rekursjonen i power-iter som en loop for å regne ut når b opphøyd i e er over n. Da b og n er benyttet lokale variabler som defineres i power-close-to,
kan vi benytte dem i power-iter. e derimot er kun lokal i power-iter, da den defineres for første gang i hjelpemetoden. Vi må derfor kalle metoden på e hver gang. Ellers så er det
verdt å legge merke til at vi kun benytter oss av b og n som kontrolltall. De blir aldri forandret, så vi har ikke noe behov for å lagre disse variablene.|#

;Oppgave 3e:

(define (fib n)
  (define (fib-iter a b count)
   (if (= count 0)  ;Her sjekker man om count er lik 0, om count er lik 0 returneres b.
    b
   (fib-iter (+ a b) a (- count 1)))) ;Her kalles fiber-iter på nytt. Alle variablene blir forandret.
(fib-iter 1 0 n)) ; her kaller man på fiber-iter for første gang.

#|Nei! Det er ikke mulig. Om vi ikke oppgir a og b når vi definer prosedyren til fib-iter, vil vi miste data. Dette skyldes at vi forandrer på a b og count hver gang vi kjører
power-iter. Count benyttes til å telle ned,  b benyttes til å regne det foregående talllet, mens a benyttes til å regne ut summen av a og b. Inne i hvert kall har hver av
variablene sin funksjon.|#
