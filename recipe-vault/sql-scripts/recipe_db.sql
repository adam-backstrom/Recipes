DROP SCHEMA IF EXISTS `recipe_db`;
CREATE SCHEMA `recipe_db`;
USE `recipe_db`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `recipe`;

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `directions` varchar(1024) DEFAULT NULL,
  `ingredients` varchar(512) DEFAULT NULL,
  `imgurl` varchar(512) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
  
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `recipe` VALUES 
	(1, 'Pannkakor - grundrecept',
    'Gör traditionella tunna pannkakor genom att blanda mjöl, mjölk och ägg och lite salt till en jämn smet. Stek smeten till tunna och smarriga pannkakor och servera med en söt sylt.',
    'Blanda mjöl och salt i en bunke. Vispa i hälften av mjölken och vispa till en slät smet. Vispa i resten av mjölken och äggen.\n
     Smält smöret i stekpannan och vispa ner i smeten. Stek tunna pannkakor av smeten i en stek- eller pannkakspanna.\n
     Servera med sylt eller bär.',
     '2 1/2 dl vetemjöl, 1/2 tsk salt, 6 dl mjölk, 3 ägg, 3 msk smör, sylt eller bär till serviering',
     'https://www.recept.com/public/uploads/headrecipes/343fcefeeeb7c9bdcaf5fbc2a5e9c552.jpg'),
     
     (2, 'Äppelkaka med citron och kardemumma',
     'Bjud dina gäster på denna härliga äppelkaka nästa gång du har middag! Receptet innehåller två delar; först gör du smeten till själva kakan och sedan blandar du ner den härliga äppel- och kardemummablandningen. Servera till glass eller vaniljsås!',
     'Sätt ugnen på 175°C. Smörj en rund form med löstagbar kant, ca 24 cm i diameter (för 8 bitar) med matfett. Kaka: Smält matfettet och låt det svalna.
	 Rör matfettet med socker, vanilj och citronskal. Tillsätt ett ägg i taget och vispa väl mellan varje. Vänd ner mjölet blandat med bakpulvret och mjölken. Häll smeten i formen.
	 Fyllning och garnering: Skär äpplena i tunna klyftor. Stick ner dem tätt i smeten. Stöt kardemummakärnorna och blanda med sockret. Strö det över äpplena.
	 Grädda kakan i nedre delen av ugnen 30-35 minuter.',
     '125g smör eller margarin, 1 1/2 dl strösocker, 1 tsk vaniljsocker, 1 citron (endast det rivna skalet), 2 ägg, 2 1/2 dl vetemjöl, 1/2 tsk bakpulver, 2 msk mjölk, 4 medelstora äpplen, 1 tsk kardemummakärnor, 1 msk strösocker',
     'https://www.recepten.se/bilder/recept/24/main/m/aeppelkaka.jpg');