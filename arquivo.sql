-- MySQL dump 10.10
--
-- Host: localhost    Database: curso_spring
-- ------------------------------------------------------
-- Server version	5.0.16-nt

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
--


/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
LOCK TABLES `categoria` WRITE;
INSERT INTO `categoria` VALUES (1,'Informática'),(2,'Escritório'),(3,'Cama mesa e banho'),(4,'Eletrônicos'),(5,'Jardinagem'),(6,'Decoração'),(7,'Perfumaria');
UNLOCK TABLES;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
CREATE TABLE `cidade` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(255) default NULL,
  `estado_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKkworrwk40xj58kevvh3evi500` (`estado_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cidade`
--


/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
LOCK TABLES `cidade` WRITE;
INSERT INTO `cidade` VALUES (1,'Uberlândia',1),(2,'São Paulo',2),(3,'Campinas',2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL auto_increment,
  `cpf_ou_cnpj` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `nome` varchar(255) default NULL,
  `tipo` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_cmxo70m08n43599l3h0h07cc6` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--


/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
LOCK TABLES `cliente` WRITE;
INSERT INTO `cliente` VALUES (1,'01314561642','maria@a.com','Maria Silva',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco` (
  `id` int(11) NOT NULL auto_increment,
  `bairro` varchar(255) default NULL,
  `cep` varchar(255) default NULL,
  `complemento` varchar(255) default NULL,
  `logradouro` varchar(255) default NULL,
  `numero` varchar(255) default NULL,
  `cidade_id` int(11) default NULL,
  `cliente_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK8b1kcb3wucapb8dejshyn5fsx` (`cidade_id`),
  KEY `FK8s7ivtl4foyhrfam9xqom73n9` (`cliente_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `endereco`
--


/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
LOCK TABLES `endereco` WRITE;
INSERT INTO `endereco` VALUES (1,'Jardim','38220834','Apto 300','Rua Flores','300',1,1),(2,'Centro','38777012','Sala 800','Avenia Matos','105',2,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estado`
--


/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
LOCK TABLES `estado` WRITE;
INSERT INTO `estado` VALUES (1,'Minas Gerais'),(2,'São Paulo');
UNLOCK TABLES;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
CREATE TABLE `item_pedido` (
  `desconto` double default NULL,
  `preco` double default NULL,
  `quantidade` int(11) default NULL,
  `pedido_id` int(11) NOT NULL,
  `produdo_id` int(11) NOT NULL,
  PRIMARY KEY  (`pedido_id`,`produdo_id`),
  KEY `FKsvm4mwet7bteg1usdyr5axj1j` (`produdo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_pedido`
--


/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
LOCK TABLES `item_pedido` WRITE;
INSERT INTO `item_pedido` VALUES (0,2000,1,1,1),(0,80,2,1,3),(100,800,1,2,2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
CREATE TABLE `pagamento` (
  `pedido_id` int(11) NOT NULL,
  `estado` int(11) default NULL,
  PRIMARY KEY  (`pedido_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pagamento`
--


/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
LOCK TABLES `pagamento` WRITE;
INSERT INTO `pagamento` VALUES (1,2),(2,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;

--
-- Table structure for table `pagamento_com_boleto`
--

DROP TABLE IF EXISTS `pagamento_com_boleto`;
CREATE TABLE `pagamento_com_boleto` (
  `data_pagamento` datetime default NULL,
  `data_vencimento` datetime default NULL,
  `pedido_id` int(11) NOT NULL,
  PRIMARY KEY  (`pedido_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pagamento_com_boleto`
--


/*!40000 ALTER TABLE `pagamento_com_boleto` DISABLE KEYS */;
LOCK TABLES `pagamento_com_boleto` WRITE;
INSERT INTO `pagamento_com_boleto` VALUES (NULL,'2017-01-01 00:00:00',2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pagamento_com_boleto` ENABLE KEYS */;

--
-- Table structure for table `pagamento_com_cartao`
--

DROP TABLE IF EXISTS `pagamento_com_cartao`;
CREATE TABLE `pagamento_com_cartao` (
  `numero_de_parcelas` int(11) default NULL,
  `pedido_id` int(11) NOT NULL,
  PRIMARY KEY  (`pedido_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pagamento_com_cartao`
--


/*!40000 ALTER TABLE `pagamento_com_cartao` DISABLE KEYS */;
LOCK TABLES `pagamento_com_cartao` WRITE;
INSERT INTO `pagamento_com_cartao` VALUES (6,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pagamento_com_cartao` ENABLE KEYS */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `id` int(11) NOT NULL auto_increment,
  `instante` datetime default NULL,
  `cliente_id` int(11) default NULL,
  `endereco_de_entrega_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK30s8j2ktpay6of18lbyqn3632` (`cliente_id`),
  KEY `FK1fihyy2fnocpuwc74674qmfkv` (`endereco_de_entrega_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pedido`
--


/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
LOCK TABLES `pedido` WRITE;
INSERT INTO `pedido` VALUES (1,'2017-01-01 10:32:00',1,1),(2,'2017-01-01 19:35:00',1,2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(255) default NULL,
  `preco` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produto`
--


/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
LOCK TABLES `produto` WRITE;
INSERT INTO `produto` VALUES (1,'Computador',2000),(2,'Impressora',800),(3,'Mouse',80),(4,'Mesa de escritório',300),(5,'Toalha',50),(6,'Colcha',200),(7,'TV true color',1200),(8,'Roçadeira',800),(9,'Abajour',100),(10,'Pendente',180),(11,'Shampoo',90);
UNLOCK TABLES;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

--
-- Table structure for table `produto_categoria`
--

DROP TABLE IF EXISTS `produto_categoria`;
CREATE TABLE `produto_categoria` (
  `produto_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  KEY `FKq3g33tp7xk2juh53fbw6y4y57` (`categoria_id`),
  KEY `FK1c0y58d3n6x3m6euv2j3h64vt` (`produto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produto_categoria`
--


/*!40000 ALTER TABLE `produto_categoria` DISABLE KEYS */;
LOCK TABLES `produto_categoria` WRITE;
INSERT INTO `produto_categoria` VALUES (1,1),(1,4),(2,1),(2,2),(2,4),(3,1),(3,4),(4,2),(5,3),(6,3),(7,4),(8,5),(9,6),(10,6),(11,7);
UNLOCK TABLES;
/*!40000 ALTER TABLE `produto_categoria` ENABLE KEYS */;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
CREATE TABLE `telefone` (
  `cliente_id` int(11) NOT NULL,
  `telefones` varchar(255) default NULL,
  KEY `FK8aafha0njkoyoe3kvrwsy3g8u` (`cliente_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `telefone`
--


/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
LOCK TABLES `telefone` WRITE;
INSERT INTO `telefone` VALUES (1,'35988884444'),(1,'35999998888');
UNLOCK TABLES;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

