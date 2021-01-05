CREATE DEFINER=`root`@`localhost` PROCEDURE `Dodanie_50_Stron_Ksiazki_Po_ID`(IN Podaj_ID INT)
BEGIN
UPDATE ksiazka SET stron = stron + 50 WHERE id_ksiazka = Podaj_ID;
SELECT * FROM biblioteka.ksiazka WHERE id_ksiazka = Podaj_ID;
END