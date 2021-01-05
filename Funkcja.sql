CREATE DEFINER=`root`@`localhost` FUNCTION `RankingKsiazkiWgStron`(
	stron DECIMAL(10,2)
) RETURNS varchar(20) CHARSET utf8 COLLATE utf8_polish_ci
    DETERMINISTIC
BEGIN
    DECLARE RankingKsiazkiWgStron VARCHAR(20);

    IF stron > 700 THEN
		SET RankingKsiazkiWgStron = 'Platyna';
    ELSEIF (stron <= 700 AND 
			stron >= 500) THEN
        SET RankingKsiazkiWgStron = 'Zloto';
    ELSEIF stron < 500 THEN
        SET RankingKsiazkiWgStron = 'Srebro';
    END IF;
    RETURN (RankingKsiazkiWgStron);
    END