-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 產生時間： 2017 年 05 月 25 日 18:02
-- 伺服器版本: 5.7.18-0ubuntu0.16.04.1
-- PHP 版本： 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `etc`
--

-- --------------------------------------------------------

--
-- 資料表結構 `area`
--

CREATE TABLE `area` (
  `id` tinyint(3) NOT NULL,
  `area` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- 資料表的匯出資料 `area`
--

INSERT INTO `area` (`id`, `area`) VALUES
(1, 'N'),
(2, 'M'),
(3, 'S');

-- --------------------------------------------------------

--
-- 資料表結構 `country`
--

CREATE TABLE `country` (
  `id` int(8) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- 資料表的匯出資料 `country`
--

INSERT INTO `country` (`id`, `country`) VALUES
(1, '基汐'),
(2, '台北'),
(3, '新北'),
(4, '桃園'),
(5, '新竹'),
(6, '苗栗'),
(7, '台中'),
(8, '彰化'),
(9, '雲林'),
(10, '嘉義'),
(11, '台南'),
(12, '高雄'),
(13, '南投'),
(14, '屏東'),
(15, '宜蘭');

-- --------------------------------------------------------

--
-- 資料表結構 `etcpoints`
--

CREATE TABLE `etcpoints` (
  `id` int(13) NOT NULL,
  `highway` tinyint(3) NOT NULL,
  `country` int(8) NOT NULL,
  `pointid` varchar(12) NOT NULL,
  `area` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- 資料表的匯出資料 `etcpoints`
--

INSERT INTO `etcpoints` (`id`, `highway`, `country`, `pointid`, `area`) VALUES
(1, 1, 1, '01F0017', 1),
(2, 1, 1, '01F0029', 1),
(3, 1, 1, '01F0061', 1),
(4, 1, 1, '01F0099', 1),
(5, 1, 1, '01F0147', 1),
(6, 1, 2, '01F0155', 1),
(7, 1, 2, '01F0182', 1),
(8, 1, 2, '01F0213', 1),
(9, 1, 2, '01F0233', 1),
(10, 1, 2, '01F0248', 1),
(11, 1, 3, '01F0256', 1),
(12, 1, 3, '01F0264', 1),
(13, 1, 3, '01F0293', 1),
(14, 1, 3, '01F0339', 1),
(15, 1, 3, '01F0376', 1),
(16, 1, 3, '01F0413', 1),
(17, 1, 4, '01F0467', 1),
(18, 1, 4, '01F0509', 1),
(19, 1, 4, '01F0532', 1),
(20, 1, 4, '01F0557', 1),
(21, 1, 4, '01F0578', 1),
(22, 1, 4, '01F0633', 1),
(23, 1, 4, '01F0664', 1),
(24, 1, 4, '01F0681', 1),
(25, 1, 4, '01F0750', 1),
(26, 1, 5, '01F0880', 1),
(27, 1, 5, '01F0928', 1),
(28, 1, 5, '01F0950', 1),
(29, 1, 5, '01F0956', 1),
(30, 1, 5, '01F0979', 1),
(31, 1, 5, '01F0980', 1),
(32, 1, 6, '01F1045', 2),
(33, 1, 6, '01F1123', 2),
(34, 1, 6, '01F1292', 2),
(35, 1, 6, '01F1389', 2),
(36, 1, 6, '01F1465', 2),
(37, 1, 7, '01F1572', 2),
(38, 1, 7, '01F1621', 2),
(39, 1, 7, '01F1664', 2),
(40, 1, 7, '01F1725', 2),
(41, 1, 7, '01F1774', 2),
(42, 1, 7, '01F1802', 2),
(43, 1, 8, '01F1839', 2),
(44, 1, 8, '01F1906', 2),
(45, 1, 8, '01F1960', 2),
(46, 1, 8, '01F2011', 2),
(47, 1, 8, '01F2089', 2),
(48, 1, 8, '01F2156', 2),
(49, 1, 9, '01F2249', 2),
(50, 1, 9, '01F2322', 2),
(51, 1, 9, '01F2394', 2),
(52, 1, 9, '01F2425', 2),
(53, 1, 9, '01F2483', 2),
(54, 1, 10, '01F2514', 3),
(55, 1, 10, '01F2603', 3),
(56, 1, 10, '01F2674', 3),
(57, 1, 10, '01F2714', 3),
(58, 1, 11, '01F2827', 3),
(59, 1, 11, '01F2866', 3),
(60, 1, 11, '01F2930', 3),
(61, 1, 11, '01F3019', 3),
(62, 1, 11, '01F3083', 3),
(63, 1, 11, '01F3126', 3),
(64, 1, 11, '01F3185', 3),
(65, 1, 11, '01F3227', 3),
(66, 1, 11, '01F3252', 3),
(67, 1, 11, '01F3286', 3),
(68, 1, 12, '01F3366', 3),
(69, 1, 12, '01F3398', 3),
(70, 1, 12, '01F3460', 3),
(71, 1, 12, '01F3525', 3),
(72, 1, 12, '01F3559', 3),
(73, 1, 12, '01F3561', 3),
(74, 1, 12, '01F3590', 3),
(75, 1, 12, '01F3640', 3),
(76, 1, 12, '01F3676', 3),
(77, 1, 12, '01F3686', 3),
(78, 1, 12, '01F3696', 3),
(79, 1, 12, '01F3736', 3),
(80, 3, 1, '01H0163', 1),
(81, 3, 2, '01H0174', 1),
(82, 3, 2, '01H0200', 1),
(83, 3, 2, '01H0206', 1),
(84, 3, 2, '01H0208', 1),
(85, 3, 2, '01H0271', 1),
(86, 3, 2, '01H0305', 1),
(87, 3, 2, '01H0333', 1),
(88, 3, 2, '01H0334', 1),
(89, 3, 2, '01H0447', 1),
(90, 3, 2, '01H0579', 1),
(91, 3, 2, '01H0608', 1),
(92, 3, 2, '01H0610', 1),
(93, 4, 2, '03A0015', 1),
(94, 4, 2, '03A0041', 1),
(95, 2, 1, '03F0006', 1),
(96, 2, 1, '03F0021', 1),
(97, 2, 1, '03F0054', 1),
(98, 2, 1, '03F0087', 1),
(99, 2, 1, '03F0116', 1),
(100, 2, 1, '03F0136', 1),
(101, 2, 2, '03F0140', 1),
(102, 2, 2, '03F0150', 1),
(103, 2, 2, '03F0158', 1),
(104, 2, 2, '03F0201', 1),
(105, 2, 2, '03F0217', 1),
(106, 2, 3, '03F0301', 1),
(107, 2, 3, '03F0337', 1),
(108, 2, 3, '03F0338', 1),
(109, 2, 3, '03F0394', 1),
(110, 2, 3, '03F0447', 1),
(111, 2, 3, '03F0498', 1),
(112, 2, 3, '03F0525', 1),
(113, 2, 4, '03F0559', 1),
(114, 2, 4, '03F0648', 1),
(115, 2, 5, '03F0698', 1),
(116, 2, 5, '03F0783', 1),
(117, 2, 5, '03F0846', 1),
(118, 2, 5, '03F0961', 1),
(119, 2, 5, '03F0996', 1),
(120, 2, 5, '03F1022', 1),
(121, 2, 5, '03F1051', 1),
(122, 2, 5, '03F1128', 1),
(123, 2, 6, '03F1161', 2),
(124, 2, 6, '03F1215', 2),
(125, 2, 6, '03F1257', 2),
(126, 2, 6, '03F1332', 2),
(127, 2, 6, '03F1395', 2),
(128, 2, 6, '03F1485', 2),
(129, 2, 7, '03F1633', 2),
(130, 2, 7, '03F1651', 2),
(131, 2, 7, '03F1710', 2),
(132, 2, 7, '03F1739', 2),
(133, 2, 7, '03F1779', 2),
(134, 2, 8, '03F1860', 2),
(135, 2, 8, '03F1941', 2),
(136, 2, 8, '03F1944', 2),
(137, 2, 8, '03F1991', 2),
(138, 2, 8, '03F1992', 2),
(139, 2, 7, '03F2066', 2),
(140, 2, 7, '03F2078', 2),
(141, 2, 7, '03F2079', 2),
(142, 2, 13, '03F2100', 2),
(143, 2, 13, '03F2125', 2),
(144, 2, 13, '03F2129', 2),
(145, 2, 13, '03F2152', 2),
(146, 2, 13, '03F2153', 2),
(147, 2, 13, '03F2194', 2),
(148, 2, 13, '03F2231', 2),
(149, 2, 13, '03F2235', 2),
(150, 2, 13, '03F2260', 2),
(151, 2, 13, '03F2261', 2),
(152, 2, 13, '03F2306', 2),
(153, 2, 13, '03F2336', 2),
(154, 2, 13, '03F2415', 2),
(155, 2, 9, '03F2447', 2),
(156, 2, 9, '03F2535', 2),
(157, 2, 9, '03F2614', 2),
(158, 2, 9, '03F2709', 2),
(159, 2, 9, '03F2747', 2),
(160, 2, 10, '03F2777', 3),
(161, 2, 10, '03F2840', 3),
(162, 2, 10, '03F2899', 3),
(163, 2, 10, '03F2923', 3),
(164, 2, 10, '03F2985', 3),
(165, 2, 11, '03F3101', 3),
(166, 2, 11, '03F3187', 3),
(167, 2, 11, '03F3211', 3),
(168, 2, 11, '03F3259', 3),
(169, 2, 11, '03F3307', 3),
(170, 2, 11, '03F3392', 3),
(171, 2, 11, '03F3445', 3),
(172, 2, 11, '03F3496', 3),
(173, 2, 12, '03F3588', 3),
(174, 2, 12, '03F3743', 3),
(175, 2, 12, '03F3854', 3),
(176, 2, 14, '03F3916', 3),
(177, 2, 14, '03F4018', 3),
(178, 2, 14, '03F4021', 3),
(179, 2, 14, '03F4142', 3),
(180, 2, 14, '03F4168', 3),
(181, 2, 14, '03F4232', 3),
(182, 2, 14, '03F4259', 3),
(183, 2, 14, '03F4263', 3),
(184, 5, 3, '05F0000', 1),
(185, 5, 3, '05F0001', 1),
(186, 5, 3, '05F0055', 1),
(187, 5, 15, '05F0287', 1),
(188, 5, 15, '05F0309', 1),
(189, 5, 15, '05F0438', 1),
(190, 5, 15, '05F0439', 1),
(191, 5, 15, '05F0494', 1),
(192, 5, 15, '05F0528', 1),
(193, 5, 15, '05FR113', 1),
(194, 5, 15, '05FR143', 1),
(195, 1, 1, '01F0005', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `highway`
--

CREATE TABLE `highway` (
  `id` tinyint(3) NOT NULL,
  `way` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- 資料表的匯出資料 `highway`
--

INSERT INTO `highway` (`id`, `way`) VALUES
(1, '中山高'),
(2, '二高'),
(3, '五股楊梅高架道路'),
(4, '國道三號甲線'),
(5, '國道五號');

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `viewPoints`
--
CREATE TABLE `viewPoints` (
`way` varchar(30)
,`country` varchar(30)
,`area` varchar(2)
,`pointid` varchar(12)
);

-- --------------------------------------------------------

--
-- 檢視表結構 `viewPoints`
--
DROP TABLE IF EXISTS `viewPoints`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewPoints`  AS  select `b`.`way` AS `way`,`c`.`country` AS `country`,`d`.`area` AS `area`,`a`.`pointid` AS `pointid` from (((`etcpoints` `a` join `highway` `b`) join `country` `c`) join `area` `d`) where ((`a`.`highway` = `b`.`id`) and (`a`.`country` = `c`.`id`) and (`a`.`area` = `d`.`id`)) ;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `etcpoints`
--
ALTER TABLE `etcpoints`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `highway`
--
ALTER TABLE `highway`
  ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `area`
--
ALTER TABLE `area`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `country`
--
ALTER TABLE `country`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用資料表 AUTO_INCREMENT `etcpoints`
--
ALTER TABLE `etcpoints`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;
--
-- 使用資料表 AUTO_INCREMENT `highway`
--
ALTER TABLE `highway`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
