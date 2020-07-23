-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: sepomex
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `entidades`
--

DROP TABLE IF EXISTS `entidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidades` (
  `municipio` varchar(120) NOT NULL,
  `id_municipio` varchar(6) NOT NULL,
  `provincia` varchar(120) NOT NULL,
  `id_provincia` varchar(6) NOT NULL,
  `cp` varchar(12) NOT NULL,
  FULLTEXT KEY `indx_provincia` (`id_provincia`),
  FULLTEXT KEY `indx_municipio` (`id_municipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades`
--

LOCK TABLES `entidades` WRITE;
/*!40000 ALTER TABLE `entidades` DISABLE KEYS */;
INSERT INTO `entidades` VALUES ('Alicante/Alacant','152','ALICANTE','03','03001'),('Altea','156','ALICANTE','03','03590'),('Dénia','201','ALICANTE','03','03700'),('Guardamar del Segura','214','ALICANTE','03','03140'),('Orihuela','235','ALICANTE','03','03192'),('Pilar de la Horadada','242','ALICANTE','03','03191'),('Santa Pola','262','ALICANTE','03','03130'),('Santa Pola','262','ALICANTE','03','03130'),('Villajoyosa/Vila Joiosa (la)','278','ALICANTE','03','03570'),('Carboneras','310','ALMERÍA','04','04140'),('Garrucha','325','ALMERÍA','04','04630'),('Colunga','4982','ASTURIAS','33','33330'),('Ribadesella','5018','ASTURIAS','33','33560'),('Alcúdia','796','BALEARS (ILLES)','07','07400'),('Andratx','798','BALEARS (ILLES)','07','07150'),('Campos','807','BALEARS (ILLES)','07','07639'),('Capdepera','808','BALEARS (ILLES)','07','07590'),('Ciutadella de Menorca','810','BALEARS (ILLES)','07','07760'),('Ciutadella de Menorca','810','BALEARS (ILLES)','07','07760'),('Eivissa','814','BALEARS (ILLES)','07','07800'),('Eivissa','814','BALEARS (ILLES)','07','07800'),('Mercadal (Es)','832','BALEARS (ILLES)','07','07748'),('Palma de Mallorca','836','BALEARS (ILLES)','07','07001'),('Palma de Mallorca','836','BALEARS (ILLES)','07','07012'),('Palma de Mallorca','836','BALEARS (ILLES)','07','07012'),('Palma de Mallorca','836','BALEARS (ILLES)','07','07015'),('Sant Antoni de Portmany','843','BALEARS (ILLES)','07','07820'),('Santanyí','853','BALEARS (ILLES)','07','07659'),('Santanyí','853','BALEARS (ILLES)','07','07660'),('Sóller','857','BALEARS (ILLES)','07','07100'),('Barcelona','881','BARCELONA','08','08003'),('Mataró','987','BARCELONA','08','08301'),('Sitges','1130','BARCELONA','08','08870'),('Sitges','1130','BARCELONA','08','08870'),('Sitges','1130','BARCELONA','08','08870'),('Vilanova i la Geltrú','1167','BARCELONA','08','08800'),('Chipiona','1777','CÁDIZ','11','11550'),('Colindres','5767','CANTABRIA','39','39750'),('San Vicente de la Barquera','5816','CANTABRIA','39','39540'),('Santander','5819','CANTABRIA','39','39009'),('Santoña','5823','CANTABRIA','39','39740'),('Suances','5828','CANTABRIA','39','39340'),('Burriana','1835','CASTELLÓN / CASTELLÓ','12','12530'),('Burriana','1835','CASTELLÓN / CASTELLÓ','12','12530'),('Castellón de la Plana/Castelló de la Plana','1842','CASTELLÓN / CASTELLÓ','12','12100'),('Oropesa del Mar/Orpesa','1883','CASTELLÓN / CASTELLÓ','12','12594'),('Peñíscola','1886','CASTELLÓN / CASTELLÓ','12','12598'),('Vinaròs','1936','CASTELLÓN / CASTELLÓ','12','12500'),('Ceuta','8110','CEUTA','51','51001'),('Boiro','2128','CORUÑA (A)','15','15930'),('Camariñas','2133','CORUÑA (A)','15','15123'),('Cariño','2137','CORUÑA (A)','15','15593'),('Cedeira','2140','CORUÑA (A)','15','15350'),('Coruña (A)','2148','CORUÑA (A)','15','15006'),('Ferrol','2154','CORUÑA (A)','15','15401'),('Fisterra','2155','CORUÑA (A)','15','15155'),('Laxe','2159','CORUÑA (A)','15','15117'),('Malpica de Bergantiños','2161','CORUÑA (A)','15','15113'),('Muros','2170','CORUÑA (A)','15','15250'),('Muxía','2171','CORUÑA (A)','15','15124'),('Pobra do Caramiñal (A)','2185','CORUÑA (A)','15','15940'),('Porto do Son','2189','CORUÑA (A)','15','15999'),('Rianxo','2190','CORUÑA (A)','15','15920'),('Ribeira','2191','CORUÑA (A)','15','15960'),('Sada','2193','CORUÑA (A)','15','15160'),('Sada','2193','CORUÑA (A)','15','15160'),('Blanes','2470','GIRONA','17','17300'),('Blanes','2470','GIRONA','17','17300'),('Castelló d\'Empúries','2492','GIRONA','17','17487'),('Escala (L\')','2506','GIRONA','17','17130'),('Llançà','2537','GIRONA','17','17490'),('Palafrugell','2559','GIRONA','17','17200'),('Palamós','2560','GIRONA','17','17230'),('Port de la Selva (El)','2577','GIRONA','17','17489'),('Roses','2592','GIRONA','17','17480'),('Roses','2592','GIRONA','17','17480'),('Sant Feliu de Guíxols','2600','GIRONA','17','17220'),('Selva de Mar (La)','2626','GIRONA','17','17489'),('Torroella de Montgrí','2637','GIRONA','17','17258'),('Almuñécar','2685','GRANADA','18','18697'),('Getaria','3169','GUIPÚZCOA','20','20808'),('Hondarribia','3172','GUIPÚZCOA','20','20280'),('Punta Umbría','3274','HUELVA','21','21100'),('Burela','4218','LUGO','27','27880'),('Ribadeo','4259','LUGO','27','27700'),('Viveiro','4273','LUGO','27','27863'),('Viveiro','4273','LUGO','27','27863'),('Fuengirola','4508','MÁLAGA','29','29640'),('Manilva','4522','MÁLAGA','29','29691'),('Vélez-Málaga','4548','MÁLAGA','29','29751'),('Águilas','4557','MURCIA','30','30880'),('Cartagena','4571','MURCIA','30','30202'),('Cartagena','4571','MURCIA','30','30370'),('Mazarrón','4581','MURCIA','30','30870'),('San Javier','4590','MURCIA','30','30370'),('San Pedro del Pinatar','4591','MURCIA','30','30740'),('San Bartolomé de Tirajana','5252','PALMAS (LAS)','35','35106'),('Yaiza','5266','PALMAS (LAS)','35','35570'),('Yaiza','5266','PALMAS (LAS)','35','35570'),('Bueu','5271','PONTEVEDRA','36','36930'),('Cambados','5273','PONTEVEDRA','36','36630'),('Cambados','5273','PONTEVEDRA','36','36630'),('Cangas','5275','PONTEVEDRA','36','36940'),('Grove (O)','5288','PONTEVEDRA','36','36980'),('Illa de Arousa (A)','5290','PONTEVEDRA','36','36626'),('Moaña','5296','PONTEVEDRA','36','36950'),('Pontevedra','5309','PONTEVEDRA','36','36910'),('Sanxenxo','5318','PONTEVEDRA','36','36960'),('Sanxenxo','5318','PONTEVEDRA','36','36970'),('Vigo','5324','PONTEVEDRA','36','36202'),('Vilanova de Arousa','5328','PONTEVEDRA','36','36620'),('Adeje','5691','SANTA CRUZ DE TENERIFE','38','38670'),('Santa Cruz de la Palma','5727','SANTA CRUZ DE TENERIFE','38','38700'),('Ametlla de Mar (L\')','6356','TARRAGONA','43','43860'),('Ametlla de Mar (L\')','6356','TARRAGONA','43','43860'),('Ampolla (L\')','6357','TARRAGONA','43','43895'),('Calafell','6381','TARRAGONA','43','43882'),('Cambrils','6383','TARRAGONA','43','43850'),('Deltebre','6396','TARRAGONA','43','43580'),('Roda de Barà','6475','TARRAGONA','43','43883'),('Sant Carles de la Ràpita','6481','TARRAGONA','43','43540'),('Tarragona','6494','TARRAGONA','43','43005'),('Torredembarra','6499','TARRAGONA','43','43830'),('Vandellòs i l\'Hospitalet de l\'Infant','6508','TARRAGONA','43','43890'),('Vendrell (El)','6509','TARRAGONA','43','43880'),('Gandia','7091','VALENCIA / VALÈNCIA','46','46730'),('Oliva','7140','VALENCIA / VALÈNCIA','46','46780'),('Valencia','7214','VALENCIA / VALÈNCIA','46','46024'),('Valencia','7214','VALENCIA / VALÈNCIA','46','46024'),('Bermeo','7481','VIZCAYA','48','48370'),('Ondarroa','7543','VIZCAYA','48','48700');
/*!40000 ALTER TABLE `entidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estaciones`
--

DROP TABLE IF EXISTS `estaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(150) NOT NULL,
  `latitud` decimal(11,8) DEFAULT NULL,
  `longitud` decimal(11,8) DEFAULT NULL,
  `id_municipio` int(11) NOT NULL,
  `horario` varchar(165) DEFAULT NULL,
  `localidad` varchar(75) DEFAULT NULL,
  `precio_gasoleo_A` decimal(8,3) DEFAULT NULL,
  `precio_gasoleo_B` decimal(8,3) DEFAULT NULL,
  `precio_gasolina_E10` decimal(8,3) DEFAULT NULL,
  `precio_gasolina_E5` decimal(8,3) DEFAULT NULL,
  `precio_gasoleo_maritimo` decimal(8,3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estaciones`
--

LOCK TABLES `estaciones` WRITE;
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` VALUES (1,'MUELLE 8, ZONA DE LEVANTE, S/N',38.33916700,-0.48147200,152,'L-D: 08:00-21:00','ALICANTE/ALACANT',1.079,NULL,NULL,1.209,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(2,'PUERTO DEPORTIVO LUIS CAMPOMANES, S/N - PARTIDA MASCARAT',38.62955600,-0.00383300,156,'M-D: 10:00-18:00','ALTEA',1.110,NULL,NULL,1.239,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(3,'PUERTO PESQUERO DE DENIA S/N',38.84361100,0.11305600,201,'L-V: 08:00-13:00 y 16:30-19:30','DENIA',NULL,NULL,NULL,NULL,335.000,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(4,'AVDA. DEL PUERTO.219',38.10900000,-0.64627800,214,'L-D: 07:00-22:00','GUARDAMAR DEL SEGURA',NULL,NULL,NULL,NULL,401.000,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(5,'CALDERON DE LA BARCA, 2',37.91053500,-0.73058800,235,'L-D: 08:00-14:00 y 16:00-21:00','DEHESA DE CAMPOAMOR',1.150,NULL,NULL,1.300,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(6,'AVDA DEL MAR S/N',37.86588900,-0.75791700,242,'L-D: 06:00-13:30 y 14:30-21:00','PILAR DE LA HORADADA',1.129,NULL,NULL,1.266,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(7,'MUELLE NORTE S/N PUERTO DEPORTIVO 2',38.18930600,-0.56055600,262,'L-D: 24H','SANTA POLA',0.953,NULL,NULL,1.086,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(8,'ZONA PORTUARIA, 35',38.18738900,-0.55858300,262,'L-V: 09:00-13:00 y 16:00-20:00','SANTA POLA',0.955,NULL,NULL,1.075,400.000,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(9,'PUERTO PESQUERO',38.50630600,-0.21883300,278,'L-V: 08:00-21:00; S-D: 08:00-15:00','VILLAJOYOSA / VILA JOIOSA (LA)',1.099,NULL,NULL,1.189,551.000,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(10,'MUELLE PESQUERO DE CARBONERAS, S/Nº',36.99180200,-1.89706800,310,'L-D: 24H','CARBONERAS',1.150,NULL,NULL,1.253,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(11,'PUERTO PESQUERO, S/Nº',37.18180200,-1.81901300,325,'L-D: 24H','GARRUCHA',NULL,369.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(12,'MUELLE PESQUERO, S/Nº',43.51583300,-5.26644400,4982,'L-D: 24H','LASTRES',NULL,489.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(13,'MUELLE PESQUERO, S/Nº',43.46444600,-5.05867800,5018,'L-D: 24H','RIBADESELLA',NULL,499.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(14,'PASEO MARITIMO, 1',39.83694400,3.13480600,796,'L-D: 24H','ALCUDIA',1.230,NULL,NULL,1.320,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(15,'MUELLE PESQUERO, S/Nº',39.54548400,2.38946100,798,'L-D: 24H','ANDRATX',NULL,419.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(16,'EXPLANADA DEL PUERTO, S/N',39.35917800,2.95109900,807,'L-S: 08:00-18:00; D: 08:00-13:00','RAPITA (SA)',1.239,NULL,NULL,1.319,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(17,'MUELLE PESQUERO, S/Nº',39.70992800,3.46418300,808,'L-D: 24H','CALA RATJADA',1.239,NULL,NULL,1.319,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(18,'MUELLE PESQUERO, S/Nº',39.99881700,3.83001600,810,'L-D: 24H','CIUTADELLA DE MENORCA',1.237,419.000,NULL,1.326,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(19,'CAMI DE BAIX S/N',39.99902800,3.82997200,810,'L-V: 09:00-18:30; S-D: 09:00-13:00','CIUTADELLA DE MENORCA',1.235,426.000,NULL,1.331,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(20,'MUELLE COMERCIAL, S/Nº',38.91381700,1.43918300,814,'L-D: 24H','EIVISSA',NULL,419.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(21,'PASSEIG JOAN CARLES I, 20',38.91380600,1.44372200,814,'L-D: 09:00-14:00 y 16:00-20:00','EIVISSA',1.305,NULL,NULL,1.391,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(22,'PASSATGE ES PLA S/N',40.05680600,4.12975000,832,'X: 09:00-13:00','FORNELLS',1.199,NULL,NULL,1.299,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(23,'MUELLE VIEJO, S/N ESPIGÓN EXTERIOR',39.56466700,2.63827800,836,'L-D: 08:00-20:00','PALMA',1.150,NULL,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(24,'MUELLE VIEJO, S/Nº (EL MOLLET)',39.56659500,2.64057200,836,'L-D: 24H','PALMA',1.239,NULL,NULL,1.319,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(25,'MUELLE DE SAN PEDRO, 1',39.56475000,2.63402800,836,'L-D: 24H','PALMA',1.155,NULL,NULL,1.259,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(26,'AVENIDA INGENIERO GABRIEL ROCA S/N',39.55672200,2.62563900,836,'L-D: 09:00-20:00','PALMA',NULL,NULL,NULL,1.235,1150.000,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(27,'PASEO DEL MAR SN',38.97672200,1.30230600,843,'L-D: 09:00-18:00','SANT ANTONI DE PORTMANY',1.264,NULL,NULL,1.361,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(28,'MUELLE, S/Nº SANTANY',39.33131700,3.17029400,853,'L-D: 24H','CALA FIGUERA',NULL,419.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(29,'AVDA CALA LLONGA S/N RCTO PUERTO',39.36880600,3.22716700,853,'L-D: 24H','CALA D\'OR',1.179,NULL,NULL,1.275,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(30,'MUELLE COMERCIAL, S/Nº',39.79715000,2.69446100,857,'L-D: 24H','SOLLER',1.239,NULL,NULL,1.319,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(31,'MUELLE DE BALEARES, S/Nº',41.37277800,2.18551000,881,'L-D: 24H','BARCELONA',NULL,368.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(32,'PASSEIG DEL CALLAO, S/N',41.52908300,2.44500000,987,'L-D: 24H','MATARO',1.153,NULL,NULL,1.373,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(33,'TORRE CAPITANIA  S N    PUERTO DEPORTIVO AIGUADOLC',NULL,NULL,1130,'L-D: 09:30-18:30','SITGES',1.164,NULL,NULL,1.287,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(34,'PORT DEL GARRAF',41.24930600,1.90005600,1130,'L-D: 08:00-18:00','GARRAF',1.214,NULL,NULL,1.342,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(35,'FINAL PLAYA CASTELLDEFELS S/N-  LES BOTIGUES DE SITGES',41.25880600,1.92533300,1130,'L-D: 24H','BOTIGUES (LES)',1.168,NULL,NULL,1.295,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(36,'LG ENTRE MUELLE DE LA LLOTJA Y PESCADO',41.21591700,1.73586100,1167,'L-D: 24H','VILANOVA I LA GELTRU',NULL,NULL,NULL,NULL,349.000,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(37,'PUERTO PESQUERO DEPORTIVO, S/Nº',36.74649800,-6.42994900,1777,'L-D: 24H','CHIPIONA',1.144,NULL,NULL,1.267,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(38,'MUELLE PESQUERO, S/Nº',43.39390300,-3.46303300,5767,'L-D: 24H','COLINDRES',1.186,335.000,NULL,1.246,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(39,'AVDA. ANTONIO GARELY, S/Nº',43.38501400,-4.39775500,5816,'L-D: 24H','SAN VICENTE DE LA BARQUERA',1.186,335.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(40,'PUERTO PSQUERO',43.44922200,-3.82133300,5819,'L-J: 09:00-13:00 y 14:00-18:00','SANTANDER',1.186,NULL,NULL,1.246,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(41,'MUELLE PESQUERO, S/Nº',43.44195900,-3.46331000,5823,'L-D: 24H','SANTOÑA',1.186,335.000,NULL,1.246,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(42,'MUELLE PESQUERO, S/Nº',43.42529200,-4.03525500,5828,'L-D: 24H','SUANCES',1.186,335.000,NULL,1.246,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(43,'ZONA SERVICIOS S/N',39.86258300,-0.07486100,1835,'L-D: 24H','BURRIANA',1.300,NULL,NULL,1.340,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(44,'MUELLE DE PONIENTE',39.85905600,-0.06913900,1835,'L-D: 24H','BURRIANA',1.120,NULL,NULL,1.270,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(45,'MUELLE PESQUERO, S/Nº',39.96634000,-0.01983600,1842,'L-D: 24H','CASTELLON DE LA PLANA',NULL,371.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(46,'PARTIDA DENOMINADA PUERTO DEPORTIVO',40.08130600,0.14680600,1883,'L-D: 24H','OROPESA',1.172,NULL,NULL,1.256,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(47,'MUELLE PESQUERO',40.35652800,0.40608300,1886,'L-V: 11:00-19:00','PEÑISCOLA',1.157,NULL,NULL,1.237,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(48,'MUELLE PESQUERO, S/Nº',40.46411100,0.47788900,1936,'L-D: 24H','VINAROS',1.157,NULL,NULL,1.237,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(49,'AV. JUAN PABLO II, PUERTO DEPORTIVO',35.89066700,-5.31480600,8110,'L-D: 11:00-13:30 y 16:30-20:00','CEUTA',0.732,NULL,NULL,0.939,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(50,'BAJO MUELLE,S/Nº',42.61355600,-8.89016700,2128,'L-D: 07:00-22:00','BOIRO',0.999,388.000,NULL,1.109,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(51,'MUELLE PESQUERO, S/Nº',43.12802700,-9.18291400,2133,'L-D: 24H','CAMARIÑAS',NULL,397.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(52,'MUELLE PESQUERO, S/Nº',43.73774900,-7.86652500,2137,'L-D: 24H','CARIÑO',NULL,395.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(53,'MUELLE PESQUERO',43.65750000,-8.06450000,2140,'L-V: 09:00-13:00 y 15:00-19:00','CEDEIRA',1.149,NULL,NULL,1.234,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(54,'DÁRSENA DE OZA, S/Nº',43.34858200,-8.37930300,2148,'L-D: 24H','CORUÑA (A)',NULL,325.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(55,'MUELLE DE CRUXEIRAS, S/Nº',43.47830400,-8.24430300,2154,'L-D: 24H','FERROL',1.099,397.000,NULL,1.194,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(56,'MUELLE PESQUERO, S/Nº',42.99886000,-9.00152500,2155,'L-D: 24H','FISTERRA',NULL,395.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(57,'MUELLE PESQUERO, S/Nº',43.22330400,-9.00180300,2159,'L-D: 24H','LAXE',NULL,395.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(58,'MUELLE PESQUERO, S/Nº',43.32330400,-8.80819200,2161,'L-D: 24H','MALPICA',NULL,397.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(59,'MUELLE PESQUERO S/N',42.77608200,-9.05596900,2170,'L-D: 24H','MUROS',1.149,NULL,NULL,1.234,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(60,'MUELLE PESQUERO, S/Nº',43.10580400,-9.21485800,2171,'L-D: 24H','MUXIA',NULL,395.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(61,'MUELLE COMERCIAL S/N',42.60908300,-8.93541700,2185,'L-D: 07:00-23:00','POBRA DO CARAMIÑAL',1.099,420.000,NULL,1.189,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(62,'MUELLE PESQUERO, S/Nº',42.76080400,-8.94735800,2189,'L-D: 24H','PORTOSIN',1.149,NULL,NULL,1.234,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(63,'PORTO DE RIANXO, S/N',42.64738900,-8.82241700,2190,'L: 07:00-23:00','RIANXO',1.119,410.000,NULL,1.219,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(64,'MUELLE PESQUERO, S/Nº',42.56136000,-8.98902500,2191,'L-D: 24H','SANTA UXIA DE RIBEIRA',NULL,330.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(65,'MUELLE PESQUERO, S/Nº',43.36274900,-8.24652500,2193,'L-D: 24H','SADA',NULL,395.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(66,'AVENIDA DEL PUERTO, S/N',43.35755600,-8.24830600,2193,'L-D: 24H','SADA',1.100,NULL,NULL,1.200,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(67,'ESPLANADA DEL PORT,S/N',41.67591700,2.79133300,2470,'L-V: 15:00-18:00','BLANES',NULL,401.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(68,'ESPLANADA DEL PORT S/N',41.67508300,2.79788900,2470,'L-D: 24H','BLANES',1.179,NULL,NULL,1.279,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(69,'SECTOR CLUB NAUTICO, S.N.',NULL,NULL,2492,'L: 09:00-13:00 y 15:00-19:00','CASTELLO D\'EMPURIES',1.220,NULL,1.340,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(70,'PORT LA CLOTA S/N',42.11919400,3.12622200,2506,'L-D: 09:00-13:00 y 15:00-19:00','ESCALA (L\')',1.119,NULL,NULL,1.260,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(71,'MOLL JORDI CANAL',42.37333300,3.16336100,2537,'L-D: 24H','LLANÇA',1.156,NULL,NULL,1.273,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(72,'PUERTO DEPORTIVO S/N',NULL,NULL,2559,'L-D: 09:00-13:00 y 16:00-18:00','LLAFRANC',1.190,NULL,1.310,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(73,'MUELLE PESQUERO, S/N',41.77918000,3.03636400,2560,'L-D: 24H','PALAMOS',NULL,371.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(74,'LLOIA S/N',NULL,NULL,2577,'L: 09:00-13:00 y 15:00-17:00','PORT DE LA SELVA (EL)',1.156,NULL,NULL,1.276,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(75,'ZONA DE DIC ABRIC - PUERTO DEPORTIVO DE ROSES',NULL,NULL,2592,'L-D: 24H','ROSES',1.239,NULL,NULL,1.339,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(76,'MUELLE PESQUERO, S/Nº',42.25279100,3.17942000,2592,'L-D: 24H','ROSES',NULL,371.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(77,'ZONA ESPORTIVA DEL PORT, S/Nº',41.77388900,3.03052800,2600,'L-D: 24H','SANT FELIU DE GUIXOLS',1.150,NULL,NULL,1.270,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(78,'MUELLE PESQUERO, S/Nº',42.34084600,3.20025300,2626,'L-D: 24H','SELVA DE MAR (LA) NUCLI',NULL,377.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(79,'PASSEIG MARÍTIM, S/N',42.05227800,3.20419400,2637,'X: 08:00-12:00','ESTARTIT (L\')',NULL,421.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(80,'TORRE DE CONTROL, PUERTO DEPORTIVO PUNTA DE LA MONA (MARINA DEL ESTE)',36.72772200,-3.72641700,2685,'L-D: 09:00-19:00','HERRADURA (LA)',1.215,NULL,1.324,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(81,'MUELLE PESQUERO S/N',43.27558400,-2.12794500,3169,'L-D: 24H','GETARIA',NULL,333.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(82,'PASEO IRIBARREN, S/N',43.38836100,-1.79072200,3172,'L-D: 24H','HONDARRIBIA',NULL,333.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(83,'MUELLE DEPORTIVO PUNTA UMBRIA, S/N - AVDA. LA RIA, S/N',37.18175000,-6.95941700,3274,'L-V: 09:30-13:00 y 15:00-17:30; S: 09:30-13:00','PUNTA UMBRIA',1.129,NULL,NULL,1.189,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(84,'MUELLE PESQUERO, S/Nº',43.66053700,-7.25481800,4218,'L-D: 24H','BURELA',NULL,335.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(85,'MUELLE PESQUERO, S/Nº',43.53275900,-7.03870700,4259,'L-D: 24H','RIBADEO',NULL,486.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(86,'MUELLE PESQUERO, S/Nº',43.68052800,-7.59647200,4273,'L-D: 24H','CELEIRO',NULL,332.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(87,'MUELLE PESQUERO, S/Nº',43.67637000,-7.59592900,4273,'L-D: 24H','CELEIRO',NULL,335.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(88,'PUERTO PESQUERO-DEPORTIVO',36.54233900,-4.61575400,4508,'L-D: 24H','FUENGIROLA',1.190,NULL,NULL,1.300,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(89,'PUERTO DEPORTIVO DE LA DUQUESA',NULL,NULL,4522,'L-D: 24H','MANILVA',1.180,NULL,NULL,1.290,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(90,'PUERTO PESQUERO,S/Nº',36.74761700,-4.06936600,4548,'L-D: 24H','CALETA DE VELEZ',1.200,NULL,NULL,1.310,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(91,'MUELLE PESQUERO, S/N',37.40293500,-1.57872000,4557,'L-D: 24H','AGUILAS',NULL,384.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(92,'MUELLE STA. LUCÍA, S/Nº',37.59765700,-0.97594200,4571,'L-D: 24H','CARTAGENA',1.131,NULL,NULL,1.224,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(93,'MUELLE DE LA SAL, S/Nº',37.63071200,-0.69872000,4571,'L-D: 24H','CABO DE PALOS',1.141,409.000,NULL,1.234,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(94,'MUELLE PESQUERO, S/Nº',37.56376800,-1.25510900,4581,'L-D: 24H','MAZARRON',NULL,384.000,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(95,'PUERTO TOMAS MAESTRE S/N',37.74763900,-0.74319400,4590,'L: 08:30-18:30','SAN JAVIER',1.150,NULL,NULL,1.240,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(96,'EXPLANADA, 2',37.81641700,-0.78441700,4591,'L-D: 08:00-18:00','SAN PEDRO DEL PINATAR',1.200,NULL,NULL,NULL,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(97,'CARRETERA GC-500 S/N (ANTIGUA CTRA. C-812) URBANIZACION PASITO BLANCO (VARADERO)',27.74694400,-15.62166700,5252,'L-D: 08:00-18:00','SAN BARTOLOME TIRAJANA',1.018,NULL,NULL,1.135,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(98,'C/ EL BERRUGO, 2',28.85711100,-13.81663900,5266,'L-D: 07:00-20:00','YAIZA',0.919,NULL,NULL,1.029,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(99,'LOS PANTALANES S/N',28.91583300,-13.70533300,5266,'L-D: 08:00-20:00','PUERTO CALERO',0.959,NULL,NULL,1.058,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(100,'MUELLE PESQUERO, S/Nº',42.32937600,-8.78512600,5271,'L-D: 24H','BUEU',1.143,NULL,NULL,1.248,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(101,'MUELLE DE TRAGOVE, S/Nº',42.51854200,-8.82818200,5273,'L-D: 24H','CAMBADOS',1.143,NULL,NULL,1.248,NULL,'2020-07-22 20:03:28','2020-07-22 20:03:28'),(102,'PORTO DE SANTO TOME S/N ',42.51252800,-8.81975000,5273,'L-D: 08:00-19:00','CAMBADOS',1.039,350.000,NULL,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(103,'PUERTO DE CANGAS, S/N',NULL,NULL,5275,'L-V: 08:30-14:00 y 16:30-19:30; S: 10:00-14:00','CANGAS',1.129,417.000,NULL,1.209,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(104,'PORO MELOXO S/N',42.48997200,-8.88927800,5288,'L: 08:00-20:00','GROVE (O)',1.028,350.000,NULL,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(105,'MUELLE DO XUFRE S/N',42.56555600,-8.86825000,5290,'L: 08:00-20:00','ISLA DE AROSA',1.069,350.000,NULL,1.089,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(106,'MUELLE PESQUERO, S/Nº',42.27493100,-8.73512600,5296,'L-D: 24H','MOAÑA',NULL,473.000,NULL,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(107,'MUELLE PESQUERO, S/Nº - ESTRIBELA-MARÍN',42.40159800,-8.69123700,5309,'L-D: 24H','ESTRIBELA',NULL,473.000,NULL,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(108,'AVENIDA AUGUSTO GONZALEZ BESADA, S/N',42.39529200,-8.80401500,5318,'L-D: 10:00-13:30 y 16:00-19:00','SANXENXO',1.260,NULL,NULL,1.270,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(109,'MUELLE COMERCIAL, S/Nº',42.39583300,-8.81777800,5318,'L-D: 24H','PORTONOVO',1.143,NULL,NULL,1.248,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(110,'AVDA. DE BEIRAMAR, 61',42.29659800,-8.61790400,5324,'L-D: 24H','VIGO',NULL,473.000,NULL,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(111,'PUERTO DE VILANOVA S/N',42.56466700,-8.83461100,5328,'L-V: 08:00-13:00 y 15:00-19:30; S: 09:00-13:00 y 15:00-19:30; D: 09:00-14:00','VILANOVA DE AROUSA',1.049,413.000,NULL,1.189,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(112,'PUERTO DEPORTIVO PUERTO COLON, EDF.CAPITANIA 1ª PLANTA',28.07933300,-16.73788900,5691,'L-D: 08:00-17:45','ADEJE',0.917,NULL,NULL,0.984,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(113,'DARSENA DE EMBARCACIONES MENORES PUERTO SANTA CRUZ DE LA PALMA',28.67908300,-17.76733300,5727,'L-S: 08:00-20:00; D: 08:00-15:30','SANTA CRUZ DE LA PALMA',0.975,NULL,NULL,1.056,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(114,'PORT ESPORTIU',40.92741700,0.85036100,6356,'L-D: 09:00-14:00 y 16:00-18:00','AMETLLA DE MAR (L\')',1.164,NULL,NULL,1.292,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(115,'MOLL DE PONENT S/N APTDO CORREOS 104',40.87938900,0.80211100,6356,'L-D: 09:00-13:00 y 15:00-19:00','AMETLLA DE MAR (L\')',1.115,NULL,1.246,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(116,'PORT ESPORTIU',40.80947200,0.71066700,6357,'L-D: 08:00-13:00 y 15:00-18:00','AMPOLLA (L\')',1.164,NULL,NULL,1.292,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(117,'Pº MARITIMO S/N',41.18608300,1.60755600,6381,'L-D: 08:00-20:00','SEGUR DE CALAFELL',1.164,NULL,NULL,1.291,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(118,'PUERTO PESQUERO, S/Nº',41.06275000,1.06188100,6383,'L-D: 24H','CAMBRILS',NULL,371.000,NULL,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(119,'URBANIZACIÓN RUIMAR',40.72080500,0.86076900,6396,'L-D: 24H','DELTEBRE',1.140,NULL,NULL,1.265,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(120,'EDIFICIO CAPITANIA,S/N',41.16755600,1.48550000,6475,'L-D: 24H','RODA DE BARA',1.128,NULL,NULL,1.225,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(121,'PUERTO, S/Nº',40.61386100,0.59688100,6481,'L-D: 24H','SANT CARLES DE LA RAPITA',NULL,371.000,NULL,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(122,'MUELLE DE REUS S/N',41.10691700,1.24219400,6494,'L-D: 24H','TARRAGONA',NULL,NULL,NULL,NULL,375.000,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(123,'EDIFICIO CAPITANIA, S/N',NULL,NULL,6499,'L-D: 09:00-14:00 y 16:00-19:00','TORREDEMBARRA',1.115,370.000,1.241,NULL,650.000,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(124,'MUELLE DR. CAPELLA S/N PUERTO DEPORTIVO',40.98863900,0.92769400,6508,'L-D: 08:00-20:00','HOSPITALET DE L\'INFANT',1.081,NULL,1.205,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(125,'PASSEIG MARÍTIM, S/N',41.17733300,1.52544400,6509,'L-D: 07:00-20:30','MASOS DE COMA-RUGA (ELS)',1.164,NULL,NULL,1.292,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(126,'PASEO MARITIMO NEPTUNO S/N',38.98380900,-0.15122000,7091,'L: 07:00-21:00','GANDIA',1.100,NULL,1.180,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(127,'ALFONSO EL MAGNANIMO, 41',38.93163900,-0.09469400,7140,'L: 08:00-19:00','OLIVA',1.099,NULL,NULL,1.189,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(128,'CAMINO DE CANAL, 91 - CLUB NAUTICO DE VALENCIA',39.42991700,-0.33072200,7214,'L-D: 24H','VALENCIA',1.219,NULL,NULL,1.269,679.000,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(129,'DIQUE NORTE, BOCANA DARSENA INTERIOR ',39.46130600,-0.31227800,7214,'L-D: 08:00-20:00','VALENCIA',1.169,NULL,NULL,1.239,650.000,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(130,'MUELLE NUEVO S/Nº',43.41725000,-2.71822200,7481,'L-D: 24H','BERMEO',NULL,333.000,NULL,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29'),(131,'EGUIDAZU KAIA, S/N',43.32641700,-2.41905600,7543,'L-D: 24H','ONDARROA',NULL,330.000,NULL,NULL,NULL,'2020-07-22 20:03:29','2020-07-22 20:03:29');
/*!40000 ALTER TABLE `estaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sepomex'
--

--
-- Dumping routines for database 'sepomex'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-22 22:57:38
