CREATE DEFINER=`root`@`localhost` PROCEDURE `TestTRIGGER2`()
BEGIN
SELECT * FROM biblioteka.ksiazka ORDER BY data_mod DESC;
END