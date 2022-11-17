/* Query 1 - Il nome di tutte le sale di Pisa*/
SELECT nome
FROM Sale
WHERE citta='Pisa'

/* Query 2 - Il titolo dei film di F. Fellini prodotti dopo il 1960*/
SELECT titolo
FROM Film
WHERE regista = 'Federico Fellini' AND annoproduzione > 1960


/* Query 3 - Il titolo e la durata dei film di fantascienza giapponesi o francesi prodotti dopo il 1990*/

SELECT titolo, durata
FROM Film
WHERE (genere LIKE '%fantascienza%') AND (nazionalita = 'Giapponese' OR nazionalita = 'Francese')  
    AND annoproduzione > 1990


/* Query 4 - Il titolo dei film di fantascienza giapponesi prodotti dopo il 1990 oppure francesi*/

SELECT titolo
FROM Film
WHERE ((genere LIKE '%fantascienza%') AND (nazionalita = 'Giapponese' AND annoproduzione > 1990))
     OR nazionalita = 'Francese'


/* Query 5 - I titoli dei film dello stesso regista di "Casablanca*/

SELECT titolo
FROM Film
WHERE regista IN (SELECT regista FROM Film WHERE Titolo = 'Casablanca') 


/* Query 6 - Il titolo ed il genere dei film proiettati il giorno di Natale 2004*/

SELECT titolo, genere
FROM Film JOIN Proiezioni ON Film.codfilm = Proiezioni.codfilm
WHERE Proiezioni.dataproiezione = '2004-12-25'


/* Query 7 - Il titolo ed il genere dei film proiettati a Napoli il giorno di Natale 2004*/

SELECT titolo, genere
FROM Film JOIN Proiezioni ON Film.codfilm = Proiezioni.codfilm
          JOIN Sale ON Proiezioni.codsala = Sale.codsala
WHERE Proiezioni.dataproiezione = '2004-12-25' AND Sale.citta = 'Napoli'



/* Query 8 - Il nome delle sale di Napoli in cui il giorno di Natale 2004 è stato proiettato
un film con R.Williams*/

SELECT Sale.nome
FROM Sale JOIN Proiezioni ON Proiezioni.codsala = Sale.codsala
          JOIN Film ON Film.codfilm = Proiezioni.codfilm
          JOIN Recita ON Recita.codfilm = Film.codfilm
          JOIN Attori ON Attori.codattore = Recita.codattore
WHERE Sale.citta = 'Napoli' AND Proiezioni.dataproiezione = '2004-12-25' AND Attori.nome = 'Robin Williams'


/* Query 9 - Il titolo dei film in cui recita M. Mastroianni oppure S.Loren*/

SELECT titolo
FROM Film JOIN Recita ON Recita.codfilm = Film.codfilm
          JOIN Attori ON Attori.codattore = Recita.codattore
WHERE Attori.nome = 'Marcello Mastroianni' OR Attori.nome = 'Sofia Loren'


/* Query 10 - Il titolo dei film in cui recitano M. Mastroianni e S.Loren*/

SELECT titolo
FROM Film JOIN Recita ON Recita.codfilm = Film.codfilm
          JOIN Attori ON Attori.codattore = Recita.codattore
WHERE Attori.nome = 'Carrie-Anne Moss' OR Attori.nome = 'Guy Pearce'
GROUP BY titolo
HAVING COUNT(titolo)>1


/* Query 11 - Per ogni film in cui recita un attore francese, il titolo del film e il nome dell'attore*/

SELECT titolo, Attori.nome
FROM Film JOIN Recita ON Recita.codfilm = Film.codfilm
          JOIN Attori ON Attori.codattore = Recita.codattore
WHERE Attori.nazionalita = 'Statunitense'


/* Query 12 - Per ogni film che è stato proiettato a Pisa 
nel gennaio 2005, il titolo del film e il nome della sala*/


SELECT titolo, sale.nome
FROM Film JOIN Proiezioni ON Film.codfilm = Proiezioni.codfilm
          JOIN Sale ON Proiezioni.codsala = Sale.codsala
WHERE Sale.citta = 'Pisa' AND Proiezioni.dataproiezione >= '2005-01-01' 
      AND Proiezioni.dataproiezione <= '2005-01-31'

