#Zostawiłem z tymi komendami do VIEW bo juz nie chciałem zmieniać.

/*Wyświetla dane z 2 połaczonych tabel (czytelnik i ksiązka)*/

CREATE VIEW w1 AS
SELECT * FROM biblioteka.czytelnik as czyt INNER JOIN biblioteka.ksiazka as ks ON czyt.id_czytelnik=ks.id_ksiazka;

/*Sprawdzanie danych z kilku tabel jednocześnie posortowane malejąco z limitem 3 szt.*/

CREATE VIEW w2 AS
SELECT z.id_zamowienie, k.isbn, z.id_czytelnik, z.data_zamowienia, z.data_odbioru
FROM zamowienie z, ksiazka k
WHERE k.isbn = '9788324631773'
AND z.id_ksiazka = k.id_ksiazka
ORDER BY z.data_zamowienia DESC
LIMIT 3;

/*Wyświetlenie wszystkich danych użytownika z ID=1*/

CREATE VIEW w3 AS
SELECT * FROM biblioteka.zamowienie WHERE id_czytelnik = 1;

/*Łaczenie zewnetrzne tabel lewostronne czytelnik i ksiażka*/

CREATE VIEW w4 AS
SELECT imie, nazwisko, adres , tytul
FROM biblioteka.czytelnik czyt LEFT OUTER JOIN biblioteka.ksiazka ks ON czyt.id_czytelnik=ks.id_ksiazka;

/*Wyświetlenie danych z tabeli czytelnik*/

CREATE VIEW w5 AS
SELECT id_czytelnik, imie, nazwisko, miasto, telefon FROM biblioteka.czytelnik;

/*Wyliczenie średniej ilości stron w tabeli książka*/

CREATE VIEW w6 AS 
SELECT AVG(stron) AS średnia_stron FROM biblioteka.ksiazka;

/*Wyliczenie sumy stron w tabeli ksiażka*/

CREATE VIEW w7 AS
SELECT SUM(stron) AS Suma_Stron FROM biblioteka.ksiazka;

/* Zapytanie zwraca id_czytelników, którzy zamówili więcej niż jedena ksiązke.*/

CREATE VIEW w8 AS
SELECT id_czytelnik
  FROM czytelnik
 WHERE id_czytelnik IN (SELECT id_czytelnik
                      FROM zamowienie
                  GROUP BY id_czytelnik
                    HAVING COUNT(*) > 1);

/*Zapytanie zwraca średnią charakterystyczną dla każdej ksiązki*/

CREATE VIEW w9 AS
SELECT id_ksiazka, stron,
      (SELECT AVG(stron) 
FROM biblioteka.ksiazka) AS avg_stron
FROM biblioteka.ksiazka;

/*Zapytanie zwraca dane z tabel połaczonych prawostronnie*/

CREATE VIEW w10 AS
SELECT autor, tytul, stron, data_zamowienia AS Data_zamownienia
FROM biblioteka.zamowienie z RIGHT JOIN biblioteka.ksiazka ks ON ks.id_ksiazka=z.id_zamowienie;


