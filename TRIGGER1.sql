CREATE DEFINER=`root`@`localhost` TRIGGER `czytelnik_BEFORE_INSERT` BEFORE INSERT ON `czytelnik` FOR EACH ROW BEGIN
SET NEW.data_dodania = NOW();
END