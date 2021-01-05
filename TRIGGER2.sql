CREATE DEFINER=`root`@`localhost` TRIGGER `ksiazka_BEFORE_UPDATE` BEFORE UPDATE ON `ksiazka` FOR EACH ROW BEGIN
   IF (NEW.stron != OLD.stron) 
   THEN
       SET NEW.data_mod = NOW();
   END IF;
END