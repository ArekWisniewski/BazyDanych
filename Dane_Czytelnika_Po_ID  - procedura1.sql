CREATE DEFINER=`root`@`localhost` PROCEDURE `Dane_Czytelnika_Po_ID`(IN Podaj_id INT)
BEGIN
SELECT *  FROM czytelnik WHERE id_czytelnik = Podaj_ID;
END