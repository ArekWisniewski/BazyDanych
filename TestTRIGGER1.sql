CREATE DEFINER=`root`@`localhost` PROCEDURE `TestTRIGGER`()
BEGIN
SELECT * FROM czytelnik ORDER BY data_dodania DESC;
END