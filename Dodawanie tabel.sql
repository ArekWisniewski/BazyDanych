USE biblioteka;

CREATE TABLE IF NOT EXISTS `biblioteka`.`czytelnik` (
`id_czytelnik` INT NOT NULL AUTO_INCREMENT,
`login` VARCHAR(50),
`haslo` VARCHAR(45),
`imie` VARCHAR(100),
`nazwisko` VARCHAR(100),
`adres` VARCHAR(200),
`miasto` VARCHAR(45),
`wojewodztwo` VARCHAR(100),
`telefon` VARCHAR(50),
`kod_pocztowy` VARCHAR(45),
`email` VARCHAR(100),
PRIMARY KEY (`id_czytelnik`));

CREATE TABLE IF NOT EXISTS `biblioteka`.`kategoria` (
`id_kategoria` INT NOT NULL AUTO_INCREMENT,
`nazwa` VARCHAR(200),
PRIMARY KEY (`id_kategoria`));

CREATE TABLE IF NOT EXISTS `biblioteka`.`ksiazka` (
`id_ksiazka` INT NOT NULL AUTO_INCREMENT,
`id_kategoria` INT NOT NULL,
`isbn` VARCHAR(13),
`tytul` VARCHAR(200),
`autor` VARCHAR(70),
`stron` INT(4) NOT NULL,
`wydawnictwo` VARCHAR(50)NOT NULL,
`rok_wydania` INT(4) NOT NULL,
`opis` TEXT NULL,
PRIMARY KEY (`id_ksiazka`),
INDEX `fk_ksiazka_kategoria1_idx` (`id_kategoria` ASC),
CONSTRAINT `fk_ksiazka_kategoria1`
FOREIGN KEY (`id_kategoria`)
REFERENCES `biblioteka`.`kategoria` (`id_kategoria`)

ON DELETE NO ACTION
ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `biblioteka`.`zamowienie` (
`id_zamowienie` INT NOT NULL AUTO_INCREMENT,
`id_czytelnik` INT NOT NULL,
`id_ksiazka` INT NOT NULL,
`data_zamowienia` DATETIME NOT NULL,
`data_odbioru` DATETIME NULL,
`data_zwrotu` DATETIME NULL,
PRIMARY KEY (`id_zamowienie`),
INDEX `fk_zamowienie_czytelnik1_idx` (`id_czytelnik` ASC),
INDEX `fk_zamowienie_ksiazka1_idx` (`id_ksiazka` ASC),
CONSTRAINT `fk_zamowienie_czytelnik1`
FOREIGN KEY (`id_czytelnik`)
REFERENCES `biblioteka`.`czytelnik` (`id_czytelnik`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_zamowienie_ksiazka1`
FOREIGN KEY (`id_ksiazka`)
REFERENCES `biblioteka`.`ksiazka` (`id_ksiazka`)
ON DELETE NO ACTION
ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `biblioteka`.`administrator` (
`id_admin` INT NOT NULL AUTO_INCREMENT,
`login` VARCHAR(50),
`haslo` VARCHAR(50) NOT NULL,
PRIMARY KEY (`id_admin`));

CREATE TABLE IF NOT EXISTS `biblioteka`.`bibliotekarz` (
`id_bibliotekarz` INT NOT NULL AUTO_INCREMENT,
`login` VARCHAR(50),
`haslo` VARCHAR(50),
PRIMARY KEY (`id_bibliotekarz`));
