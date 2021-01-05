CREATE DEFINER=`root`@`localhost` PROCEDURE `SprawdzenieFunkcji`()
BEGIN
SELECT *,RankingKsiazkiWgStron(stron) FROM ksiazka ORDER BY stron DESC;
END