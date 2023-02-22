-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2023 at 02:50 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `training`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `Id` int NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Jenis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`Id`, `Nama`, `Jenis`) VALUES
(2, 'Mouse', 'Logitech');

-- --------------------------------------------------------

--
-- Table structure for table `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `Id` int NOT NULL,
  `NamaBarang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Qty` int NOT NULL,
  `Harga` float NOT NULL,
  `Invoice` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detailpenjualan`
--

INSERT INTO `detailpenjualan` (`Id`, `NamaBarang`, `Qty`, `Harga`, `Invoice`) VALUES
(27, 'mouse', 4, 5, '015'),
(28, 'mouse', 23, 4, '016'),
(49, 'barang 1', 4, 23000, '017'),
(50, 'barang 2', 5, 37000, '017'),
(94, 'mouse', 1, 3000, '014'),
(99, 'barang 1', 2, 4500000, '018'),
(142, 'keyboard', 7, 5000, '022'),
(144, 'nama', 1, 23000, '023'),
(150, 'barang a', 7, 129000, '024'),
(151, 'barang b', 4, 23000000, '024'),
(152, 'barang c', 23, 980000, '024'),
(173, 'mouse', 122, 45000, '013'),
(182, 'barang 2', 4, 450800, '025'),
(183, 'barang 3', 1, 458000, '025');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `Invoice` varchar(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Tgl` date NOT NULL,
  `Id` int NOT NULL,
  `Jeniskelamin` enum('LAKI-LAKI','PEREMPUAN') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Saldo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`Invoice`, `Nama`, `Tgl`, `Id`, `Jeniskelamin`, `Saldo`) VALUES
('013', 'FI', '2023-01-06', 117, 'LAKI-LAKI', 450000.67),
('014', 'ARNIDA', '2023-01-06', 118, 'LAKI-LAKI', 566688),
('015', 'ARNIDA', '2023-01-06', 120, 'PEREMPUAN', 150000),
('016', 'ARNIDA', '2023-01-06', 122, 'PEREMPUAN', 4500000),
('017', 'LAILI', '2023-01-01', 123, 'LAKI-LAKI', 3400000),
('018', 'LAILI', '2023-01-01', 125, 'PEREMPUAN', 989999.77),
('022', 'SUKMA', '2023-01-04', 147, 'PEREMPUAN', 0),
('023', 'LAILI', '2022-10-07', 149, 'LAKI-LAKI', 0),
('024', 'ARNIDA LAILI', '2023-01-14', 152, 'PEREMPUAN', 0),
('025', 'SDS', '2023-01-03', 153, 'LAKI-LAKI', 0),
('027', 'NAME1112', '2022-09-05', 168, 'PEREMPUAN', 0),
('028', 'Vendor LG', '2023-04-01', 169, 'LAKI-LAKI', 565656),
('1', 'ere', '2022-05-12', 187, 'PEREMPUAN', 34),
('3', 'gh', '2023-11-02', 193, 'PEREMPUAN', 45000000),
('4', 'erdf', '2022-08-12', 195, 'LAKI-LAKI', 1200000),
('5', 'ghju', '2022-05-12', 196, 'PEREMPUAN', 56000),
('6', 'TYYY', '2023-08-02', 197, 'PEREMPUAN', 120000),
('7', 'yuyu', '2023-05-02', 198, 'PEREMPUAN', 32000),
('8', 'tyu', '2023-02-02', 200, 'PEREMPUAN', 23000),
('9', 'TYUTU', '2023-02-02', 201, 'PEREMPUAN', 150000),
('10', 'ERTU', '2023-09-02', 203, 'LAKI-LAKI', 450000),
('11', 'LAILI', '2022-12-04', 205, 'PEREMPUAN', 1200000),
('12', 'DF', '2023-02-04', 206, 'LAKI-LAKI', 34444),
('13', 'YOYO', '2023-02-18', 211, 'LAKI-LAKI', 120000),
('14', 'RIRI', '2023-03-08', 216, 'PEREMPUAN', 450000),
('15', 'TUTI', '2023-02-09', 217, 'PEREMPUAN', 12123.5595703125),
('16', 'KOKOU', '2023-01-11', 218, 'LAKI-LAKI', 780000),
('INV123', '3', '2023-02-02', 219, 'LAKI-LAKI', 12123.5595703125),
('17', 'QWE', '2023-02-06', 224, 'LAKI-LAKI', 2300.8798828125),
('18', 'JKL', '2023-02-28', 225, 'LAKI-LAKI', 58902.33984375),
('19', 'VB', '2023-02-18', 226, 'PEREMPUAN', 2599.840087890625),
('20', 'BN', '2023-02-23', 227, 'PEREMPUAN', 2385.93994140625),
('21', 'CVB', '2023-03-17', 228, 'LAKI-LAKI', 5711.669921875),
('22', 'ZX', '2023-02-28', 229, 'PEREMPUAN', 23000.08984375),
('test1', 'ZX', '2023-02-28', 231, 'PEREMPUAN', 2300.090087890625),
('23', 'ERE', '2023-02-22', 232, 'PEREMPUAN', 56566.99),
('24', 'JJJ', '2023-02-26', 233, 'PEREMPUAN', 12006430.79),
('25', 'PPI', '2023-02-22', 234, 'PEREMPUAN', 56454.56),
('26', 'FG', '2023-03-17', 236, 'PEREMPUAN', 454545.32),
('27', 'MKM', '2023-04-14', 237, 'LAKI-LAKI', 3409990.81),
('28', 'RTYY', '2023-03-30', 239, 'LAKI-LAKI', 349999.93),
('29', 'KIKI', '2022-12-19', 240, 'PEREMPUAN', 1200000),
('012', 'VB', '2022-12-20', 241, 'LAKI-LAKI', 3400456.65),
('011', 'RNI', '2023-01-23', 242, 'PEREMPUAN', 670000),
('010', 'ERRE', '2023-01-29', 243, 'LAKI-LAKI', 456789.77),
('09', 'DF', '2023-02-15', 244, 'PEREMPUAN', 3434444),
('08', 'EER', '2023-02-01', 245, 'LAKI-LAKI', 676767),
('07', 'RTRT', '2023-02-14', 247, 'PEREMPUAN', 4545555),
('04', 'RERE', '2023-02-14', 248, 'PEREMPUAN', 34334),
('02', 'FGFG', '2023-02-21', 250, 'PEREMPUAN', 1200000),
('INV0045', 'EST IN QUOD NECESSIT', '1970-01-01', 251, 'LAKI-LAKI', 123213),
('123', 'RTR', '2023-02-21', 252, 'LAKI-LAKI', 4545555),
('124', '454', '2023-02-06', 253, 'LAKI-LAKI', 43655555),
('125', 'EEE', '2023-02-28', 254, 'PEREMPUAN', 344444),
('126', 'RYTYT', '2023-02-17', 256, 'PEREMPUAN', 3333333),
('127', 'TRRT', '2023-02-08', 257, 'PEREMPUAN', 44444),
('128', 'ER', '2023-02-02', 258, 'LAKI-LAKI', 344444),
('129', 'VBVB', '2023-02-06', 259, 'PEREMPUAN', 3444444),
('110', 'QW', '2023-02-26', 260, 'PEREMPUAN', 2222222),
('111', 'SSSS', '2023-02-10', 261, 'PEREMPUAN', 1200000),
('112', 'NNNM', '2023-02-08', 262, 'LAKI-LAKI', 4566666),
('113', 'FG', '2023-02-06', 263, 'LAKI-LAKI', 4555),
('114', 'RTRT', '2023-02-14', 264, 'LAKI-LAKI', 34444),
('120', 'DFD', '2023-02-06', 265, 'LAKI-LAKI', 233333),
('121', 'ERER', '2023-02-13', 266, 'LAKI-LAKI', 233333),
('122', 'ERE', '2023-02-13', 267, 'LAKI-LAKI', 344444),
('138', 'RTR', '2023-02-13', 271, 'PEREMPUAN', 45555),
('139', 'RERE', '2023-02-16', 272, 'LAKI-LAKI', 455555),
('140', 'HH', '2023-02-22', 273, 'LAKI-LAKI', 455555),
('141', 'GHGH', '2023-02-14', 274, 'PEREMPUAN', 4354555),
('142', 'DFFG', '2023-02-09', 275, 'LAKI-LAKI', 45555),
('143', 'CV', '2023-02-14', 276, 'LAKI-LAKI', 34444444),
('144', 'ERR', '2023-02-15', 277, 'LAKI-LAKI', 344444),
('145', 'RTRT', '2023-02-15', 278, 'LAKI-LAKI', 4500000),
('146', 'JK', '2023-02-14', 279, 'LAKI-LAKI', 340000),
('147', 'UIUI', '2023-02-08', 280, 'LAKI-LAKI', 676700),
('148', 'JLJKL', '2023-02-10', 281, 'LAKI-LAKI', 677000),
('149', 'HJHJ', '2023-02-14', 282, 'LAKI-LAKI', 450000),
('150', 'TRTY', '2023-02-13', 284, 'LAKI-LAKI', 340000),
('151', 'WERI', '2023-02-15', 285, 'LAKI-LAKI', 56000),
('152', 'FG', '2023-02-14', 286, 'LAKI-LAKI', 3400000),
('153', 'FFG', '2023-02-06', 287, 'LAKI-LAKI', 450000),
('154', 'RTR', '2023-02-13', 288, 'LAKI-LAKI', 450000),
('155', 'TYT', '2023-02-13', 289, 'LAKI-LAKI', 56),
('157', 'HJ', '2023-02-14', 290, 'LAKI-LAKI', 450000),
('158', 'IOIO', '2023-02-15', 291, 'LAKI-LAKI', 560000),
('159', 'IOIO', '2023-02-14', 292, 'LAKI-LAKI', 560000),
('160', 'IP', '2023-02-07', 293, 'LAKI-LAKI', 560000),
('161', 'RTR', '2023-02-06', 294, 'LAKI-LAKI', 450000),
('162', 'ET', '2023-02-13', 295, 'LAKI-LAKI', 34888),
('164', 'ERER', '2023-02-14', 296, 'LAKI-LAKI', 34555),
('165', 'TRT', '2023-02-08', 297, 'LAKI-LAKI', 340000),
('168', 'TYTY', '2023-02-15', 298, 'LAKI-LAKI', 450000),
('169', 'FGG', '2023-02-09', 299, 'LAKI-LAKI', 450000),
('170', 'GH', '2023-02-14', 300, 'LAKI-LAKI', 560000),
('171', 'FRE', '2023-02-06', 301, 'LAKI-LAKI', 340000),
('166', 'RT', '2023-02-14', 303, 'LAKI-LAKI', 450000),
('172', 'ERER', '2023-02-06', 304, 'PEREMPUAN', 45555),
('173', 'RTR', '2023-02-13', 305, 'LAKI-LAKI', 450000),
('174', 'RT', '2023-02-16', 306, 'LAKI-LAKI', 450000),
('175', 'TYY', '2023-02-16', 307, 'LAKI-LAKI', 45000),
('176', 'TYT', '2023-02-14', 309, 'LAKI-LAKI', 56000),
('177', 'TYTY', '2023-02-20', 310, 'LAKI-LAKI', 5670000),
('178', 'JKJ', '2023-02-20', 311, 'LAKI-LAKI', 678000),
('179', 'KJ', '2023-02-13', 312, 'LAKI-LAKI', 45000),
('180', 'HJH', '2023-02-20', 313, 'PEREMPUAN', 655656),
('181', '33', '2023-02-20', 314, 'LAKI-LAKI', 3445444),
('182', 'FG', '2023-02-18', 315, 'LAKI-LAKI', 340000),
('183', 'R', '2023-02-22', 316, 'PEREMPUAN', 45555),
('184', 'FG', '2023-02-27', 317, 'LAKI-LAKI', 3400000),
('185', 'YUY', '2023-02-13', 319, 'LAKI-LAKI', 67000),
('186', 'GHJ', '2023-02-20', 320, 'LAKI-LAKI', 560000),
('187', 'JU', '2023-02-13', 322, 'LAKI-LAKI', 670000),
('188', 'GH', '2023-02-15', 323, 'LAKI-LAKI', 560000),
('189', 'JKJK', '2023-02-07', 324, 'LAKI-LAKI', 5678888),
('190', 'YUY', '2023-02-20', 325, 'LAKI-LAKI', 560000),
('191', 'RT', '2023-02-12', 326, 'LAKI-LAKI', 3478888),
('3212', '132', '1970-01-01', 327, 'LAKI-LAKI', 2312),
('200', 'YTY', '2023-02-14', 328, 'LAKI-LAKI', 566666),
('202', 'FGFG', '2023-02-01', 330, 'LAKI-LAKI', 56666),
('203', 'YTYTY', '2023-02-20', 331, 'LAKI-LAKI', 45555),
('201', 'RTTY', '2023-02-13', 332, 'LAKI-LAKI', 45555),
('204', 'YUYU', '2023-02-20', 334, 'LAKI-LAKI', 56666),
('205', 'RTRT', '2023-02-13', 335, 'LAKI-LAKI', 45555),
('206', 'ERRE', '2023-02-13', 337, 'LAKI-LAKI', 455555),
('207', 'FGGF', '2023-02-12', 338, 'LAKI-LAKI', 6565656),
('208', 'YYTYT', '2023-02-13', 339, 'LAKI-LAKI', 565656),
('209', 'RY', '2023-02-20', 340, 'LAKI-LAKI', 6565656),
('210', 'RTRTRT', '2023-02-20', 341, 'LAKI-LAKI', 45454545),
('211', 'RTRT', '2023-02-13', 342, 'LAKI-LAKI', 44545),
('212', 'HHGH', '2023-02-06', 343, 'LAKI-LAKI', 565656),
('213', 'TRT', '2023-02-19', 344, 'LAKI-LAKI', 665656),
('214', 'RRTTR', '2023-02-13', 345, 'LAKI-LAKI', 455555),
('215', 'RYTY', '2023-02-20', 346, 'LAKI-LAKI', 4555555),
('216', 'RTRTRT', '2023-02-12', 347, 'LAKI-LAKI', 455555),
('217', 'RYTY', '2023-02-13', 348, 'LAKI-LAKI', 56556),
('218', 'RTRT', '2023-02-20', 349, 'LAKI-LAKI', 455555),
('219', 'YYUYU', '2023-02-19', 350, 'LAKI-LAKI', 676776),
('220', 'YUYYU', '2023-02-06', 351, 'LAKI-LAKI', 767676),
('221', 'GHGH', '2023-02-26', 352, 'LAKI-LAKI', 454555),
('32132', '1', '1970-01-01', 353, 'LAKI-LAKI', 321321),
('223', 'RR', '2023-02-07', 354, 'LAKI-LAKI', 66454545),
('224', 'FHHG', '2023-02-06', 355, 'LAKI-LAKI', 4545455),
('225', 'RTRTRT', '2023-02-13', 356, 'LAKI-LAKI', 5454545),
('226', 'RTRT', '2023-02-08', 357, 'LAKI-LAKI', 5465656),
('227', 'RYY', '2023-02-06', 358, 'LAKI-LAKI', 565656),
('228', 'RYTY', '2023-02-06', 359, 'LAKI-LAKI', 566666),
('229', 'TYU', '2023-02-12', 360, 'LAKI-LAKI', 565656),
('230', 'RTRT', '2023-02-20', 361, 'LAKI-LAKI', 455454),
('231', 'DFD', '2023-02-20', 362, 'LAKI-LAKI', 455555),
('232', 'FTRT', '2023-02-20', 363, 'LAKI-LAKI', 45555),
('233', 'DFDFD', '2023-02-06', 364, 'LAKI-LAKI', 4545454),
('234', 'RTRT', '2023-02-19', 365, 'LAKI-LAKI', 4545555),
('235', 'GRTRT', '2023-02-12', 366, 'LAKI-LAKI', 565656),
('236', 'RTRTRT', '2023-02-19', 367, 'LAKI-LAKI', 544555),
('237', 'RYYT', '2023-02-26', 368, 'LAKI-LAKI', 56565656),
('238', 'TYTY', '2023-02-12', 369, 'LAKI-LAKI', 122222),
('239', 'RRYT', '2023-02-13', 370, 'LAKI-LAKI', 5656565),
('240', 'ERERE', '2023-02-19', 371, 'LAKI-LAKI', 34343434),
('241', 'ETRER', '2023-02-13', 372, 'LAKI-LAKI', 545455),
('242', 'ERE', '2023-02-06', 373, 'LAKI-LAKI', 454545),
('243', 'EERE', '2023-02-19', 374, 'LAKI-LAKI', 45454545),
('244', 'DFDFDF', '2023-02-13', 375, 'LAKI-LAKI', 4557677),
('245', 'FGFGF', '2023-02-19', 376, 'LAKI-LAKI', 345454),
('246', 'TRERE', '2023-02-20', 377, 'LAKI-LAKI', 454455),
('247', 'ERERE', '2023-02-19', 378, 'LAKI-LAKI', 4545454),
('248', 'FTRTR', '2023-02-19', 379, 'LAKI-LAKI', 565656),
('249', 'RYRTR', '2023-02-20', 380, 'LAKI-LAKI', 5656565),
('250', 'HHT', '2023-02-26', 381, 'LAKI-LAKI', 56556),
('251', 'SSDS', '2023-02-01', 382, 'LAKI-LAKI', 56565656),
('98754', '321315', '2013-12-06', 383, 'LAKI-LAKI', 321321),
('252', 'GHGHG', '2023-02-18', 384, 'LAKI-LAKI', 56565656),
('253', 'DFDF', '2023-02-15', 385, 'LAKI-LAKI', 4545454),
('254', 'ERER', '2023-02-27', 386, 'LAKI-LAKI', 4545445),
('255', 'JHJKK', '2023-02-16', 387, 'LAKI-LAKI', 56565656),
('256', 'RTRT', '2023-02-28', 388, 'LAKI-LAKI', 8678787),
('345345345', '345345', '2012-03-31', 389, 'LAKI-LAKI', 123213),
('DA1321', '321321', '2013-03-31', 390, 'LAKI-LAKI', 321321),
('257', 'TRT', '2023-02-11', 391, 'LAKI-LAKI', 454545454),
('258', 'TRTR', '2023-02-12', 392, 'LAKI-LAKI', 76766767),
('259', 'TYTY', '2023-02-13', 393, 'LAKI-LAKI', 6676767),
('260', 'YUYU', '2023-02-20', 394, 'LAKI-LAKI', 6776767),
('261', 'ERER', '2023-02-04', 395, 'LAKI-LAKI', 565656),
('262', 'GHGH', '2023-02-13', 396, 'LAKI-LAKI', 5655656),
('263', 'JJK', '2023-02-20', 397, 'LAKI-LAKI', 55656565),
('264', 'HTYT', '2023-02-25', 399, 'LAKI-LAKI', 67676),
('265', 'EER', '2023-02-12', 400, 'PEREMPUAN', 565656565),
('266', 'RTRT', '2023-02-13', 401, 'LAKI-LAKI', 5656565),
('267', 'TYTYT', '2023-02-19', 403, 'LAKI-LAKI', 6767676),
('268', 'RTRT', '2023-02-28', 404, 'LAKI-LAKI', 555656),
('269', 'GHGHG', '2023-02-05', 405, 'LAKI-LAKI', 5656565),
('768678678', '12321', '2013-03-13', 406, 'LAKI-LAKI', 123213),
('3466', '3452', '2034-02-04', 407, 'LAKI-LAKI', 234234),
('6783456', '23423', '2023-02-14', 408, 'LAKI-LAKI', 234234),
('34123213', '21312', '2023-02-21', 409, 'LAKI-LAKI', 213),
('270', 'JHKJ', '2023-02-13', 410, 'LAKI-LAKI', 544545),
('304', 'SAYA', '2023-02-21', 411, 'LAKI-LAKI', 545454),
('412', 'OK', '2023-02-21', 412, 'PEREMPUAN', 231231),
('623236', 'AFAS', '2023-02-15', 415, 'LAKI-LAKI', 123132),
('352351', 'ASFA', '2023-02-15', 416, 'LAKI-LAKI', 12313),
('51251', 'SDASD', '2023-02-14', 418, 'LAKI-LAKI', 21313),
('15125', 'ARA', '2023-02-15', 420, 'LAKI-LAKI', 421421),
('31234', 'AGFASG', '2023-02-14', 421, 'LAKI-LAKI', 2412421),
('125125', 'ASFAS', '2023-02-14', 422, 'LAKI-LAKI', 124142),
('2512', 'AFAS', '2023-02-21', 424, 'LAKI-LAKI', 12312),
('271', 'ERERE', '2023-02-26', 425, 'LAKI-LAKI', 3434343),
('272', 'ERR', '2023-02-20', 426, 'LAKI-LAKI', 87888888),
('273', 'ERERER', '2023-02-19', 427, 'PEREMPUAN', 34000),
('274', 'RTRT', '2023-02-20', 428, 'LAKI-LAKI', 56566),
('275', 'TYTY', '2023-02-10', 429, 'LAKI-LAKI', 677777),
('276', 'ER', '2023-02-08', 430, 'LAKI-LAKI', 677777),
('277', 'RTRT', '2023-02-19', 431, 'LAKI-LAKI', 56000),
('278', 'TRTRT', '2023-02-19', 432, 'LAKI-LAKI', 560000),
('279', 'YYU', '2023-02-20', 433, 'LAKI-LAKI', 898989),
('280', '7U', '2023-02-11', 434, 'LAKI-LAKI', 8980000),
('281', 'YTUYU', '2023-02-12', 435, 'LAKI-LAKI', 676767);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FOREIGN_NO_INVOICE` (`Invoice`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UNIQUE_NO_INVOICE` (`Invoice`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=436;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD CONSTRAINT `detailpenjualan_ibfk_1` FOREIGN KEY (`Invoice`) REFERENCES `penjualan` (`Invoice`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
