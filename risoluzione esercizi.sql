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

/* Query 18 - Per ogni regista, l'incasso totale di tutte le proiezioni dei suoi film*/

/* Query 19 - Per ogni film di S.Spielberg, il titolo del film, il numero totale di proiezioni a Pisa 
e l'incasso totale*/

/* Query 20 - Per ogni regista e per ogni attore, il numero di film del regista con l'attore
