-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.18-0ubuntu0.16.04.1 - (Ubuntu)
-- Операционная система:         Linux
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица vi_ibvd.courier
CREATE TABLE IF NOT EXISTS `courier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `start_work` date NOT NULL,
  `end_work` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vi_ibvd.courier: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `courier` DISABLE KEYS */;
INSERT IGNORE INTO `courier` (`id`, `name`, `start_work`, `end_work`) VALUES
	(1, 'Крылов Антонин Федотович', '2014-09-04', '2015-09-05'),
	(2, 'Галкин Лукий Васильевич', '2015-09-04', NULL),
	(3, 'Князев Святослав Евсеевич', '2016-09-04', NULL),
	(4, 'Фокин Серапион Аркадьевич', '2015-09-04', NULL),
	(5, 'Лазарев Григорий Фролович', '2015-01-01', NULL),
	(6, 'Ларионов Александр Матвеевич', '2017-09-04', NULL),
	(7, 'Егоров Денис Кимович', '2017-01-01', NULL),
	(8, 'Сафонов Ростислав Витальевич', '2016-01-01', NULL),
	(9, 'Новиков Альвиан Ефимович', '2015-01-01', NULL),
	(10, 'Козлов Ростислав Валерьянович', '2014-01-01', NULL);
/*!40000 ALTER TABLE `courier` ENABLE KEYS */;

-- Дамп структуры для таблица vi_ibvd.region
CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `days_send` tinyint(3) unsigned NOT NULL,
  `days_back` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vi_ibvd.region: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT IGNORE INTO `region` (`id`, `name`, `days_send`, `days_back`) VALUES
	(1, 'Санкт-Петербург', 2, 2),
	(2, 'Уфа', 3, 2),
	(3, 'Нижний Новгород', 4, 4),
	(4, 'Владимир', 5, 5),
	(5, 'Кострома', 7, 7),
	(6, 'Екатеринбург', 6, 5),
	(7, 'Ковров', 2, 1),
	(8, 'Воронеж', 3, 3),
	(9, 'Самара', 3, 4),
	(10, 'Астрахань', 5, 4);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;

-- Дамп структуры для таблица vi_ibvd.shipment
CREATE TABLE IF NOT EXISTS `shipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courier` int(11) NOT NULL,
  `region` int(11) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_shipment_courier` (`courier`),
  KEY `FK_shipment_region` (`region`),
  CONSTRAINT `FK_shipment_courier` FOREIGN KEY (`courier`) REFERENCES `courier` (`id`),
  CONSTRAINT `FK_shipment_region` FOREIGN KEY (`region`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vi_ibvd.shipment: ~460 rows (приблизительно)
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT IGNORE INTO `shipment` (`id`, `courier`, `region`, `date_start`, `date_end`) VALUES
	(8, 1, 3, '2015-06-01', '2015-06-09'),
	(9, 1, 6, '2015-06-09', '2015-06-20'),
	(10, 1, 5, '2015-06-20', '2015-07-04'),
	(11, 1, 6, '2015-07-04', '2015-07-15'),
	(12, 1, 10, '2015-07-15', '2015-07-24'),
	(13, 1, 3, '2015-07-24', '2015-08-01'),
	(14, 1, 2, '2015-08-01', '2015-08-06'),
	(15, 1, 6, '2015-08-06', '2015-08-17'),
	(16, 1, 1, '2015-08-17', '2015-08-21'),
	(17, 1, 6, '2015-08-21', '2015-09-01'),
	(18, 1, 4, '2015-09-01', '2015-09-11'),
	(19, 1, 4, '2015-09-11', '2015-09-21'),
	(20, 1, 4, '2015-09-21', '2015-10-01'),
	(21, 1, 9, '2015-10-01', '2015-10-08'),
	(22, 1, 7, '2015-10-08', '2015-10-11'),
	(23, 1, 9, '2015-10-11', '2015-10-18'),
	(24, 1, 7, '2015-10-18', '2015-10-21'),
	(25, 1, 7, '2015-10-21', '2015-10-24'),
	(26, 1, 1, '2015-10-24', '2015-10-28'),
	(27, 1, 4, '2015-10-28', '2015-11-07'),
	(28, 1, 9, '2015-11-07', '2015-11-14'),
	(29, 1, 2, '2015-11-14', '2015-11-19'),
	(30, 1, 6, '2015-11-19', '2015-11-30'),
	(31, 1, 8, '2015-11-30', '2015-12-06'),
	(32, 1, 2, '2015-12-06', '2015-12-11'),
	(33, 1, 7, '2015-12-11', '2015-12-14'),
	(34, 1, 10, '2015-12-14', '2015-12-23'),
	(35, 1, 9, '2015-12-23', '2015-12-30'),
	(36, 1, 3, '2015-12-30', '2016-01-07'),
	(37, 1, 7, '2016-01-07', '2016-01-10'),
	(38, 1, 1, '2016-01-10', '2016-01-14'),
	(39, 1, 3, '2016-01-14', '2016-01-22'),
	(40, 1, 4, '2016-01-22', '2016-02-01'),
	(41, 1, 7, '2016-02-01', '2016-02-04'),
	(42, 1, 1, '2016-02-04', '2016-02-08'),
	(43, 1, 2, '2016-02-08', '2016-02-13'),
	(44, 1, 2, '2016-02-13', '2016-02-18'),
	(45, 1, 10, '2016-02-18', '2016-02-27'),
	(46, 1, 1, '2016-02-27', '2016-03-02'),
	(47, 1, 10, '2016-03-02', '2016-03-11'),
	(48, 1, 8, '2016-03-11', '2016-03-17'),
	(49, 1, 9, '2016-03-17', '2016-03-24'),
	(50, 1, 7, '2016-03-24', '2016-03-27'),
	(51, 1, 1, '2016-03-27', '2016-03-31'),
	(52, 1, 1, '2016-03-31', '2016-04-04'),
	(53, 1, 8, '2016-04-04', '2016-04-10'),
	(54, 1, 6, '2016-04-10', '2016-04-21'),
	(55, 1, 10, '2016-04-21', '2016-04-30'),
	(56, 1, 8, '2016-04-30', '2016-05-06'),
	(57, 1, 10, '2016-05-06', '2016-05-15'),
	(58, 1, 2, '2016-05-15', '2016-05-20'),
	(59, 1, 10, '2016-05-20', '2016-05-29'),
	(60, 1, 2, '2016-05-29', '2016-06-03'),
	(61, 1, 9, '2016-06-03', '2016-06-10'),
	(62, 1, 4, '2016-06-10', '2016-06-20'),
	(63, 1, 2, '2016-06-20', '2016-06-25'),
	(64, 1, 3, '2016-06-25', '2016-07-03'),
	(65, 1, 8, '2016-07-03', '2016-07-09'),
	(66, 1, 10, '2016-07-09', '2016-07-18'),
	(67, 1, 1, '2016-07-18', '2016-07-22'),
	(68, 1, 8, '2016-07-22', '2016-07-28'),
	(69, 1, 5, '2016-07-28', '2016-08-11'),
	(70, 1, 8, '2016-08-11', '2016-08-17'),
	(71, 1, 2, '2016-08-17', '2016-08-22'),
	(72, 1, 10, '2016-08-22', '2016-08-31'),
	(73, 1, 1, '2016-08-31', '2016-09-04'),
	(74, 1, 1, '2016-09-04', '2016-09-08'),
	(75, 1, 4, '2016-09-08', '2016-09-18'),
	(76, 1, 1, '2016-09-18', '2016-09-22'),
	(77, 1, 1, '2016-09-22', '2016-09-26'),
	(78, 1, 1, '2016-09-26', '2016-09-30'),
	(79, 1, 2, '2016-09-30', '2016-10-05'),
	(80, 1, 2, '2016-10-05', '2016-10-10'),
	(81, 1, 4, '2016-10-10', '2016-10-20'),
	(82, 1, 6, '2016-10-20', '2016-10-31'),
	(83, 1, 2, '2016-10-31', '2016-11-05'),
	(84, 1, 7, '2016-11-05', '2016-11-08'),
	(85, 1, 8, '2016-11-08', '2016-11-14'),
	(86, 1, 8, '2016-11-14', '2016-11-20'),
	(87, 1, 6, '2016-11-20', '2016-12-01'),
	(88, 1, 1, '2016-12-01', '2016-12-05'),
	(89, 1, 3, '2016-12-05', '2016-12-13'),
	(90, 1, 5, '2016-12-13', '2016-12-27'),
	(91, 1, 7, '2016-12-27', '2016-12-30'),
	(92, 1, 4, '2016-12-30', '2017-01-09'),
	(93, 1, 3, '2017-01-09', '2017-01-17'),
	(94, 1, 4, '2017-01-17', '2017-01-27'),
	(95, 1, 4, '2017-01-27', '2017-02-06'),
	(96, 1, 3, '2017-02-06', '2017-02-14'),
	(97, 1, 8, '2017-02-14', '2017-02-20'),
	(98, 1, 1, '2017-02-20', '2017-02-24'),
	(99, 1, 9, '2017-02-24', '2017-03-03'),
	(100, 1, 1, '2017-03-03', '2017-03-07'),
	(101, 1, 3, '2017-03-07', '2017-03-15'),
	(102, 1, 1, '2017-03-15', '2017-03-19'),
	(103, 1, 5, '2017-03-19', '2017-04-02'),
	(104, 1, 6, '2017-04-02', '2017-04-13'),
	(105, 1, 10, '2017-04-13', '2017-04-22'),
	(106, 1, 7, '2017-04-22', '2017-04-25'),
	(107, 1, 4, '2017-04-25', '2017-05-05'),
	(108, 1, 4, '2017-05-05', '2017-05-15'),
	(109, 1, 3, '2017-05-15', '2017-05-23'),
	(110, 1, 8, '2017-05-23', '2017-05-29'),
	(111, 1, 5, '2017-05-29', '2017-06-12'),
	(112, 1, 7, '2017-06-12', '2017-06-15'),
	(113, 1, 10, '2017-06-15', '2017-06-24'),
	(114, 1, 4, '2017-06-24', '2017-07-04'),
	(115, 1, 7, '2017-07-04', '2017-07-07'),
	(116, 1, 9, '2017-07-07', '2017-07-14'),
	(117, 1, 10, '2017-07-14', '2017-07-23'),
	(118, 1, 6, '2017-07-23', '2017-08-03'),
	(119, 1, 7, '2017-08-03', '2017-08-06'),
	(120, 1, 2, '2017-08-06', '2017-08-11'),
	(121, 1, 6, '2017-08-11', '2017-08-22'),
	(122, 1, 1, '2017-08-22', '2017-08-26'),
	(123, 2, 10, '2015-09-04', '2015-09-13'),
	(124, 2, 4, '2015-09-13', '2015-09-23'),
	(125, 2, 6, '2015-09-23', '2015-10-04'),
	(126, 2, 8, '2015-10-04', '2015-10-10'),
	(127, 2, 3, '2015-10-10', '2015-10-18'),
	(128, 2, 6, '2015-10-18', '2015-10-29'),
	(129, 2, 2, '2015-10-29', '2015-11-03'),
	(130, 2, 4, '2015-11-03', '2015-11-13'),
	(131, 2, 8, '2015-11-13', '2015-11-19'),
	(132, 2, 8, '2015-11-19', '2015-11-25'),
	(133, 2, 9, '2015-11-25', '2015-12-02'),
	(134, 2, 9, '2015-12-02', '2015-12-09'),
	(135, 2, 2, '2015-12-09', '2015-12-14'),
	(136, 2, 8, '2015-12-14', '2015-12-20'),
	(137, 2, 5, '2015-12-20', '2016-01-03'),
	(138, 2, 9, '2016-01-03', '2016-01-10'),
	(139, 2, 8, '2016-01-10', '2016-01-16'),
	(140, 2, 5, '2016-01-16', '2016-01-30'),
	(141, 2, 10, '2016-01-30', '2016-02-08'),
	(142, 2, 4, '2016-02-08', '2016-02-18'),
	(143, 2, 10, '2016-02-18', '2016-02-27'),
	(144, 2, 2, '2016-02-27', '2016-03-03'),
	(145, 2, 2, '2016-03-03', '2016-03-08'),
	(146, 2, 5, '2016-03-08', '2016-03-22'),
	(147, 2, 10, '2016-03-22', '2016-03-31'),
	(148, 2, 8, '2016-03-31', '2016-04-06'),
	(149, 2, 6, '2016-04-06', '2016-04-17'),
	(150, 2, 1, '2016-04-17', '2016-04-21'),
	(151, 2, 8, '2016-04-21', '2016-04-27'),
	(152, 2, 6, '2016-04-27', '2016-05-08'),
	(153, 2, 5, '2016-05-08', '2016-05-22'),
	(154, 2, 3, '2016-05-22', '2016-05-30'),
	(155, 2, 7, '2016-05-30', '2016-06-02'),
	(156, 2, 2, '2016-06-02', '2016-06-07'),
	(157, 2, 9, '2016-06-07', '2016-06-14'),
	(158, 2, 6, '2016-06-14', '2016-06-25'),
	(159, 2, 6, '2016-06-25', '2016-07-06'),
	(160, 2, 2, '2016-07-06', '2016-07-11'),
	(161, 2, 6, '2016-07-11', '2016-07-22'),
	(162, 2, 5, '2016-07-22', '2016-08-05'),
	(163, 2, 9, '2016-08-05', '2016-08-12'),
	(164, 2, 5, '2016-08-12', '2016-08-26'),
	(165, 2, 6, '2016-08-26', '2016-09-06'),
	(166, 2, 1, '2016-09-06', '2016-09-10'),
	(167, 2, 8, '2016-09-10', '2016-09-16'),
	(168, 2, 3, '2016-09-16', '2016-09-24'),
	(169, 2, 4, '2016-09-24', '2016-10-04'),
	(170, 2, 6, '2016-10-04', '2016-10-15'),
	(171, 2, 7, '2016-10-15', '2016-10-18'),
	(172, 2, 10, '2016-10-18', '2016-10-27'),
	(173, 2, 7, '2016-10-27', '2016-10-30'),
	(174, 2, 6, '2016-10-30', '2016-11-10'),
	(175, 2, 9, '2016-11-10', '2016-11-17'),
	(176, 2, 3, '2016-11-17', '2016-11-25'),
	(177, 2, 3, '2016-11-25', '2016-12-03'),
	(178, 2, 4, '2016-12-03', '2016-12-13'),
	(179, 2, 8, '2016-12-13', '2016-12-19'),
	(180, 2, 3, '2016-12-19', '2016-12-27'),
	(181, 2, 10, '2016-12-27', '2017-01-05'),
	(182, 2, 10, '2017-01-05', '2017-01-14'),
	(183, 2, 4, '2017-01-14', '2017-01-24'),
	(184, 2, 1, '2017-01-24', '2017-01-28'),
	(185, 2, 9, '2017-01-28', '2017-02-04'),
	(186, 2, 6, '2017-02-04', '2017-02-15'),
	(187, 2, 5, '2017-02-15', '2017-03-01'),
	(188, 2, 9, '2017-03-01', '2017-03-08'),
	(189, 2, 9, '2017-03-08', '2017-03-15'),
	(190, 2, 8, '2017-03-15', '2017-03-21'),
	(191, 2, 7, '2017-03-21', '2017-03-24'),
	(192, 2, 1, '2017-03-24', '2017-03-28'),
	(193, 2, 7, '2017-03-28', '2017-03-31'),
	(194, 2, 6, '2017-03-31', '2017-04-11'),
	(195, 2, 10, '2017-04-11', '2017-04-20'),
	(196, 2, 3, '2017-04-20', '2017-04-28'),
	(197, 2, 2, '2017-04-28', '2017-05-03'),
	(198, 2, 6, '2017-05-03', '2017-05-14'),
	(199, 2, 6, '2017-05-14', '2017-05-25'),
	(200, 2, 9, '2017-05-25', '2017-06-01'),
	(201, 2, 10, '2017-06-01', '2017-06-10'),
	(202, 2, 6, '2017-06-10', '2017-06-21'),
	(203, 2, 6, '2017-06-21', '2017-07-02'),
	(204, 2, 4, '2017-07-02', '2017-07-12'),
	(205, 2, 8, '2017-07-12', '2017-07-18'),
	(206, 2, 4, '2017-07-18', '2017-07-28'),
	(207, 2, 5, '2017-07-28', '2017-08-11'),
	(208, 2, 5, '2017-08-11', '2017-08-25'),
	(209, 3, 5, '2016-09-04', '2016-09-18'),
	(210, 3, 7, '2016-09-18', '2016-09-21'),
	(211, 3, 2, '2016-09-21', '2016-09-26'),
	(212, 3, 4, '2016-09-26', '2016-10-06'),
	(213, 3, 2, '2016-10-06', '2016-10-11'),
	(214, 3, 7, '2016-10-11', '2016-10-14'),
	(215, 3, 9, '2016-10-14', '2016-10-21'),
	(216, 3, 3, '2016-10-21', '2016-10-29'),
	(217, 3, 2, '2016-10-29', '2016-11-03'),
	(218, 3, 2, '2016-11-03', '2016-11-08'),
	(219, 3, 10, '2016-11-08', '2016-11-17'),
	(220, 3, 9, '2016-11-17', '2016-11-24'),
	(221, 3, 5, '2016-11-24', '2016-12-08'),
	(222, 3, 10, '2016-12-08', '2016-12-17'),
	(223, 3, 5, '2016-12-17', '2016-12-31'),
	(224, 3, 1, '2016-12-31', '2017-01-04'),
	(225, 3, 7, '2017-01-04', '2017-01-07'),
	(226, 3, 10, '2017-01-07', '2017-01-16'),
	(227, 3, 1, '2017-01-16', '2017-01-20'),
	(228, 3, 3, '2017-01-20', '2017-01-28'),
	(229, 3, 7, '2017-01-28', '2017-01-31'),
	(230, 3, 2, '2017-01-31', '2017-02-05'),
	(231, 3, 7, '2017-02-05', '2017-02-08'),
	(232, 3, 9, '2017-02-08', '2017-02-15'),
	(233, 3, 3, '2017-02-15', '2017-02-23'),
	(234, 3, 6, '2017-02-23', '2017-03-06'),
	(235, 3, 10, '2017-03-06', '2017-03-15'),
	(236, 3, 10, '2017-03-15', '2017-03-24'),
	(237, 3, 7, '2017-03-24', '2017-03-27'),
	(238, 3, 9, '2017-03-27', '2017-04-03'),
	(239, 3, 3, '2017-04-03', '2017-04-11'),
	(240, 3, 9, '2017-04-11', '2017-04-18'),
	(241, 3, 6, '2017-04-18', '2017-04-29'),
	(242, 3, 6, '2017-04-29', '2017-05-10'),
	(243, 3, 4, '2017-05-10', '2017-05-20'),
	(244, 3, 9, '2017-05-20', '2017-05-27'),
	(245, 3, 3, '2017-05-27', '2017-06-04'),
	(246, 3, 10, '2017-06-04', '2017-06-13'),
	(247, 3, 10, '2017-06-13', '2017-06-22'),
	(248, 3, 10, '2017-06-22', '2017-07-01'),
	(249, 3, 7, '2017-07-01', '2017-07-04'),
	(250, 3, 8, '2017-07-04', '2017-07-10'),
	(251, 3, 4, '2017-07-10', '2017-07-20'),
	(252, 3, 2, '2017-07-20', '2017-07-25'),
	(253, 3, 10, '2017-07-25', '2017-08-03'),
	(254, 3, 6, '2017-08-03', '2017-08-14'),
	(255, 3, 1, '2017-08-14', '2017-08-18'),
	(256, 3, 10, '2017-08-18', '2017-08-27'),
	(257, 3, 8, '2017-08-27', '2017-09-02'),
	(258, 4, 1, '2015-09-04', '2015-09-08'),
	(259, 4, 5, '2015-09-08', '2015-09-22'),
	(260, 4, 4, '2015-09-22', '2015-10-02'),
	(261, 4, 6, '2015-10-02', '2015-10-13'),
	(262, 4, 3, '2015-10-13', '2015-10-21'),
	(263, 4, 8, '2015-10-21', '2015-10-27'),
	(264, 4, 2, '2015-10-27', '2015-11-01'),
	(265, 4, 7, '2015-11-01', '2015-11-04'),
	(266, 4, 2, '2015-11-04', '2015-11-09'),
	(267, 4, 9, '2015-11-09', '2015-11-16'),
	(268, 4, 6, '2015-11-16', '2015-11-27'),
	(269, 4, 7, '2015-11-27', '2015-11-30'),
	(270, 4, 8, '2015-11-30', '2015-12-06'),
	(271, 4, 1, '2015-12-06', '2015-12-10'),
	(272, 4, 7, '2015-12-10', '2015-12-13'),
	(273, 4, 5, '2015-12-13', '2015-12-27'),
	(274, 4, 1, '2015-12-27', '2015-12-31'),
	(275, 4, 9, '2015-12-31', '2016-01-07'),
	(276, 4, 8, '2016-01-07', '2016-01-13'),
	(277, 4, 8, '2016-01-13', '2016-01-19'),
	(278, 4, 2, '2016-01-19', '2016-01-24'),
	(279, 4, 9, '2016-01-24', '2016-01-31'),
	(280, 4, 10, '2016-01-31', '2016-02-09'),
	(281, 4, 7, '2016-02-09', '2016-02-12'),
	(282, 4, 4, '2016-02-12', '2016-02-22'),
	(283, 4, 1, '2016-02-22', '2016-02-26'),
	(284, 4, 3, '2016-02-26', '2016-03-05'),
	(285, 4, 4, '2016-03-05', '2016-03-15'),
	(286, 4, 4, '2016-03-15', '2016-03-25'),
	(287, 4, 3, '2016-03-25', '2016-04-02'),
	(288, 4, 2, '2016-04-02', '2016-04-07'),
	(289, 4, 7, '2016-04-07', '2016-04-10'),
	(290, 4, 6, '2016-04-10', '2016-04-21'),
	(291, 4, 5, '2016-04-21', '2016-05-05'),
	(292, 4, 8, '2016-05-05', '2016-05-11'),
	(293, 4, 6, '2016-05-11', '2016-05-22'),
	(294, 4, 5, '2016-05-22', '2016-06-05'),
	(295, 4, 7, '2016-06-05', '2016-06-08'),
	(296, 4, 8, '2016-06-08', '2016-06-14'),
	(297, 4, 5, '2016-06-14', '2016-06-28'),
	(298, 4, 5, '2016-06-28', '2016-07-12'),
	(299, 4, 1, '2016-07-12', '2016-07-16'),
	(300, 4, 4, '2016-07-16', '2016-07-26'),
	(301, 4, 9, '2016-07-26', '2016-08-02'),
	(302, 4, 3, '2016-08-02', '2016-08-10'),
	(303, 4, 4, '2016-08-10', '2016-08-20'),
	(304, 4, 8, '2016-08-20', '2016-08-26'),
	(305, 4, 2, '2016-08-26', '2016-08-31'),
	(306, 4, 3, '2016-08-31', '2016-09-08'),
	(307, 4, 8, '2016-09-08', '2016-09-14'),
	(308, 4, 1, '2016-09-14', '2016-09-18'),
	(309, 4, 4, '2016-09-18', '2016-09-28'),
	(310, 4, 8, '2016-09-28', '2016-10-04'),
	(311, 4, 2, '2016-10-04', '2016-10-09'),
	(312, 4, 6, '2016-10-09', '2016-10-20'),
	(313, 4, 2, '2016-10-20', '2016-10-25'),
	(314, 4, 4, '2016-10-25', '2016-11-04'),
	(315, 4, 1, '2016-11-04', '2016-11-08'),
	(316, 4, 8, '2016-11-08', '2016-11-14'),
	(317, 4, 8, '2016-11-14', '2016-11-20'),
	(318, 4, 3, '2016-11-20', '2016-11-28'),
	(319, 4, 7, '2016-11-28', '2016-12-01'),
	(320, 4, 9, '2016-12-01', '2016-12-08'),
	(321, 4, 7, '2016-12-08', '2016-12-11'),
	(322, 4, 5, '2016-12-11', '2016-12-25'),
	(323, 4, 8, '2016-12-25', '2016-12-31'),
	(324, 4, 10, '2016-12-31', '2017-01-09'),
	(325, 4, 1, '2017-01-09', '2017-01-13'),
	(326, 4, 4, '2017-01-13', '2017-01-23'),
	(327, 4, 7, '2017-01-23', '2017-01-26'),
	(328, 4, 2, '2017-01-26', '2017-01-31'),
	(329, 4, 10, '2017-01-31', '2017-02-09'),
	(330, 4, 7, '2017-02-09', '2017-02-12'),
	(331, 4, 9, '2017-02-12', '2017-02-19'),
	(332, 4, 2, '2017-02-19', '2017-02-24'),
	(333, 4, 6, '2017-02-24', '2017-03-07'),
	(334, 4, 1, '2017-03-07', '2017-03-11'),
	(335, 4, 6, '2017-03-11', '2017-03-22'),
	(336, 4, 10, '2017-03-22', '2017-03-31'),
	(337, 4, 3, '2017-03-31', '2017-04-08'),
	(338, 4, 3, '2017-04-08', '2017-04-16'),
	(339, 4, 9, '2017-04-16', '2017-04-23'),
	(340, 4, 3, '2017-04-23', '2017-05-01'),
	(341, 4, 1, '2017-05-01', '2017-05-05'),
	(342, 4, 8, '2017-05-05', '2017-05-11'),
	(343, 4, 2, '2017-05-11', '2017-05-16'),
	(344, 4, 3, '2017-05-16', '2017-05-24'),
	(345, 4, 7, '2017-05-24', '2017-05-27'),
	(346, 4, 1, '2017-05-27', '2017-05-31'),
	(347, 4, 10, '2017-05-31', '2017-06-09'),
	(348, 4, 10, '2017-06-09', '2017-06-18'),
	(349, 4, 2, '2017-06-18', '2017-06-23'),
	(350, 4, 10, '2017-06-23', '2017-07-02'),
	(351, 4, 9, '2017-07-02', '2017-07-09'),
	(352, 4, 5, '2017-07-09', '2017-07-23'),
	(353, 4, 6, '2017-07-23', '2017-08-03'),
	(354, 4, 10, '2017-08-03', '2017-08-12'),
	(355, 4, 7, '2017-08-12', '2017-08-15'),
	(356, 4, 5, '2017-08-15', '2017-08-29'),
	(357, 7, 2, '2017-01-01', '2017-01-06'),
	(358, 7, 8, '2017-01-06', '2017-01-12'),
	(359, 7, 2, '2017-01-12', '2017-01-17'),
	(360, 7, 1, '2017-01-17', '2017-01-21'),
	(361, 7, 2, '2017-01-21', '2017-01-26'),
	(362, 7, 3, '2017-01-26', '2017-02-03'),
	(363, 7, 1, '2017-02-03', '2017-02-07'),
	(364, 7, 8, '2017-02-07', '2017-02-13'),
	(365, 7, 2, '2017-02-13', '2017-02-18'),
	(366, 7, 2, '2017-02-18', '2017-02-23'),
	(367, 7, 10, '2017-02-23', '2017-03-04'),
	(368, 7, 9, '2017-03-04', '2017-03-11'),
	(369, 7, 7, '2017-03-11', '2017-03-14'),
	(370, 7, 4, '2017-03-14', '2017-03-24'),
	(371, 7, 9, '2017-03-24', '2017-03-31'),
	(372, 7, 8, '2017-03-31', '2017-04-06'),
	(373, 7, 10, '2017-04-06', '2017-04-15'),
	(374, 7, 2, '2017-04-15', '2017-04-20'),
	(375, 7, 3, '2017-04-20', '2017-04-28'),
	(376, 7, 8, '2017-04-28', '2017-05-04'),
	(377, 7, 2, '2017-05-04', '2017-05-09'),
	(378, 7, 8, '2017-05-09', '2017-05-15'),
	(379, 7, 4, '2017-05-15', '2017-05-25'),
	(380, 7, 2, '2017-05-25', '2017-05-30'),
	(381, 7, 4, '2017-05-30', '2017-06-09'),
	(382, 7, 2, '2017-06-09', '2017-06-14'),
	(383, 7, 3, '2017-06-14', '2017-06-22'),
	(384, 7, 1, '2017-06-22', '2017-06-26'),
	(385, 7, 2, '2017-06-26', '2017-07-01'),
	(386, 7, 5, '2017-07-01', '2017-07-15'),
	(387, 7, 1, '2017-07-15', '2017-07-19'),
	(388, 7, 4, '2017-07-19', '2017-07-29'),
	(389, 7, 10, '2017-07-29', '2017-08-07'),
	(390, 7, 6, '2017-08-07', '2017-08-18'),
	(391, 7, 6, '2017-08-18', '2017-08-29'),
	(392, 8, 9, '2016-01-01', '2016-01-08'),
	(393, 8, 1, '2016-01-08', '2016-01-12'),
	(394, 8, 3, '2016-01-12', '2016-01-20'),
	(395, 8, 7, '2016-01-20', '2016-01-23'),
	(396, 8, 5, '2016-01-23', '2016-02-06'),
	(397, 8, 5, '2016-02-06', '2016-02-20'),
	(398, 8, 4, '2016-02-20', '2016-03-01'),
	(399, 8, 8, '2016-03-01', '2016-03-07'),
	(400, 8, 7, '2016-03-07', '2016-03-10'),
	(401, 8, 7, '2016-03-10', '2016-03-13'),
	(402, 8, 8, '2016-03-13', '2016-03-19'),
	(403, 8, 1, '2016-03-19', '2016-03-23'),
	(404, 8, 5, '2016-03-23', '2016-04-06'),
	(405, 8, 6, '2016-04-06', '2016-04-17'),
	(406, 8, 7, '2016-04-17', '2016-04-20'),
	(407, 8, 9, '2016-04-20', '2016-04-27'),
	(408, 8, 5, '2016-04-27', '2016-05-11'),
	(409, 8, 5, '2016-05-11', '2016-05-25'),
	(410, 8, 10, '2016-05-25', '2016-06-03'),
	(411, 8, 5, '2016-06-03', '2016-06-17'),
	(412, 8, 4, '2016-06-17', '2016-06-27'),
	(413, 8, 5, '2016-06-27', '2016-07-11'),
	(414, 8, 6, '2016-07-11', '2016-07-22'),
	(415, 8, 7, '2016-07-22', '2016-07-25'),
	(416, 8, 1, '2016-07-25', '2016-07-29'),
	(417, 8, 1, '2016-07-29', '2016-08-02'),
	(418, 8, 6, '2016-08-02', '2016-08-13'),
	(419, 8, 9, '2016-08-13', '2016-08-20'),
	(420, 8, 10, '2016-08-20', '2016-08-29'),
	(421, 8, 1, '2016-08-29', '2016-09-02'),
	(422, 8, 4, '2016-09-02', '2016-09-12'),
	(423, 8, 3, '2016-09-12', '2016-09-20'),
	(424, 8, 7, '2016-09-20', '2016-09-23'),
	(425, 8, 3, '2016-09-23', '2016-10-01'),
	(426, 8, 8, '2016-10-01', '2016-10-07'),
	(427, 8, 6, '2016-10-07', '2016-10-18'),
	(428, 8, 10, '2016-10-18', '2016-10-27'),
	(429, 8, 9, '2016-10-27', '2016-11-03'),
	(430, 8, 8, '2016-11-03', '2016-11-09'),
	(431, 8, 9, '2016-11-09', '2016-11-16'),
	(432, 8, 6, '2016-11-16', '2016-11-27'),
	(433, 8, 1, '2016-11-27', '2016-12-01'),
	(434, 8, 6, '2016-12-01', '2016-12-12'),
	(435, 8, 6, '2016-12-12', '2016-12-23'),
	(436, 8, 3, '2016-12-23', '2016-12-31'),
	(437, 8, 10, '2016-12-31', '2017-01-09'),
	(438, 8, 3, '2017-01-09', '2017-01-17'),
	(439, 8, 4, '2017-01-17', '2017-01-27'),
	(440, 8, 6, '2017-01-27', '2017-02-07'),
	(441, 8, 9, '2017-02-07', '2017-02-14'),
	(442, 8, 8, '2017-02-14', '2017-02-20'),
	(443, 8, 7, '2017-02-20', '2017-02-23'),
	(444, 8, 4, '2017-02-23', '2017-03-05'),
	(445, 8, 7, '2017-03-05', '2017-03-08'),
	(446, 8, 1, '2017-03-08', '2017-03-12'),
	(447, 8, 8, '2017-03-12', '2017-03-18'),
	(448, 8, 3, '2017-03-18', '2017-03-26'),
	(449, 8, 2, '2017-03-26', '2017-03-31'),
	(450, 8, 6, '2017-03-31', '2017-04-11'),
	(451, 8, 2, '2017-04-11', '2017-04-16'),
	(452, 8, 10, '2017-04-16', '2017-04-25'),
	(453, 8, 8, '2017-04-25', '2017-05-01'),
	(454, 8, 10, '2017-05-01', '2017-05-10'),
	(455, 8, 10, '2017-05-10', '2017-05-19'),
	(456, 8, 5, '2017-05-19', '2017-06-02'),
	(457, 8, 3, '2017-06-02', '2017-06-10'),
	(458, 8, 5, '2017-06-10', '2017-06-24'),
	(459, 8, 4, '2017-06-24', '2017-07-04'),
	(460, 8, 3, '2017-07-04', '2017-07-12'),
	(461, 8, 3, '2017-07-12', '2017-07-20'),
	(462, 8, 1, '2017-07-20', '2017-07-24'),
	(463, 8, 4, '2017-07-24', '2017-08-03'),
	(464, 8, 8, '2017-08-03', '2017-08-09'),
	(465, 8, 10, '2017-08-09', '2017-08-18'),
	(466, 8, 3, '2017-08-18', '2017-08-26'),
	(467, 8, 3, '2017-08-26', '2017-09-03');
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
