-- --------------------------------------------------------
-- Хост:                         192.168.2.252
-- Версия сервера:               5.5.44-MariaDB - MariaDB Server
-- Операционная система:         Linux
-- HeidiSQL Версия:              9.3.0.5053
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных database
DROP DATABASE IF EXISTS `database`;
CREATE DATABASE IF NOT EXISTS `database` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `database`;

-- Дамп структуры для таблица database.Keywords
DROP TABLE IF EXISTS `Keywords`;
CREATE TABLE IF NOT EXISTS `Keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор ключевого слова',
  `Name` varchar(2048) NOT NULL COMMENT 'Название ключевого слова',
  `PersonID` int(11) NOT NULL COMMENT 'Идентификатор личности, которой соответствует данное ключевое слово. Является внешним ключом к таблице Persons.',
  KEY `ID` (`ID`),
  KEY `FK__Persons` (`PersonID`),
  CONSTRAINT `FK__Persons` FOREIGN KEY (`PersonID`) REFERENCES `Persons` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='2. Keywords (ключевые слова)– таблица базы данных, отвечающая за хранение ключевых слов, соответствующих каждой конкретной личности. Встретив какое-либо из ключевых слов на HTML-странице веб-сайта, мы считаем, что встретили упоминание соответствующей ему личности на данной HTML-странице. Каждому ключевому слову соответствует ровно одна личность.';

-- Экспортируемые данные не выделены.
-- Дамп структуры для таблица database.Pages
DROP TABLE IF EXISTS `Pages`;
CREATE TABLE IF NOT EXISTS `Pages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор страницы сайта',
  `Url` varchar(2048) NOT NULL COMMENT 'Полный URL адрес страницы',
  `SiteID` int(11) NOT NULL COMMENT 'Идентификатор сайта (ресурса), который предоставлен  администратором для анализа. Является внешним ключом к таблице Sites',
  `FoundDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время обнаружения страницы системой',
  `LastScanDate` datetime DEFAULT NULL COMMENT 'Дата и время последней проверки на упоминания',
  KEY `ID` (`ID`),
  KEY `FK_Pages_Sites` (`SiteID`),
  CONSTRAINT `FK_Pages_Sites` FOREIGN KEY (`SiteID`) REFERENCES `Sites` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='4. Pages (страница сайта) – таблица базы данных, содержит страницы сайта, которые были найдены при анализе сайтов из таблицы Sites.  ';

-- Экспортируемые данные не выделены.
-- Дамп структуры для таблица database.PersonPageRank
DROP TABLE IF EXISTS `PersonPageRank`;
CREATE TABLE IF NOT EXISTS `PersonPageRank` (
  `PersonID` int(11) NOT NULL COMMENT 'Идентификатор личности, которой соответствует данное ключевое слово. Является внешним ключом к таблице Persons.',
  `PageID` int(11) NOT NULL COMMENT 'Идентификатор страницы сайта, на которой найдены упоминания о персонах. Является внешним ключом к таблице Pages\\r\\n',
  `Rank` int(11) NOT NULL COMMENT 'Количество упоминаний личности на странице ',
  KEY `FK_PersonPageRank_Persons` (`PersonID`),
  KEY `FK_PersonPageRank_Pages` (`PageID`),
  CONSTRAINT `FK_PersonPageRank_Pages` FOREIGN KEY (`PageID`) REFERENCES `Pages` (`ID`),
  CONSTRAINT `FK_PersonPageRank_Persons` FOREIGN KEY (`PersonID`) REFERENCES `Persons` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='3. PersonPageRank (рейтинг личности на странице сайта) – таблица базы данных, отвечающая за хранение количества упоминаний каждой личности на обработанной  странице.';

-- Экспортируемые данные не выделены.
-- Дамп структуры для таблица database.Persons
DROP TABLE IF EXISTS `Persons`;
CREATE TABLE IF NOT EXISTS `Persons` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор личности',
  `Name` varchar(2048) NOT NULL COMMENT 'Наименование личности',
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='1. Persons (личности)– таблица базы данных, отвечающая за хранение имен личностей. Каждой личности соответствует от 0 до бесконечности ключевых слов.';

-- Экспортируемые данные не выделены.
-- Дамп структуры для таблица database.Sites
DROP TABLE IF EXISTS `Sites`;
CREATE TABLE IF NOT EXISTS `Sites` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сайта',
  `Name` varchar(2048) NOT NULL COMMENT 'Наименование сайта',
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='5. Sites  (сайт) – таблица базы данных, содержит названия сайтов для анализа на упоминания.';

-- Экспортируемые данные не выделены.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
