CREATE DATABASE  IF NOT EXISTS `recipe`;
USE `recipe`;
DROP TABLE IF EXISTS `recipe`;

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `recipe` VALUES 
	(1,'David','Adams','david@quik.com'),
	(2,'John','Doe','john@quik.com'),
	(3,'Ajay','Rao','ajay@quik.com'),
	(4,'Mary','Public','mary@quik.com'),
	(5,'Maxwell','Dixon','max@quik.com');