/* Query 13 - Il numero di sale di Pisa con più di 60 posti*/

SELECT COUNT(*) AS Num_Sale_Pisa
FROM Sale
WHERE Sale.posti > 60 AND Sale.citta = 'Pisa'


/* Query 14 - Il numero totale di posti nelle sale di Pisa*/

SELECT SUM(Sale.posti) AS num_tot_posti
FROM Sale
WHERE Sale.citta = 'Pisa'

/* Query 15 - Per ogni città, il numero di sale*/

SELECT citta, COUNT(*) AS Num_Sale
FROM Sale
GROUP BY citta

/* Query 16 - Per ogni città, il numero di sale con più di 60 posti*/

SELECT citta, COUNT(*) AS Num_Sale
FROM Sale
WHERE Sale.posti > 60
GROUP BY citta

/* Query 17 - Per ogni regista, il numero di film diretti dopo il 1990*/

SELECT regista, COUNT(*) AS Num_film_diretti
FROM Film
WHERE annoproduzione > 1990
GROUP BY regista

/* Query 18 - Per ogni regista, l'incasso totale di tutte le proiezioni dei suoi film*/

SELECT regista, SUM(incasso) AS totale_incasso
FROM Film JOIN Proiezioni ON Film.codfilm = Proiezioni.codfilm
GROUP BY regista

/* Query 19 - Per ogni film di S.Spielberg, il titolo del film, il numero totale di proiezioni a Pisa 
e l'incasso totale*/

SELECT titolo, COUNT(*) AS totale_proiezioni, SUM(incasso) AS somma_incassi
FROM Film JOIN Proiezioni ON Film.codfilm = Proiezioni.codfilm
          JOIN Sale ON Proiezioni.codsala = Sale.codsala
WHERE regista='Steven Spielberg' AND Sale.citta = 'Pisa'
GROUP BY titolo


/* Query 20 - Per ogni regista e per ogni attore, il numero di film del regista con l'attore*/

SELECT regista, attori.nome, COUNT(*) AS num_film
FROM Film JOIN Recita ON Recita.codfilm = Film.codfilm
          JOIN Attori ON Attori.codattore = Recita.codattore
GROUP BY regista, attori.nome


/* Query 21 - Il regista ed il titolo dei film in cui recitano meno di 6 attori*/

SELECT regista, titolo, COUNT(*) AS num_attori
FROM Film JOIN Recita ON Recita.codfilm = Film.codfilm
          JOIN Attori ON Attori.codattore = Recita.codattore
GROUP BY regista,titolo
HAVING COUNT(*) < 6

/* Query 22 - Per ogni film prodotto dopo il 2000, il codice, il titolo e 
l'incasso totale di tutte le sue proiezioni*/

SELECT codfilm, titolo, SUM(incasso) AS somma_incassi
FROM Film JOIN Proiezioni ON Film.codfilm = Proiezioni.codfilm
WHERE annoproduzione > 2000
GROUP BY titolo


/* Query 23 - Il numero di attori dei film in cui appaiono solo attori nati prima del 1970*/


SELECT COUNT(DISTINCT attori.nome)
FROM Film JOIN Recita ON Recita.codfilm = Film.codfilm
          JOIN Attori ON Attori.codattore = Recita.codattore
WHERE attori.annonascita < 1970


/* Query 24 - Per ogni film di fantascienza, il titolo e l'incasso totale di tutte le sue proiezioni*/
/* Query 25 - Per ogni film di fantascienza, il titolo e l'incasso totale di tutte le sue proiezioni 
successive al 01/01/2001*/
/* Query 26 - Per ogni film di fantascienza che non è mai stato proiettato prima del 01/01/2001
il titolo e l'incasso totale di tutte le sue proiezioni */
/* Query 27 - Per ogni sala di Pisa, che nel mese di gennaio 2005 ha incassato più di 20000€, 
il nome della sala e l'incasso totale (sempre del mese di gennaio 2005) */
/* Query 28 - I titoli dei film che non sono mai stati proiettati a Pisa*/
/* Query 29 - I titoli dei film che sono stati proiettati solo a Pisa*/
/* Query 30 - I titoli dei film dei quali non vi è mai stata una proiezioni con incasso superiore
a 500€ */