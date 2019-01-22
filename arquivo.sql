-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.16-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema curso_spring
--

CREATE DATABASE IF NOT EXISTS heroku_0b70333788d70cc;
USE heroku_0b70333788d70cc;

--
-- Definition of table `categoria`
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
INSERT INTO `categoria` (`id`,`nome`) VALUES 
 (1,'Informática'),
 (2,'Escritório'),
 (3,'Cama mesa e banho'),
 (4,'Eletrônicos'),
 (5,'Jardinagem'),
 (6,'Decoração'),
 (7,'Perfumaria');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Definition of table `cidade`
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
INSERT INTO `cidade` (`id`,`nome`,`estado_id`) VALUES 
 (1,'Uberlândia',1),
 (2,'São Paulo',2),
 (3,'Campinas',2);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;


--
-- Definition of table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL auto_increment,
  `cpf_ou_cnpj` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `nome` varchar(255) default NULL,
  `senha` varchar(255) default NULL,
  `tipo` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_cmxo70m08n43599l3h0h07cc6` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`,`cpf_ou_cnpj`,`email`,`nome`,`senha`,`tipo`) VALUES 
 (1,'01314561642','eduardo@prosanearinfo.com.br','Maria Silva','$2a$10$99upU4zg5ceRx/Jpuk1IqO42QfShVoqxaLj3CSmsipZHnS6vRnOt6',1),
 (2,'01314561642','eduardohmferreira@gmail.com','Ana Costa','$2a$10$hc5w1KhuorxfNBI6Rv5TBu5nK/YUzLtVLA.UGdTVUr1ronhB063WO',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


--
-- Definition of table `endereco`
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
INSERT INTO `endereco` (`id`,`bairro`,`cep`,`complemento`,`logradouro`,`numero`,`cidade_id`,`cliente_id`) VALUES 
 (1,'Jardim','38220834','Apto 300','Rua Flores','300',1,1),
 (2,'Centro','38777012','Sala 800','Avenia Matos','105',2,1),
 (3,'Centro','38777012',NULL,'Avenia Floriano','2106',2,2);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;


--
-- Definition of table `estado`
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
INSERT INTO `estado` (`id`,`nome`) VALUES 
 (1,'Minas Gerais'),
 (2,'São Paulo');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;


--
-- Definition of table `item_pedido`
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
INSERT INTO `item_pedido` (`desconto`,`preco`,`quantidade`,`pedido_id`,`produdo_id`) VALUES 
 (0,2000,1,1,1),
 (0,80,2,1,3),
 (100,800,1,2,2);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;


--
-- Definition of table `pagamento`
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
INSERT INTO `pagamento` (`pedido_id`,`estado`) VALUES 
 (1,2),
 (2,1);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;


--
-- Definition of table `pagamento_com_boleto`
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
INSERT INTO `pagamento_com_boleto` (`data_pagamento`,`data_vencimento`,`pedido_id`) VALUES 
 (NULL,'2017-01-01 00:00:00',2);
/*!40000 ALTER TABLE `pagamento_com_boleto` ENABLE KEYS */;


--
-- Definition of table `pagamento_com_cartao`
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
INSERT INTO `pagamento_com_cartao` (`numero_de_parcelas`,`pedido_id`) VALUES 
 (6,1);
/*!40000 ALTER TABLE `pagamento_com_cartao` ENABLE KEYS */;


--
-- Definition of table `pedido`
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
INSERT INTO `pedido` (`id`,`instante`,`cliente_id`,`endereco_de_entrega_id`) VALUES 
 (1,'2017-01-01 10:32:00',1,1),
 (2,'2017-01-01 19:35:00',1,2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;


--
-- Definition of table `perfis`
--

DROP TABLE IF EXISTS `perfis`;
CREATE TABLE `perfis` (
  `cliente_id` int(11) NOT NULL,
  `perfis` int(11) default NULL,
  KEY `FKsobr8hl9guwr8775lyl1mncg2` (`cliente_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfis`
--

/*!40000 ALTER TABLE `perfis` DISABLE KEYS */;
INSERT INTO `perfis` (`cliente_id`,`perfis`) VALUES 
 (1,2),
 (2,1),
 (2,2);
/*!40000 ALTER TABLE `perfis` ENABLE KEYS */;


--
-- Definition of table `produto`
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
INSERT INTO `produto` (`id`,`nome`,`preco`) VALUES 
 (1,'Computador',2000),
 (2,'Impressora',800),
 (3,'Mouse',80),
 (4,'Mesa de escritório',300),
 (5,'Toalha',50),
 (6,'Colcha',200),
 (7,'TV true color',1200),
 (8,'Roçadeira',800),
 (9,'Abajour',100),
 (10,'Pendente',180),
 (11,'Shampoo',90),
 (12,'Produto 12',10),
 (13,'Produto 13',10),
 (14,'Produto 14',10),
 (15,'Produto 15',10),
 (16,'Produto 16',10),
 (17,'Produto 17',10),
 (18,'Produto 18',10),
 (19,'Produto 19',10),
 (20,'Produto 20',10),
 (21,'Produto 21',10),
 (22,'Produto 22',10),
 (23,'Produto 23',10),
 (24,'Produto 24',10),
 (25,'Produto 25',10),
 (26,'Produto 26',10),
 (27,'Produto 27',10),
 (28,'Produto 28',10),
 (29,'Produto 29',10),
 (30,'Produto 30',10),
 (31,'Produto 31',10),
 (32,'Produto 32',10),
 (33,'Produto 34',10),
 (34,'Produto 35',10),
 (35,'Produto 36',10),
 (36,'Produto 37',10),
 (37,'Produto 38',10),
 (38,'Produto 39',10),
 (39,'Produto 40',10),
 (40,'Produto 41',10),
 (41,'Produto 42',10),
 (42,'Produto 43',10),
 (43,'Produto 44',10),
 (44,'Produto 45',10),
 (45,'Produto 46',10),
 (46,'Produto 47',10),
 (47,'Produto 48',10),
 (48,'Produto 49',10),
 (49,'Produto 50',10);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


--
-- Definition of table `produto_categoria`
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
INSERT INTO `produto_categoria` (`produto_id`,`categoria_id`) VALUES 
 (1,1),
 (1,4),
 (2,1),
 (2,2),
 (2,4),
 (3,1),
 (3,4),
 (4,2),
 (5,3),
 (6,3),
 (7,4),
 (8,5),
 (9,6),
 (10,6),
 (11,7),
 (12,1),
 (13,1),
 (14,1),
 (15,1),
 (16,1),
 (17,1),
 (18,1),
 (19,1),
 (20,1),
 (21,1),
 (22,1),
 (23,1),
 (24,1),
 (25,1),
 (26,1),
 (27,1),
 (28,1),
 (29,1),
 (30,1),
 (31,1),
 (32,1),
 (33,1),
 (34,1),
 (35,1),
 (36,1),
 (37,1),
 (38,1),
 (39,1),
 (40,1),
 (41,1),
 (42,1),
 (43,1),
 (44,1),
 (45,1),
 (46,1),
 (47,1),
 (48,1),
 (49,1);
/*!40000 ALTER TABLE `produto_categoria` ENABLE KEYS */;


--
-- Definition of table `telefone`
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
INSERT INTO `telefone` (`cliente_id`,`telefones`) VALUES 
 (1,'35988884444'),
 (1,'35999998888'),
 (2,'35988884444'),
 (2,'35999998888');
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
