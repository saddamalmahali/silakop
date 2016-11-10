-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 10, 2016 at 07:04 PM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.6.23-1+deprecated+dontuse+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ksp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accaktiva`
--

CREATE TABLE IF NOT EXISTS `accaktiva` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `tglbeli` date NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` double(15,2) NOT NULL,
  `residu` double(15,2) NOT NULL,
  `umur` double(9,2) NOT NULL,
  `kelompokid` varchar(30) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `acckas` varchar(30) NOT NULL,
  `accakumulasi` varchar(30) NOT NULL,
  `accpenyusutan` varchar(30) NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `jurnal` char(1) NOT NULL,
  `metode` char(1) NOT NULL,
  `kondisi` char(1) NOT NULL,
  `penyusutan` char(1) NOT NULL,
  `aktif` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`kelompokid`,`accountid`,`acckas`,`accakumulasi`,`accpenyusutan`,`jurnalid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accaktivajurnal`
--

CREATE TABLE IF NOT EXISTS `accaktivajurnal` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`jurnalid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accaktivajurnaldetail`
--

CREATE TABLE IF NOT EXISTS `accaktivajurnaldetail` (
  `id` varchar(30) NOT NULL,
  `aktivaid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`,`aktivaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accaktivakelompok`
--

CREATE TABLE IF NOT EXISTS `accaktivakelompok` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accbudget`
--

CREATE TABLE IF NOT EXISTS `accbudget` (
  `id` varchar(30) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accbudgetdetail`
--

CREATE TABLE IF NOT EXISTS `accbudgetdetail` (
  `id` varchar(30) NOT NULL,
  `bulan` varchar(10) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`,`bulan`,`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accbudgetksu`
--

CREATE TABLE IF NOT EXISTS `accbudgetksu` (
  `id` varchar(30) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accbudgetksudetail`
--

CREATE TABLE IF NOT EXISTS `accbudgetksudetail` (
  `id` varchar(30) NOT NULL,
  `bulan` varchar(10) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`,`bulan`,`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accbudgetksy`
--

CREATE TABLE IF NOT EXISTS `accbudgetksy` (
  `id` varchar(30) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accbudgetksydetail`
--

CREATE TABLE IF NOT EXISTS `accbudgetksydetail` (
  `id` varchar(30) NOT NULL,
  `bulan` varchar(10) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`,`bulan`,`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accgrup`
--

CREATE TABLE IF NOT EXISTS `accgrup` (
  `id` int(4) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accgrup`
--

INSERT INTO `accgrup` (`id`, `nama`) VALUES
(1, 'AKTIVA LANCAR'),
(2, 'AKTIVA TETAP'),
(3, 'AKTIVA LAIN'),
(4, 'HUTANG LANCAR'),
(5, 'HUTANG JANGKA PANJANG'),
(6, 'MODAL'),
(7, 'PENDAPATAN'),
(8, 'BIAYA');

-- --------------------------------------------------------

--
-- Table structure for table `accheader`
--

CREATE TABLE IF NOT EXISTS `accheader` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `nama` varchar(300) NOT NULL,
  `grupid` int(4) NOT NULL,
  `jenis` char(2) NOT NULL,
  `modal` char(1) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`grupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accheader`
--

INSERT INTO `accheader` (`id`, `nama`, `grupid`, `jenis`, `modal`, `keterangan`, `user`, `jam`) VALUES
('100', 'AKTIVA', 1, '0', '0', '', 'admin', '2009-06-25 20:47:11'),
('110', 'BANK', 1, '0', '0', '', 'admin', '2009-06-25 20:47:11'),
('150', 'REK. PINJAMAN YANG DIBERIKAN', 1, '0', '0', '', 'admin', '2009-06-25 20:47:11'),
('151', 'REK. SEWA DIBAYAR DIMUKA', 1, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('153', 'PIUTANG ANGSURAN', 1, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('155', 'PIUTANG KARYAWAN', 1, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('160', 'PENYISIHAN PENGHAPUSAN A.PRO', 1, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('170', 'SUPLIES KANTOR', 1, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('200', 'INVENTARIS', 2, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('201', 'INVENTARIS', 2, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('400', 'BIAYA DIBAYAR DIMUKA', 1, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('500', 'KEWAJIBAN SEGERA DIBAYAR', 4, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('510', 'KEWAJIBAN REK. SIMPANAN ANGGOTA', 4, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('520', 'KEWAJIBAN REK. SIMPANAN BERJANGKA', 4, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('560', 'HUTANG LAIN-LAIN', 4, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('561', 'HUTANG BANK', 4, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('700', 'RUPA-RUPA PASIVA', 5, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('800', 'MODAL', 6, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('900', 'PEND. HASIL BUNGA PINJAMAN', 7, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('901', 'PEND. HASIL BUNGA TABUNGAN', 7, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('902', 'PEND. HASIL BUNGA GIRO', 7, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('903', 'PEND. HASIL BUNGA SIMPANAN BERJANGKA', 7, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('910', 'PEND. PROVISI PINJAMAN', 7, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('931', 'PENDAPATAN', 7, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('940', 'PEND. NONOPERASIONAL LAIN', 7, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('950', 'RUPA-RUPA AKTIVA', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('960', 'BIAYA BUNGA SIMPANAN', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('961', 'BIAYA PAJAK BUNGA', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('962', 'PIUTANG ANGSURAN', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('970', 'BIAYA TENAGA KERJA', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('980', 'BIAYA SEWA', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('981', 'BIAYA', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('982', 'BIAYA PEMELIHARAAN', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('983', 'BIAYA PAJAK', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('984', 'BIAYA PENYUSUTAN A.PRODUKTIF', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('985', 'BIAYA ASURANSI', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('986', 'BIAYA PENYUSUTAN A. TETAP', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12'),
('990', 'BIAYA NONOPERASIONAL LAINNYA', 8, '0', '0', '', 'admin', '2009-06-25 20:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `accjurnal`
--

CREATE TABLE IF NOT EXISTS `accjurnal` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `automated` char(1) NOT NULL,
  `posted` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accjurnal`
--

INSERT INTO `accjurnal` (`id`, `tanggal`, `keterangan`, `automated`, `posted`, `kantorid`, `user`, `jam`) VALUES
('ADMN1605040001', '2016-05-04', 'Setoran Simpanan No. Simpanan:12.16050001, Nama:Saddam Almahali', '2', '0', '1', 'admin', '2016-06-04 10:06:50'),
('ADMN1605110001', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050001, Nama:R. Usman Mahali', '2', '0', '1', 'admin', '2016-05-11 09:38:11'),
('ADMN1605110002', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050001, Nama:R. Usman Mahali', '2', '0', '1', 'admin', '2016-06-04 10:06:33'),
('ADMN1605110003', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050002, Nama:Amanda Abdurahman', '2', '0', '1', 'admin', '2016-05-12 08:45:06'),
('ADMN1605110004', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050002, Nama:Amanda Abdurahman', '2', '0', '1', 'admin', '2016-06-04 10:06:17'),
('ADMN1605110005', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050003, Nama:Ratih Hartati', '2', '0', '1', 'admin', '2016-05-11 09:46:08'),
('ADMN1605110006', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050003, Nama:Ratih Hartati', '2', '0', '1', 'admin', '2016-06-04 10:06:07'),
('ADMN1605110007', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050004, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-05-11 09:48:26'),
('ADMN1605110008', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050004, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-09-05 11:59:52'),
('ADMN1605110009', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-3.16050001, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-09-05 12:00:03'),
('ADMN1605110010', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050005, Nama:R. Alfy Fauziyah', '2', '0', '1', 'admin', '2016-05-11 09:51:41'),
('ADMN1605110011', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050005, Nama:R. Alfy Fauziyah', '2', '0', '1', 'admin', '2016-06-04 10:05:44'),
('ADMN1605110012', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-3.16050002, Nama:R. Alfy Fauziyah', '2', '0', '1', 'admin', '2016-06-16 10:49:15'),
('ADMN1605110013', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050006, Nama:R. Ina Ariandina', '2', '0', '1', 'admin', '2016-05-11 09:54:39'),
('ADMN1605110014', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050006, Nama:R. Ina Ariandina', '2', '0', '1', 'admin', '2016-06-04 10:05:34'),
('ADMN1605110015', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050007, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-05-11 09:57:58'),
('ADMN1605110016', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050007, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-06-04 10:05:24'),
('ADMN1605110017', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050008, Nama:Kartini', '2', '0', '1', 'admin', '2016-05-11 10:00:08'),
('ADMN1605110018', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050008, Nama:Kartini', '2', '0', '1', 'admin', '2016-06-04 10:05:15'),
('ADMN1605110019', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050009, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-05-11 10:03:03'),
('ADMN1605110020', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050009, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-06-04 10:05:06'),
('ADMN1605110021', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-3.16050003, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-06-16 10:49:38'),
('ADMN1605110022', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050010, Nama:Saddam Almahali', '2', '0', '1', 'admin', '2016-05-11 10:05:38'),
('ADMN1605110023', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050011, Nama:Enung Nurhayati . S.Pd. I', '2', '0', '1', 'admin', '2016-05-11 10:18:47'),
('ADMN1605110024', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050010, Nama:Enung Nurhayati . S.Pd. I', '2', '0', '1', 'admin', '2016-06-04 10:04:50'),
('ADMN1605110025', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050012, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-05-11 10:21:42'),
('ADMN1605110026', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050011, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-06-04 10:04:39'),
('ADMN1605110027', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050013, Nama:Siti Asri Jubaedah', '2', '0', '1', 'admin', '2016-05-11 10:23:21'),
('ADMN1605110028', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050012, Nama:Siti Asri Jubaedah', '2', '0', '1', 'admin', '2016-06-04 10:04:30'),
('ADMN1605110029', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050014, Nama:Wini Widiarti', '2', '0', '1', 'admin', '2016-05-11 10:24:55'),
('ADMN1605110030', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050013, Nama:Wini Widiarti', '2', '0', '1', 'admin', '2016-06-04 10:04:20'),
('ADMN1605110031', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050015, Nama:Ani Milayani', '2', '0', '1', 'admin', '2016-05-11 10:26:48'),
('ADMN1605110032', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050014, Nama:Ani Milayani', '2', '0', '1', 'admin', '2016-06-04 10:04:01'),
('ADMN1605110033', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050016, Nama:Nurul Aeni', '2', '0', '1', 'admin', '2016-05-11 10:28:51'),
('ADMN1605110034', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050015, Nama:Nurul Aeni', '2', '0', '1', 'admin', '2016-06-04 10:03:49'),
('ADMN1605110035', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050017, Nama:Ani K.S.', '2', '0', '1', 'admin', '2016-05-11 10:30:26'),
('ADMN1605110036', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050016, Nama:Ani K.S.', '2', '0', '1', 'admin', '2016-06-04 10:03:40'),
('ADMN1605110037', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050018, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-05-11 10:31:56'),
('ADMN1605110038', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050017, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-06-04 10:03:29'),
('ADMN1605110039', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050019, Nama:Tisna Wijaya', '2', '0', '1', 'admin', '2016-05-11 10:33:43'),
('ADMN1605110040', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050018, Nama:Tisna Wijaya', '2', '0', '1', 'admin', '2016-06-04 10:03:17'),
('ADMN1605110041', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050020, Nama:Hj. Eti Purhayati', '2', '0', '1', 'admin', '2016-05-11 10:37:20'),
('ADMN1605110042', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050019, Nama:Hj. Eti Purhayati', '2', '0', '1', 'admin', '2016-06-04 10:03:01'),
('ADMN1605110043', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-3.16050004, Nama:Hj. Eti Purhayati', '2', '0', '1', 'admin', '2016-06-16 10:50:39'),
('ADMN1605110044', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050021, Nama:Rifa Masrifah', '2', '0', '1', 'admin', '2016-05-11 10:41:56'),
('ADMN1605110045', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050020, Nama:Rifa Masrifah', '2', '0', '1', 'admin', '2016-05-11 10:42:45'),
('ADMN1605110046', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-3.16050005, Nama:Rifa Masrifah', '2', '0', '1', 'admin', '2016-06-16 10:51:31'),
('ADMN1605110047', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050022, Nama:Enur Nurjaman', '2', '0', '1', 'admin', '2016-05-11 10:45:46'),
('ADMN1605110048', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050021, Nama:Enur Nurjaman', '2', '0', '1', 'admin', '2016-06-04 10:02:27'),
('ADMN1605110049', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050023, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-05-11 10:51:47'),
('ADMN1605110050', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050022, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-06-04 10:02:13'),
('ADMN1605110051', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050024, Nama:Rini Adawiyah', '2', '0', '1', 'admin', '2016-05-11 10:57:53'),
('ADMN1605110052', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050023, Nama:Rini Adawiyah', '2', '0', '1', 'admin', '2016-06-04 10:01:53'),
('ADMN1605110053', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050025, Nama:Lala Mulya', '2', '0', '1', 'admin', '2016-05-11 11:04:07'),
('ADMN1605110054', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050024, Nama:Lala Mulya', '2', '0', '1', 'admin', '2016-10-29 08:29:31'),
('ADMN1605110055', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050026, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-05-11 11:08:02'),
('ADMN1605110056', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050025, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-06-04 10:01:28'),
('ADMN1605110057', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050027, Nama:Fitri Nurhayati', '2', '0', '1', 'admin', '2016-05-11 11:11:33'),
('ADMN1605110058', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-1.16050028, Nama:Sri Rahayu', '2', '0', '1', 'admin', '2016-05-11 11:13:42'),
('ADMN1605110059', '2016-05-11', 'Setoran Simpanan No. Simpanan:11-2.16050026, Nama:Sri Rahayu', '2', '0', '1', 'admin', '2016-06-04 10:01:12'),
('ADMN1605120001', '2016-05-12', 'Pembelian Perlengkapan Kantor (Office Supplies)', '2', '0', '1', 'admin', '2016-05-12 09:18:09'),
('ADMN1605140001', '2016-05-14', 'Setoran Simpanan No. Simpanan:11-1.16050029, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-05-14 09:13:27'),
('ADMN1605140002', '2016-05-14', 'Setoran Simpanan No. Simpanan:11-2.16050027, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-06-04 10:01:00'),
('ADMN1605140003', '2016-05-14', 'Setoran Simpanan No. Simpanan:11-1.16050030, Nama:Yanti Haryanti', '2', '0', '1', 'admin', '2016-05-14 09:15:27'),
('ADMN1605140004', '2016-05-14', 'Setoran Simpanan No. Simpanan:11-2.16050028, Nama:Yanti Haryanti', '2', '0', '1', 'admin', '2016-06-04 10:00:50'),
('ADMN1605140005', '2016-05-14', 'Setoran Simpanan No. Simpanan:11-1.16050031, Nama:Siti Saadah', '2', '0', '1', 'admin', '2016-05-14 09:17:26'),
('ADMN1605140006', '2016-05-14', 'Setoran Simpanan No. Simpanan:11-2.16050029, Nama:Siti Saadah', '2', '0', '1', 'admin', '2016-06-04 10:00:40'),
('ADMN1605160001', '2016-05-16', 'Setoran Simpanan No. Simpanan:11-1.16050032, Nama:Siti Maryam', '2', '0', '1', 'admin', '2016-05-16 10:51:53'),
('ADMN1605160002', '2016-05-16', 'Setoran Simpanan No. Simpanan:11-2.16050030, Nama:Siti Maryam', '2', '0', '1', 'admin', '2016-06-04 10:00:26'),
('ADMN1605160007', '2016-05-16', 'Pencairan Pinjaman No. Pinjaman:51.16050002, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-05-16 11:27:54'),
('ADMN1605160008', '2016-05-16', 'Pencairan Pinjaman No. Pinjaman:51.16050003, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-05-16 11:28:12'),
('ADMN1605170001', '2016-05-17', 'Pencairan Pinjaman No. Pinjaman:51.16050004, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-05-17 11:09:07'),
('ADMN1605190001', '2016-05-19', 'Pencairan Pinjaman No. Pinjaman:51.16050005, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-05-19 10:17:59'),
('ADMN1605190002', '2016-05-19', 'Pencairan Pinjaman No. Pinjaman:51.16050006, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-05-19 10:18:57'),
('ADMN1605190003', '2016-05-19', 'Setoran Simpanan No. Simpanan:11-3.16050006, Nama:Enung Nurhayati . S.Pd. I', '2', '0', '1', 'admin', '2016-09-06 11:59:56'),
('ADMN1605260001', '2016-05-26', 'Setoran Simpanan No. Simpanan:11-1.16050033, Nama:Yeni Sulastri', '2', '0', '1', 'admin', '2016-05-26 08:41:59'),
('ADMN1605260002', '2016-05-26', 'Setoran Simpanan No. Simpanan:11-2.16050031, Nama:Yeni Sulastri', '2', '0', '1', 'admin', '2016-06-04 09:59:59'),
('ADMN1606010001', '2016-06-01', 'Setoran Simpanan No. Simpanan:11-1.16060001, Nama:R. Shoffy Basyiroh Am.', '2', '0', '1', 'admin', '2016-06-03 09:41:09'),
('ADMN1606010002', '2016-06-01', 'Setoran Simpanan No. Simpanan:11-2.16060001, Nama:R. Shoffy Basyiroh Am.', '2', '0', '1', 'admin', '2016-06-04 09:59:47'),
('ADMN1606010003', '2016-06-01', 'Setoran Simpanan No. Simpanan:11-2.16050001, Nama:R. Usman Mahali', '2', '0', '1', 'admin', '2016-06-04 09:59:39'),
('ADMN1606020001', '2016-06-02', 'Angsuran Pinjaman No. Pinjaman:51.16050004, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-06-02 09:55:59'),
('ADMN1606020002', '2016-06-02', 'Setoran Simpanan No. Simpanan:11-2.16050007, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-06-04 09:59:28'),
('ADMN1606030001', '2016-06-03', 'Angsuran Pinjaman No. Pinjaman:51.16050005, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-06-03 09:23:30'),
('ADMN1606030002', '2016-06-03', 'Angsuran Pinjaman No. Pinjaman:51.16050006, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-06-03 09:23:53'),
('ADMN1606030003', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-2.16050019, Nama:Hj. Eti Purhayati', '2', '0', '1', 'admin', '2016-06-04 09:59:22'),
('ADMN1606030004', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-2.16050011, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-06-04 09:59:12'),
('ADMN1606030005', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-1.16050019, Nama:Tisna Wijaya', '2', '0', '1', 'admin', '2016-06-03 09:34:33'),
('ADMN1606030006', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-2.16050018, Nama:Tisna Wijaya', '2', '0', '1', 'admin', '2016-06-04 09:58:58'),
('ADMN1606030007', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-1.16050017, Nama:Ani K.S.', '2', '0', '1', 'admin', '2016-06-03 09:37:05'),
('ADMN1606030008', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-2.16050016, Nama:Ani K.S.', '2', '0', '1', 'admin', '2016-06-04 09:58:45'),
('ADMN1606030009', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-1.16050013, Nama:Siti Asri Jubaedah', '2', '0', '1', 'admin', '2016-06-03 09:38:56'),
('ADMN1606030010', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-2.16050012, Nama:Siti Asri Jubaedah', '2', '0', '1', 'admin', '2016-06-04 09:58:26'),
('ADMN1606030011', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-1.16050014, Nama:Wini Widiarti', '2', '0', '1', 'admin', '2016-06-03 09:40:18'),
('ADMN1606030012', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-2.16050013, Nama:Wini Widiarti', '2', '0', '1', 'admin', '2016-06-04 09:58:15'),
('ADMN1606030013', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-1.16050015, Nama:Ani Milayani', '2', '0', '1', 'admin', '2016-06-03 09:42:01'),
('ADMN1606030014', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-2.16050014, Nama:Ani Milayani', '2', '0', '1', 'admin', '2016-06-04 09:58:03'),
('ADMN1606030015', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-2.16050017, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-06-04 09:57:52'),
('ADMN1606030016', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-1.16050016, Nama:Nurul Aeni', '2', '0', '1', 'admin', '2016-06-03 09:44:17'),
('ADMN1606030017', '2016-06-03', 'Setoran Simpanan No. Simpanan:11-2.16050015, Nama:Nurul Aeni', '2', '0', '1', 'admin', '2016-06-04 09:57:28'),
('ADMN1606100001', '2016-06-10', 'Setoran Simpanan No. Simpanan:11-1.16050030, Nama:Yanti Haryanti', '2', '0', '1', 'admin', '2016-06-10 10:33:24'),
('ADMN1606100002', '2016-06-10', 'Setoran Simpanan No. Simpanan:11-2.16050028, Nama:Yanti Haryanti', '2', '0', '1', 'admin', '2016-06-10 10:34:08'),
('ADMN1606160001', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-2.16050002, Nama:Amanda Abdurahman', '2', '0', '1', 'admin', '2016-06-16 10:24:18'),
('ADMN1606160002', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-2.16050009, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-06-16 10:25:08'),
('ADMN1606160003', '2016-06-16', 'Setoran Simpanan No. Simpanan:12.16050001, Nama:Saddam Almahali', '2', '0', '1', 'admin', '2016-06-16 10:26:04'),
('ADMN1606160004', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-3.16050003, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-06-16 11:00:02'),
('ADMN1606160005', '2016-06-16', 'Angsuran Pinjaman No. Pinjaman:51.16050003, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-06-16 11:05:39'),
('ADMN1606160006', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-2.16050022, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-06-16 11:07:18'),
('ADMN1606160007', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-2.16050004, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-09-05 12:02:42'),
('ADMN1606160008', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-2.16050005, Nama:R. Alfy Fauziyah', '2', '0', '1', 'admin', '2016-06-16 12:58:33'),
('ADMN1606160009', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-3.16050001, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-06-16 12:59:20'),
('ADMN1606160010', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-2.16050003, Nama:Ratih Hartati', '2', '0', '1', 'admin', '2016-06-16 13:02:18'),
('ADMN1606160011', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-2.16050008, Nama:Kartini', '2', '0', '1', 'admin', '2016-06-16 13:02:58'),
('ADMN1606160012', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-2.16050006, Nama:R. Ina Ariandina', '2', '0', '1', 'admin', '2016-06-16 13:03:47'),
('ADMN1606160013', '2016-06-16', 'Setoran Simpanan No. Simpanan:11-2.16050026, Nama:Sri Rahayu', '2', '0', '1', 'admin', '2016-06-16 13:04:23'),
('ADMN1607180001', '2016-07-18', 'Setoran Simpanan No. Simpanan:11-1.16050031, Nama:Siti Saadah', '2', '0', '1', 'admin', '2016-07-18 10:29:32'),
('ADMN1607180002', '2016-07-18', 'Setoran Simpanan No. Simpanan:11-2.16050029, Nama:Siti Saadah', '2', '0', '1', 'admin', '2016-07-18 10:29:21'),
('ADMN1607180003', '2016-07-18', 'Pencairan Pinjaman No. Pinjaman:51.16070001, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-07-18 10:35:11'),
('ADMN1607180004', '2016-07-18', 'Pencairan Pinjaman No. Pinjaman:51.16070002, Nama:Ratih Hartati', '2', '0', '1', 'admin', '2016-07-18 10:35:35'),
('ADMN1607180005', '2016-07-18', 'Pencairan Pinjaman No. Pinjaman:51.16070003, Nama:Amanda Abdurahman', '2', '0', '1', 'admin', '2016-07-18 10:35:57'),
('ADMN1607180006', '2016-07-18', 'Biaya Konsumsi Rapat Anggota', '2', '0', '1', 'admin', '2016-07-18 10:48:18'),
('ADMN1607180007', '2016-07-18', 'Setoran Simpanan No. Simpanan:11-2.16050017, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-07-18 11:47:41'),
('ADMN1607180008', '2016-07-18', 'Setoran Simpanan No. Simpanan:11-2.16050009, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-07-18 11:50:52'),
('ADMN1607180009', '2016-07-18', 'Setoran Simpanan No. Simpanan:11-2.16050007, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-07-18 11:52:43'),
('ADMN1607180010', '2016-07-18', 'Setoran Simpanan No. Simpanan:11-2.16050002, Nama:Amanda Abdurahman', '2', '0', '1', 'admin', '2016-07-18 11:53:38'),
('ADMN1607180011', '2016-07-18', 'Setoran Simpanan No. Simpanan:11-2.16050003, Nama:Ratih Hartati', '2', '0', '1', 'admin', '2016-07-18 11:54:35'),
('ADMN1607180012', '2016-07-18', 'Setoran Simpanan No. Simpanan:12.16050001, Nama:Saddam Almahali', '2', '0', '1', 'admin', '2016-07-18 11:55:30'),
('ADMN1607180013', '2016-07-18', 'Angsuran Pinjaman No. Pinjaman:51.16050005, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-07-18 11:57:25'),
('ADMN1607180014', '2016-07-18', 'Angsuran Pinjaman No. Pinjaman:51.16070001, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-07-18 11:58:06'),
('ADMN1607180015', '2016-07-18', 'Angsuran Pinjaman No. Pinjaman:51.16050006, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-07-18 12:03:02'),
('ADMN1607210001', '2016-07-21', 'Angsuran Pinjaman No. Pinjaman:51.16050004, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-07-21 08:57:19'),
('ADMN1607210002', '2016-07-21', 'Setoran Simpanan No. Simpanan:11-2.16050001, Nama:R. Usman Mahali', '2', '0', '1', 'admin', '2016-07-21 11:10:27'),
('ADMN1607210003', '2016-07-21', 'Setoran Simpanan No. Simpanan:11-3.16070001, Nama:R. Usman Mahali', '2', '0', '1', 'admin', '2016-07-21 11:11:46'),
('ADMN1607210004', '2016-07-21', 'Setoran Simpanan No. Simpanan:11-2.16050001, Nama:R. Usman Mahali', '2', '0', '1', 'admin', '2016-07-21 11:12:34'),
('ADMN1607210005', '2016-07-21', 'Angsuran Pinjaman No. Pinjaman:51.16050003, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-07-21 11:18:03'),
('ADMN1607210006', '2016-07-21', 'Setoran Simpanan No. Simpanan:11-2.16050022, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-07-21 11:19:24'),
('ADMN1607210007', '2016-07-21', 'Angsuran Pinjaman No. Pinjaman:51.16050002, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-07-21 11:26:29'),
('ADMN1607210008', '2016-07-21', 'Angsuran Pinjaman No. Pinjaman:51.16050002, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-07-21 11:27:21'),
('ADMN1607210009', '2016-07-21', 'Setoran Simpanan No. Simpanan:11-2.16050008, Nama:Kartini', '2', '0', '1', 'admin', '2016-07-21 11:30:46'),
('ADMN1607210010', '2016-07-21', 'Setoran Simpanan No. Simpanan:11-2.16050025, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-07-21 11:32:16'),
('ADMN1607210011', '2016-07-21', 'Setoran Simpanan No. Simpanan:11-2.16050025, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-07-21 11:33:23'),
('ADMN1607210012', '2016-07-21', 'Setoran Simpanan No. Simpanan:11-2.16050027, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-07-21 11:36:30'),
('ADMN1607210013', '2016-07-21', 'Setoran Simpanan No. Simpanan:11-2.16050027, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-07-21 11:37:53'),
('ADMN1607230001', '2016-07-23', 'Pencairan Pinjaman No. Pinjaman:51.16070004, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-07-23 10:43:47'),
('ADMN1607260001', '2016-07-26', 'Setoran Simpanan No. Simpanan:11-2.16050014, Nama:Ani Milayani', '2', '0', '1', 'admin', '2016-07-26 10:33:51'),
('ADMN1607260002', '2016-07-26', 'Setoran Simpanan No. Simpanan:11-1.16050015, Nama:Ani Milayani', '2', '0', '1', 'admin', '2016-07-26 10:35:03'),
('ADMN1607260003', '2016-07-26', 'Setoran Simpanan No. Simpanan:11-1.16050014, Nama:Wini Widiarti', '2', '0', '1', 'admin', '2016-07-26 10:36:02'),
('ADMN1607260004', '2016-07-26', 'Setoran Simpanan No. Simpanan:11-2.16050013, Nama:Wini Widiarti', '2', '0', '1', 'admin', '2016-07-26 10:37:57'),
('ADMN1607260005', '2016-07-26', 'Setoran Simpanan No. Simpanan:11-1.16050017, Nama:Ani K.S.', '2', '0', '1', 'admin', '2016-07-26 10:39:22'),
('ADMN1607260006', '2016-07-26', 'Setoran Simpanan No. Simpanan:11-2.16050016, Nama:Ani K.S.', '2', '0', '1', 'admin', '2016-07-26 10:40:12'),
('ADMN1607260007', '2016-07-26', 'Setoran Simpanan No. Simpanan:11-1.16050013, Nama:Siti Asri Jubaedah', '2', '0', '1', 'admin', '2016-07-26 10:41:21'),
('ADMN1607260008', '2016-07-26', 'Setoran Simpanan No. Simpanan:11-2.16050012, Nama:Siti Asri Jubaedah', '2', '0', '1', 'admin', '2016-07-26 10:42:12'),
('ADMN1607260009', '2016-07-26', 'Setoran Simpanan No. Simpanan:11-1.16070001, Nama:Zam-Zam Nurjaman', '2', '0', '1', 'admin', '2016-07-26 10:47:23'),
('ADMN1608100002', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050007, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-08-10 10:40:10'),
('ADMN1608100003', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050008, Nama:Kartini', '2', '0', '1', 'admin', '2016-08-10 10:37:48'),
('ADMN1608100004', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050006, Nama:R. Ina Ariandina', '2', '0', '1', 'admin', '2016-08-10 10:39:24'),
('ADMN1608100005', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050006, Nama:R. Ina Ariandina', '2', '0', '1', 'admin', '2016-08-10 10:41:04'),
('ADMN1608100006', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050026, Nama:Sri Rahayu', '2', '0', '1', 'admin', '2016-08-10 10:42:00'),
('ADMN1608100007', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050026, Nama:Sri Rahayu', '2', '0', '1', 'admin', '2016-08-10 10:43:33'),
('ADMN1608100008', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-1.16050015, Nama:Ani Milayani', '2', '0', '1', 'admin', '2016-08-10 10:45:41'),
('ADMN1608100009', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050014, Nama:Ani Milayani', '2', '0', '1', 'admin', '2016-08-10 10:47:05'),
('ADMN1608100010', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-1.16050013, Nama:Siti Asri Jubaedah', '2', '0', '1', 'admin', '2016-08-10 10:48:06'),
('ADMN1608100011', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050012, Nama:Siti Asri Jubaedah', '2', '0', '1', 'admin', '2016-08-10 10:49:01'),
('ADMN1608100012', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-1.16050014, Nama:Wini Widiarti', '2', '0', '1', 'admin', '2016-08-10 10:49:44'),
('ADMN1608100013', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050013, Nama:Wini Widiarti', '2', '0', '1', 'admin', '2016-08-10 10:50:30'),
('ADMN1608100014', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-1.16050017, Nama:Ani K.S.', '2', '0', '1', 'admin', '2016-08-10 10:51:28'),
('ADMN1608100015', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050016, Nama:Ani K.S.', '2', '0', '1', 'admin', '2016-08-10 10:52:13'),
('ADMN1608100016', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050017, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-08-10 10:53:05'),
('ADMN1608100017', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050011, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-08-10 10:54:19'),
('ADMN1608100018', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050011, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-08-10 10:55:10'),
('ADMN1608100019', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050019, Nama:Hj. Eti Purhayati', '2', '0', '1', 'admin', '2016-08-10 10:56:04'),
('ADMN1608100020', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050019, Nama:Hj. Eti Purhayati', '2', '0', '1', 'admin', '2016-08-10 10:56:51'),
('ADMN1608100021', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050018, Nama:Tisna Wijaya', '2', '0', '1', 'admin', '2016-08-10 10:57:50'),
('ADMN1608100022', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050018, Nama:Tisna Wijaya', '2', '0', '1', 'admin', '2016-08-10 10:58:36'),
('ADMN1608100023', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050025, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-08-10 10:59:31'),
('ADMN1608100024', '2016-08-10', 'Angsuran Pinjaman No. Pinjaman:51.16050004, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-08-10 11:00:18'),
('ADMN1608100025', '2016-08-10', 'Angsuran Pinjaman No. Pinjaman:51.16050006, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-08-10 11:00:58'),
('ADMN1608100026', '2016-08-10', 'Angsuran Pinjaman No. Pinjaman:51.16050005, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-08-10 11:01:26'),
('ADMN1608100027', '2016-08-10', 'Angsuran Pinjaman No. Pinjaman:51.16070004, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-08-10 11:01:54'),
('ADMN1608100028', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050024, Nama:Lala Mulya', '2', '0', '1', 'admin', '2016-08-10 11:59:36'),
('ADMN1608100029', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050024, Nama:Lala Mulya', '2', '0', '1', 'admin', '2016-08-10 12:00:24'),
('ADMN1608100030', '2016-08-10', 'Setoran Simpanan No. Simpanan:11-2.16050024, Nama:Lala Mulya', '2', '0', '1', 'admin', '2016-08-10 12:09:27'),
('ADMN1608130001', '2016-08-13', 'Setoran Simpanan No. Simpanan:11-2.16050023, Nama:Rini Adawiyah', '2', '0', '1', 'admin', '2016-08-13 10:27:54'),
('ADMN1608130002', '2016-08-13', 'Setoran Simpanan No. Simpanan:11-2.16050023, Nama:Rini Adawiyah', '2', '0', '1', 'admin', '2016-08-13 10:30:12'),
('ADMN1608130003', '2016-08-13', 'Setoran Simpanan No. Simpanan:11-2.16050010, Nama:Enung Nurhayati . S.Pd. I', '2', '0', '1', 'admin', '2016-08-13 10:34:32'),
('ADMN1608130004', '2016-08-13', 'Setoran Simpanan No. Simpanan:11-2.16050010, Nama:Enung Nurhayati . S.Pd. I', '2', '0', '1', 'admin', '2016-08-13 10:37:50'),
('ADMN1608130005', '2016-08-13', 'Angsuran Pinjaman No. Pinjaman:51.16070001, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-08-13 10:40:36'),
('ADMN1608130006', '2016-08-13', 'Setoran Simpanan No. Simpanan:11-2.16050009, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-08-13 10:45:38'),
('ADMN1608130007', '2016-08-13', 'Setoran Simpanan No. Simpanan:11-2.16050002, Nama:Amanda Abdurahman', '2', '0', '1', 'admin', '2016-08-13 10:47:38'),
('ADMN1608130008', '2016-08-13', 'Setoran Simpanan No. Simpanan:11-2.16050003, Nama:Ratih Hartati', '2', '0', '1', 'admin', '2016-08-13 10:48:43'),
('ADMN1608130009', '2016-08-13', 'Setoran Simpanan No. Simpanan:12.16050001, Nama:Saddam Almahali', '2', '0', '1', 'admin', '2016-08-13 10:51:39'),
('ADMN1608130010', '2016-08-13', 'Setoran Simpanan No. Simpanan:11-1.16050009, Nama:R. Saad Aliyudin, S.Ip.', '2', '0', '1', 'admin', '2016-08-13 10:51:25'),
('ADMN1608200001', '2016-08-20', 'Setoran Simpanan No. Simpanan:11-2.16050023, Nama:Rini Adawiyah', '2', '0', '1', 'admin', '2016-08-20 08:53:37'),
('ADMN1608200002', '2016-08-20', 'Setoran Simpanan No. Simpanan:11-2.16050022, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-08-20 08:55:30'),
('ADMN1608200003', '2016-08-20', 'Angsuran Pinjaman No. Pinjaman:51.16050003, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-08-20 08:57:19'),
('ADMN1608200004', '2016-08-20', 'Pencairan Pinjaman No. Pinjaman:51.16080001, Nama:Saddam Almahali', '2', '0', '1', 'admin', '2016-08-20 09:13:21'),
('ADMN1609020001', '2016-09-02', 'Setoran Simpanan No. Simpanan:11-2.16050025, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-09-02 09:55:50'),
('ADMN1609020002', '2016-09-02', 'Angsuran Pinjaman No. Pinjaman:51.16070004, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-09-02 09:34:43'),
('ADMN1609020003', '2016-09-02', 'Setoran Simpanan No. Simpanan:11-2.16050024, Nama:Lala Mulya', '2', '0', '1', 'admin', '2016-09-02 09:56:18'),
('ADMN1609020004', '2016-09-02', 'Setoran Simpanan No. Simpanan:11-2.16050026, Nama:Sri Rahayu', '2', '0', '1', 'admin', '2016-09-02 09:50:33'),
('ADMN1609020005', '2016-09-02', 'Setoran Simpanan No. Simpanan:11-2.16050008, Nama:Kartini', '2', '0', '1', 'admin', '2016-09-02 09:53:29'),
('ADMN1609020006', '2016-09-02', 'Setoran Simpanan No. Simpanan:11-2.16050007, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-09-02 09:54:15'),
('ADMN1609020007', '2016-09-02', 'Angsuran Pinjaman No. Pinjaman:51.16050004, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-09-02 09:58:54'),
('ADMN1609050001', '2016-09-05', 'Angsuran Pinjaman No. Pinjaman:51.16050002, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-09-05 11:32:59'),
('ADMN1609050002', '2016-09-05', 'Angsuran Pinjaman No. Pinjaman:51.16050002, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-09-05 11:33:28'),
('ADMN1609050003', '2016-09-05', 'Setoran Simpanan No. Simpanan:11-2.16050027, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-09-05 11:37:00'),
('ADMN1609050004', '2016-09-05', 'Setoran Simpanan No. Simpanan:11-2.16050027, Nama:Iin Lasmanawati', '2', '0', '1', 'admin', '2016-09-05 11:37:52'),
('ADMN1609050005', '2016-09-05', 'Setoran Simpanan No. Simpanan:11-2.16050004, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-09-05 11:54:23'),
('ADMN1609050006', '2016-09-05', 'Setoran Simpanan No. Simpanan:11-2.16050004, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-09-05 11:44:02'),
('ADMN1609050007', '2016-09-05', 'Setoran Simpanan No. Simpanan:11-1.16050031, Nama:Siti Saadah', '2', '0', '1', 'admin', '2016-09-05 11:48:24'),
('ADMN1609050008', '2016-09-05', 'Setoran Simpanan No. Simpanan:11-2.16050029, Nama:Siti Saadah', '2', '0', '1', 'admin', '2016-09-05 11:50:35'),
('ADMN1609050009', '2016-09-05', 'Setoran Simpanan No. Simpanan:11-2.16050029, Nama:Siti Saadah', '2', '0', '1', 'admin', '2016-09-06 11:36:43'),
('ADMN1609050010', '2016-09-05', 'Setoran Simpanan No. Simpanan:11-2.16050029, Nama:Siti Saadah', '2', '0', '1', 'admin', '2016-09-05 11:51:38'),
('ADMN1609060001', '2016-09-06', 'Angsuran Pinjaman No. Pinjaman:51.16050005, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-09-06 11:33:50'),
('ADMN1609060002', '2016-09-06', 'Angsuran Pinjaman No. Pinjaman:51.16050006, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-09-06 11:34:36'),
('ADMN1609060003', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16050017, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-09-06 11:35:51'),
('ADMN1609060004', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16050014, Nama:Ani Milayani', '2', '0', '1', 'admin', '2016-09-06 11:37:55'),
('ADMN1609060005', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16050011, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-09-06 11:40:39'),
('ADMN1609060006', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16050019, Nama:Hj. Eti Purhayati', '2', '0', '1', 'admin', '2016-09-06 11:40:20'),
('ADMN1609060007', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16050016, Nama:Ani K.S.', '2', '0', '1', 'admin', '2016-09-06 11:41:37'),
('ADMN1609060008', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16050013, Nama:Wini Widiarti', '2', '0', '1', 'admin', '2016-09-06 11:42:48'),
('ADMN1609060009', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16050012, Nama:Siti Asri Jubaedah', '2', '0', '1', 'admin', '2016-09-06 11:43:45'),
('ADMN1609060010', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16050018, Nama:Tisna Wijaya', '2', '0', '1', 'admin', '2016-09-06 12:51:24'),
('ADMN1609060011', '2016-09-06', 'Pencairan Pinjaman No. Pinjaman:51.16090001, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-09-06 12:46:05'),
('ADMN1609060012', '2016-09-06', 'Angsuran Pinjaman No. Pinjaman:51.16090001, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-09-06 12:49:16'),
('ADMN1609060013', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-1.16090001, Nama:Intan Permata', '2', '0', '1', 'admin', '2016-09-06 12:50:45'),
('ADMN1609060014', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-1.16090002, Nama:Ai Nurlaela', '2', '0', '1', 'admin', '2016-09-06 12:52:23'),
('ADMN1609060015', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16090001, Nama:Intan Permata', '2', '0', '1', 'admin', '2016-09-06 12:53:11'),
('ADMN1609060016', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16090001, Nama:Intan Permata', '2', '0', '1', 'admin', '2016-09-06 12:53:59'),
('ADMN1609060017', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16090001, Nama:Intan Permata', '2', '0', '1', 'admin', '2016-09-06 12:54:55'),
('ADMN1609060018', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16090001, Nama:Intan Permata', '2', '0', '1', 'admin', '2016-09-06 12:55:44'),
('ADMN1609060019', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16090001, Nama:Intan Permata', '2', '0', '1', 'admin', '2016-09-06 12:56:24'),
('ADMN1609060020', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16090002, Nama:Ai Nurlaela', '2', '0', '1', 'admin', '2016-09-06 12:57:18'),
('ADMN1609060021', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16090002, Nama:Ai Nurlaela', '2', '0', '1', 'admin', '2016-09-06 12:57:57'),
('ADMN1609060022', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16090002, Nama:Ai Nurlaela', '2', '0', '1', 'admin', '2016-09-06 12:58:44'),
('ADMN1609060023', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16090002, Nama:Ai Nurlaela', '2', '0', '1', 'admin', '2016-09-06 12:59:24'),
('ADMN1609060024', '2016-09-06', 'Setoran Simpanan No. Simpanan:11-2.16090002, Nama:Ai Nurlaela', '2', '0', '1', 'admin', '2016-09-06 13:00:10'),
('ADMN1609160001', '2016-09-16', 'Setoran Simpanan No. Simpanan:11-1.16050016, Nama:Nurul Aeni', '2', '0', '1', 'admin', '2016-09-16 07:40:28'),
('ADMN1609160002', '2016-09-16', 'Setoran Simpanan No. Simpanan:11-2.16050015, Nama:Nurul Aeni', '2', '0', '1', 'admin', '2016-09-16 07:46:17'),
('ADMN1609160003', '2016-09-16', 'Setoran Simpanan No. Simpanan:11-2.16050015, Nama:Nurul Aeni', '2', '0', '1', 'admin', '2016-09-16 07:45:59'),
('ADMN1609160004', '2016-09-16', 'Setoran Simpanan No. Simpanan:11-2.16050015, Nama:Nurul Aeni', '2', '0', '1', 'admin', '2016-09-16 07:47:06'),
('ADMN1609220001', '2016-09-22', 'Angsuran Pinjaman No. Pinjaman:51.16050003, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-09-22 08:47:00'),
('ADMN1609220002', '2016-09-22', 'Setoran Simpanan No. Simpanan:11-2.16050022, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-09-22 08:48:49'),
('ADMN1609280001', '2016-09-28', 'Pencairan Pinjaman No. Pinjaman:51.16090002, Nama:Lala Mulya', '2', '0', '1', 'admin', '2016-09-28 07:10:24'),
('ADMN1609300001', '2016-09-30', 'Setoran Simpanan No. Simpanan:11-2.16050006, Nama:R. Ina Ariandina', '2', '0', '1', 'admin', '2016-09-30 09:49:04'),
('ADMN1609300002', '2016-09-30', 'Setoran Simpanan No. Simpanan:11-2.16050003, Nama:Ratih Hartati', '2', '0', '1', 'admin', '2016-09-30 09:49:51'),
('ADMN1610050001', '2016-10-05', 'Angsuran Pinjaman No. Pinjaman:51.16090001, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-10-05 09:46:52'),
('ADMN1610050002', '2016-10-05', 'Setoran Simpanan No. Simpanan:11-2.16050004, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-10-05 09:48:03'),
('ADMN1610100001', '2016-10-10', 'Setoran Simpanan No. Simpanan:11-2.16050025, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-10-10 10:43:35'),
('ADMN1610100002', '2016-10-10', 'Angsuran Pinjaman No. Pinjaman:51.16070004, Nama:Nia Kusniawati, S.Pd.I.', '2', '0', '1', 'admin', '2016-10-10 10:45:07'),
('ADMN1610240001', '2016-10-24', 'Setoran Simpanan No. Simpanan:11-2.16050022, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-10-24 11:13:54'),
('ADMN1610240002', '2016-10-24', 'Angsuran Pinjaman No. Pinjaman:51.16050003, Nama:Enok Armilah, S.Pd.I', '2', '0', '1', 'admin', '2016-10-24 11:14:56'),
('ADMN1610290001', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050007, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-10-29 08:03:40'),
('ADMN1610290002', '2016-10-29', 'Angsuran Pinjaman No. Pinjaman:51.16050004, Nama:N. Ilah Jamilah ', '2', '0', '1', 'admin', '2016-10-29 07:57:43'),
('ADMN1610290003', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050026, Nama:Sri Rahayu', '2', '0', '1', 'admin', '2016-10-29 08:00:51'),
('ADMN1610290004', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050006, Nama:R. Ina Ariandina', '2', '0', '1', 'admin', '2016-10-29 08:02:06'),
('ADMN1610290005', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050008, Nama:Kartini', '2', '0', '1', 'admin', '2016-10-29 08:03:00'),
('ADMN1610290006', '2016-10-29', 'Angsuran Pinjaman No. Pinjaman:51.16050005, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-10-29 08:08:24'),
('ADMN1610290007', '2016-10-29', 'Angsuran Pinjaman No. Pinjaman:51.16090001, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-10-29 08:09:37'),
('ADMN1610290008', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050004, Nama:Hj. R. Siti Syarifah', '2', '0', '1', 'admin', '2016-10-29 08:10:48'),
('ADMN1610290009', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050017, Nama:Aam Maryati', '2', '0', '1', 'admin', '2016-10-29 08:11:55'),
('ADMN1610290010', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050015, Nama:Nurul Aeni', '2', '0', '1', 'admin', '2016-10-29 08:19:04'),
('ADMN1610290011', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050012, Nama:Siti Asri Jubaedah', '2', '0', '1', 'admin', '2016-10-29 08:20:45'),
('ADMN1610290012', '2016-10-29', 'Angsuran Pinjaman No. Pinjaman:51.16090002, Nama:Lala Mulya', '2', '0', '1', 'admin', '2016-10-29 08:22:14'),
('ADMN1610290013', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050024, Nama:Lala Mulya', '2', '0', '1', 'admin', '2016-10-29 08:25:54'),
('ADMN1610290014', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050016, Nama:Ani K.S.', '2', '0', '1', 'admin', '2016-10-29 08:32:00'),
('ADMN1610290015', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050013, Nama:Wini Widiarti', '2', '0', '1', 'admin', '2016-10-29 08:45:38'),
('ADMN1610290016', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050014, Nama:Ani Milayani', '2', '0', '1', 'admin', '2016-10-29 08:46:36'),
('ADMN1610290017', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050019, Nama:Hj. Eti Purhayati', '2', '0', '1', 'admin', '2016-10-29 08:47:34'),
('ADMN1610290018', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050011, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-10-29 08:48:24'),
('ADMN1610290019', '2016-10-29', 'Setoran Simpanan No. Simpanan:11-2.16050018, Nama:Tisna Wijaya', '2', '0', '1', 'admin', '2016-10-29 08:50:20'),
('ADMN1610290020', '2016-10-29', 'Angsuran Pinjaman No. Pinjaman:51.16050006, Nama:Hj. Ai Nurjanah', '2', '0', '1', 'admin', '2016-10-29 11:04:12');

-- --------------------------------------------------------

--
-- Table structure for table `accjurnaldetail`
--

CREATE TABLE IF NOT EXISTS `accjurnaldetail` (
  `id` varchar(30) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `debet` double(15,2) NOT NULL,
  `kredit` double(15,2) NOT NULL,
  `cek` char(1) NOT NULL,
  KEY `id2` (`id`,`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accjurnaldetail`
--

INSERT INTO `accjurnaldetail` (`id`, `accountid`, `keterangan`, `debet`, `kredit`, `cek`) VALUES
('ADMN1605110001', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110001', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110005', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110005', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110007', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110007', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110010', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110010', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110013', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110013', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110015', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110015', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110017', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110017', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110019', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110019', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110022', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110022', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110023', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110023', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110025', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110025', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110027', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1605110027', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1605110029', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1605110029', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1605110031', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1605110031', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1605110033', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1605110033', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1605110035', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1605110035', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1605110037', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110037', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110039', '100-01', '', 80000.00, 0.00, '0'),
('ADMN1605110039', '800-02', '', 0.00, 80000.00, '0'),
('ADMN1605110041', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110041', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110044', '100-01', '', 25000.00, 0.00, '0'),
('ADMN1605110044', '800-02', '', 0.00, 25000.00, '0'),
('ADMN1605110045', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110045', '800-02', '', 0.00, 20000.00, '0'),
('ADMN1605110047', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110047', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110049', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110049', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110051', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110051', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110053', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110053', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110055', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110055', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110057', '100-01', '', 45000.00, 0.00, '0'),
('ADMN1605110057', '800-02', '', 0.00, 45000.00, '0'),
('ADMN1605110058', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110058', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605110003', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605110003', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605120001', '170-01', '', 47500.00, 0.00, '0'),
('ADMN1605120001', '100-01', '', 0.00, 47500.00, '0'),
('ADMN1605120001', '170-01', '', 3000.00, 0.00, '0'),
('ADMN1605120001', '100-01', '', 0.00, 3000.00, '0'),
('ADMN1605140001', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1605140001', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1605140003', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1605140003', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1605140005', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1605140005', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1605160001', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605160001', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1605160007', '150-01', '', 500000.00, 0.00, '1'),
('ADMN1605160007', '100-01', '', 0.00, 500000.00, '1'),
('ADMN1605160008', '150-01', '', 500000.00, 0.00, '1'),
('ADMN1605160008', '100-01', '', 0.00, 500000.00, '1'),
('ADMN1605170001', '150-01', '', 500000.00, 0.00, '1'),
('ADMN1605170001', '100-01', '', 0.00, 500000.00, '1'),
('ADMN1605190001', '150-01', '', 500000.00, 0.00, '0'),
('ADMN1605190001', '100-01', '', 0.00, 500000.00, '0'),
('ADMN1605190002', '150-01', '', 500000.00, 0.00, '0'),
('ADMN1605190002', '100-01', '', 0.00, 500000.00, '0'),
('ADMN1605260001', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1605260001', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1606020001', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1606020001', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1606020001', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1606030001', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1606030001', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1606030001', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1606030002', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1606030002', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1606030002', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1606030005', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606030005', '800-02', '', 0.00, 20000.00, '0'),
('ADMN1606030007', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1606030007', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1606030009', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1606030009', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1606030011', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1606030011', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1606010001', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1606010001', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1606030013', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1606030013', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1606030016', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1606030016', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1606030017', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606030017', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606030015', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606030015', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606030014', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606030014', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606030012', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606030012', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606030010', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606030010', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606030008', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606030008', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606030006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606030006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606030004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606030004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606030003', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606030003', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606020002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606020002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606010003', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606010003', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606010002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606010002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605260002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605260002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605160002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605160002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605140006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605140006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605140004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605140004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605140002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605140002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110059', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110059', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110056', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110056', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110052', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110052', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110050', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110050', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110048', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110048', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110042', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110042', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110040', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110040', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110038', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110038', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110036', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110036', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110034', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110034', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110032', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110032', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110030', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110030', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110028', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110028', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110026', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110026', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110024', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110024', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110020', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110020', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110018', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110018', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110016', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110016', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110014', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110014', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110011', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110011', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605040001', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605040001', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606100001', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1606100001', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1606100002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606100002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606160001', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606160001', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606160002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606160002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606160003', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606160003', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110012', '100-01', '', 10000.00, 0.00, '0'),
('ADMN1605110012', '510-01', '', 0.00, 10000.00, '0'),
('ADMN1605110021', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110021', '510-01', '', 0.00, 20000.00, '0'),
('ADMN1605110043', '100-01', '', 10000.00, 0.00, '0'),
('ADMN1605110043', '510-01', '', 0.00, 10000.00, '0'),
('ADMN1605110046', '100-01', '', 5000.00, 0.00, '0'),
('ADMN1605110046', '510-01', '', 0.00, 5000.00, '0'),
('ADMN1606160004', '100-01', '', 40000.00, 0.00, '0'),
('ADMN1606160004', '510-01', '', 0.00, 40000.00, '0'),
('ADMN1606160005', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1606160005', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1606160005', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1606160006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606160006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606160008', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606160008', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606160009', '100-01', '', 10000.00, 0.00, '0'),
('ADMN1606160009', '510-01', '', 0.00, 10000.00, '0'),
('ADMN1606160010', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606160010', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606160011', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606160011', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606160012', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606160012', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606160013', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606160013', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607180002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607180002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607180001', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1607180001', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1607180003', '150-01', '', 500000.00, 0.00, '0'),
('ADMN1607180003', '100-01', '', 0.00, 500000.00, '0'),
('ADMN1607180004', '150-01', '', 500000.00, 0.00, '0'),
('ADMN1607180004', '100-01', '', 0.00, 500000.00, '0'),
('ADMN1607180005', '150-01', '', 200000.00, 0.00, '0'),
('ADMN1607180005', '100-01', '', 0.00, 200000.00, '0'),
('ADMN1607180006', '985-04', '', 350000.00, 0.00, '0'),
('ADMN1607180006', '100-01', '', 0.00, 350000.00, '0'),
('ADMN1607180007', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607180007', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607180008', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607180008', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607180009', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607180009', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607180010', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607180010', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607180011', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607180011', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607180012', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607180012', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607180013', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1607180013', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1607180013', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1607180014', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1607180014', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1607180014', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1607180015', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1607180015', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1607180015', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1607210001', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1607210001', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1607210001', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1607210002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607210002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607210003', '100-01', '', 10000.00, 0.00, '0'),
('ADMN1607210003', '510-01', '', 0.00, 10000.00, '0'),
('ADMN1607210004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607210004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607210005', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1607210005', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1607210005', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1607210006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607210006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607210007', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1607210007', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1607210007', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1607210008', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1607210008', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1607210008', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1607210009', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607210009', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607210010', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607210010', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607210011', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607210011', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607210012', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607210012', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607210013', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607210013', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607230001', '150-01', '', 500000.00, 0.00, '0'),
('ADMN1607230001', '100-01', '', 0.00, 500000.00, '0'),
('ADMN1607260001', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607260001', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607260002', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1607260002', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1607260003', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1607260003', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1607260004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607260004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607260005', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1607260005', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1607260006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607260006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607260007', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1607260007', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1607260008', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1607260008', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1607260009', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1607260009', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1608100003', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100003', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100005', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100005', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100007', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100007', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100008', '100-01', '', 10000.00, 0.00, '0'),
('ADMN1608100008', '800-02', '', 0.00, 10000.00, '0'),
('ADMN1608100009', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100009', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100010', '100-01', '', 10000.00, 0.00, '0'),
('ADMN1608100010', '800-02', '', 0.00, 10000.00, '0'),
('ADMN1608100011', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100011', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100012', '100-01', '', 10000.00, 0.00, '0'),
('ADMN1608100012', '800-02', '', 0.00, 10000.00, '0'),
('ADMN1608100013', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100013', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100014', '100-01', '', 10000.00, 0.00, '0'),
('ADMN1608100014', '800-02', '', 0.00, 10000.00, '0'),
('ADMN1608100015', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100015', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100016', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100016', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100017', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100017', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100018', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100018', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100019', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100019', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100020', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100020', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100021', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100021', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100022', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100022', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100023', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100023', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100024', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1608100024', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1608100024', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1608100025', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1608100025', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1608100025', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1608100026', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1608100026', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1608100026', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1608100027', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1608100027', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1608100027', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1608100028', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100028', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100029', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100029', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608100030', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608100030', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608130001', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608130001', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608130002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608130002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608130003', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608130003', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608130004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608130004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608130005', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1608130005', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1608130005', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1608130006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608130006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608130007', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608130007', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608130008', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608130008', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608130010', '100-01', '', 25000.00, 0.00, '0'),
('ADMN1608130010', '800-02', '', 0.00, 25000.00, '0'),
('ADMN1608130009', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608130009', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608200001', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608200001', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608200002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1608200002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1608200003', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1608200003', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1608200003', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1608200004', '150-01', '', 500000.00, 0.00, '0'),
('ADMN1608200004', '100-01', '', 0.00, 500000.00, '0'),
('ADMN1609020002', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1609020002', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1609020002', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1609020004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609020004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609020005', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609020005', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609020006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609020006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609020001', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609020001', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609020003', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609020003', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609020007', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1609020007', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1609020007', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1609050001', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1609050001', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1609050001', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1609050002', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1609050002', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1609050002', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1609050003', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609050003', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609050004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609050004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609050006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609050006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609050007', '100-01', '', 40000.00, 0.00, '0'),
('ADMN1609050007', '800-02', '', 0.00, 40000.00, '0'),
('ADMN1609050008', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609050008', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609050010', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609050010', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609050005', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609050005', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110008', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110008', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110009', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110009', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1606160007', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1606160007', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060001', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1609060001', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1609060001', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1609060002', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1609060002', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1609060002', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1609060003', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060003', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609050009', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609050009', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060006', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060006', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060005', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060005', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060007', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060007', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060008', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060008', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060009', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060009', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605190003', '100-01', '', 30000.00, 0.00, '0'),
('ADMN1605190003', '800-02', '', 0.00, 30000.00, '0'),
('ADMN1609060011', '150-01', '', 500000.00, 0.00, '0'),
('ADMN1609060011', '100-01', '', 0.00, 500000.00, '0'),
('ADMN1609060012', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1609060012', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1609060012', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1609060013', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1609060013', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1609060010', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060010', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060014', '100-01', '', 100000.00, 0.00, '0'),
('ADMN1609060014', '800-02', '', 0.00, 100000.00, '0'),
('ADMN1609060015', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060015', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060016', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060016', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060017', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060017', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060018', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060018', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060019', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060019', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060020', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060020', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060021', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060021', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060022', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060022', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060023', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060023', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609060024', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609060024', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609160001', '100-01', '', 40000.00, 0.00, '0'),
('ADMN1609160001', '800-02', '', 0.00, 40000.00, '0'),
('ADMN1609160003', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609160003', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609160002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609160002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609160004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609160004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609220001', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1609220001', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1609220001', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1609220002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609220002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609280001', '150-01', '', 500000.00, 0.00, '0'),
('ADMN1609280001', '100-01', '', 0.00, 500000.00, '0'),
('ADMN1609300001', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609300001', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1609300002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1609300002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610050001', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1610050001', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1610050001', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1610050002', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610050002', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610100001', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610100001', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610100002', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1610100002', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1610100002', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1610240001', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610240001', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610240002', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1610240002', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1610240002', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1610290002', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1610290002', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1610290002', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1610290003', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290003', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290004', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290004', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290005', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290005', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290001', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290001', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290006', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1610290006', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1610290006', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1610290007', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1610290007', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1610290007', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1610290008', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290008', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290009', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290009', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290010', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290010', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290011', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290011', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290012', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1610290012', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1610290012', '100-01', '', 55000.00, 0.00, '0'),
('ADMN1610290013', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290013', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1605110054', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1605110054', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290014', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290014', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290015', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290015', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290016', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290016', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290017', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290017', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290018', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290018', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290019', '100-01', '', 20000.00, 0.00, '0'),
('ADMN1610290019', '800-03', '', 0.00, 20000.00, '0'),
('ADMN1610290020', '150-01', '', 0.00, 50000.00, '0'),
('ADMN1610290020', '900-01', '', 0.00, 5000.00, '0'),
('ADMN1610290020', '100-01', '', 55000.00, 0.00, '0');

-- --------------------------------------------------------

--
-- Table structure for table `acckas`
--

CREATE TABLE IF NOT EXISTS `acckas` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `penyetor` varchar(100) NOT NULL,
  `penerima` varchar(100) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `kelompokid` varchar(30) NOT NULL,
  `kas` char(1) NOT NULL,
  `masuk` char(1) NOT NULL,
  `cetak` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`jurnalid`,`kelompokid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acckas`
--

INSERT INTO `acckas` (`id`, `tanggal`, `nobukti`, `penyetor`, `penerima`, `keterangan`, `jurnalid`, `kelompokid`, `kas`, `masuk`, `cetak`, `kantorid`, `user`, `jam`) VALUES
('ADMN20160512-091728', '2016-05-12', 'TK.16050001', 'Amanda Abdurahman', 'Irham Hakim', 'Pembelian Perlengkapan Kantor (Office Supplies)', 'ADMN1605120001', '', '1', '0', '0', '1', 'admin', '2016-05-12 09:18:09'),
('ADMN20160718-104818', '2016-07-18', 'TK.16070001', 'Irham Hakim', 'Hj. Siti Jubaedah', 'Biaya Konsumsi Rapat Anggota', 'ADMN1607180006', '', '1', '0', '0', '1', 'admin', '2016-07-18 10:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `acckasdetail`
--

CREATE TABLE IF NOT EXISTS `acckasdetail` (
  `id` varchar(30) NOT NULL,
  `kasid` varchar(30) NOT NULL,
  `accdebet` varchar(30) NOT NULL,
  `acckredit` varchar(30) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`,`kasid`,`accdebet`,`acckredit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acckasdetail`
--

INSERT INTO `acckasdetail` (`id`, `kasid`, `accdebet`, `acckredit`, `keterangan`, `nominal`) VALUES
('ADMN20160512-091728', 'ADMN20160512-091130', '170-01', '100-01', 'Pembelian HVS F4', 47500.00),
('ADMN20160512-091728', 'ADMN20160512-091235', '170-01', '100-01', 'Pembelian Kwitansi Kosong', 3000.00),
('ADMN20160718-104818', 'ADMN20160718-104736', '985-04', '100-01', 'Konsumsi Rapat', 350000.00);

-- --------------------------------------------------------

--
-- Table structure for table `acckaskelompok`
--

CREATE TABLE IF NOT EXISTS `acckaskelompok` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acckodekas`
--

CREATE TABLE IF NOT EXISTS `acckodekas` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `kode` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `accdebet` varchar(30) NOT NULL,
  `acckredit` varchar(30) NOT NULL,
  `kas` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`accdebet`,`acckredit`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acckodekas`
--

INSERT INTO `acckodekas` (`id`, `kode`, `nama`, `accdebet`, `acckredit`, `kas`, `kantorid`, `user`, `jam`) VALUES
('ADMN20160512-091130', 'OS.1', 'Office Supplies - Kertas HVS', '170-01', '100-01', '1', '1', 'admin', '2016-05-12 09:13:07'),
('ADMN20160512-091235', 'OS.2', 'Office Supplies - Kwitansi', '170-01', '100-01', '1', '1', 'admin', '2016-05-12 09:13:19'),
('ADMN20160718-104736', 'OS.3', 'Biaya Konsumsi Rapat', '985-04', '100-01', '1', '1', 'admin', '2016-07-18 10:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `accneraca`
--

CREATE TABLE IF NOT EXISTS `accneraca` (
  `tanggal` date NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  KEY `id` (`tanggal`,`accountid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accneracahari`
--

CREATE TABLE IF NOT EXISTS `accneracahari` (
  `tanggal` date DEFAULT NULL,
  `accountid` varchar(30) DEFAULT NULL,
  `nominal` double(15,2) DEFAULT NULL,
  `kantorid` varchar(30) NOT NULL DEFAULT '',
  `user` varchar(30) DEFAULT NULL,
  `jam` datetime DEFAULT NULL,
  KEY `id` (`tanggal`,`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `nama` varchar(300) NOT NULL,
  `headerid` varchar(30) NOT NULL,
  `tipe` varchar(10) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`headerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `nama`, `headerid`, `tipe`, `user`, `jam`) VALUES
('100-01', 'KAS BESAR', '100', 'Debet', 'admin', '2009-06-26 13:46:35'),
('100-02', 'KAS KECIL', '100', 'Debet', 'admin', '2009-06-25 20:49:44'),
('100-03', 'BON SEMENTARA', '100', 'Debet', 'admin', '2009-06-25 20:49:44'),
('110-01', 'BANK BCA', '110', 'Debet', 'admin', '2009-06-25 20:49:44'),
('110-02', 'BANK LIPPO', '110', 'Debet', 'admin', '2009-06-25 20:49:44'),
('150-01', 'PINJAMAN ANUITAS', '150', 'Debet', 'admin', '2009-06-25 20:49:44'),
('150-02', 'PINJAMAN POKOK TETAP', '150', 'Debet', 'admin', '2009-06-25 20:49:44'),
('151-01', 'SEWA DIBAYAR DIMUKA', '151', 'Debet', 'admin', '2009-06-25 20:49:44'),
('153-01', 'PIUTANG BUNGA', '153', 'Debet', 'admin', '2009-06-25 20:49:44'),
('153-02', 'PIUTANG DENDA', '153', 'Debet', 'admin', '2009-06-25 20:49:44'),
('155-01', 'PIUTANG KARYAWAN', '155', 'Debet', 'admin', '2009-06-25 20:49:44'),
('155-02', 'PIUTANG LAIN', '155', 'Debet', 'admin', '2009-06-25 20:49:44'),
('160-01', 'CADANGAN PENGHAPUSAN A.PRO', '160', 'Debet', 'admin', '2009-06-25 20:49:45'),
('170-01', 'SUPLIES KANTOR', '170', 'Debet', 'admin', '2009-06-25 20:49:45'),
('170-02', 'PERSEDIAAN BEA MATERAI', '170', 'Debet', 'admin', '2009-06-25 20:49:45'),
('200-01', 'INVENTARIS KOMPUTER', '200', 'Debet', 'admin', '2009-06-25 20:49:45'),
('200-02', 'INVENTARIS KENDARAAN', '200', 'Debet', 'admin', '2009-06-25 20:49:45'),
('200-03', 'INVENTARIS KANTOR', '200', 'Debet', 'admin', '2009-06-25 20:49:45'),
('200-04', 'FURNITURE', '200', 'Debet', 'admin', '2009-06-25 20:49:45'),
('200-05', 'BANGUNAN', '200', 'Debet', 'admin', '2009-06-25 20:49:45'),
('200-06', 'TANAH', '200', 'Debet', 'admin', '2009-06-25 20:49:45'),
('201-01', 'AKUM. PENYUSUTAN INVESTARIS KOMPUTER', '201', 'Debet', 'admin', '2009-06-25 20:49:45'),
('201-02', 'AKUM. PENYUSUTAN KENDARAAN', '201', 'Debet', 'admin', '2009-06-25 20:49:45'),
('201-03', 'AKUM. PENYUSUTAN KANTOR', '201', 'Debet', 'admin', '2009-06-25 20:49:45'),
('201-04', 'AKUM. PENYUSUTAN FURNITURE', '201', 'Debet', 'admin', '2009-06-25 20:49:45'),
('201-05', 'AKUM. PENYUSUTAN BANGUNAN', '201', 'Debet', 'admin', '2009-06-25 20:49:45'),
('400-01', 'PENDAPATAN YANG AKAN DITERIMA', '400', 'Debet', 'admin', '2009-06-25 20:49:45'),
('400-02', 'PAJAK PBB DIBAYAR DIMUKA', '400', 'Debet', 'admin', '2009-06-25 20:49:45'),
('400-03', 'BEBAN DITANGGUHKAN', '400', 'Debet', 'admin', '2009-06-25 20:49:45'),
('400-04', 'SEWA DIBAYAR DIMUKA', '400', 'Debet', 'admin', '2009-06-25 20:49:45'),
('400-05', 'AGUNAN YANG DIAMBIL ALIH', '400', 'Debet', 'admin', '2009-06-25 20:49:45'),
('400-06', 'PENDIRIAN KOPERASI', '400', 'Debet', 'admin', '2009-06-25 20:49:45'),
('400-07', 'SOFTWARE KOMPUTER', '400', 'Debet', 'admin', '2009-06-25 20:49:45'),
('500-01', 'BEBAN PAJAK BUNGA SIMPANAN', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-02', 'BEBAN PAJAK SIMPANAN BERJANGKA', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-03', 'BEBAN BIAYA NOTARIS', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-04', 'BEBAN TITIPAN BUNGA BERJANGKA', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-05', 'BEBAN TITIPAN ANGSURAN', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-06', 'BAGIAN SHU ANGGOTA PENYIMPAN', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-07', 'BAGIAN SHU ANGGOTA BERJASA', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-08', 'BAGIAN SHU PEGURUS', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-09', 'DANA KESEJAHTERAAN KARYAWAN', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-10', 'DANA SOSIAL', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-11', 'DANA PENDIDIKAN', '500', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('500-12', 'DANA TITIPAN ANGGOTA', '500', 'Kredit', 'admin', '2009-09-08 14:03:25'),
('510-01', 'SIMPANAN ANGGOTA', '510', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('520-01', 'SIMPANAN BERJANGKA', '520', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('560-01', 'HUTANG LAIN-LAIN', '560', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('561-01', 'HUTANG BANK', '561', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('700-01', 'B.BUNGA YMH DIBAYAR', '700', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('700-02', 'PAJAK PENGHASILAN', '700', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('700-03', 'PENDAPATAN DITERIMA DIMUKA', '700', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('800-01', 'SISA HASIL USAHA', '800', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('800-02', 'SIMPANAN POKOK', '800', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('800-03', 'SIMPANAN WAJIB', '800', 'Kredit', 'admin', '2016-06-04 09:46:09'),
('800-04', 'MODAL PENYERTAAN PARTISIPASI ANGGOTA', '800', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('800-05', 'MODAL CADANGAN', '800', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('800-06', 'MODAL DONASI', '800', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('800-07', 'SIMPANAN SUKARELA', '800', 'Kredit', 'admin', '2016-05-10 09:15:26'),
('900-01', 'HASIL BUNGA PINJAMAN', '900', 'Kredit', 'admin', '2009-06-25 20:49:45'),
('900-02', 'RETUR HASIL BUNGA PINJAMAN', '900', 'Debet', 'admin', '2009-06-25 20:49:45'),
('901-01', 'HASIL BUNGA TABUNGAN', '901', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('902-01', 'HASIL BUNGA BANK', '902', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('903-01', 'HASIL BUNGA SIMPANAN BERJANGKA', '903', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('910-01', 'PROVISI PINJAMAN', '910', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('931-01', 'PENDAPATAN ADMINISTRASI SIMPANAN', '931', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('931-02', 'PENDAPATAN DENDA PINJAMAN', '931', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('931-03', 'PENDAPATAN ASURANSI PINJAMAN', '931', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('931-04', 'PENDAPATAN ADMINISTRASI PINALTI SIMPANAN BERJANGKA', '931', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('931-05', 'PENDAPATAN ADMINISTRASI PINJAMAN', '931', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('931-06', 'PENDAPATAN PINALTI PINJAMAN', '931', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('931-07', 'PENDAPATAN BIAYA METERAI', '931', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('931-08', 'PENDAPATAN BIAYA NOTARIS', '931', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('931-09', 'PENDAPATAN PREMI RESIKO KREDIT', '931', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('931-10', 'PAJAK SIMPANAN', '931', 'Kredit', 'admin', '2009-09-30 14:13:49'),
('940-01', 'LABA PENJUALAN AKTIVA TETAP', '940', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('940-02', 'PENDAPATAN NONOPERASIONAL LAINNYA', '940', 'Kredit', 'admin', '2009-06-25 20:49:46'),
('950-01', 'AMOR. PENDAPATAN BUNGA DIMUKA', '950', 'Debet', 'admin', '2009-06-25 20:49:46'),
('950-02', 'AMOR. PAJAK PBB DIBAYAR DIMUKA', '950', 'Debet', 'admin', '2009-06-25 20:49:46'),
('950-03', 'AMOR. BEBAN DITANGGUHKAN', '950', 'Debet', 'admin', '2009-06-25 20:49:46'),
('950-04', 'AMOR. SEWA DIBAYAR DIMUKA', '950', 'Debet', 'admin', '2009-06-25 20:49:46'),
('950-05', 'AMOR. PENDIRIAN GEDUNG', '950', 'Debet', 'admin', '2009-06-25 20:49:46'),
('950-06', 'AMOR. PROGRAM KOMPUTER', '950', 'Debet', 'admin', '2009-06-25 20:49:46'),
('960-01', 'BIAYA BUNGA SIMPANAN ANGGOTA', '960', 'Debet', 'admin', '2009-06-25 20:49:46'),
('960-02', 'BIAYA BUNGA SIMPANAN BERJANGKA', '960', 'Debet', 'admin', '2009-06-25 20:49:46'),
('960-03', 'BIAYA BUNGA SIMPANAN YANG DITERIMA', '960', 'Debet', 'admin', '2009-06-25 20:49:46'),
('960-04', 'BIAYA BUNGA REKENING KORAN', '960', 'Debet', 'admin', '2009-06-25 20:49:46'),
('961-01', 'BIAYA PAJAK BUNGA REKENING KORAN', '961', 'Debet', 'admin', '2009-06-25 20:49:46'),
('961-02', 'BIAYA PAJAK DEPOSITO', '961', 'Debet', 'admin', '2009-06-25 20:49:46'),
('961-03', 'BIAYA PAJAK TABUNGAN', '961', 'Debet', 'admin', '2009-06-25 20:49:46'),
('962-01', 'POTONGAN BUNGA', '962', 'Debet', 'admin', '2009-06-25 20:49:46'),
('962-02', 'POTONGAN DENDA', '962', 'Debet', 'admin', '2009-06-25 20:49:46'),
('970-01', 'BIAYA GAJI/HONORARIUM', '970', 'Debet', 'admin', '2009-06-25 20:49:46'),
('970-02', 'BIAYA UANG LEMBUR', '970', 'Debet', 'admin', '2009-06-25 20:49:46'),
('970-03', 'BIAYA PENDIDIKAN', '970', 'Debet', 'admin', '2009-06-25 20:49:46'),
('970-04', 'BIAYA UANG MAKAN KARYAWAN', '970', 'Debet', 'admin', '2009-06-25 20:49:46'),
('970-05', 'BIAYA TK. LAINNYA', '970', 'Debet', 'admin', '2009-06-25 20:49:46'),
('970-06', 'BIAYA BONUS KARYAWAN', '970', 'Debet', 'admin', '2009-06-25 20:49:46'),
('980-01', 'BIAYA SEWA INVENTARIS', '980', 'Debet', 'admin', '2009-06-25 20:49:46'),
('980-02', 'BIAYA SEWA GEDUNG', '980', 'Debet', 'admin', '2009-06-25 20:49:46'),
('980-03', 'BIAYA SEWA KENDARAAN', '980', 'Debet', 'admin', '2009-06-25 20:49:46'),
('980-04', 'BIAYA SEWA LAINNYA', '980', 'Debet', 'admin', '2009-06-25 20:49:46'),
('981-01', 'BIAYA ALAT TULIS KANTOR', '981', 'Debet', 'admin', '2009-06-25 20:49:46'),
('981-02', 'BIAYA TELP/TELEX/TELEGRAM', '981', 'Debet', 'admin', '2009-06-25 20:49:46'),
('981-03', 'BIAYA FOTOCOPY', '981', 'Debet', 'admin', '2009-06-25 20:49:46'),
('981-04', 'BIAYA PERJALANAN DINAS', '981', 'Debet', 'admin', '2009-06-25 20:49:46'),
('981-05', 'BIAYA IKLAN/KONSULTAN', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-06', 'BIAYA SURAT KABAR', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-07', 'BIAYA PERJAMUAN', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-08', 'BIAYA LISTRIK DAN PAM', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-09', 'BIAYA METERAI LANNYA', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-10', 'BIAYA AKTA NOTARIS', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-11', 'BIAYA JASA ADMINISTRASI LAINNYA', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-12', 'BIAYA BENSIN/TRANSPORT', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-13', 'BIAYA RUMAH TANGGA KANTOR', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-14', 'BIAYA BARANG CETAKAN', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-15', 'BIAYA FILM DAN CETAK FOTO', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-16', 'BIAYA KEAMANAN', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-17', 'BIAYA KOMISI', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-18', 'BIAYA PARKIR', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('981-19', 'BIAYA BUNGA PINJAMAN BANK', '981', 'Debet', 'admin', '2009-06-25 20:49:47'),
('982-01', 'BIAYA PEMELIHARAAN INVENTARIS', '982', 'Debet', 'admin', '2009-06-25 20:49:47'),
('982-02', 'BIAYA PEMELIHARAAN GEDUNG', '982', 'Debet', 'admin', '2009-06-25 20:49:47'),
('982-03', 'BIAYA PEMELIHARAAN KENDARAAN', '982', 'Debet', 'admin', '2009-06-25 20:49:47'),
('982-04', 'BIAYA PEMELIHARAAN LAINNYA', '982', 'Debet', 'admin', '2009-06-25 20:49:47'),
('982-05', 'BIAYA PEMELIHARAAN KOMPUTER', '982', 'Debet', 'admin', '2009-06-25 20:49:47'),
('983-01', 'BIAYA PAJAK PBB', '983', 'Debet', 'admin', '2009-06-25 20:49:47'),
('983-02', 'BIAYA PAJAK INVENTARIS GEDUNG', '983', 'Debet', 'admin', '2009-06-25 20:49:47'),
('983-03', 'BEA METERAI KERTAS SEGEL', '983', 'Debet', 'admin', '2009-06-25 20:49:47'),
('983-04', 'BIAYA PAJAK REKLAME', '983', 'Debet', 'admin', '2009-06-25 20:49:47'),
('983-05', 'BIAYA PAJAK LAINNYA', '983', 'Debet', 'admin', '2009-06-25 20:49:47'),
('984-01', 'BIAYA PENYUSUTAN REKENING PINJAMAN', '984', 'Debet', 'admin', '2009-06-25 20:49:47'),
('984-02', 'BIAYA PENYUSUTAN A.PRO LAINNYA', '984', 'Debet', 'admin', '2009-06-25 20:49:47'),
('985-01', 'BIAYA ASURANSI INVENTARIS', '985', 'Debet', 'admin', '2009-06-25 20:49:47'),
('985-02', 'BIAYA ASURANSI KENDARAAN', '985', 'Debet', 'admin', '2009-06-25 20:49:47'),
('985-03', 'BIAYA ASURANSI KARYAWAN', '985', 'Debet', 'admin', '2009-06-25 20:49:47'),
('985-04', 'BIAYA OPERASIONAL LAINNYA', '985', 'Debet', 'admin', '2009-06-25 20:49:47'),
('986-01', 'BIAYA PENYUSUTAN INVENTARIS KOMPUTER', '986', 'Debet', 'admin', '2009-06-25 20:49:47'),
('986-02', 'BIAYA PENYUSUTAN KENDARAAN', '986', 'Debet', 'admin', '2009-06-25 20:49:47'),
('986-03', 'BIAYA PENYUSUTAN GEDUNG', '986', 'Debet', 'admin', '2009-06-25 20:49:47'),
('986-04', 'BIAYA PENYUSUTAN INVENTARIS LAINNYA', '986', 'Debet', 'admin', '2009-06-25 20:49:47'),
('990-01', 'PENJUALAN RUGI AKTIVA TETAP', '990', 'Debet', 'admin', '2009-06-25 20:49:47'),
('990-02', 'BIAYA SUMBANGAN', '990', 'Debet', 'admin', '2009-06-25 20:49:47'),
('990-03', 'BIAYA DENDA', '990', 'Debet', 'admin', '2009-06-25 20:49:47'),
('990-04', 'BIAYA NONOPERASIONAL LAINNYA', '990', 'Debet', 'admin', '2009-06-25 20:49:47'),
('990-05', 'BIAYA KERUGIAN', '990', 'Debet', 'admin', '2009-06-25 20:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `accrual`
--

CREATE TABLE IF NOT EXISTS `accrual` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accrualdetail`
--

CREATE TABLE IF NOT EXISTS `accrualdetail` (
  `id` varchar(30) NOT NULL,
  `transaksiid` varchar(30) NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `bunga` double(9,2) NOT NULL,
  `nbunga` double(15,2) NOT NULL,
  `jenis` char(1) NOT NULL,
  KEY `id` (`id`,`transaksiid`,`jurnalid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accshu`
--

CREATE TABLE IF NOT EXISTS `accshu` (
  `anggotaid` varchar(30) NOT NULL,
  `simpanan` double(15,2) NOT NULL,
  `pinjaman` double(15,2) NOT NULL,
  `shu` double(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accshukebijakan`
--

CREATE TABLE IF NOT EXISTS `accshukebijakan` (
  `nama` varchar(300) NOT NULL,
  `persen` double(9,2) NOT NULL,
  `nominal` double(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accsuratkeluar`
--

CREATE TABLE IF NOT EXISTS `accsuratkeluar` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `nosurat` varchar(50) NOT NULL,
  `kepada` varchar(100) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `namafile` varchar(100) NOT NULL,
  `surat` mediumblob,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accsuratmasuk`
--

CREATE TABLE IF NOT EXISTS `accsuratmasuk` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `tglkirim` date NOT NULL,
  `nosurat` varchar(50) NOT NULL,
  `dari` varchar(100) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `namafile` varchar(100) NOT NULL,
  `surat` mediumblob,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE IF NOT EXISTS `agama` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `nama` varchar(100) DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  `jam` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id`, `nama`, `user`, `jam`) VALUES
('20090628-000339', 'Katholik', 'admin', '2009-06-28 00:03:39'),
('20090628-000351', 'Kristen', 'admin', '2009-06-28 00:03:51'),
('20090628-000357', 'Islam', 'admin', '2009-06-28 00:03:57'),
('20090628-000415', 'Budha', 'admin', '2009-06-28 00:04:15'),
('20090628-000423', 'Hindu', 'admin', '2009-06-28 00:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE IF NOT EXISTS `anggota` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `noanggota` varchar(30) NOT NULL,
  `pin` varchar(30) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `nama` varchar(300) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `kabupatenid` varchar(30) NOT NULL,
  `alamatsurat` varchar(300) DEFAULT NULL,
  `tmplahir` varchar(100) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `agamaid` varchar(30) DEFAULT NULL,
  `pekerjaanid` varchar(30) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `nohp` varchar(100) NOT NULL,
  `jenisid` char(1) DEFAULT NULL,
  `noid` varchar(50) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `ibu` varchar(100) NOT NULL,
  `hutang` double(15,2) NOT NULL,
  `hargaid` varchar(30) NOT NULL,
  `foto` mediumblob,
  `pengurus` char(1) DEFAULT NULL,
  `tglpengurusdiangkat` date DEFAULT NULL,
  `pengurusjabatan` varchar(100) DEFAULT NULL,
  `tglpengurusberhenti` date DEFAULT NULL,
  `pengurusberhenti` varchar(300) DEFAULT NULL,
  `pengawas` char(1) DEFAULT NULL,
  `tglpengawasdiangkat` date DEFAULT NULL,
  `pengawasjabatan` varchar(100) DEFAULT NULL,
  `tglpengawasberhenti` date DEFAULT NULL,
  `pengawasberhenti` varchar(300) DEFAULT NULL,
  `anggota` char(1) DEFAULT NULL,
  `aktif` char(1) DEFAULT NULL,
  `tglberhenti` date DEFAULT NULL,
  `berhenti` varchar(300) DEFAULT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) DEFAULT NULL,
  `jam` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`kabupatenid`,`agamaid`,`pekerjaanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `noanggota`, `pin`, `tanggal`, `nama`, `alamat`, `kabupatenid`, `alamatsurat`, `tmplahir`, `tgllahir`, `gender`, `agamaid`, `pekerjaanid`, `telepon`, `nohp`, `jenisid`, `noid`, `npwp`, `ibu`, `hutang`, `hargaid`, `foto`, `pengurus`, `tglpengurusdiangkat`, `pengurusjabatan`, `tglpengurusberhenti`, `pengurusberhenti`, `pengawas`, `tglpengawasdiangkat`, `pengawasjabatan`, `tglpengawasberhenti`, `pengawasberhenti`, `anggota`, `aktif`, `tglberhenti`, `berhenti`, `kantorid`, `user`, `jam`) VALUES
('ADMN20160504-103221', '1605001', '1234', '2016-05-02', 'Saddam Almahali', 'Kp. Sumursari, Ds. Sukasono, kec. Sukawening', '20100321-20082011', 'Kp. Sumursari, Ds. Sukasono, kec. Sukawening', 'Tangerang', '1991-01-08', '1', '20090628-000357', '20090628-000703', '', '081223596458', '1', '3205150801910002', '', 'N. Ilah Jamilah', 0.00, '', NULL, '1', '2016-04-09', 'Sekretaris', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 10:40:05'),
('ADMN20160504-105207', '1604001', '1234', '2016-04-09', 'N. Ilah Jamilah ', 'Kp. Sumursari Rt 003/ Rw 09, Desa Sukasono,Kec. Sukawening', '20100321-20082011', 'Kp. Sumursari Rt 003/ Rw 09, Desa Sukasono,Kec. Sukawening', 'Garut ', '1963-08-15', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 10:52:07'),
('ADMN20160504-105703', '1604002', '1234', '2016-04-09', 'Kartini', 'Kp.Sumur Tengah Rt 01/ Rw 06, Desa Sukasono, kec. Sukawening', '20100321-20082011', 'Kp.Sumur Tengah Rt 01/ Rw 06, Desa Sukasono, kec. Sukawening', 'Garut', '1977-10-06', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 10:57:03'),
('ADMN20160504-110156', '1604003', '1234', '2016-04-09', 'Sri Rahayu', 'Kp. Sirna Sari, Rt 01/Rw 08, Desa Maripari, Kec. Sukawening', '20100321-20082011', 'Kp. Sirna Sari, Rt 01/Rw 08, Desa Maripari, Kec. Sukawening', 'Garut', '1976-04-26', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:01:56'),
('ADMN20160504-110547', '1604004', '1234', '2016-04-09', 'R. Ina Ariandina', 'Kp. Sagaranten, Rt 01/ Rw 03, Desa Sukasono, kec. Sukawening', '20100321-20082011', 'Kp. Sagaranten, Rt 01/ Rw 03, Desa Sukasono, kec. Sukawening', 'Garut', '1979-10-04', '1', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:05:47'),
('ADMN20160504-110951', '1604005', '1234', '2016-04-09', 'Ratih Hartati', 'Kp. Sumursari, Rt 03/ Rw 09, Desa. Sukasono, Kec. Sukawening', '20100321-20082011', 'Kp. Sumursari, Rt 03/ Rw 09, Desa. Sukasono, Kec. Sukawening', 'Garut', '2016-05-04', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:09:51'),
('ADMN20160504-111419', '1605002', '1234', '2016-05-04', 'Hj. R. Siti Syarifah', 'Kp. Sumursari, Rt 03 / Rw 09, Desa Sukasono, Kec. Sukawening', '20100321-20082011', 'Kp. Sumursari, Rt 03 / Rw 09, Desa Sukasono, Kec. Sukawening', 'Garut', '1964-06-06', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:14:19'),
('ADMN20160504-111749', '1605003', '1234', '2016-05-04', 'R. Alfy Fauziyah', 'Kp. Cinunuk Indah Blok C No 16  Wanaraja', '20100321-20082011', 'Kp. Cinunuk Indah Blok C No 16  Wanaraja', 'Garut', '1987-12-30', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:17:49'),
('ADMN20160504-112422', '1605004', '1234', '2016-05-04', 'Hj. Eti Purhayati', 'Kp. Sagaranten, Desa Sukasono, Kec. Sukawenig', '20100321-20082011', 'Kp. Cinunuk Indah Blok C No 16  Wanaraja', 'Garut', '1960-05-20', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:24:22'),
('ADMN20160504-112850', '1605005', '1234', '2016-05-04', 'Siti Asri Jubaedah', 'Kp. Sumursari, Desa Sukasono, Kec. Sukawening', '20100321-20082011', 'Kp. Sumursari, Desa Sukasono, Kec. Sukawening', 'Garut', '1976-11-05', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:28:50'),
('ADMN20160504-113203', '1605006', '1234', '2016-05-04', 'Nurul Aeni', 'Kp. Cibodas Rt 03/ Rw 07, Desa Keresek, Kec. Cibatu', '20100321-20082011', 'Kp. Cibodas Rt 03/ Rw 07, Desa Keresek, Kec. Cibatu', 'Garut', '1995-10-29', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:32:03'),
('ADMN20160504-114037', '1605007', '1234', '2016-05-04', 'Ani K.S.', 'Kp. Cipanas, Desa Sukahaji, Kec. Sukawening', '20100321-20082011', 'Kp. Cipanas, Desa Sukahaji, Kec. Sukawening', 'Sumua', '1963-02-06', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:40:37'),
('ADMN20160504-114314', '1605008', '1234', '2016-05-04', 'Tisna Wijaya', 'Kp. Cipanas, Desa Sukahaji, Kec. Sukaweing', '20100321-20082011', 'Kp. Cipanas, Desa Sukahaji, Kec. Sukaweing', 'Garut', '1964-07-04', '1', '20090628-000357', '20090628-000706', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:43:14'),
('ADMN20160504-114537', '1605009', '1234', '2016-05-04', 'Hj. Ai Nurjanah', 'Kp. Sumursari, Desa Sukasono, Kec. Sukawening', '20100321-20082011', 'Kp. Sumursari, Desa Sukasono, Kec. Sukawening', 'Garut', '2016-10-18', '2', '20090628-000357', '20090628-000706', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:45:37'),
('ADMN20160504-114819', '1605010', '1234', '2016-05-04', 'Ani Milayani', 'Kp. Sagaranten, Desa Sukasono, Kec. Sukawening', '20100321-20082011', 'Kp. Sagaranten, Desa Sukasono, Kec. Sukawening', 'Garut', '1981-04-15', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:48:19'),
('ADMN20160504-115050', '1605011', '1234', '2016-05-04', 'Wini Widiarti', 'Kp. Sagaranten, Desa Sukasono, Kec. Sukawening', '20100321-20082011', 'Kp. Sagaranten, Desa Sukasono, Kec. Sukawening', 'Garut', '1987-10-26', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:50:50'),
('ADMN20160504-115300', '1605012', '1234', '2016-05-04', 'Aam Maryati', 'Kp. Sagaranten, Desa Sukasono, Kec. Sukawening', '20100321-20082011', 'Kp. Sagaranten, Desa Sukasono, Kec. Sukawening', 'Garut', '1970-10-27', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:53:00'),
('ADMN20160504-115717', '1605013', '1234', '2016-05-04', 'Enung Nurhayati . S.Pd. I', 'Kp. Sumur Wetan, Rt 02/ Rw 07, Desa Sukasono, Kec. Sukaweing', '20100321-20082011', 'Kp. Sumur Wetan, Rt 02/ Rw 07, Desa Sukasono, Kec. Sukaweing', 'Garut', '1981-05-10', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 11:57:17'),
('ADMN20160504-120920', '1605014', '1234', '2016-05-04', 'Rifa Masrifah', 'Kp. Sagaranten Rt 03/ Rw 04, Desa Sukasono, Kec. Sukawening', '20100321-20082011', 'Kp. Sagaranten Rt 03/ Rw 04, Desa Sukasono, Kec. Sukawening', 'Garut', '1988-12-27', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-04 12:09:20'),
('ADMN20160509-110426', '1605015', '1234', '2016-05-09', 'Enur Nurjaman', 'Kp. Patrol Rt 01/ Rw 01, Desa Sukasono, Kec. Sukawening', '20100321-20082011', 'Kp. Patrol Rt 01/ Rw 01, Desa Sukasono, Kec. Sukawening', 'Garut', '1968-01-03', '1', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-09 11:04:26'),
('ADMN20160509-110817', '1605016', '1234', '2016-05-09', 'Rini Adawiyah', 'Kp. Cikawung Rt01/ Rw 04, Desa Karangpawitan, Kec. Karangpawitan', '20100321-20082011', 'Kp. Cikawung Rt01/ Rw 04, Desa Karangpawitan, Kec. Karangpawitan', 'Garut', '1986-07-13', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-09 11:08:17'),
('ADMN20160510-100427', '1604006', '1234', '2016-04-09', 'R. Usman Mahali', 'Kp. Sumursari RT 03 RW 09 Desa Sukasono Kec. Sukawening', '20100321-20082011', '', '', '2016-05-10', '1', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-10 10:07:51'),
('ADMN20160510-100634', '1605017', '1234', '2016-05-02', 'Amanda Abdurahman', 'Kp. Sumursari RT 03 RW 09 Desa Sukasono Kec. Sukawening', '20100321-20082011', '', 'Tanggerang', '1989-09-24', '1', '20090628-000357', '20090628-000703', '', '', '1', '', '', 'N. Ilah Jamilah', 0.00, '', 0xffd8ffe000104a46494600010200000100010000ffe100d545786966000049492a000800000008001201030001000000010000001a010500010000006e0000001b0105000100000076000000280103000100000002000000310102000d0000007e00000032010200140000008b00000013020300010000000100000069870400010000009f00000000000000480000000100000048000000010000004143445365652050726f203600323031343a31313a31362031383a35343a313600030090920200030000003631000002a00400010000004a01000003a00400010000001f0100000000000000000000ffe11430687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e0a3c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d22584d5020436f726520352e312e32223e0a203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e0a20203c7264663a4465736372697074696f6e207264663a61626f75743d22220a20202020786d6c6e733a786d705269676874733d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f7269676874732f223e0a2020203c786d705269676874733a55736167655465726d733e0a202020203c7264663a416c743e0a20202020203c7264663a6c6920786d6c3a6c616e673d22782d64656661756c74223e7777772e63727970746f6e39372e75733c2f7264663a6c693e0a202020203c2f7264663a416c743e0a2020203c2f786d705269676874733a55736167655465726d733e0a20203c2f7264663a4465736372697074696f6e3e0a20203c7264663a4465736372697074696f6e207264663a61626f75743d22220a20202020786d6c6e733a4970746334786d70436f72653d22687474703a2f2f697074632e6f72672f7374642f4970746334786d70436f72652f312e302f786d6c6e732f223e0a2020203c4970746334786d70436f72653a43726561746f72436f6e74616374496e666f207264663a7061727365547970653d225265736f75726365223e0a202020203c4970746334786d70436f72653a436955726c576f726b3e7777772e63727970746f6e39372e75733c2f4970746334786d70436f72653a436955726c576f726b3e0a2020203c2f4970746334786d70436f72653a43726561746f72436f6e74616374496e666f3e0a20203c2f7264663a4465736372697074696f6e3e0a20203c7264663a4465736372697074696f6e207264663a61626f75743d22220a20202020786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f223e0a2020203c64633a63726561746f723e0a202020203c7264663a4261673e0a20202020203c7264663a6c693e7777772e63727970746f6e39372e75733c2f7264663a6c693e0a202020203c2f7264663a4261673e0a2020203c2f64633a63726561746f723e0a2020203c64633a7269676874733e0a202020203c7264663a416c743e0a20202020203c7264663a6c6920786d6c3a6c616e673d22782d64656661756c74223e7777772e63727970746f6e39372e75733c2f7264663a6c693e0a202020203c2f7264663a416c743e0a2020203c2f64633a7269676874733e0a20203c2f7264663a4465736372697074696f6e3e0a203c2f7264663a5244463e0a3c2f783a786d706d6574613e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a3c3f787061636b657420656e643d2277223f3effc0001108011f014a03012100021101031101ffdb0084000c08090a09070c0a090a0d0c0c0e121e1312101012241a1b151e2b262d2d2a262a293036453a30334133292a3c513c4147494d4e4d2e39545a544b5a454b4d4a011314141b171b341d1d346f4a3f4a6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6fffc400950000020301010100000000000000000000000102030405060710000202010205030302040404070000000001020311042105123141511322321461710633238191a1154252b1b2c1d1e1072635627274820100020301000000000000000000000000000102030405110101000202020200040504030000000000010211033121320412224151617181a1c1f02352b1d14272e1ffda000c03010002110311003f00f0c9ee591912492c928f5367c4f651cfea901d463000011b7e0c57a13b72edee4f4eb2ce2727b56fc7a4ec2b227409811224901e9646126f64cd518b515940968c1ad80698add3592b32b72eaeb715b92c6e91ca24d060b2557a3c0b04886063200320032031900240c0640068aaee4d1cd6f4e2cb23d4d9f13d9473faa407518c000046df8315e84edcbb7b93d2f5389c9ed5bf1e965a5582274138552b1e22b2c0e46baf87a8a4ee9a59ecba9a2ad1d49e7976fbf512522f6aa8c70a38335964108d54ad4ba11f55f6022767921eb456c045eb43ee49595f927295892717d2485d0bb1bb5566801344001181285400c80c64011223403459a0fda9fd89a67323a06a582fa9e4d9f13d99f9fa58075190000046df8315e84edcbbba93d377389c9ed5bf1e96cd6415592296938d0f3f166da6338471158236a522c4a30599bcbfb119ded2f62fe6c49325da8cbeae4fc99e56bf0346945e7a9372f1b20242c927848861f9183515dd93518aec0125541bf04d4797fcd95f71cba166d2c2ec069c6ee28ca6801244012230190c0f034420c12843031932ac2582472dbc234d3d0d9f13d9473f4b00ea320002046df8315e8e76e65ab2c9d31e5471393daba18f4d315f62d8fa8fa47041389a7cbbca590fa879c22268caf587be5fdba19e7739757b7d862d41cd63b10e64d822626c648b963b045a680cd3c31f367b8034f7ea4b32009479d3cbe8585fc755e7001729003060491a60892206320180262e66deef2fc92e6398e81a91aa8e86cf89eea39fa5a074d900010236fc18af473b73e4bdc595b4a6a2e497e4e2727b57431e9a5cf976c27f8212ba59df6209a99d92cf52b94de3c882be6790e5cf71924960620920c0c07141848022f2c12f22092c1741a185b149838e3a13c2ea96537080d4cc006460491a00942340491301c0c3c81cace53a1a0a3b9b28f89b3e27b28e7e9701d264003008d9f062bd09db9d63c498d4e32872ce09aed2ee8e2727b57431e918cb97e32095ce4fdc412479892c63a8026d1288049bfb0b600321b811730f2006c4972e40cf1e0589453601385d85b938dbbe7b00599525911af0bb8cf94d5302c4001288801c2340491318c9940e4ba4117d5d0d9f13d9473faae03a8c6000190b7e0c57a13b732eee4aa8f3238bc9ed5d0c3a42da9a7b648e1aea5699e07d8434581c64977dc083b7cbd88bb576c8c829b7df034bcc80271516be40f6e99600d6e4b932bae00083717b96396101b358f92585ba255cfdd87dc035552cec5869e2be14f276011745460491a0304a2346068708c09131864e43a413dcd34f435fc3f651cfd2e03aac6000811b3e2c57a39db976fc99a34a92af99f738bc9ed5bf0e9ae8a1ea54e51e9033dda6927f129b5748a7d09782c8e9a4fb645b3d1bd1cdf44556e967059c6c12958a1c1f80e5fb134138c3ec5918a7d5000e95d515e1a78009c47cd800837b89cf66802b93ce078c6e04b6bb1c5a7e0da9e527e4bf8aabe4008d11498124698122008711a63c12260c81c87487735d1d0d7f0fd9473f4b80eab1800008d9f062bd09db976ef632f87b6b471793daba1874ef70aa39387c5c961d9eeffa12b74cdf5593356993c230d127be0d15e8a2baa23b3d2cfa387828d4e8e0e385109458e36a74be94ba6c65956916e354e50e0bb1271c0d1492d8a6e8e3a0c2b52c119eef6004ba1079c8038964a3982c010c7b4d744b352fb16715fc48e7d2c5d466c67a063888ec0491004a118c64e629124ce3ba692ea6ba3a1b3e1fbb3fc8f55c07558c000046cf8315e847327b5b9fb97bde1b77389c9ed5d0c3a7aaaa295508ae8a2917a867a19ab54495787d0b630dba114cd43ec29d195d041ced5e8f29ac64e2ea349283ca5944f1aaf28c98c3c3ea589734705bb55a45c651d884b7ea8069094160a5adc113e5db24300096c5d17b0c2515be0ba8db289f1fb219f4b57519b19e802489812440122318c9ca8f5268e3ba69aea6ca7a1b3e1fba8f91eab40eab1000008d9f062bd09db976fcd9752f68fe57fb9c4e4f6ae8e3d47b1aa39669ae183364d51628ac93e544524e3044dc16370d0556d70c65f5463bf474dabdad647a46d7175dc2a5196628e5baa7096fb61ef9ec4e55762cde0b162ce77525d08db5c70a50efd50d155643054eb248d45ad8838edb011fa5296d1849fe1649c23cbb3ea1b3b3c24916c1624d96f17b2bcfa4c68d8ce603468192440128463244e545a268e33a69c5ac9b2ae86cf85ed547c8f55a075588000046cf8315e84edcbbbe64a993e64979471393daba38f51ee34f88d6b38ce0d50945afb99ab5449f9173242d1a16eb2ba7793fe873efe3536f145595e644a446d6396a75b7d9bef9ecbb1bf49a7b9af7cd45fe47518d2e8b1ecfdc62d5e839f2dc3126452d396ab9d2dc26bd99e9e09fd1a9c735f5f1e47b474c575528663358914f2938aea3e9b949b35f0ad04757ac50b36ae2b9a4fec2b4f19baf5fa7d26ae35c63a254d75c7a29472d9938a70a8f104ebbe9869f5d8fe1d9158567d9957dbcb45c7734f1dc9284a55d89a9c5b8c93ecd16c5611b78bcd61e4f10c68d4ce604910324401128898c91385ea324ad7e4e469d1d9ab5e7a9d4d23cd7966cf893f128e7bb8d0074d90000046cf8315e84edccb63ee65ba2ad3b54a4b314f38387c9ed5d1c3a8ed3e2d34f069a78b73349ec5562e95d086ad4e1b3095cdc5e08558c36b726f98a5a8aebb20da362dab51441af7235d7ab8bf8eefec312b5d1ab52dba3f0cd11c58c8a6ab57c363656da5fc8c54695427e9d89f2be8fc0b634cbc5b42ea5cd9cc6472255e09e355651b743c39db57377676f45c3396994609293ee2caa784763432941aaec7f821c4a0e509496ce0f29b2b5cf19fa8eb8478cca7058f5ab8d8d7ddadce79bf83a73f9bbb001a99a9812854218e234c092206489c00392e81c7e48ec68ff006d1b3e27b28e6e9a40e9b2800008cfe2c57a11cfb1acbfc9a345894b911c3e5f6ae961d46b7a5ae2b2e7d7c957b212c4669b2958d3a5d4b8db18e766f07a5a347cf1cb2192cc7caad4e8f09f2adce3eaaab209ec28958e46a68d44dae45279ec8ec70ae1b396973a8adab33ed79c61162ad6eba1470cbeb79fa972c748cb7fee7528aac5f2fec576ad91baaade377926f4d092f7223b4b4c3c5346ecd2e16fca79e868dcae504b6c92950ca3d2e9b46abd3a8a8ae866d57d541425a29a8ca2db7b76154e4f0851afbfd58bd4c5466bae0e96b67ea5718c7776248138f0dc72f57f17b9c1fb218ae3f84623a1c3358c7339aef2a0668500070a819244c09100193842394de71f91d8d27eda367c4f651cdd3481d365020008d8f1062bd1cedcdb1fb98f4f6fa57c659db3b9c2e4f6ae8e1d46cd4d76d93e5ad3937e0968b87ea23a88d96d6b91754fb95acd6dba9d173ebea8d6b10e6dd367b8d3d4a34a4bb10c96e110b69797b1cbd568a52798ee413b197e96c8b588c532fa68bf2b7497d87b4647429d3c925ccf26b855823538be11c22cd846aac49c5a6735e9a30be324b64c22363a15c96d17df639ba372d2ea5d56c6528a93596c70cb88c6166ae0abee69d5cd69f496dade1d1537bf91cecef4f9e65c9b93eade5fe4674f09a8e567e6802c40c06540224898124681e464e108e5b71c7e476349fb68dbf13d94f374d20749940800236fedb15e8e76e5dbf26884ba6c70f93daba18f4f55a6d3590d2d1282f73ad67fa16ad3df292e6924bec67ad12786fe1da74b531496f1df2cf494471123566276a4d18e69262495b8293e84a15e18134c22bb16a4248a52582baec787962052995c9a6c0954e78b134fa2c85765773928a4e7279cf84305284616a946399f97d8e4fea6d77a3a1fa38c94adbf79fda289e1379167758d794ee074e39740c68802454c094440c65400c9c311cc6e38fc8ec693f6d1b7e27b28e6e9a06749940002236bfe1b15e8e3936cbdcc51f7492f2d2387c9ed5d0c7a8fa0d308c6b847fd2b0128a466ad727868e1e92b5bf27660f6235388ce5958dcc3a894a3be0414d7aa8bd9b34c2d524325d0b62b6dd9294d3e8ff901ab73cbea2ce1881adc1c44197512946d4e3d703d345f365a4bf0011e31c4a8d0699593de5d2315d5b3c2dfa9b357aab2fb9e6537fd1783470cf2a39af8d2206e8c34012840064604a1180d1a032327104735b4e3f23b1a4fdb46cf89eca39ba6819d365000088dbf062bd1c71ed5ef90a2f964a7fe979387c9ed5d0c7a7bca2ee7a6134f6945327658944cd5ae74b749a88a7179dce97f88d75c77c0692955be35a052c4ad827e32435bafa2ca946b6a527d304747b73aed3d9082b62f7ef827a5d5f37b64f74345d085a59cf962a7128bc93c08d240dec20e56bef9576c70b992ebf61d1abb2c8fb63cabcb193ce7ea5b9d9c4614b79508e5bfbb3989246be1c58f972f26335338019001901922004880f2345c6c0b0739b0d2dceb693f6d1afe27b29e6e9a40e9b28000442df83165d1cedcab7e6ff240e1f27b57471e9e8b826b39b46aa6f7af6fe4746cb73133ded7e37c307ad655194d37d4d146ae5ab8ba659c4bba049ae9e0fa5eb28a9367474ba2a34ebf850c3f2249b7923cb868e4ebb4be959ead5b794016e92c538a699b7a6e469c5d5b2d5d046592327b012954c2d96651c8de9e35af6ac200f0dc5a5cfc6750fc3e5339bb8ba60e4ec0172b00491301900183019503248b8e073dacd1d4d27eda35fc4f653cdd3481d3650000885bf062bd1cedcab7e6ff0025670f93daba13a69e1d7bab57159da5b33d127cd129c976152aeb8c9352e85fa7d3c2ade288a6dd55f18ed266baf554f7906924a7aed3a5bd8918359c4f4bc98f562ff980db3e8ec4e6a50f8b3b15cb2b7234e2e83c16648a45cc42c9fb408e865973f68e17e4f9e6adf36baf9799b2b37e1d3067d802c4000c8c43140c711004880c09c81985a81d3d13cc11abe2fba9e6e9a581d4653000446cf8315e8e76e36a32ad9782ae6389c9ed5bb1be0949f3269f467aad15cafd2c2c5dd6ff00929c96e17ca57d8e95cc6686be536d467baed92316d5d0b2ee65994127de4c9faf369c2bb256d9d9416dfd47a12adfa4d55ca0de2b6b778ddb3757c1699dbf517c14a5d976154b4d31d2c6bc722c246883c6c42a517c59373c1134653c6e52e7cf2c21935531c22573c56ff013b17a7cf2efdf9fff002640e863d39f9760091018c800c887919180c801227246616a337e89fb7069f8deea797d5b00eab20000052594c54391ab8e2c33e0e372cfc75bb1e8b075b826a3924f4f2784f7894d9e1663755de5085d0c359fb18751c2eaf554ba2ee571a3b5f570bd2c619c393fbbc9d1d2421534a11490ce48ea55caf768b24f242d4c9c328adc7948838b24e58df204cf65ae6f951a74b4f768035c63821a8fdb97e18e762f4f9e59fb92fcb226ec7a73f2ec0122190c8c8640600c6890c600c64e48cc6d266cd13df05ff1fde2ae4f56f03aec6000007d00397ad87bb26438fcd359b761d044e0dc64a51786b74ca527a1e17af56349bf77468e9df1e68ec557c568c6ee33a525d326cd376cb236a71d1a9bc17a4c826b33b15cf0014ca6a2512bf9b68f5045769e9cc9391d2aa2a31c01c49955df1082be7767ee4bf2c46fc7a73f2ec08910c8c010c64009101a180004e50cc8d068d5a478997707bc57c9eae8f603b118800000018b5b1db2739a395f267e26be2be021a332d595d92aec538bc347abe1fa98eaf4d1977e8c86516617cba34d1066b869eb4f64555a234c61148526932292329a28b2dc2ea04cb3939b2ca2093ce068b7d31354589286caadf8bfc0415f3a9ed392ff00dcff00dc593763d305ecb9906512446479080643286067ee19190c8657925b2195e4328634e6819179a2fa2589a2ce3baca23974e9c5e50cecce98000c0000a3551cc0e54d61b39bf2a7969e1be111a31af491bf846a9e9f50937ec96cd7dc57a4a76f53a7d547c9aa3aa4ba329b1a2537ac8f9233d7452ea8496d4cb5e9f4647d7f53b88b6bab4e5d0d554181b5d48bd22266fa14cded8f2315f30d5dcd6aee5e26d7f72af5df935cbe18acf23d69790f5e5e47b2d0f5e5e43d7906c687af20f5e5e43ec343d79790f5e5e47f61a1ebcbc87ad20fb17d47acc3d661f61f54064123271d9a64b1ecaf4e9d12e6822c3b585de3186f6009100008d8b9a272b530e59b30fcbc7c6d7f0df2a092473da52c1669d736a2b8f99a417a39dbbfaa8baec7286c8a96ae68a978faa93e8d87a929f56446d6d4a4de126ceae934964f0e5b0928ead1a5515d0d0abc76229a5158260037b14cbaa02af9df13d0fa5c53530f1637fd7732fd31a674cb6791f4c1f4c321f4c1f4c007d307d3001f4c1f4c007d307d3002fa60fa600a060464a2c703a1a59660683b1c5778c61cfb005a880003aa316aeadb267f918ef159c775939ef66491c96c48d7c32be6e2342eab9b22bd1cedded4c79b28e6db1e5654bd08e5bd8e968b47eae1c85447734ba08471ed3a555518ac6082c917c6281a11a0d0c609f42b9013cbfea6d2b8dd1d52f8cbdb2fcf6386d17e1d33e73c8c01340000000000000000007306046892c006ad1cf12c1b91d6f8f77831f24fc400d0ac0000577479a0c867378d4b1baae5dd5f2c855d729c92845b671b29aadb2b6d7a1e9cf2dfbfd8eaf0cd1d70c6a37cb93505feed91cbc4598f6dd657931dfa7ca285ba515d3caf73a7c3e6a36288a88f415c9722c135322b2271996296c0659c83008b233cff0021930f10ad4f4b2e649e1a787df747178a7e9eb2a72b7438b2beaebff32fc79278e5a432c76e235878eebaa160ba79516683418020180040000003000e58c08c97600b28972cd1d383cc72747e25f1a66e69e4c0daa000000e395d0597473b66b29af9b32f73f0595bc47114a38f07233f35bb1e91767b9a6ce8f0cbb9a14d59f839651467d2cc3b74f1914a0b052bd92d87bc4b306a4bb013b1a4d74675a4dee6a5352e82a945b096c591908d645e7a8d8021496c018f5c9bd2cd79697f568e9286508e38bc778351a9a657c57a57c165591db3f67e4f2384b69eed7568bb8eed472429d69acd6ff9333bb545e1eccb1517aebc8bd74007ac89c24e7f159fc081cdb87c93447d5fb06c92e697fa58bd41ec39e000c920069e1e4e8e9a7989b3e25fc5a53cd3c2f03a4ca0002515b665b233dda8ff002d7b230fc9e5ff00c6347161f9d51179797b96c5981a55cf6964ddc19a7ac967fd1b0b23c6f976d126b28a2b433dd0ee412525862259541c259474289bdb2071b12c32d891c6ee6d6658fd6e96458e4c689d69ce492ee5fe8d6df2733e6f3d8ab933cb1bac6258e32cdd66b6bd3e6156a7d5e695ab95431be37ff91d2aaba9c1c973e1792ae4cf92799ad252470ff53eb63a4e1eeb8bfe25bed4beddcf0f23a1c53519392f934f0885d542e5ee5897fa916ab736faaca65eedd7668af9991a413cb3afc3adae30c369315152d75b5b8fc9366084929659126d56c3973cc8a5d95e7a8839e05891a248081a3493e5782ee1bace21c9378ba2b74422f116bba66ce7bf5ca67fb5ff00bfec5f1e7df1b85fd65fedfdd2e91c77e83c630cc1cb9ee7ef24fe97ff008dfc73eb75f9656ff59e3fe50b64a51714f76b28a67270d3c22bac9f319edb95d5fd56ea71e1f69fedd7f3dcff00b5ad2b2e84fb4965928453d5466be2d7310dd935fb2efa4cb2dfeb94bfcbfcacd7cb9ec949f7669d24a1a6d3c75125994a58fc22ce49ac663fc99be3d997265c97f296bb70e5715383ca6b2b72ca5732dccd9612591af0f91965865c97bf1fdd39c33ed2994955546beede584ff6fee59df173fd719ff4d73b1c669471d0b14b118d8b66fa90c71924bfa9f2676e594fd3cc6ae7c3c16a9612c770c719f593f5473cafdf2bfa2c4f30cf7459658e325cb8cbee2faeecc6fee8dba9729fb2d585284f18cadcb2314ec52cf7c91ddc71deb7e34564b74c96ff001b8c452e94c1c9fe5ecbfe66ebed869f4fef92518acb64b5bb862aff005af9ef1ae20f886ba5667d91da28eb7fe1ff00febb77ff005e5ff144d1f266b832fe0cd8f9ce327e8d7ff9a747ff00effe091e8384dd5ad5f1ca74565157169eaacf4656e378f37459fe7fd519be64de77f4d4dff0ddd8c3a796fd413d7d9c45ae2da78557a8a8b4a0a2a5f7db67f9389768a12dea7cafc337f14c7e93e97c2bbdf962b6ab29789c5a08b2646e4479d8889c9f91733f2234c0903448080eb6d4d63a92c6ea95e9d6a54bd34e6b1f606bf88a4ba1a7e4727df19217c7fc195b7f3830dcb216cf9160c7f5f17f769bc9e71bfa334acfe3292e8856c94eccae8b64471c3565fd93e4e599639633f3bfd3fcd2daecc50e3dfa2fc0e16a8d2e2fe5d17e0578ff00e53c7e449aff00d75fcffcd233553a3bfa990aecae5a7745f951ce549760cb1cacfdf7e071f27161949f959abfc5b787eae8d3a54bbdd916f6f6b5ca75a9963a955995b2d8b3edc5861961865bdebf2fe2d13f8292ea8a3534b714f1b9093f1a7965fe849fbff9ff0029dae3ea2e69b8ede3213bd3e58433cabbbee47096eb7d44f9ee18dcb57cd6d8591b312cb4f1d0d35ef141f5ca4eba42e785caddf7fd172f8e026d4a49af03c71bb96fee8659e36593f6684d38c52ec8b53518b7f6ea2fa5b8fd4ae53edb66e1cd72dbabb5f2ab64e797da2b65fd964f33fa8b8e2d758e8d2cff0080bac97f98b71c2de4dfeca73cbf0e987847f8535a8ff15f53e1fc2e4cf5fe5dfa75d8b7f4cf14af84f1657dea4ea9c1d7271dda4f0f3fd5225c9867c98e78deaf4aa5c66aba5c26efd3dc2b8cc3550d7dd7af7723f4a518d49a7d7bb7db65dcc4e3c1f5dc475d7ea789d9a594f5339d5254b92945b6d3db74ca24f9133bc971f3a935bfdcefd35a952fd57c5f4dc4ecd255a473b21a6af91dd62c4ac7b6ff00dbfbb3839c1a7e371de3e298e5dabcaeeecf692c4926bee67b745196f53e57e1f42fa4c3755656f138b45640108417b4089032caea9d8f108b6109ba9e1af695b2dbc234c6baa9f8457f326119599173640cf388b666b65ccc44a8924234d7410c1320c017e0dda3d7d94fb64f30ff0062366ce5d3bba4ba17b4f9b31f0753914e067faead6bcb93ed24935a63b6879dcabd349f416335343973fbe572fd5a6a58c1ba8dd0d08b65b2082c81af82c19b88ea2092d3ca7c9092e6b659f8c3fefd07215af31c6f8ecf5cfe9f4d9af4aba2e8e5ff00638f92fc628caecc09224004084de00275ee86f600945e76786994dba1aaccb8ae57f60b039ba8d2db44bdeb31f28a086835cc8044ab56934566a1f36396bff51d3aebae88f2c16dfee4e12365cfa27b782894dbee308e5e4b6b59102ba585833b79604060125d040608c90041ec342268d36a2dd359cf5bfe4cf5bc1b5b5eb2a4a2f135d63dd15e716e15beca398cb65387d0ad6a0934cdba5dd808d328e470af0821b3f10e23a7e1d539df2dfb4175678ae21c46ed7dd39d92c424f3c8bfb166315655913cbc922d540000181132ab1ee012a8b180453c32d8c8612972c9624b29f628ff000ed33dfdc85a0c15d73ba6a35a6db3a9a5e1f5d294adc4e7e3b2232255a65625b25833ce64c99dbdc42068bd6140099e72cb2bee013400121000c0468b59441a7179007192ec68d3dd3a6d8db4d8eb9ae8d30be44ba7b0e0bc76ad735a7d5e2abfb4bfcb3ffa33a77d1bf429ca697e376c56430cd7a1865321536a972569ced9c6108eee527847038afeaad3549d5c3a3eb598fdc92c457e3c93c71432cb4f27a8d45baabddb7d8e737dd904bc976945bb492c0c64000c0c0916516bc300b69f82649bc80264a0c02591e4613a2b8696b508af77797914ad6c50d076320d80418802705b93b2588e003349ee080934000c000611eb8001adc1ac81aab2b71dd118db878604ba3635badcf57c03f51ab5d7a2e219727edaed4baf84ff00ea4729b89e1755d2d56a285ab969a32cdb1596b0c5afe255f09d1464e3cf659f08f6fe655a5d7278fe21c4b57c467cdaab5c97682da2bf918f765d269465766894468980030005d8601191459d402f4f96a4d8a2f2b20031c5804c3201ffd9, '1', '2016-04-09', 'Ketua', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-07-23 10:20:27'),
('ADMN20160510-100742', '1605018', '1234', '2016-05-02', 'R. Saad Aliyudin, S.Ip.', 'Kp. Sumursari RT 03 RW 09 Desa Sukasono Kec. Sukawening', '20100321-20082011', '', '', '2016-05-10', '1', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-10 10:07:42'),
('ADMN20160510-101031', '1605019', '1234', '2016-05-09', 'Enok Armilah, S.Pd.I', 'Kp. Sumur Wetan Rt 04/ Rw 07, Desa Sukasono, Kec. Sukaweing', '20100321-20082011', 'Kp. Sumur Wetan Rt 04/ Rw 07, Desa Sukasono, Kec. Sukaweing', 'Garut', '1967-06-05', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-11 08:44:10'),
('ADMN20160510-101123', '1605020', '1234', '2016-05-09', 'Lala Mulya', 'Kp. Sagaranten', '20100321-20082011', '', '', '2016-05-10', '1', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-10 10:11:23'),
('ADMN20160510-101211', '1605021', '1234', '2016-05-09', 'Nia Kusniawati, S.Pd.I.', 'Kp. Sumursari', '20100321-20082011', '', '', '2016-05-10', '1', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-10 10:12:11'),
('ADMN20160510-101244', '1605022', '1234', '2016-05-10', 'Fitri Nurhayati', 'Kp. Sumur Wetan Rt 04/ Rw 07, Desa Sukasono, Kec. Sukaweing', '20100321-20082011', 'Kp. Sumur Wetan Rt 04/ Rw 07, Desa Sukasono, Kec. Sukaweing', 'Garut', '1995-02-19', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-11 08:46:42'),
('ADMN20160514-090943', '1605023', '1234', '2016-05-13', 'Iin Lasmanawati', 'Kp. Nangewer', '20100321-20082011', '', '', '2016-05-14', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-14 09:09:43'),
('ADMN20160514-091012', '1605024', '1234', '2016-05-13', 'Yanti Haryanti', 'Kp. Sumursari', '20100321-20082011', '', '', '2016-05-14', '2', '20090628-000357', '20090628-000706', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-14 09:10:24'),
('ADMN20160514-091057', '1605025', '1234', '2016-05-13', 'Siti Saadah', 'Kp. Sagaranten', '20100321-20082011', '', '', '2016-05-14', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-14 09:10:57'),
('ADMN20160516-105019', '1605026', '1234', '2016-05-16', 'Siti Maryam', 'Kp. Neglasari RT02 RW 10 Desa Sukasono Kec. Sukawening', '20100321-20082011', 'Kp. Neglasari RT02 RW 10 Desa Sukasono Kec. Sukawening', 'Garut', '1971-03-23', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-16 10:50:19'),
('ADMN20160525-112634', '1605027', '1234', '2016-05-25', 'Yeni Sulastri', 'BTN Cibatu Indah RT 02 RW 13 Desa Wanakerta Kec. Cibatu', '20100321-20082011', 'BTN Cibatu Indah RT 02 RW 13 Desa Wanakerta Kec. Cibatu', 'Garut', '1981-03-14', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-05-25 11:26:34'),
('ADMN20160601-073443', '1606001', '1234', '2016-06-01', 'R. Shoffy Basyiroh Am.', 'Kp. Wanakerta RT 003 RW 002 Desa Wanakerta Kec. Cibatu', '20100321-20082011', 'Kp. Wanakerta RT 003 RW 002 Desa Wanakerta Kec. Cibatu', 'Bogor', '1989-10-26', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-06-01 07:34:43'),
('ADMN20160726-104424', '1607001', '1234', '2016-07-26', 'Zam-Zam Nurjaman', 'Kp. Sumursari RT 02 RW 09 Desa Sukasono Kec. Sukawening', '20100321-20082011', 'Kp. Sumursari RT 02 RW 09 Desa Sukasono Kec. Sukawening', 'Garut', '1994-08-19', '1', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '1', '2016-05-01', 'Bendahara', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-07-26 10:44:24'),
('ADMN20160905-113056', '1609001', '1234', '2016-09-05', 'Intan Permata', 'Kp. SumurTengah', '20100321-20082011', '', '', '2016-09-05', '1', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-09-05 11:30:56'),
('ADMN20160905-113127', '1609002', '1234', '2016-09-05', 'Ai Nurlaela', 'Kp. sumur', '20100321-20082011', '', '', '2016-09-05', '1', '20090628-000415', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-09-05 11:31:27'),
('ADMN20161029-110719', '1610001', '1234', '2016-10-29', 'WIDA', 'CIBATU', '20100321-20082011', '', '', '2016-10-29', '2', '20090628-000357', '20090628-000703', '', '', '1', '', '', '', 0.00, '', NULL, '0', '2009-06-27', '', '2009-06-27', '', '0', '2009-06-27', '', '2009-06-27', '', '1', '1', '2009-06-27', '', '1', 'admin', '2016-10-29 11:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `anggotadetail`
--

CREATE TABLE IF NOT EXISTS `anggotadetail` (
  `id` varchar(30) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nobukti` varchar(30) DEFAULT NULL,
  `anggotaid` varchar(30) DEFAULT NULL,
  `depositoid` varchar(30) NOT NULL,
  `jurnalid` varchar(30) DEFAULT NULL,
  `accbank` varchar(30) NOT NULL,
  `debet` double(15,2) DEFAULT NULL,
  `kredit` double(15,2) DEFAULT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) DEFAULT NULL,
  `jam` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`anggotaid`,`jurnalid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom`
--

CREATE TABLE IF NOT EXISTS `custom` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `jenis` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customfilter`
--

CREATE TABLE IF NOT EXISTS `customfilter` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `kolom` varchar(100) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `tanggal1` date NOT NULL,
  `tanggal2` date NOT NULL,
  KEY `id` (`id`,`kolom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customkolom`
--

CREATE TABLE IF NOT EXISTS `customkolom` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `kolom` varchar(100) NOT NULL,
  KEY `id` (`id`,`kolom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customsort`
--

CREATE TABLE IF NOT EXISTS `customsort` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `kolom` varchar(100) NOT NULL,
  `urutan` char(1) NOT NULL,
  KEY `id` (`id`,`kolom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `depjenis`
--

CREATE TABLE IF NOT EXISTS `depjenis` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `kode` varchar(5) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `jangkawaktu` double(9,2) NOT NULL,
  `bunga` double(9,2) NOT NULL,
  `accountbunga` varchar(30) NOT NULL,
  `rumusbunga` char(1) NOT NULL,
  `penalti` double(9,2) NOT NULL,
  `accountpenalti` varchar(30) NOT NULL,
  `pajak` double(9,2) NOT NULL,
  `accountpajak` varchar(30) NOT NULL,
  `saldopajak` double(15,2) NOT NULL,
  `insentif` double(9,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`accountid`,`accountbunga`,`accountpenalti`,`accountpajak`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depjenis`
--

INSERT INTO `depjenis` (`id`, `kode`, `nama`, `accountid`, `jangkawaktu`, `bunga`, `accountbunga`, `rumusbunga`, `penalti`, `accountpenalti`, `pajak`, `accountpajak`, `saldopajak`, `insentif`, `user`, `jam`) VALUES
('DP20090720-182600', '55', 'Simpanan Berjangka 12 Bulan', '520-01', 12.00, 10.00, '960-02', '1', 15.00, '155-01', 0.00, '', 0.00, 0.00, 'admin', '2009-09-30 15:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `deposito`
--

CREATE TABLE IF NOT EXISTS `deposito` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `nodeposito` varchar(30) NOT NULL,
  `anggotaid` varchar(30) NOT NULL,
  `jenisid` varchar(30) NOT NULL,
  `marketingid` varchar(30) NOT NULL,
  `qq` varchar(100) NOT NULL,
  `jangkawaktu` double(9,2) NOT NULL,
  `bunga` double(9,2) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `otomatis` char(1) NOT NULL,
  `bayarbunga` char(1) NOT NULL,
  `diawal` char(1) NOT NULL,
  `bungaaccrual` char(1) NOT NULL,
  `accbungaaccrual` varchar(30) NOT NULL,
  `tabunganid1` varchar(30) NOT NULL,
  `bayarjatuhtempo` char(1) NOT NULL,
  `tabunganid2` varchar(30) NOT NULL,
  `blokir` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`anggotaid`,`jenisid`,`marketingid`,`tabunganid1`,`tabunganid2`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `depositobilyet`
--

CREATE TABLE IF NOT EXISTS `depositobilyet` (
  `id` varchar(30) NOT NULL,
  `suratid` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `surat` mediumblob,
  KEY `id` (`id`,`suratid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `depositodetail`
--

CREATE TABLE IF NOT EXISTS `depositodetail` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `depositoid` varchar(30) NOT NULL,
  `bunga` double(9,2) NOT NULL,
  `bayarbunga` char(1) NOT NULL,
  `nbunga` double(15,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`depositoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deptransaksi`
--

CREATE TABLE IF NOT EXISTS `deptransaksi` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `depositoid` varchar(30) NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `debet` double(15,2) NOT NULL,
  `kredit` double(15,2) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `tipe` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`depositoid`,`jurnalid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deptransaksidetail2`
--

CREATE TABLE IF NOT EXISTS `deptransaksidetail2` (
  `id` varchar(30) NOT NULL,
  `kas` char(1) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  KEY `id` (`id`,`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hari`
--

CREATE TABLE IF NOT EXISTS `hari` (
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `libur` char(1) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`tanggal`),
  UNIQUE KEY `id` (`tanggal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdabsen`
--

CREATE TABLE IF NOT EXISTS `hrdabsen` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `karyawanid` varchar(30) NOT NULL,
  `lama` double(9,2) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`karyawanid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdaccount`
--

CREATE TABLE IF NOT EXISTS `hrdaccount` (
  `accountid` varchar(30) NOT NULL,
  KEY `id` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdbagian`
--

CREATE TABLE IF NOT EXISTS `hrdbagian` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `marketing` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdgaji`
--

CREATE TABLE IF NOT EXISTS `hrdgaji` (
  `id` varchar(30) NOT NULL,
  `karyawanid` varchar(30) NOT NULL,
  `pokok` double(15,2) NOT NULL,
  `tunjangan` double(15,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id2` (`karyawanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdgajidetail`
--

CREATE TABLE IF NOT EXISTS `hrdgajidetail` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `komponenid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `persen` char(1) NOT NULL,
  KEY `id` (`id`,`komponenid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdhari`
--

CREATE TABLE IF NOT EXISTS `hrdhari` (
  `id` varchar(30) NOT NULL,
  `bulan` date NOT NULL DEFAULT '0000-00-00',
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdharidetail`
--

CREATE TABLE IF NOT EXISTS `hrdharidetail` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `libur` char(1) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdjabatan`
--

CREATE TABLE IF NOT EXISTS `hrdjabatan` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `pokok` double(15,2) NOT NULL,
  `tunjangan` double(15,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdjam`
--

CREATE TABLE IF NOT EXISTS `hrdjam` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `masuk` time NOT NULL,
  `pulang` time NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdkaryawan`
--

CREATE TABLE IF NOT EXISTS `hrdkaryawan` (
  `id` varchar(30) NOT NULL,
  `tglmasuk` date NOT NULL,
  `nik` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `kotaid` varchar(30) NOT NULL,
  `kodepos` varchar(30) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `tempatlahir` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `gender` char(1) NOT NULL,
  `darah` char(1) NOT NULL,
  `agamaid` varchar(30) NOT NULL,
  `pendidikanid` varchar(30) NOT NULL,
  `status` char(1) NOT NULL,
  `tanggungan` double(9,2) NOT NULL,
  `noktp` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `bagianid` varchar(30) NOT NULL,
  `jabatanid` varchar(30) NOT NULL,
  `jamid` varchar(30) NOT NULL,
  `tabunganid` varchar(30) NOT NULL,
  `foto` mediumblob,
  `tglkeluar` date NOT NULL,
  `aktif` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`kotaid`,`agamaid`,`pendidikanid`,`kantorid`,`bagianid`,`jabatanid`,`jamid`,`tabunganid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdkomponen`
--

CREATE TABLE IF NOT EXISTS `hrdkomponen` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `persen` char(1) NOT NULL,
  `rumus` varchar(100) NOT NULL,
  `aktif` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdposting`
--

CREATE TABLE IF NOT EXISTS `hrdposting` (
  `id` varchar(30) NOT NULL,
  `bulan` date NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`jurnalid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdpostingdetail`
--

CREATE TABLE IF NOT EXISTS `hrdpostingdetail` (
  `id` varchar(30) NOT NULL,
  `karyawanid` varchar(30) NOT NULL,
  `tabunganid` varchar(30) NOT NULL,
  `pokok` double(15,2) NOT NULL,
  `tunjangan` double(15,2) NOT NULL,
  `pph21` double(15,2) NOT NULL,
  KEY `id` (`id`,`karyawanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdpostingdetail2`
--

CREATE TABLE IF NOT EXISTS `hrdpostingdetail2` (
  `id` varchar(30) NOT NULL,
  `karyawanid` varchar(30) NOT NULL,
  `komponenid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`,`komponenid`,`karyawanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdpph`
--

CREATE TABLE IF NOT EXISTS `hrdpph` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `minimal` double(15,0) NOT NULL,
  `maksimal` double(15,0) NOT NULL,
  `persen` double(6,2) NOT NULL,
  `user` varchar(20) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdpresensi`
--

CREATE TABLE IF NOT EXISTS `hrdpresensi` (
  `id` varchar(30) NOT NULL,
  `bulan` date NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdpresensidetail`
--

CREATE TABLE IF NOT EXISTS `hrdpresensidetail` (
  `id` varchar(30) NOT NULL,
  `karyawanid` varchar(30) NOT NULL,
  `hadir` double(9,2) NOT NULL,
  `terlambat` double(9,2) NOT NULL,
  KEY `id` (`id`,`karyawanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdptkp`
--

CREATE TABLE IF NOT EXISTS `hrdptkp` (
  `id` varchar(30) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `user` varchar(20) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hrdptkpdetail`
--

CREATE TABLE IF NOT EXISTS `hrdptkpdetail` (
  `id` varchar(30) NOT NULL,
  `kawin` char(1) NOT NULL,
  `tanggungan` int(4) NOT NULL,
  `nominal` double(15,0) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jaminan`
--

CREATE TABLE IF NOT EXISTS `jaminan` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `nama` varchar(300) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jaminan`
--

INSERT INTO `jaminan` (`id`, `nama`, `user`, `jam`) VALUES
('20090629-225925', 'Emas', 'admin', '2009-07-01 13:42:17'),
('20090629-231830', 'Tanpa Agunan', 'admin', '2009-07-01 13:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `jaminandetail`
--

CREATE TABLE IF NOT EXISTS `jaminandetail` (
  `id` varchar(30) NOT NULL,
  `id2` int(4) NOT NULL,
  `nama` varchar(300) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jaminandetail`
--

INSERT INTO `jaminandetail` (`id`, `id2`, `nama`) VALUES
('20090629-225719', 1, 'berat'),
('20090629-225719', 2, 'kadar'),
('20090629-225925', 1, 'Berat'),
('20090629-225925', 2, 'Kadar');

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE IF NOT EXISTS `kabupaten` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `sandi` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `propinsiid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`propinsiid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`id`, `sandi`, `nama`, `propinsiid`, `user`, `jam`) VALUES
('1', '8217', 'Kab. Sarmi', '30', 'admin', '2010-03-21 20:08:30'),
('10', '8228', 'Kab. Asmat', '30', 'admin', '2010-03-21 20:08:30'),
('11', '8231', 'Kab. Supiori', '30', 'admin', '2010-03-21 20:08:30'),
('12', '8232', 'Kab. Mamberamo Raya', '30', 'admin', '2010-03-21 20:08:30'),
('13', '8233', 'Kab. Dogiyai', '30', 'admin', '2010-03-21 20:08:30'),
('14', '8234', 'Kab. Lanny Jaya', '30', 'admin', '2010-03-21 20:08:30'),
('15', '8235', 'Kab. Mamberamo Tengah', '30', 'admin', '2010-03-21 20:08:30'),
('16', '8236', 'Kab. Nduga Tengah', '30', 'admin', '2010-03-21 20:08:30'),
('17', '8237', 'Kab. Yalimo', '30', 'admin', '2010-03-21 20:08:30'),
('18', '8238', 'Kab. Puncak', '30', 'admin', '2010-03-21 20:08:30'),
('19', '8288', 'Kab./Kota Lainnya', '30', 'admin', '2010-03-21 20:08:30'),
('2', '8218', 'Kab. Keerom', '30', 'admin', '2010-03-21 20:08:30'),
('20', '8291', 'Kota Jayapura', '30', 'admin', '2010-03-21 20:08:30'),
('20100321-20081910', '0102', 'Kab. Bekasi', '1', 'admin', '2010-10-29 20:29:25'),
('20100321-2008192', '0103', 'Kab. Purwakarta', '1', 'admin', '2010-03-21 20:08:19'),
('20100321-2008193', '0106', 'Kab. Karawang', '1', 'admin', '2010-03-21 20:08:19'),
('20100321-2008194', '0108', 'Kab. Bogor', '1', 'admin', '2010-03-21 20:08:19'),
('20100321-2008195', '0109', 'Kab. Sukabumi', '1', 'admin', '2010-03-21 20:08:19'),
('20100321-2008196', '0110', 'Kab. Cianjur', '1', 'admin', '2010-03-21 20:08:19'),
('20100321-2008197', '0111', 'Kab. Bandung', '1', 'admin', '2010-03-21 20:08:19'),
('20100321-2008198', '0112', 'Kab. Sumedang', '1', 'admin', '2010-03-21 20:08:19'),
('20100321-2008199', '0113', 'Kab. Tasikmalaya', '1', 'admin', '2010-03-21 20:08:19'),
('20100321-20082011', '0114', 'Kab. Garut', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082012', '0115', 'Kab. Ciamis', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082013', '0116', 'Kab. Cirebon', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082014', '0117', 'Kab. Kuningan', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082015', '0118', 'Kab. Indramayu', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082016', '0119', 'Kab. Majalengka', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082017', '0121', 'Kab. Subang', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082018', '0122', 'Kab. Bandung Barat', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082019', '0180', 'Kota Banjar', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082020', '0188', 'Kab./Kota Lainnya', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082021', '0191', 'Kota Bandung', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082022', '0192', 'Kota Bogor', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082023', '0193', 'Kota Sukabumi', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082024', '0194', 'Kota Cirebon', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082025', '0195', 'Kota Tasikmalaya', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082026', '0196', 'Kota Cimahi', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082027', '0197', 'Kota Depok', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082028', '0198', 'Kota Bekasi', '1', 'admin', '2010-03-21 20:08:20'),
('20100321-20082029', '0201', 'Kab. Lebak', '2', 'admin', '2010-03-21 20:08:20'),
('20100321-20082030', '0202', 'Kab. Pandeglang', '2', 'admin', '2010-03-21 20:08:20'),
('20100321-20082031', '0203', 'Kab. Serang', '2', 'admin', '2010-03-21 20:08:20'),
('20100321-20082032', '0204', 'Kab. Tangerang', '2', 'admin', '2010-03-21 20:08:20'),
('20100321-20082033', '0288', 'Kab./Kota Lainnya', '2', 'admin', '2010-03-21 20:08:20'),
('20100321-20082034', '0291', 'Kota Cilegon', '2', 'admin', '2010-03-21 20:08:20'),
('20100321-20082035', '0292', 'Kota Tangerang', '2', 'admin', '2010-03-21 20:08:20'),
('20100321-20082036', '0293', 'Kota Serang', '2', 'admin', '2010-03-21 20:08:20'),
('20100321-20082037', '0391', 'Wil. Kota Jakarta Pusat', '3', 'admin', '2010-03-21 20:08:20'),
('20100321-20082038', '0392', 'Wil. Kota Jakarta Utara', '3', 'admin', '2010-03-21 20:08:20'),
('20100321-20082039', '0393', 'Wil. Kota Jakarta Barat', '3', 'admin', '2010-03-21 20:08:20'),
('20100321-20082040', '0394', 'Wil. Kota Jakarta Selatan', '3', 'admin', '2010-03-21 20:08:20'),
('20100321-20082041', '0395', 'Wil. Kota Jakarta Timur', '3', 'admin', '2010-03-21 20:08:20'),
('20100321-20082042', '0396', 'Wil. Kepulauan Seribu', '3', 'admin', '2010-03-21 20:08:20'),
('20100321-20082043', '0501', 'Kab. Bantul', '4', 'admin', '2010-03-21 20:08:20'),
('20100321-20082044', '0502', 'Kab. Sleman', '4', 'admin', '2010-03-21 20:08:20'),
('20100321-20082045', '0503', 'Kab. Gunung Kidul', '4', 'admin', '2010-03-21 20:08:20'),
('20100321-20082046', '0504', 'Kab. Kulon Progo', '4', 'admin', '2010-03-21 20:08:20'),
('20100321-20082047', '0588', 'Kab./Kota Lainnya', '4', 'admin', '2010-03-21 20:08:20'),
('20100321-20082048', '0591', 'Kota Yogyakarta', '4', 'admin', '2010-03-21 20:08:20'),
('20100321-20082049', '0901', 'Kab. Semarang', '4', 'admin', '2010-03-21 20:08:20'),
('20100321-20082050', '0902', 'Kab. Kendal', '5', 'admin', '2010-03-21 20:08:20'),
('20100321-20082051', '0903', 'Kab. Demak', '5', 'admin', '2010-03-21 20:08:20'),
('20100321-20082052', '0904', 'Kab. Grobogan', '5', 'admin', '2010-03-21 20:08:20'),
('20100321-20082053', '0905', 'Kab. Pekalongan', '5', 'admin', '2010-03-21 20:08:20'),
('20100321-20082054', '0906', 'Kab. Tegal', '5', 'admin', '2010-03-21 20:08:20'),
('20100321-20082055', '0907', 'Kab. Brebes', '5', 'admin', '2010-03-21 20:08:20'),
('20100321-200821100', '0908', 'Kab. Pati', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-200821101', '0909', 'Kab. Kudus', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-200821102', '0910', 'Kab. Pemalang', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-200821103', '0911', 'Kab. Jepara', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-20082156', '0912', 'Kab. Rembang', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082157', '0913', 'Kab. Blora', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082158', '0914', 'Kab. Banyumas', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082159', '0915', 'Kab. Cilacap', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082160', '0916', 'Kab. Purbalingga', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082161', '0917', 'Kab. Banjarnegara', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082162', '0918', 'Kab. Magelang', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082163', '0919', 'Kab. Temanggung', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082164', '0920', 'Kab. Wonosobo', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082165', '0921', 'Kab. Purworejo', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082166', '0922', 'Kab. Kebumen', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082167', '0923', 'Kab. Klaten', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082168', '0924', 'Kab. Boyolali', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082169', '0925', 'Kab. Sragen', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082170', '0926', 'Kab. Sukoharjo', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082171', '0927', 'Kab. Karanganyar', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082172', '0928', 'Kab. Wonogiri', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082173', '0929', 'Kab. Batang', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082174', '0988', 'Kab./Kota Lainnya', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082175', '0991', 'Kota Semarang', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082176', '0992', 'Kota Salatiga', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082177', '0993', 'Kota Pekalongan', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082178', '0994', 'Kota Tegal', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082179', '0995', 'Kota Magelang', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082180', '0996', 'Kota Surakarta/Solo', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082181', '1201', 'Kab. Gresik', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082182', '1202', 'Kab. Sidoarjo', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082183', '1203', 'Kab. Mojokerto', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082184', '1204', 'Kab. Jombang', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082185', '1205', 'Kab. Sampang', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082186', '1206', 'Kab. Pamekasan', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082187', '1207', 'Kab. Sumenep', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082188', '1208', 'Kab. Bangkalan', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082189', '1209', 'Kab. Bondowoso', '5', 'admin', '2010-03-21 20:08:21'),
('20100321-20082190', '1211', 'Kab. Banyuwangi', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-20082191', '1212', 'Kab. Jember', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-20082192', '1213', 'Kab. Malang', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-20082193', '1214', 'Kab. Pasuruan', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-20082194', '1215', 'Kab. Probolinggo', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-20082195', '1216', 'Kab. Lumajang', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-20082196', '1217', 'Kab. Kediri', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-20082197', '1218', 'Kab. Nganjuk', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-20082198', '1219', 'Kab. Tulungagung', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-20082199', '1220', 'Kab. Trenggalek', '6', 'admin', '2010-03-21 20:08:21'),
('20100321-200822104', '1221', 'Kab. Blitar', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822105', '1222', 'Kab. Madiun', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822106', '1223', 'Kab. Ngawi', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822107', '1224', 'Kab. Magetan', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822108', '1225', 'Kab. Ponorogo', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822109', '1226', 'Kab. Pacitan', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822110', '1227', 'Kab. Bojonegoro', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822111', '1228', 'Kab. Tuban', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822112', '1229', 'Kab. Lamongan', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822113', '1230', 'Kab. Situbondo', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822114', '1271', 'Kota Batu', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822115', '1288', 'Kab./Kota Lainnya', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822116', '1291', 'Kota Surabaya', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822117', '1292', 'Kota Mojokerto', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822118', '1293', 'Kota Malang', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822119', '1294', 'Kota Pasuruan', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822120', '1295', 'Kota Probolinggo', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822121', '1296', 'Kota Blitar', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822122', '1297', 'Kota Kediri', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822123', '1298', 'Kota Madiun', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822124', '2301', 'Kab. Bengkulu Selatan', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822125', '2302', 'Kab. Bengkulu Utara', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822126', '2303', 'Kab. Rejang Lebong', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822127', '2304', 'Kab. Lebong', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822128', '2305', 'Kab. Kepahiang', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822129', '2306', 'Kab. Mukomuko', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822130', '2307', 'Kab. Seluma', '6', 'admin', '2010-03-21 20:08:22'),
('20100321-200822131', '2308', 'Kab. Kaur', '7', 'admin', '2010-03-21 20:08:22'),
('20100321-200822132', '2388', 'Kab./Kota Lainnya', '7', 'admin', '2010-03-21 20:08:22'),
('20100321-200822133', '2391', 'Kota Bengkulu', '7', 'admin', '2010-03-21 20:08:22'),
('20100321-200822134', '3101', 'Kab. Batanghari', '7', 'admin', '2010-03-21 20:08:22'),
('20100321-200822135', '3104', 'Kab. Sarolangun', '7', 'admin', '2010-03-21 20:08:22'),
('20100321-200822136', '3105', 'Kab. Kerinci', '7', 'admin', '2010-03-21 20:08:22'),
('20100321-200822137', '3106', 'Kab. Muaro Jambi', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822138', '3107', 'Kab. Tanjung Jabung Barat', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822139', '3108', 'Kab. Tanjung Jabung Timur', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822140', '3109', 'Kab. Tebo', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822141', '3111', 'Kab. Merangin', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822142', '3112', 'Kab. Bungo', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822143', '3188', 'Kab./Kota Lainnya', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822144', '3191', 'Kota Jambi', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822145', '3201', 'Kab. Aceh Besar', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822146', '3202', 'Kab. Pidie', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822147', '3203', 'Kab. Aceh Utara', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822148', '3204', 'Kab. Aceh Timur', '8', 'admin', '2010-03-21 20:08:22'),
('20100321-200822149', '3205', 'Kab. Aceh Selatan', '9', 'admin', '2010-03-21 20:08:22'),
('20100321-200822150', '3206', 'Kab. Aceh Barat', '9', 'admin', '2010-03-21 20:08:22'),
('20100321-200823151', '3207', 'Kab. Aceh Tengah', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823152', '3208', 'Kab. Aceh Tenggara', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823153', '3209', 'Kab. Aceh Singkil', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823154', '3210', 'Kab. Aceh Jeumpa/Bireuen', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823155', '3211', 'Kab. Aceh Tamiang', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823156', '3212', 'Kab. Gayo Luwes', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823157', '3213', 'Kab. Aceh Barat Daya', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823158', '3214', 'Kab. Aceh Jaya', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823159', '3215', 'Kab. Nagan Raya', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823160', '3216', 'Kab. Aceh Simeuleu', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823161', '3217', 'Kab. Bener Meriah', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823162', '3218', 'Kab. Pidie Jaya', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823163', '3219', 'Kab. Subulussalam', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823164', '3288', 'Kab./Kota Lainnya', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823165', '3291', 'Kota Banda Aceh', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823166', '3292', 'Kota Sabang', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823167', '3293', 'Kota Lhokseumawe', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823168', '3294', 'Kota Langsa', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823169', '3301', 'Kab. Deli Serdang', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823170', '3302', 'Kab. Langkat', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823171', '3303', 'Kab. Karo', '9', 'admin', '2010-03-21 20:08:23'),
('20100321-200823172', '3304', 'Kab. Simalungun', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823173', '3305', 'Kab. Labuhan Batu', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823174', '3306', 'Kab. Asahan', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823175', '3307', 'Kab. Dairi', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823176', '3308', 'Kab. Tapanuli Utara', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823177', '3309', 'Kab. Tapanuli Tengah', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823178', '3310', 'Kab. Tapanuli Selatan', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823179', '3311', 'Kab. Nias', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823180', '3313', 'Kab. Toba Samosir', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823181', '3314', 'Kab. Mandailing Natal', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823182', '3315', 'Kab. Nias Selatan', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823183', '3316', 'Kab. Humbang Hasundutan', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823184', '3317', 'Kab. Pakpak Bharat', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823185', '3318', 'Kab. Samosir', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823186', '3319', 'Kab. Serdang Bedagai', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823187', '3320', 'Kab. Angkola Sipirok', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823188', '3321', 'Kab. Batu Bara', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823189', '3322', 'Kab. Padang Lawas', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823190', '3323', 'Kab. Padang Lawas Utara', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823191', '3388', 'Kab/Kota Lainnya', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823192', '3391', 'Kota Tebing Tinggi', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823193', '3392', 'Kota Binjai', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823194', '3393', 'Kota Pematang Siantar', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823195', '3394', 'Kota Tanjung Balai', '10', 'admin', '2010-03-21 20:08:23'),
('20100321-200823196', '3395', 'Kota Sibolga', '11', 'admin', '2010-03-21 20:08:23'),
('20100321-200823197', '3396', 'Kota Medan', '11', 'admin', '2010-03-21 20:08:23'),
('20100321-200824198', '3399', 'Kota Padang Sidempuan', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824199', '3401', 'Kab. Agam', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824200', '3402', 'Kab. Pasaman', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824201', '3403', 'Kab. Limapuluh Koto', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824202', '3404', 'Kab. Solok Selatan', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824203', '3405', 'Kab. Padang Pariaman', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824204', '3406', 'Kab. Pesisir Selatan', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824205', '3407', 'Kab. Tanah Datar', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824206', '3408', 'Kab. Sawahlunto/Sijunjung', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824207', '3409', 'Kab. Kepulauan Mentawai', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824208', '3410', 'Kab. Pasaman Barat', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824209', '3411', 'Kab. Dharmasraya', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824210', '3412', 'Kab. Solok', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824211', '3488', 'Kab/Kota Lainnya', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824212', '3491', 'Kota Bukittinggi', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824213', '3492', 'Kota Padang', '11', 'admin', '2010-03-21 20:08:24'),
('20100321-200824214', '3493', 'Kota Sawahlunto', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824215', '3494', 'Kota Padang Panjang', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824216', '3495', 'Kota Solok', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824217', '3496', 'Kota Payakumbuh', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824218', '3497', 'Kota Pariaman', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824219', '3501', 'Kab. Kampar', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824220', '3502', 'Kab. Bengkalis', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824221', '3504', 'Kab. Indragiri Hulu', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824222', '3505', 'Kab. Indragiri Hilir', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824223', '3508', 'Kab. Rokan Hulu', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824224', '3509', 'Kab. Rokan Hilir', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824225', '3510', 'Kab. Pelalawan', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824226', '3511', 'Kab. Siak', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824227', '3512', 'Kab. Kuantan Singingi', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824228', '3588', 'Kab./Kota Lainnya', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824229', '3591', 'Kota Pekanbaru', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824230', '3592', 'Kota Dumai', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824231', '3606', 'Kab. Musi Banyuasin', '12', 'admin', '2010-03-21 20:08:24'),
('20100321-200824232', '3607', 'Kab. Ogan Komering Ulu', '13', 'admin', '2010-03-21 20:08:24'),
('20100321-200824233', '3608', 'Kab. Lematang Ilir Ogan Tengah (Muara Enim)', '13', 'admin', '2010-03-21 20:08:24'),
('20100321-200824234', '3609', 'Kab. Lahat', '13', 'admin', '2010-03-21 20:08:24'),
('20100321-200824235', '3610', 'Kab. Musi Rawas', '13', 'admin', '2010-03-21 20:08:24'),
('20100321-200825236', '3611', 'Kab. Ogan Komering Ilir', '13', 'admin', '2010-03-21 20:08:25'),
('20100321-200825237', '3613', 'Kab. Banyuasin', '13', 'admin', '2010-03-21 20:08:25'),
('20100321-200825238', '3614', 'Kab. Ogan Komeing Ulu Selatan', '13', 'admin', '2010-03-21 20:08:25'),
('20100321-200825239', '3615', 'Kab. Ogan Komeing Ulu Timur', '13', 'admin', '2010-03-21 20:08:25'),
('20100321-200825240', '3616', 'Kab. Ogan Ilir', '13', 'admin', '2010-03-21 20:08:25'),
('20100321-200825241', '3617', 'Kab. Empat Lawang', '13', 'admin', '2010-03-21 20:08:25'),
('20100321-200825242', '3688', 'Kab./Kota Lainnya', '13', 'admin', '2010-03-21 20:08:25'),
('20100321-200825243', '3691', 'Kota Palembang', '13', 'admin', '2010-03-21 20:08:25'),
('20100321-200825244', '3693', 'Kota Lubuklinggau', '13', 'admin', '2010-03-21 20:08:25'),
('20100321-200825245', '3694', 'Kota Prabumulih', '13', 'admin', '2010-03-21 20:08:25'),
('20100321-200825246', '3697', 'Kota Pagar Alam', '14', 'admin', '2010-03-21 20:08:25'),
('20100321-200825247', '3701', 'Kab. Bangka', '14', 'admin', '2010-03-21 20:08:25'),
('20100321-200825248', '3702', 'Kab. Belitung', '14', 'admin', '2010-03-21 20:08:25'),
('20100321-200825249', '3703', 'Kab. Bangka Barat', '14', 'admin', '2010-03-21 20:08:25'),
('20100321-200825250', '3704', 'Kab. Bangka Selatan', '14', 'admin', '2010-03-21 20:08:25'),
('20100321-200825251', '3705', 'Kab. Bangka Tengah', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825252', '3706', 'Kab. Belitung Timur', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825253', '3788', 'Kab./Kota Lainnya', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825254', '3791', 'Kota Pangkal Pinang', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825255', '3801', 'Kab. Karimun', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825256', '3802', 'Kab. Lingga', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825257', '3803', 'Kab. Natuna', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825258', '3804', 'Kab. Bintan (d/h Kabupaten Kepulauan Riau)', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825259', '3888', 'Kab./Kota Lainnya', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825260', '3891', 'Kota Tanjung Pinang', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825261', '3892', 'Kota Batam', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200825262', '3901', 'Kab. Lampung Selatan', '15', 'admin', '2010-03-21 20:08:25'),
('20100321-200826263', '3902', 'Kab. Lampung Tengah', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826264', '3903', 'Kab. Lampung Utara', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826265', '3904', 'Kab. Lampung Barat', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826266', '3905', 'Kab. Tulang Bawang', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826267', '3906', 'Kab. Tanggamus', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826268', '3907', 'Kab. Lampung Timur', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826269', '3908', 'Kab. Way Kanan', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826270', '3909', 'Kab. Pesawaran', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826271', '3988', 'Kab./Kota Lainnya', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826272', '3991', 'Kota Bandar Lampung', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826273', '3992', 'Kota Metro', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826274', '5101', 'Kab. Banjar', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826275', '5102', 'Kab. Tanah Laut', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826276', '5103', 'Kab. Tapin', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826277', '5104', 'Kab. Hulu Sungai Selatan', '16', 'admin', '2010-03-21 20:08:26'),
('20100321-200826278', '5105', 'Kab. Hulu Sungai Tengah', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826279', '5106', 'Kab. Hulu Sungai Utara', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826280', '5107', 'Kab. Barito Kuala', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826281', '5108', 'Kab. Kota Baru', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826282', '5109', 'Kab. Tabalong', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826283', '5110', 'Kab. Tanah Bumbu', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826284', '5111', 'Kab. Balangan', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826285', '5188', 'Kab./Kota Lainnya', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826286', '5191', 'Kota Banjarmasin', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826287', '5192', 'Kota Banjarbaru', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826288', '5301', 'Kab. Pontianak', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826289', '5302', 'Kab. Sambas', '17', 'admin', '2010-03-21 20:08:26'),
('20100321-200826290', '5303', 'Kab. Ketapang', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826291', '5304', 'Kab. Sanggau', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826292', '5305', 'Kab. Sintang', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826293', '5306', 'Kab. Kapuas Hulu', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826294', '5307', 'Kab. Bengkayang', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826295', '5308', 'Kab. Landak', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826296', '5309', 'Kab. Sekadau', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826297', '5310', 'Kab. Melawi', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826298', '5311', 'Kab. Kayong Utara', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826299', '5312', 'Kab. Kubu Raya', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826300', '5388', 'Kab./Kota Lainnya', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826301', '5391', 'Kota Pontianak', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826302', '5392', 'Kota Singkawang', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826303', '5401', 'Kab. Kutai Kartanegara', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826304', '5402', 'Kab. Berau', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826305', '5403', 'Kab. Pasir', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826306', '5404', 'Kab. Bulungan', '18', 'admin', '2010-03-21 20:08:26'),
('20100321-200826307', '5405', 'Kab. Kutai Barat', '19', 'admin', '2010-03-21 20:08:26'),
('20100321-200826308', '5406', 'Kab. Kutai Timur', '19', 'admin', '2010-03-21 20:08:26'),
('20100321-200826309', '5409', 'Kab. Nunukan', '19', 'admin', '2010-03-21 20:08:26'),
('20100321-200827310', '5410', 'Kab. Malinau', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827311', '5411', 'Kab. Penajam Paser Utara', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827312', '5412', 'Kab. Tana Tidung', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827313', '5488', 'Kab./Kota Lainnya', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827314', '5491', 'Kota Samarinda', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827315', '5492', 'Kota Balikpapan', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827316', '5493', 'Kota Tarakan', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827317', '5494', 'Kota Bontang', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827318', '5801', 'Kab. Kapuas', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827319', '5802', 'Kab. Kotawaringin Barat', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827320', '5803', 'Kab. Kotawaringin Timur', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827321', '5804', 'Kab. Murung Raya', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827322', '5805', 'Kab. Barito Timur', '19', 'admin', '2010-03-21 20:08:27'),
('20100321-200827323', '5806', 'Kab. Barito Selatan', '20', 'admin', '2010-03-21 20:08:27'),
('20100321-200827324', '5807', 'Kab. Gunung Mas', '20', 'admin', '2010-03-21 20:08:27'),
('20100321-200827325', '5808', 'Kab. Barito Utara', '20', 'admin', '2010-03-21 20:08:27'),
('20100321-200827326', '5809', 'Kab. Pulang Pisau', '20', 'admin', '2010-03-21 20:08:27'),
('20100321-200827327', '5810', 'Kab. Seruyan', '20', 'admin', '2010-03-21 20:08:27'),
('20100321-200827328', '5811', 'Kab. Katingan', '20', 'admin', '2010-03-21 20:08:27'),
('20100321-200827329', '5812', 'Kab. Sukamara', '20', 'admin', '2010-03-21 20:08:27'),
('20100321-200827330', '5813', 'Kab. Lamandau', '20', 'admin', '2010-03-21 20:08:27'),
('20100321-200827331', '5888', 'Kab./Kota Lainnya', '20', 'admin', '2010-03-21 20:08:27'),
('20100321-200827332', '5892', 'Kota Palangkaraya', '20', 'admin', '2010-03-21 20:08:27'),
('20100321-200827333', '6001', 'Kab. Donggala', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827334', '6002', 'Kab. Poso', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827335', '6003', 'Kab. Parimo/Banggai', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827336', '6004', 'Kab. Toli-Toli', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827337', '6005', 'Kab. Banggai Kepulauan', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827338', '6006', 'Kab. Morowali', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827339', '6007', 'Kab. Buol', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827340', '6008', 'Kab. Tojo Una-Una', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827341', '6009', 'Kab. Parigi Moutong', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827342', '6088', 'Kab./Kota Lainnya', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827343', '6091', 'Kota Palu', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827344', '6101', 'Kab. Pinrang', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827345', '6102', 'Kab. Gowa', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827346', '6103', 'Kab. Wajo', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827347', '6105', 'Kab. Bone', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827348', '6106', 'Kab. Tana Toraja', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827349', '6107', 'Kab. Maros', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827350', '6109', 'Kab. Luwu', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827351', '6110', 'Kab. Sinjai', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827352', '6111', 'Kab. Bulukumba', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827353', '6112', 'Kab. Bantaeng', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200827354', '6113', 'Kab. Jeneponto', '21', 'admin', '2010-03-21 20:08:27'),
('20100321-200828355', '6114', 'Kab. Selayar', '21', 'admin', '2010-03-21 20:08:28'),
('20100321-200828356', '6115', 'Kab. Takalar', '21', 'admin', '2010-03-21 20:08:28'),
('20100321-200828357', '6116', 'Kab. Barru', '21', 'admin', '2010-03-21 20:08:28'),
('20100321-200828358', '6117', 'Kab. Sidenreng Rappang', '21', 'admin', '2010-03-21 20:08:28'),
('20100321-200828359', '6118', 'Kab. Pangkajene Kepulauan', '21', 'admin', '2010-03-21 20:08:28'),
('20100321-200828360', '6119', 'Kab. Soppeng (d/h Watansoppeng)', '21', 'admin', '2010-03-21 20:08:28'),
('20100321-200828361', '6121', 'Kab. Enrekang', '21', 'admin', '2010-03-21 20:08:28'),
('20100321-200828362', '6122', 'Kab. Luwu Timur (d/h Luwu Selatan)', '21', 'admin', '2010-03-21 20:08:28'),
('20100321-200828363', '6124', 'Kab. Luwu Utara', '22', 'admin', '2010-03-21 20:08:28'),
('20100321-200828364', '6188', 'Kab./Kota Lainnya', '22', 'admin', '2010-03-21 20:08:28'),
('20100321-200828365', '6191', 'Kota Makassar', '22', 'admin', '2010-03-21 20:08:28'),
('20100321-200828366', '6192', 'Kota Pare-Pare', '22', 'admin', '2010-03-21 20:08:28'),
('20100321-200828367', '6193', 'Kota Palopo', '22', 'admin', '2010-03-21 20:08:28'),
('20100321-200828368', '6202', 'Kab. Minahasa', '22', 'admin', '2010-03-21 20:08:28'),
('20100321-200828369', '6203', 'Kab. Bolaang Mongondow', '22', 'admin', '2010-03-21 20:08:28'),
('20100321-200828370', '6204', 'Kab. Kepulauan Sangihe', '22', 'admin', '2010-03-21 20:08:28'),
('20100321-200828371', '6205', 'Kab. kepulauan Talaud', '22', 'admin', '2010-03-21 20:08:28'),
('20100321-200828372', '6206', 'Kab. Minahasa Selatan', '22', 'admin', '2010-03-21 20:08:28'),
('20100321-200828373', '6207', 'Kab. Minahasa Utara', '23', 'admin', '2010-03-21 20:08:28'),
('20100321-200828374', '6209', 'Kab. Minahasa Tenggara', '23', 'admin', '2010-03-21 20:08:28'),
('20100321-200828375', '6210', 'Kab. Bolaang Mongondow Utara', '23', 'admin', '2010-03-21 20:08:28'),
('20100321-200828376', '6211', 'Kab. Kepulauan Sitaro', '23', 'admin', '2010-03-21 20:08:28'),
('20100321-200828377', '6288', 'Kab./Kota Lainnya', '23', 'admin', '2010-03-21 20:08:28'),
('20100321-200828378', '6291', 'Kota Manado', '23', 'admin', '2010-03-21 20:08:28'),
('20100321-200828379', '6292', 'Kota Kotamobagu', '23', 'admin', '2010-03-21 20:08:28'),
('20100321-200828380', '6293', 'Kota Bitung', '24', 'admin', '2010-03-21 20:08:28'),
('20100321-200828381', '6294', 'Kota Tomohon', '24', 'admin', '2010-03-21 20:08:28'),
('20100321-200828382', '6301', 'Kab. Gorontalo', '24', 'admin', '2010-03-21 20:08:28'),
('20100321-200828383', '6302', 'Kab. Bualemo', '24', 'admin', '2010-03-21 20:08:28'),
('20100321-200828384', '6303', 'Kab. Bonebolango', '24', 'admin', '2010-03-21 20:08:28'),
('20100321-200828385', '6304', 'Kab. Pohuwato', '24', 'admin', '2010-03-21 20:08:28'),
('20100321-200828386', '6305', 'Kab. Gorontalo Utara', '24', 'admin', '2010-03-21 20:08:28'),
('20100321-200828387', '6388', 'Kab./Kota Lainnya', '24', 'admin', '2010-03-21 20:08:28'),
('20100321-200828388', '6391', 'Kota Gorontalo', '25', 'admin', '2010-03-21 20:08:28'),
('20100321-200828389', '6401', 'Kab. Polewali Mandar', '25', 'admin', '2010-03-21 20:08:28'),
('20100321-200828390', '6402', 'Kab. Majene', '25', 'admin', '2010-03-21 20:08:28'),
('20100321-200828391', '6403', 'Kab. Mamasa', '25', 'admin', '2010-03-21 20:08:28'),
('20100321-200828392', '6404', 'Kab. Mamuju Utara', '25', 'admin', '2010-03-21 20:08:28'),
('20100321-200828393', '6488', 'Kab./Kota Lainnya', '25', 'admin', '2010-03-21 20:08:28'),
('20100321-200828394', '6491', 'Kota Mamuju', '25', 'admin', '2010-03-21 20:08:28'),
('20100321-200828395', '6901', 'Kab. Buton', '25', 'admin', '2010-03-21 20:08:28'),
('20100321-200828396', '6903', 'Kab. Muna', '25', 'admin', '2010-03-21 20:08:28'),
('20100321-200828397', '6904', 'Kab. Kolaka', '25', 'admin', '2010-03-21 20:08:28'),
('20100321-200828398', '6905', 'Kab. Wakatobi', '26', 'admin', '2010-03-21 20:08:28'),
('20100321-200828399', '6906', 'Kab. Konawe', '26', 'admin', '2010-03-21 20:08:28'),
('20100321-200828400', '6907', 'Kab. Konawe Selatan', '26', 'admin', '2010-03-21 20:08:28'),
('20100321-200829401', '6908', 'Kab. Bombana', '26', 'admin', '2010-03-21 20:08:29'),
('20100321-200829402', '6909', 'Kab. Kolaka Utara', '26', 'admin', '2010-03-21 20:08:29'),
('20100321-200829403', '6910', 'Kab. Buton Utara', '26', 'admin', '2010-03-21 20:08:29'),
('20100321-200829404', '6911', 'Kab. Konawe Utara', '26', 'admin', '2010-03-21 20:08:29'),
('20100321-200829405', '6988', 'Kab./Kota Lainnya', '26', 'admin', '2010-03-21 20:08:29'),
('20100321-200829406', '6990', 'Kota Bau-Bau', '26', 'admin', '2010-03-21 20:08:29'),
('20100321-200829407', '6991', 'Kota Kendari', '26', 'admin', '2010-03-21 20:08:29'),
('20100321-200829408', '7101', 'Kab. Lombok Barat', '26', 'admin', '2010-03-21 20:08:29'),
('20100321-200829409', '7102', 'Kab. Lombok Tengah', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829410', '7103', 'Kab. Lombok Timur', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829411', '7104', 'Kab. Sumbawa', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829412', '7105', 'Kab. Bima', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829413', '7106', 'Kab. Dompu', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829414', '7107', 'Kab. Sumbawa Barat', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829415', '7188', 'Kab./Kota Lainnya', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829416', '7191', 'Kota Mataram', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829417', '7192', 'Kota Bima', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829418', '7201', 'Kab. Buleleng', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829419', '7202', 'Kab. Jembrana', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829420', '7203', 'Kab. Tabanan', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829421', '7204', 'Kab. Badung', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829422', '7205', 'Kab. Gianyar', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829423', '7206', 'Kab. Klungkung', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829424', '7207', 'Kab. Bangli', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829425', '7208', 'Kab. Karangasem', '27', 'admin', '2010-03-21 20:08:29'),
('20100321-200829426', '7288', 'Kab./Kota Lainnya', '28', 'admin', '2010-03-21 20:08:29'),
('20100321-200829427', '7291', 'Kota Denpasar', '28', 'admin', '2010-03-21 20:08:29'),
('20100321-200829428', '7401', 'Kab. Kupang', '28', 'admin', '2010-03-21 20:08:29'),
('20100321-200829429', '7402', 'Kab. Timor-Tengah Selatan', '28', 'admin', '2010-03-21 20:08:29'),
('20100321-200829430', '7403', 'Kab. Timor-Tengah Utara', '28', 'admin', '2010-03-21 20:08:29'),
('20100321-200829431', '7404', 'Kab. Belu', '28', 'admin', '2010-03-21 20:08:29'),
('20100321-200829432', '7405', 'Kab. Alor', '28', 'admin', '2010-03-21 20:08:29'),
('20100321-200829433', '7406', 'Kab. Flores Timur', '29', 'admin', '2010-03-21 20:08:29'),
('20100321-200829434', '7407', 'Kab. Sikka', '29', 'admin', '2010-03-21 20:08:29'),
('20100321-200829435', '7408', 'Kab. Ende', '29', 'admin', '2010-03-21 20:08:29'),
('20100321-200829436', '7409', 'Kab. Ngada', '29', 'admin', '2010-03-21 20:08:29'),
('20100321-200829437', '7410', 'Kab. Manggarai', '29', 'admin', '2010-03-21 20:08:29'),
('20100321-200829438', '7411', 'Kab. Sumba Timur', '29', 'admin', '2010-03-21 20:08:29'),
('20100321-200829439', '7412', 'Kab. Sumba Barat', '29', 'admin', '2010-03-21 20:08:29'),
('20100321-200829440', '7413', 'Kab. Lembata', '29', 'admin', '2010-03-21 20:08:29'),
('20100321-200829441', '7414', 'Kab. Rote', '29', 'admin', '2010-03-21 20:08:29'),
('20100321-200829442', '7415', 'Kab. Manggarai Barat', '29', 'admin', '2010-03-21 20:08:29'),
('20100321-200830443', '7416', 'Kab. Sumba Tengah', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830444', '7417', 'Kab. Sumba Barat Daya', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830445', '7418', 'Kab. Manggarai Timur', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830446', '7419', 'Kab. Nagekeo', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830447', '7488', 'Kab./Kota Lainnya', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830448', '7491', 'Kota Kupang', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830449', '8101', 'Kab. Maluku Tengah', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830450', '8102', 'Kab. Maluku Tenggara', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830451', '8103', 'Kab. Maluku Tenggara Barat', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830452', '8104', 'Kab. Buru', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830453', '8105', 'Kota Seram Bagian Barat', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830454', '8106', 'Kota Seram Bagian Timur', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830455', '8107', 'Kota Kepulauan Aru', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830456', '8188', 'Kab./Kota Lainnya', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830457', '8191', 'Kota Ambon', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830458', '8192', 'Kota Tual', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830459', '8201', 'Kab. Jayapura', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830460', '8202', 'Kab. Biak Numfor', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830461', '8210', 'Kab. Yapen-Waropen', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830462', '8211', 'Kab. Merauke', '29', 'admin', '2010-03-21 20:08:30'),
('20100321-200830463', '8212', 'Kab. Paniai', '30', 'admin', '2010-03-21 20:08:30'),
('20100321-200830464', '8213', 'Kab. Jayawijaya', '30', 'admin', '2010-03-21 20:08:30'),
('20100321-200830465', '8214', 'Kab. Nabire', '30', 'admin', '2010-03-21 20:08:30'),
('20100321-200830466', '8215', 'Kab. Mimika', '30', 'admin', '2010-03-21 20:08:30'),
('20100321-200830467', '8216', 'Kab. Puncak Jaya', '30', 'admin', '2010-03-21 20:08:30'),
('21', '8302', 'Kab. Halmahera Tengah', '30', 'admin', '2010-03-21 20:08:30'),
('22', '8303', 'Kab. Halmahera Utara', '30', 'admin', '2010-03-21 20:08:30'),
('23', '8304', 'Kab. Halmahera Timur', '30', 'admin', '2010-03-21 20:08:30'),
('24', '8305', 'Kab. Halmahera Barat', '30', 'admin', '2010-03-21 20:08:30'),
('25', '8306', 'Kab. Halmahera Selatan', '30', 'admin', '2010-03-21 20:08:30'),
('26', '8307', 'Kab. Kepulauan Sula', '30', 'admin', '2010-03-21 20:08:30'),
('27', '8388', 'Kab./Kota Lainnya', '30', 'admin', '2010-03-21 20:08:30'),
('28', '8390', 'Kota Ternate', '30', 'admin', '2010-03-21 20:08:30'),
('29', '8391', 'Kota Tidore Kepulauan', '30', 'admin', '2010-03-21 20:08:30'),
('3', '8221', 'Kab. Pegunungan Bintang', '30', 'admin', '2010-03-21 20:08:30'),
('30', '8401', 'Kab. Sorong', '30', 'admin', '2010-03-21 20:08:30'),
('31', '8402', 'Kab. Fak-Fak', '30', 'admin', '2010-03-21 20:08:30'),
('32', '8403', 'Kab. Manokwari', '30', 'admin', '2010-03-21 20:08:30'),
('33', '8404', 'Kab. Sorong Selatan', '30', 'admin', '2010-03-21 20:08:30'),
('34', '8405', 'Kab. Raja Ampat', '30', 'admin', '2010-03-21 20:08:30'),
('35', '8406', 'Kab. Kaimana', '30', 'admin', '2010-03-21 20:08:30'),
('36', '8407', 'Kab. Teluk Bintuni', '30', 'admin', '2010-03-21 20:08:30'),
('37', '8408', 'Kab. Teluk Wondama', '30', 'admin', '2010-03-21 20:08:30'),
('38', '8488', 'Kab./Kota Lainnya', '30', 'admin', '2010-03-21 20:08:30'),
('39', '8491', 'Kota Sorong', '30', 'admin', '2010-03-21 20:08:30'),
('4', '8222', 'Kab. Yahukimo', '30', 'admin', '2010-03-21 20:08:30'),
('5', '8223', 'Kab. Tolikara', '30', 'admin', '2010-03-21 20:08:30'),
('6', '8224', 'Kab. Waropen', '30', 'admin', '2010-03-21 20:08:30'),
('8', '8226', 'Kab. Boven Digoel', '30', 'admin', '2010-03-21 20:08:30'),
('9', '8227', 'Kab. Mappi', '30', 'admin', '2010-03-21 20:08:30');

-- --------------------------------------------------------

--
-- Table structure for table `kantor`
--

CREATE TABLE IF NOT EXISTS `kantor` (
  `id` varchar(30) NOT NULL,
  `kode` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat1` varchar(300) NOT NULL,
  `alamat2` varchar(300) NOT NULL,
  `kotaid` varchar(30) NOT NULL,
  `pejabat` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `bendahara` varchar(100) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`kotaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kantor`
--

INSERT INTO `kantor` (`id`, `kode`, `nama`, `alamat1`, `alamat2`, `kotaid`, `pejabat`, `jabatan`, `bendahara`, `user`, `jam`) VALUES
('1', '1', 'Kantor Pusat', '', '', '', '', '', '', 'admin', '2013-12-18 14:33:52');

-- --------------------------------------------------------

--
-- Table structure for table `kasakhir`
--

CREATE TABLE IF NOT EXISTS `kasakhir` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kasakhirdetail`
--

CREATE TABLE IF NOT EXISTS `kasakhirdetail` (
  `id` varchar(30) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `uang` double(15,0) NOT NULL,
  `kuantitas` double(9,0) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kasawal`
--

CREATE TABLE IF NOT EXISTS `kasawal` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kasawal`
--

INSERT INTO `kasawal` (`id`, `tanggal`, `nominal`, `user`, `jam`) VALUES
('admin20091017-194730', '2009-10-17', 1000.00, 'admin', '2009-10-17 19:56:10'),
('admin20091018-194336', '2009-10-18', 250000.00, 'admin', '2009-10-18 22:33:58'),
('admin20091021-165254', '2009-10-21', 50000000.00, 'admin', '2009-10-21 16:52:54'),
('admin20160509-101924', '2016-05-09', 0.00, 'admin', '2016-05-09 10:19:24'),
('admin20160510-101856', '2016-05-10', 0.00, 'admin', '2016-05-10 10:18:56'),
('admin20160512-090334', '2016-05-12', 2905000.00, 'admin', '2016-05-12 09:03:34'),
('admin20160517-110816', '2016-05-17', 1500000.00, 'admin', '2016-05-17 11:08:16'),
('admin20160519-101718', '2016-05-19', 1000000.00, 'admin', '2016-05-19 10:17:18'),
('admin20160718-103435', '2016-07-18', 2000000.00, 'admin', '2016-07-18 10:34:35'),
('admin20160723-104321', '2016-07-23', 600000.00, 'admin', '2016-07-23 10:43:21'),
('admin20160820-091223', '2016-08-20', 600000.00, 'admin', '2016-08-20 09:12:27'),
('admin20160906-123814', '2016-09-06', 500000.00, 'admin', '2016-09-06 12:38:14'),
('admin20160928-070959', '2016-09-28', 500000.00, 'admin', '2016-09-28 07:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `kasawaldetail`
--

CREATE TABLE IF NOT EXISTS `kasawaldetail` (
  `id` varchar(30) NOT NULL,
  `uang` double(15,0) NOT NULL,
  `kuantitas` double(9,0) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kaskeluar`
--

CREATE TABLE IF NOT EXISTS `kaskeluar` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kaskeluar`
--

INSERT INTO `kaskeluar` (`id`, `tanggal`, `nominal`, `keterangan`, `user`, `jam`) VALUES
('admin20091018-194310', '2009-10-18', 25000.00, 'asasa', 'admin', '2009-10-18 19:43:10'),
('admin20091018-194317', '2009-10-18', 2122222.00, 'asas', 'admin', '2009-10-18 19:43:17'),
('ADMN20160509-102549', '2016-05-09', 2000000.00, 'Menghapus Percobaan', 'admin', '2016-05-09 10:25:49'),
('ADMN20160512-090443', '2016-05-12', 47500.00, 'Mencatat Pembelian Kertas HVS F4 Tanggal .... Mei 2016', 'admin', '2016-05-12 09:04:43'),
('ADMN20160512-090515', '2016-05-12', 3000.00, 'Mencatat Pembelian Kuitansi Kosong Tanggal ... Mei 2016', 'admin', '2016-05-12 09:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `kasmasuk`
--

CREATE TABLE IF NOT EXISTS `kasmasuk` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kasmasuk`
--

INSERT INTO `kasmasuk` (`id`, `tanggal`, `nominal`, `keterangan`, `user`, `jam`) VALUES
('admin20091018-193313', '2009-10-18', 100000.00, 'adsad', 'admin', '2009-10-18 19:33:13'),
('admin20091018-193320', '2009-10-18', 232323.00, 'asaasas', 'admin', '2009-10-18 19:33:20'),
('ADMN20091018-222718', '2009-10-18', 300000.00, 'as', 'admin', '2009-10-18 22:27:18'),
('ADMN20160509-101913', '2016-05-09', 2000000.00, 'Percobaan', 'admin', '2016-05-09 10:21:31'),
('ADMN20160516-110911', '2016-05-16', 2500000.00, '', 'admin', '2016-05-16 11:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `kunci`
--

CREATE TABLE IF NOT EXISTS `kunci` (
  `id` varchar(30) NOT NULL,
  `bulan` date NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kuncidetail`
--

CREATE TABLE IF NOT EXISTS `kuncidetail` (
  `id` varchar(30) NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kunci` char(1) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE IF NOT EXISTS `laporan` (
  `id` varchar(30) NOT NULL,
  `kode` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `lokasi` varchar(300) NOT NULL,
  `data` varchar(3000) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id`, `kode`, `nama`, `jenis`, `lokasi`, `data`, `user`, `jam`) VALUES
('20150413-133005', '1', 'Daftar Anggota', 'Lain-lain', 'E:/data/projects/ksp2/laporan custom.rpx', 'select norekening,a.nama as anggota,j.nama as produk,t.bunga  from (tabungan t left join anggota a on anggotaid=a.id) left join tabjenis j on t.jenisid=j.id <filter> order by norekening', 'admin', '2015-04-15 11:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `laporanfilter`
--

CREATE TABLE IF NOT EXISTS `laporanfilter` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `filterid` varchar(50) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `kolom` varchar(100) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `limitkonfirm`
--

CREATE TABLE IF NOT EXISTS `limitkonfirm` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `user` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `limittransaksi`
--

CREATE TABLE IF NOT EXISTS `limittransaksi` (
  `id` varchar(30) NOT NULL,
  `maksimal` double(15,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manajemen`
--

CREATE TABLE IF NOT EXISTS `manajemen` (
  `id` varchar(30) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manajemendetail`
--

CREATE TABLE IF NOT EXISTS `manajemendetail` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `kelompok` varchar(30) NOT NULL,
  `pertanyaan` varchar(300) NOT NULL,
  `jawab` char(1) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing`
--

CREATE TABLE IF NOT EXISTS `marketing` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `kode` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `noktp` varchar(50) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `nohp` varchar(100) NOT NULL,
  `aktif` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE IF NOT EXISTS `parameter` (
  `id` varchar(100) NOT NULL,
  `jenis` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parameter`
--

INSERT INTO `parameter` (`id`, `jenis`) VALUES
('Alamat', '1'),
('Anggota', '1'),
('Angsuran', '1'),
('Angsuran Ke', '1'),
('Angsuran Terbilang', '1'),
('AngsuranBagiHasil', '2'),
('AngsuranPokok', '2'),
('Bagi Hasil', '1'),
('Bagi Hasil Per Bulan', '1'),
('Bagi Hasil Per Bulan Terbilang', '1'),
('Bagi Hasil Terbilang', '1'),
('BagiHasilNominal', '2'),
('Bulan (Tanggal) Romawi', '1'),
('Bulan Terbilang(Jatuh Tempo)', '1'),
('Bulan Terbilang(Tanggal)', '1'),
('Bulan(Jatuh Tempo)', '1'),
('Bulan(Tanggal)', '1'),
('DendaTunggakan', '2'),
('Enter', '1'),
('Hari Terbilang(Jatuh Tempo)', '1'),
('Hari Terbilang(Tanggal)', '1'),
('Hari(Jatuh Tempo)', '1'),
('Hari(Tanggal)', '1'),
('Jaminan', '1'),
('Jaminan Detail Keterangan(n)', '1'),
('Jaminan Detail Nama(n)', '1'),
('Jaminan Detail Nilai(n)', '1'),
('Jangka Waktu', '1'),
('Jangka Waktu Terbilang', '1'),
('Jatuh Tempo', '1'),
('Jatuh Tempo Terbilang', '1'),
('Jenis Angsuran', '1'),
('Jenis Identitas', '1'),
('Jenis Kelamin', '1'),
('Jumlah Saham', '1'),
('Kode Kantor', '1'),
('Kota', '1'),
('KSP', '1'),
('Manajer', '1'),
('Marketing', '1'),
('No. Anggota', '1'),
('No. HP', '1'),
('No. Identitas', '1'),
('No. Pinjaman', '1'),
('No. Simpanan', '1'),
('No. Simpanan Berjangka', '1'),
('Nominal', '2'),
('Nominal Setor', '1'),
('Nominal Simpanan', '1'),
('Nominal Simpanan Berjangka', '1'),
('Nominal Simpanan Berjangka Terbilang', '1'),
('Nominal Simpanan Terbilang', '1'),
('NPWP', '1'),
('Pejabat', '1'),
('Pekerjaan', '1'),
('Plafon', '1'),
('Plafon Terbilang', '1'),
('Produk Pinjaman', '1'),
('Produk Simpanan', '1'),
('Produk Simpanan Berjangka', '1'),
('Saham', '1'),
('Saksi Alamat(n)', '1'),
('Saksi No. KTP(n)', '1'),
('Saksi Pekerjaan(n)', '1'),
('Saksi Tanggal Lahir(n)', '1'),
('Saksi Tempat Lahir(n)', '1'),
('Saksi(n)', '1'),
('Satuan Waktu', '1'),
('Sektor', '1'),
('SisaBagiHasil', '2'),
('SisaPinjaman', '2'),
('SisaPokok', '2'),
('Tahun(Jatuh Tempo)', '1'),
('Tahun(Tanggal)', '1'),
('Tanggal', '1'),
('Tanggal Gabung', '1'),
('Tanggal Hari Ini', '1'),
('Tanggal Hari Ini Terbilang', '1'),
('Tanggal Hari Ini/', '1'),
('Tanggal Lahir', '1'),
('Tanggal/', '1'),
('Telepon', '1'),
('Tempat Lahir', '1'),
('Terlambat', '2'),
('Tgl. Pencairan Pinjaman', '1'),
('Tgl. Setor', '1'),
('Total Pinjaman', '1'),
('Total Pinjaman Terbilang', '1'),
('Total Sisa Pinjaman', '1'),
('Total Sisa Pinjaman Terbilang', '1'),
('Tunggakan', '2'),
('Tunggakan Pinjaman', '1'),
('User', '1'),
('X Angsur', '1'),
('X Sisa', '1');

-- --------------------------------------------------------

--
-- Table structure for table `parkanggota`
--

CREATE TABLE IF NOT EXISTS `parkanggota` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `jenisid` char(1) NOT NULL,
  `noid` varchar(50) NOT NULL,
  `tarifid` varchar(30) NOT NULL,
  `stnk` varchar(100) NOT NULL,
  `nopolisi` varchar(30) NOT NULL,
  `warna` varchar(100) NOT NULL,
  `norangka` varchar(100) NOT NULL,
  `nomesin` varchar(100) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `aktif` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`jenisid`,`tarifid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parkbayar`
--

CREATE TABLE IF NOT EXISTS `parkbayar` (
  `id` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `periode` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `anggotaid` varchar(30) NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `nominal` double(15,0) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`anggotaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parkgerbang`
--

CREATE TABLE IF NOT EXISTS `parkgerbang` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `aktif` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parkgerbangdetail`
--

CREATE TABLE IF NOT EXISTS `parkgerbangdetail` (
  `id` varchar(30) NOT NULL,
  `tarifid` varchar(30) NOT NULL,
  `kapasitas` double(9,0) NOT NULL,
  KEY `id` (`id`,`tarifid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parkjam`
--

CREATE TABLE IF NOT EXISTS `parkjam` (
  `id` varchar(30) NOT NULL,
  `tarifid` varchar(30) NOT NULL,
  `minimal` double(9,0) NOT NULL,
  `maksimal` double(9,0) NOT NULL,
  `nominal` double(15,0) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`tarifid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parkkeluar`
--

CREATE TABLE IF NOT EXISTS `parkkeluar` (
  `id` varchar(30) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `masukid` varchar(30) NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `lama` double(9,2) NOT NULL,
  `nominal` double(15,0) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`masukid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parkmasuk`
--

CREATE TABLE IF NOT EXISTS `parkmasuk` (
  `id` varchar(30) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `gerbangid` varchar(30) NOT NULL,
  `tarifid` varchar(30) NOT NULL,
  `nopolisi` varchar(30) NOT NULL,
  `tarif` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`gerbangid`,`tarifid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parktarif`
--

CREATE TABLE IF NOT EXISTS `parktarif` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `njam` double(15,0) NOT NULL,
  `nhari` double(15,0) NOT NULL,
  `nbulan` double(15,0) NOT NULL,
  `aktif` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE IF NOT EXISTS `pekerjaan` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pekerjaan`
--

INSERT INTO `pekerjaan` (`id`, `nama`, `user`, `jam`) VALUES
('20090628-000703', 'Karyawan Swasta', 'admin', '2009-06-28 00:07:03'),
('20090628-000706', 'PNS', 'admin', '2009-06-28 00:07:06'),
('20090628-000726', 'Wiraswata', 'admin', '2009-06-28 00:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE IF NOT EXISTS `pendidikan` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjnopajak`
--

CREATE TABLE IF NOT EXISTS `penjnopajak` (
  `id` varchar(30) NOT NULL,
  `mulai` varchar(100) NOT NULL,
  `sampai` varchar(100) NOT NULL,
  `aktif` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE IF NOT EXISTS `pinjaman` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `nopinjaman` varchar(30) NOT NULL,
  `anggotaid` varchar(30) NOT NULL,
  `jaminanid` varchar(30) NOT NULL,
  `jenisid` varchar(30) NOT NULL,
  `marketingid` varchar(30) NOT NULL,
  `sektorid` varchar(30) NOT NULL,
  `angsuran` varchar(20) NOT NULL,
  `plafon` double(15,2) NOT NULL,
  `nangsuran` double(15,2) NOT NULL,
  `bunga` double(15,4) NOT NULL,
  `jangkawaktu` double(9,0) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `pembayaran` char(1) NOT NULL,
  `manual` char(1) NOT NULL,
  `tabunganid` varchar(30) NOT NULL,
  `kodeid` varchar(30) NOT NULL,
  `kodekoreksi` varchar(30) NOT NULL,
  `SWPID` varchar(30) NOT NULL,
  `SPPID` varchar(30) NOT NULL,
  `angsuranke` double(9,0) NOT NULL,
  `rekeningkoran` char(1) NOT NULL,
  `cairsimpanan` char(1) NOT NULL,
  `aktif` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`anggotaid`,`jaminanid`,`jenisid`,`marketingid`,`tabunganid`,`kodeid`,`SWPID`,`SPPID`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjaman`
--

INSERT INTO `pinjaman` (`id`, `tanggal`, `nopinjaman`, `anggotaid`, `jaminanid`, `jenisid`, `marketingid`, `sektorid`, `angsuran`, `plafon`, `nangsuran`, `bunga`, `jangkawaktu`, `satuan`, `pembayaran`, `manual`, `tabunganid`, `kodeid`, `kodekoreksi`, `SWPID`, `SPPID`, `angsuranke`, `rekeningkoran`, `cairsimpanan`, `aktif`, `kantorid`, `user`, `jam`) VALUES
('160516-110133', '2016-05-16', '51.16050002', 'ADMN20160514-090943', '20090629-231830', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-05-16 11:01:33'),
('160516-111908', '2016-05-16', '51.16050003', 'ADMN20160510-101031', '20090629-231830', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-05-16 11:19:08'),
('160517-110535', '2016-05-17', '51.16050004', 'ADMN20160504-105207', '20090629-231830', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-05-17 11:05:35'),
('160519-101313', '2016-05-19', '51.16050005', 'ADMN20160504-115300', '20090629-231830', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-05-19 10:13:13'),
('160519-101450', '2016-05-19', '51.16050006', 'ADMN20160504-114537', '20090629-231830', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-05-19 10:14:50'),
('160718-103211', '2016-07-18', '51.16070001', 'ADMN20160510-100742', '20090629-231830', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-07-18 10:32:11'),
('160718-103252', '2016-07-18', '51.16070002', 'ADMN20160504-110951', '20090629-231830', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-07-18 10:32:52'),
('160718-103327', '2016-07-18', '51.16070003', 'ADMN20160510-100634', '20090629-231830', '20090810-091322', '', '', 'Flat', 200000.00, 22000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-07-18 10:33:39'),
('160723-103609', '2016-07-23', '51.16070004', 'ADMN20160510-101211', '20090629-231830', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-07-23 10:36:09'),
('160820-091208', '2016-08-20', '51.16080001', 'ADMN20160504-103221', '20090629-231830', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-08-20 09:12:08'),
('160902-094100', '2016-09-02', '51.16090001', 'ADMN20160504-111419', '20090629-231830', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-09-02 09:41:14'),
('160928-070429', '2016-09-28', '51.16090002', 'ADMN20160510-101123', '20090629-225925', '20090810-091322', '', '', 'Flat', 500000.00, 55000.00, 12.0000, 10, 'Bulan', '1', '1', '', '', '', '', '', 0, '0', '0', '1', '1', 'admin', '2016-09-28 07:04:29');

-- --------------------------------------------------------

--
-- Table structure for table `pinjamanbunga`
--

CREATE TABLE IF NOT EXISTS `pinjamanbunga` (
  `id` varchar(30) NOT NULL,
  `tglbunga` date NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjamandetail`
--

CREATE TABLE IF NOT EXISTS `pinjamandetail` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `persen` char(1) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  KEY `id` (`id`,`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjamandetail`
--

INSERT INTO `pinjamandetail` (`id`, `nama`, `nominal`, `persen`, `accountid`) VALUES
('160516-110133', 'Administrasi', 0.00, '1', '931-05'),
('160516-111908', 'Administrasi', 0.00, '1', '931-05'),
('160517-110535', 'Administrasi', 0.00, '1', '931-05'),
('160519-101313', 'Administrasi', 0.00, '1', '931-05'),
('160519-101450', 'Administrasi', 0.00, '1', '931-05'),
('160718-103211', 'Administrasi', 0.00, '1', '931-05'),
('160718-103252', 'Administrasi', 0.00, '1', '931-05'),
('160718-103327', 'Administrasi', 0.00, '1', '931-05'),
('160723-103609', 'Administrasi', 0.00, '1', '931-05'),
('160820-091208', 'Administrasi', 0.00, '1', '931-05'),
('160902-094100', 'Administrasi', 0.00, '1', '931-05'),
('160928-070429', 'Administrasi', 0.00, '1', '931-05');

-- --------------------------------------------------------

--
-- Table structure for table `pinjamandetail2`
--

CREATE TABLE IF NOT EXISTS `pinjamandetail2` (
  `id` varchar(30) NOT NULL,
  `suratid` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `surat` mediumblob,
  KEY `id` (`id`,`suratid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjangsuranbank`
--

CREATE TABLE IF NOT EXISTS `pinjangsuranbank` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `nobukti` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `kantorid` varchar(30) NOT NULL DEFAULT '',
  `user` varchar(30) NOT NULL DEFAULT '',
  `jam` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjangsuranbankdetail`
--

CREATE TABLE IF NOT EXISTS `pinjangsuranbankdetail` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `simwaid` varchar(30) NOT NULL DEFAULT '',
  `pinjamanid` varchar(30) NOT NULL DEFAULT '',
  `simkurid` varchar(30) NOT NULL DEFAULT '0.00',
  `nominal` double(15,2) NOT NULL DEFAULT '0.00',
  KEY `id` (`id`,`pinjamanid`,`simwaid`,`simkurid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjangsurandebet`
--

CREATE TABLE IF NOT EXISTS `pinjangsurandebet` (
  `id` varchar(30) NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `marketingid` varchar(30) NOT NULL,
  `jenisid` varchar(30) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`marketingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjangsurandebetdetail`
--

CREATE TABLE IF NOT EXISTS `pinjangsurandebetdetail` (
  `id` varchar(30) NOT NULL,
  `noangsur` varchar(30) NOT NULL,
  `pinjamanid` varchar(30) NOT NULL,
  `simpananid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `pembulatan` double(15,2) NOT NULL,
  KEY `id` (`id`,`pinjamanid`,`simpananid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjangsurantunai`
--

CREATE TABLE IF NOT EXISTS `pinjangsurantunai` (
  `id` varchar(30) NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `marketingid` varchar(30) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`marketingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjangsurantunaidetail`
--

CREATE TABLE IF NOT EXISTS `pinjangsurantunaidetail` (
  `id` varchar(30) NOT NULL,
  `noangsur` varchar(30) NOT NULL,
  `pinjamanid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `pembulatan` double(15,2) NOT NULL,
  KEY `id` (`id`,`pinjamanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjcetakangsuran`
--

CREATE TABLE IF NOT EXISTS `pinjcetakangsuran` (
  `id` varchar(10) NOT NULL,
  `pinjamanid` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `pokok` double(15,2) NOT NULL,
  `bunga` double(15,2) NOT NULL,
  `denda` double(15,2) NOT NULL,
  `angsuran` double(15,2) NOT NULL,
  `sisa` double(15,2) NOT NULL,
  `swp` double(15,2) NOT NULL,
  `userid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  KEY `id` (`id`,`pinjamanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjhapus`
--

CREATE TABLE IF NOT EXISTS `pinjhapus` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `pinjamanid` varchar(30) NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `debet` double(15,2) NOT NULL,
  `kredit` double(15,2) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `tipe` char(1) NOT NULL,
  `manual` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`pinjamanid`,`jurnalid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjhapusdetail`
--

CREATE TABLE IF NOT EXISTS `pinjhapusdetail` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjjaminan`
--

CREATE TABLE IF NOT EXISTS `pinjjaminan` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjjaminan`
--

INSERT INTO `pinjjaminan` (`id`, `nama`, `keterangan`, `nominal`) VALUES
('160928-070429', 'Berat', '', 0.00),
('160928-070429', 'Kadar', '', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `pinjjaminankembali`
--

CREATE TABLE IF NOT EXISTS `pinjjaminankembali` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `pinjamanid` varchar(30) NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `penerima` varchar(100) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`pinjamanid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjjaminankembaliksy`
--

CREATE TABLE IF NOT EXISTS `pinjjaminankembaliksy` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `pinjamanid` varchar(30) NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `penerima` varchar(100) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`pinjamanid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjjenis`
--

CREATE TABLE IF NOT EXISTS `pinjjenis` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `kode` varchar(5) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `bunga` double(15,4) NOT NULL,
  `accountbunga` varchar(30) NOT NULL,
  `ditangguhkan` char(1) NOT NULL,
  `accditangguhkan` varchar(30) NOT NULL,
  `kas` char(1) NOT NULL,
  `accountbank` varchar(30) NOT NULL,
  `insentif` double(9,2) NOT NULL,
  `simpanan` char(1) NOT NULL,
  `swpcair` char(1) NOT NULL,
  `swpangsur` char(1) NOT NULL,
  `nsimpanan` double(15,2) NOT NULL,
  `simpananpokok` char(1) NOT NULL,
  `nsimpananpokok` double(15,2) NOT NULL,
  `toleransi` double(9,0) NOT NULL,
  `angsuran` varchar(20) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`accountid`,`accountbunga`,`accountbank`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjjenis`
--

INSERT INTO `pinjjenis` (`id`, `kode`, `nama`, `accountid`, `bunga`, `accountbunga`, `ditangguhkan`, `accditangguhkan`, `kas`, `accountbank`, `insentif`, `simpanan`, `swpcair`, `swpangsur`, `nsimpanan`, `simpananpokok`, `nsimpananpokok`, `toleransi`, `angsuran`, `user`, `jam`) VALUES
('20090703-142458', '31', 'pinjaman emas', '150-02', 10.7500, '900-01', '0', '', '1', '', 0.00, '0', '0', '0', 0.00, '0', 0.00, 0, '', 'admin', '2009-08-10 13:38:48'),
('20090704-222857', '41', 'pinjaman jaminan rumah', '150-02', 15.0000, '900-01', '0', '', '1', '', 0.00, '0', '0', '0', 0.00, '0', 0.00, 0, '', 'admin', '2009-08-11 09:06:10'),
('20090810-091322', '51', 'Pinjaman bebas', '150-01', 12.0000, '900-01', '0', '', '1', '', 0.00, '0', '0', '0', 0.00, '0', 0.00, 5, 'Flat', 'admin', '2016-05-14 09:45:11');

-- --------------------------------------------------------

--
-- Table structure for table `pinjjenisdetail`
--

CREATE TABLE IF NOT EXISTS `pinjjenisdetail` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `persen` char(1) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `cair` char(1) NOT NULL,
  `tunggakan` char(1) NOT NULL,
  `dendat` char(1) NOT NULL,
  `dendah` char(1) NOT NULL,
  `angsuran` char(1) NOT NULL,
  `penalti` char(1) NOT NULL,
  `penaltip` char(1) NOT NULL,
  `rumus` varchar(500) NOT NULL,
  `rumusa` varchar(500) NOT NULL,
  `rumusp` varchar(500) NOT NULL,
  KEY `id` (`id`,`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjjenisdetail`
--

INSERT INTO `pinjjenisdetail` (`id`, `nama`, `nominal`, `persen`, `accountid`, `cair`, `tunggakan`, `dendat`, `dendah`, `angsuran`, `penalti`, `penaltip`, `rumus`, `rumusa`, `rumusp`) VALUES
('20090703-142458', 'administrasi', 35000.00, '0', '931-05', '1', '0', '0', '0', '', '0', '0', 'Nominal', '', ''),
('20090704-222857', 'notaris', 350000.00, '0', '931-08', '1', '0', '0', '0', '', '0', '0', 'Nominal', '', ''),
('20090704-222857', 'provisi', 10.00, '1', '910-01', '1', '0', '0', '0', '', '0', '0', 'Nominal/100*Plafon', '', ''),
('20090704-222857', 'survei', 250000.00, '0', '931-05', '1', '0', '0', '0', '', '0', '0', 'Nominal', '', ''),
('20090704-222857', 'denda', 10.00, '1', '931-02', '1', '0', '0', '0', '', '0', '0', 'Nominal/100*Plafon', '', ''),
('20090704-222857', 'penalti', 15.00, '1', '931-06', '1', '0', '0', '0', '', '0', '0', 'Nominal/100*Plafon', '', ''),
('20090810-091322', 'Administrasi', 0.00, '1', '931-05', '1', '0', '0', '0', '0', '0', '0', 'Angsuran*0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pinjjenisdetail2`
--

CREATE TABLE IF NOT EXISTS `pinjjenisdetail2` (
  `id` varchar(30) NOT NULL,
  `kualitasid` varchar(30) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  KEY `id` (`id`,`kualitasid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjjenisdetail2`
--

INSERT INTO `pinjjenisdetail2` (`id`, `kualitasid`, `keterangan`) VALUES
('20090810-091322', '1', ''),
('20090810-091322', '2', ''),
('20090810-091322', '3', ''),
('20090810-091322', '4', '');

-- --------------------------------------------------------

--
-- Table structure for table `pinjpasal`
--

CREATE TABLE IF NOT EXISTS `pinjpasal` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjpasal`
--

INSERT INTO `pinjpasal` (`id`, `user`, `jam`) VALUES
('1', 'admin', '2013-12-18 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pinjpasaldetail`
--

CREATE TABLE IF NOT EXISTS `pinjpasaldetail` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `level` int(4) NOT NULL,
  `keterangan` mediumtext NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjpasaldetail`
--

INSERT INTO `pinjpasaldetail` (`id`, `id2`, `level`, `keterangan`) VALUES
('1', '1', 1, ''),
('1', '2', 2, 'Koperasi dengan ini memberikan fasilitas pinjaman Flat kepada Peminjam sebesar Rp. <<Plafon>> (<<Plafon Terbilang>>)'),
('1', '3', 2, 'Peminjam setuju untuk menerima pinjaman tersebut diatas.'),
('1', '4', 2, 'Untuk Pendapatan pinjaman tersebut, surat perjanjian ini dapat berlaku sebagai kwitansinya.'),
('1', '5', 1, 'Pinjaman ini diberikan untuk jangka waktu selama <<Jangka Waktu>> bulan, terhitung mulai tanggal <<Tanggal>> dan akan berakhir pada tanggal <<Jatuh Tempo>>'),
('1', '6', 1, ''),
('1', '7', 2, 'Untuk pinjaman sebagaimana dimaksud dalam pasal 1 diatas, maka kepada Peminjam dikenakan bagi hasil sebesar <<Bagi Hasil>> % (<<Bagi Hasil Terbilang>> persen) Flat per bulan dari besarnya pinjaman yang diberikan tersebut dan harus dibayar tiap-tiap bulan bersama-sama dengan pembayaran angsuran pokoknya. Bilamana jatuh tempo pembayaran tersebut tiap bulannya jatuh pada hari libur, maka bagi hasil dibayar satu hari sebelumnya.'),
('1', '8', 2, 'Koperasi  berhak  untuk  menaikkan  atau   menurunkan   suku   bagi hasil   tersebut   disesuaikan   dengan perkembangan moneter. Kenaikan atau penurunan  suku  bagi hasil  tersebut  cukup  diberitahukan kepada Peminjam dan mengikat Peminjam.<<Enter>>Apabila Peminjam  tidak setuju  dengan  perubahan  suku  bagi hasil  tersebut, maka  perjanjian  ini  dapat dihentikan  secara  sepihak  oleh Koperasi dan Peminjam wajib melunasi pinjamannya tersebut berikut bagi hasil, denda-denda  dan  biaya-biaya  (jika ada). Selama belum melunasi pinjamannya tersebut, maka tetap berlaku ketentuan suku bagi hasil baru yang sudah ditetapkan oleh Koperasi.'),
('1', '9', 2, 'Peminjam dikenakan provisi sebesar <<provisi>> (<<provisi Terbilang>>) dan biaya administrasi sebesar <<administrasi>> (<<administrasi Terbilang>>) dari jumlah pinjaman tersebut dalam pasal 1 yang harus dibayar dengan sekaligus pada saat ditandatanganinya perjanjian ini.'),
('1', '10', 1, ''),
('1', '11', 2, 'Pembayaran pokok pinjaman dilakukan dengan angsuran bulanan secara berturut-turut bersama-sama dengan pembayaran bagi hasilnya, yang besarnya angsuran pokok dan bagi hasil ditetapkan tiap-tiap bulan adalah sebesar Rp. <<Angsuran>> (<<Angsuran Terbilang>>), yang harus dibayar selama <<Jangka Waktu>> (<<Jangka Waktu Terbilang>>) kali angsuran. Pembayaran angsuran tersebut harus dilakukan sebelum atau selambat-lambatnya pada setiap tanggal <<Hari(Tanggal)>>, untuk pertama kalinya pada tanggal <<Tanggal>>.'),
('1', '12', 2, 'Peminjam   diperkenankan  untuk  melunasi  pinjaman  tersebut  sebelum  jangka  waktu  pinjaman  ini berakhir, asalkan  dilakukan  setelah  1 (satu)  tahun.  Pelunasan  pinjaman  yang  dipercepat  ini  tidak dikenakan penalty dan bagi hasilnya hanya dihitung sampai dengan tanggal waktu pelunasan.'),
('1', '13', 2, 'Apabila pelunasan  pinjaman  dilakukan  sebelum  1 (satu) tahun, maka  kepada  Peminjam  dikenakan penalty yang besarnya ditetapkan sebesar 3 (tiga) kali dari bagi hasil pinjaman per bulan.'),
('1', '14', 2, 'Apabila  Peminjam  lalai  membayar  angsuran  pokok  dan  bagi hasil  3  (tiga)  kali  berturut-turut,  maka perjanjian  ini dapat  dihentikan  dengan  seketika  dan  Peminjam  wajib  melunasi  pinjaman  tersebut berikut bagi hasil, denda-denda dan  biaya-biaya  kepada  Koperasi dengan seketika  dan  sekaligus  lunas, tanpa diperlukan perantaraan dengan surat juru sita atau surat peringatan lain semacam itu.'),
('1', '15', 1, 'Pembayaran angsuran  pokok  dan  bagi hasil  ataupun  pelunasan  pinjaman tersebut  dilakukan  di kantor Koperasi dengan mendapat kwitansi.'),
('1', '16', 1, 'Dengan  menyimpang dari ketentuan pasal 4 diatas, Koperasi berhak untuk menagih pinjaman tersebut dalam pasal 1 dengan seketika  dan  harus dilunasi  oleh  Peminjam  dengan  sekaligus, apabila  terjadi hal-hal sebagai berikut :'),
('1', '17', 2, 'Peminjam meninggal dunia, jatuh pailit atau dinyatakan pailit oleh pengadilan;'),
('1', '18', 2, 'Peminjam ditaruh dibawah pengampuan (curatele);'),
('1', '19', 2, 'Peminjam diberikan penundaan pembayaran oleh pihak ketiga;'),
('1', '20', 2, 'Barang-barang milik  Peminjam  sebagian  atau  seluruhnya  disita  atau  dilakukan  penyitaan  oleh pengadilan;'),
('1', '21', 2, 'Peminjam pindah tempat tinggal tanpa memberitahukan alamatnya yang baru kepada Koperasi;'),
('1', '22', 2, 'Peminjam tidak memenuhi salah satu atau lebih ketentuan-ketentuan dalam perjanjian ini.'),
('1', '23', 1, 'Semua biaya-biaya  dan  ongkos-ongkos,  termasuk  juga  ongkos pengacara  atau  kuasa dari Koperasi yang diberi hak  untuk  melakukan penagihan-penagihan itu, honorarium Notaris, menjadi tanggungan dari dan harus dibayar oleh Peminjam sepenuhnya.'),
('1', '24', 1, ''),
('1', '25', 2, 'Untuk   menjamin   pembayaran   lunas,  penuh,  tertib  dan  dengan   semestinya  semua  jumlah  yang terhutang  dan   wajib  dibayar  oleh  Peminjam   kepada   Koperasi   berdasarkan   perjanjian   ini  dan perubahan-perubahan dan/atau perpanjangan-perpanjangannya dan/atau pembaharuan-pembaharuannya, baik berupa pinjaman pokok, bagi hasil, biaya-biaya, denda-denda dan lain-lain jumlah uang yang wajib dibayar oleh Peminjam kepada Koperasi, maka Peminjam dengan ini menyerahkan kepada Koperasi jaminan (-jaminan) yang pengalihan dan hak kepemilikannya dibuktikan dengan dokumen atau perjanjian-perjanjian yang dibuat dalam bentuk, jumlah dan isi yang memuaskan Koperasi, termasuk namun tidak terbatas pada hal-hal sebagai berikut, berikut segala tambahan dan/atau penggantinya yang diuraikan dalam suatu perjanjian terpisah namun merupakan satu kesatuan dengan perjanjian ini, yaitu : <<Jaminan>>'),
('1', '26', 4, 'jaminan'),
('1', '27', 2, 'Peminjam dengan ini berjanji tidak akan menjual, menghilangkan dan memindahtangankan kepada pihak ketiga aset-aset yang berhubungan dengan jaminan (-jaminan) yang telah dan akan diserahkan kepada Koperasi tanpa persetujuan tertulis terlebih dahulu dari Koperasi.'),
('1', '28', 2, 'Peminjam dengan ini memberi kuasa dengan hak substitusi kepada Koperasi kuasa mana tidak dapat ditarik kembali, dibatalkan atau menjadi berhenti dengan melepaskan segala peraturan-peraturan yang menentukan tentang berhentinya suatu kuasa, antara lain pasal 1813 Kitab Undang-undang Hukum Perdata, untuk menjual barang jaminan diatas dengan cara dan harga yang dianggap baik oleh Koperasi, bilamana Peminjam tidak mampu atau lalai melunasi pinjaman yang tersebut dalam pasal 1, termasuk bagi hasil, biaya, denda, provisi dan jumlah uang lain yang wajib dibayar oleh Peminjam kepada Koperasi berdasarkan perjanjian ini dan/atau perubahan-perubahannya, perpanjangan-perpanjangannya atau pembaharuan-pembaharuannya, dan memperhitungkan hasil penjualan tersebut dengan hutang Peminjam kepada Koperasi.<<Enter>><<Enter>>Apabila  ternyata  dari  hasil  penjualan tersebut ada kelebihan, maka kelebihan itu wajib dikembalikan kepada  Peminjam. Dan  apabila  ternyata  kurang, maka  Koperasi berhak untuk menagih kekurangan tersebut kepada Peminjam.'),
('1', '29', 1, 'Akhirnya  para pihak  sepakat  untuk  memilih domisili hukum pada kantor Panitera pengadilan Negeri Kabupaten  Semarang, dengan  tidak  mengurangi  hak  dari  Koperasi  untuk  memohon eksekusi atau mengajukan  tuntutan/gugatan   hukum  berdasarkan  perjanjian  ini  pada  pengadilan-pengadilan  lain dalam wilayah Republik Indonesia.');

-- --------------------------------------------------------

--
-- Table structure for table `pinjpenaltitunai`
--

CREATE TABLE IF NOT EXISTS `pinjpenaltitunai` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `nobukti` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `marketingid` varchar(30) NOT NULL DEFAULT '',
  `kantorid` varchar(30) NOT NULL DEFAULT '',
  `user` varchar(30) NOT NULL DEFAULT '',
  `jam` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`marketingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjpenaltitunaidetail`
--

CREATE TABLE IF NOT EXISTS `pinjpenaltitunaidetail` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `noangsur` varchar(30) NOT NULL DEFAULT '',
  `pinjamanid` varchar(30) NOT NULL DEFAULT '',
  `nominal` double(15,2) NOT NULL DEFAULT '0.00',
  `pembulatan` double(15,2) NOT NULL DEFAULT '0.00',
  KEY `id` (`id`,`pinjamanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjpenjamin`
--

CREATE TABLE IF NOT EXISTS `pinjpenjamin` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `noktp` varchar(50) NOT NULL,
  `hubungan` varchar(100) NOT NULL,
  `ibu` varchar(100) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `tampil` char(1) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjperingatan`
--

CREATE TABLE IF NOT EXISTS `pinjperingatan` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `pinjamanid` varchar(30) NOT NULL,
  `tunggakan` varchar(10) NOT NULL,
  `jatuhtempo` date NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`pinjamanid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjperingatandetail`
--

CREATE TABLE IF NOT EXISTS `pinjperingatandetail` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `suratid` varchar(30) NOT NULL DEFAULT '',
  `keterangan` varchar(100) NOT NULL DEFAULT '',
  `surat` mediumblob,
  KEY `id` (`id`,`suratid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjperpanjangan`
--

CREATE TABLE IF NOT EXISTS `pinjperpanjangan` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `pinjamanid` varchar(30) NOT NULL,
  `sisapokok` double(15,2) NOT NULL,
  `sisabunga` double(15,2) NOT NULL,
  `hitung` char(1) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`pinjamanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjproposal`
--

CREATE TABLE IF NOT EXISTS `pinjproposal` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `plafon` double(15,2) NOT NULL,
  `nangsuran` double(15,2) NOT NULL,
  `bunga` double(15,4) NOT NULL,
  `jangkawaktu` double(9,2) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `angsuran` varchar(30) NOT NULL,
  `setiapsaat` char(1) NOT NULL,
  `jenisid` varchar(30) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`jenisid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjproposal`
--

INSERT INTO `pinjproposal` (`id`, `tanggal`, `nobukti`, `nama`, `plafon`, `nangsuran`, `bunga`, `jangkawaktu`, `satuan`, `angsuran`, `setiapsaat`, `jenisid`, `kantorid`, `user`, `jam`) VALUES
('ADMN20160516-095343', '2016-05-16', 'PR.1605001', 'Aam Maryati', 500000.00, 55000.00, 12.0000, 10.00, 'Bulan', 'Flat', '0', '20090810-091322', '1', 'admin', '2016-05-16 09:53:43');

-- --------------------------------------------------------

--
-- Table structure for table `pinjproposaldetail`
--

CREATE TABLE IF NOT EXISTS `pinjproposaldetail` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `persen` char(1) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  KEY `id` (`id`,`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjproposaldetail`
--

INSERT INTO `pinjproposaldetail` (`id`, `nama`, `nominal`, `persen`, `accountid`) VALUES
('ADMN20160514-093237', 'Administrasi', 0.00, '1', '931-05'),
('ADMN20160514-093313', 'Administrasi', 0.00, '1', '931-05'),
('ADMN20160516-095343', 'Administrasi', 0.00, '1', '931-05');

-- --------------------------------------------------------

--
-- Table structure for table `pinjsaksi`
--

CREATE TABLE IF NOT EXISTS `pinjsaksi` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `tmplahir` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `noktp` varchar(100) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `pekerjaanid` varchar(30) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjtagihan`
--

CREATE TABLE IF NOT EXISTS `pinjtagihan` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `nopinjaman` varchar(30) NOT NULL,
  `anggota` varchar(100) NOT NULL,
  `angsuran` double(15,2) NOT NULL,
  `jangkawaktu` double(9,2) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `tunggakan` double(9,0) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjtemplate`
--

CREATE TABLE IF NOT EXISTS `pinjtemplate` (
  `id` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `surat` mediumblob,
  `jenis` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjtransaksi`
--

CREATE TABLE IF NOT EXISTS `pinjtransaksi` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `pinjamanid` varchar(30) NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `debet` double(15,2) NOT NULL,
  `kredit` double(15,2) NOT NULL,
  `bayar` double(15,2) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `tipe` char(1) NOT NULL,
  `manual` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`pinjamanid`,`jurnalid`,`kantorid`),
  KEY `id3` (`pinjamanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjtransaksi`
--

INSERT INTO `pinjtransaksi` (`id`, `tanggal`, `nobukti`, `pinjamanid`, `jurnalid`, `debet`, `kredit`, `bayar`, `keterangan`, `tipe`, `manual`, `kantorid`, `user`, `jam`) VALUES
('ADMN20160516-111408', '2016-05-16', 'BKK.010516', '160516-110133', 'ADMN1605160007', 0.00, 500000.00, 0.00, 'Pinjaman Iin Lasmanawati', '1', '0', '1', 'admin', '2016-05-16 11:27:54'),
('ADMN20160516-112314', '2016-05-16', 'BKK.020516', '160516-111908', 'ADMN1605160008', 0.00, 500000.00, 0.00, 'Pinjaman Enok Armilah', '1', '0', '1', 'admin', '2016-05-16 11:28:12'),
('ADMN20160517-110907', '2016-05-17', 'BKK.030516', '160517-110535', 'ADMN1605170001', 0.00, 500000.00, 0.00, 'Pinjaman N. Ilah Jamilah', '1', '0', '1', 'admin', '2016-05-17 11:09:07'),
('ADMN20160519-101759', '2016-05-19', 'BKK.040516', '160519-101313', 'ADMN1605190001', 0.00, 500000.00, 0.00, '', '1', '0', '1', 'admin', '2016-05-19 10:17:59'),
('ADMN20160519-101857', '2016-05-19', 'BKK.050516', '160519-101450', 'ADMN1605190002', 0.00, 500000.00, 0.00, '', '1', '0', '1', 'admin', '2016-05-19 10:18:57'),
('ADMN20160602-095444', '2016-06-02', 'BKM.Ang.010616', '160517-110535', 'ADMN1606020001', 50000.00, 0.00, 0.00, '1', '2', '0', '1', 'admin', '2016-06-02 09:55:59'),
('ADMN20160603-092330', '2016-06-03', 'BKM.Ang.020616', '160519-101313', 'ADMN1606030001', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-06-03 09:23:31'),
('ADMN20160603-092353', '2016-06-03', 'BKM.Ang.030616', '160519-101450', 'ADMN1606030002', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-06-03 09:23:53'),
('ADMN20160616-110539', '2016-06-16', 'BKM.Ang.040616', '160516-111908', 'ADMN1606160005', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-06-16 11:05:39'),
('ADMN20160718-103511', '2016-07-18', 'BKK.010616', '160718-103211', 'ADMN1607180003', 0.00, 500000.00, 0.00, '', '1', '0', '1', 'admin', '2016-07-18 10:35:11'),
('ADMN20160718-103535', '2016-07-18', 'BKK.020616', '160718-103252', 'ADMN1607180004', 0.00, 500000.00, 0.00, '', '1', '0', '1', 'admin', '2016-07-18 10:35:35'),
('ADMN20160718-103557', '2016-07-18', 'BKK.030616', '160718-103327', 'ADMN1607180005', 0.00, 200000.00, 0.00, '', '1', '0', '1', 'admin', '2016-07-18 10:35:57'),
('ADMN20160718-115725', '2016-07-18', 'BKM.Ang.010716', '160519-101313', 'ADMN1607180013', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-07-18 11:57:25'),
('ADMN20160718-115806', '2016-07-18', 'BKM.Ang.020716', '160718-103211', 'ADMN1607180014', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-07-18 11:58:06'),
('ADMN20160718-120302', '2016-07-18', 'BKM.Ang.030716', '160519-101450', 'ADMN1607180015', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-07-18 12:03:02'),
('ADMN20160721-085719', '2016-07-21', 'BKM.Ang.040716', '160517-110535', 'ADMN1607210001', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-07-21 08:57:19'),
('ADMN20160721-111803', '2016-07-21', 'BKM.Ang.050716', '160516-111908', 'ADMN1607210005', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-07-21 11:18:03'),
('ADMN20160721-112629', '2016-07-21', 'BKM.Ang.060716', '160516-110133', 'ADMN1607210007', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-07-21 11:26:29'),
('ADMN20160721-112721', '2016-07-21', 'BKM.Ang.070716', '160516-110133', 'ADMN1607210008', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-07-21 11:27:21'),
('ADMN20160723-104347', '2016-07-23', 'BKK.010716', '160723-103609', 'ADMN1607230001', 0.00, 500000.00, 0.00, '', '1', '0', '1', 'admin', '2016-07-23 10:43:47'),
('ADMN20160810-103510', '2016-08-10', 'BKM.Ang.010816', '160517-110535', 'ADMN1608100024', 50000.00, 0.00, 0.00, 'ANGSURAN BULAN AGUSTUS', '2', '0', '1', 'admin', '2016-08-10 11:00:18'),
('ADMN20160810-110058', '2016-08-10', 'BKM.Ang.020816', '160519-101450', 'ADMN1608100025', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-08-10 11:00:58'),
('ADMN20160810-110126', '2016-08-10', 'BKM.Ang.030816', '160519-101313', 'ADMN1608100026', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-08-10 11:01:26'),
('ADMN20160810-110154', '2016-08-10', 'BKM.Ang.040816', '160723-103609', 'ADMN1608100027', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-08-10 11:01:55'),
('ADMN20160813-104036', '2016-08-13', 'BKM.Ang.050816', '160718-103211', 'ADMN1608130005', 50000.00, 0.00, 0.00, 'ANGSURAN BLN AGUSTUS', '2', '0', '1', 'admin', '2016-08-13 10:40:36'),
('ADMN20160820-085719', '2016-08-20', 'BKM.Ang.060816', '160516-111908', 'ADMN1608200003', 50000.00, 0.00, 0.00, 'angsuran bln agustus', '2', '0', '1', 'admin', '2016-08-20 08:57:19'),
('ADMN20160820-091321', '2016-08-20', 'BKK.010816', '160820-091208', 'ADMN1608200004', 0.00, 500000.00, 0.00, '', '1', '0', '1', 'admin', '2016-08-20 09:13:21'),
('ADMN20160902-093443', '2016-09-02', 'BKM.Ang.010916', '160723-103609', 'ADMN1609020002', 50000.00, 0.00, 0.00, 'angsuran bulan september', '2', '0', '1', 'admin', '2016-09-02 09:34:43'),
('ADMN20160902-095854', '2016-09-02', 'BKM.Ang.020916', '160517-110535', 'ADMN1609020007', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-09-02 09:58:54'),
('ADMN20160905-113259', '2016-09-05', 'BKM.Ang.030916', '160516-110133', 'ADMN1609050001', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-09-05 11:32:59'),
('ADMN20160905-113328', '2016-09-05', 'BKK.Ang.040916', '160516-110133', 'ADMN1609050002', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-09-05 11:33:28'),
('ADMN20160906-113350', '2016-09-06', 'BKM.Ang.040916', '160519-101313', 'ADMN1609060001', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-09-06 11:33:50'),
('ADMN20160906-113436', '2016-09-06', 'BKM.Ang.050916', '160519-101450', 'ADMN1609060002', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-09-06 11:34:36'),
('ADMN20160906-124605', '2016-09-06', 'BKK.010916', '160902-094100', 'ADMN1609060011', 0.00, 500000.00, 0.00, '', '1', '0', '1', 'admin', '2016-09-06 12:46:06'),
('ADMN20160906-124916', '2016-09-06', 'BKM.Ang.060916', '160902-094100', 'ADMN1609060012', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-09-06 12:49:16'),
('ADMN20160922-084700', '2016-09-22', 'BKM.Ang.070916', '160516-111908', 'ADMN1609220001', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-09-22 08:47:00'),
('ADMN20160928-071024', '2016-09-28', 'BKK.020916', '160928-070429', 'ADMN1609280001', 0.00, 500000.00, 0.00, '', '1', '0', '1', 'admin', '2016-09-28 07:10:24'),
('ADMN20161005-094652', '2016-10-05', 'BKM.Ang.011016', '160902-094100', 'ADMN1610050001', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-10-05 09:46:52'),
('ADMN20161010-104507', '2016-10-10', 'BKM.Ang.021016', '160723-103609', 'ADMN1610100002', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-10-10 10:45:07'),
('ADMN20161024-111456', '2016-10-24', 'BKM.Ang.031016', '160516-111908', 'ADMN1610240002', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-10-24 11:14:57'),
('ADMN20161029-075743', '2016-10-29', 'BKM.Ang.041016', '160517-110535', 'ADMN1610290002', 50000.00, 0.00, 0.00, '', '2', '0', '1', 'admin', '2016-10-29 07:57:43'),
('ADMN20161029-080824', '2016-10-29', 'BKM.Ang.051016', '160519-101313', 'ADMN1610290006', 50000.00, 0.00, 0.00, 'ANGSURAN BULAN OKTOBER', '2', '0', '1', 'admin', '2016-10-29 08:08:24'),
('ADMN20161029-080937', '2016-10-29', 'BKM.Ang.061016', '160902-094100', 'ADMN1610290007', 50000.00, 0.00, 0.00, 'ANGSURAN BLN OKTOBER\r\n', '2', '0', '1', 'admin', '2016-10-29 08:09:37'),
('ADMN20161029-082214', '2016-10-29', 'BKM.Ang.071016', '160928-070429', 'ADMN1610290012', 50000.00, 0.00, 0.00, 'ANGSURAN BULAN OKTOBER\r\n', '2', '0', '1', 'admin', '2016-10-29 08:22:15'),
('ADMN20161029-110412', '2016-10-29', 'BKM.Ang.081016', '160519-101450', 'ADMN1610290020', 50000.00, 0.00, 0.00, 'angsuran bulan oktober', '2', '0', '1', 'admin', '2016-10-29 11:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `pinjtransaksidenda`
--

CREATE TABLE IF NOT EXISTS `pinjtransaksidenda` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `rumus` varchar(300) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjtransaksidetail`
--

CREATE TABLE IF NOT EXISTS `pinjtransaksidetail` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `nilai` double(15,2) NOT NULL,
  `persen` char(1) NOT NULL,
  `p` char(1) NOT NULL,
  `sp` char(1) NOT NULL,
  `sb` char(1) NOT NULL,
  `tp` char(1) NOT NULL,
  `tb` char(1) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjtransaksidetail`
--

INSERT INTO `pinjtransaksidetail` (`id`, `nama`, `nominal`, `nilai`, `persen`, `p`, `sp`, `sb`, `tp`, `tb`) VALUES
('ADMN20160602-095444', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160603-092330', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160603-092353', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160616-110539', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160718-115725', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160718-115806', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160718-120302', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160721-085719', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160721-111803', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160721-112629', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160721-112721', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160810-103510', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160810-110058', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160810-110126', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160810-110154', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160813-104036', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160820-085719', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160902-093443', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160902-095854', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160905-113259', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160905-113328', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160906-113350', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160906-113436', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160906-124916', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20160922-084700', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20161005-094652', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20161010-104507', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20161024-111456', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20161029-075743', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20161029-080824', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20161029-080937', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20161029-082214', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0'),
('ADMN20161029-110412', 'Bunga', 5000.00, 0.00, '0', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pinjtransaksidetail2`
--

CREATE TABLE IF NOT EXISTS `pinjtransaksidetail2` (
  `id` varchar(30) NOT NULL,
  `kas` char(1) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  KEY `id` (`id`,`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjtransaksidetail2`
--

INSERT INTO `pinjtransaksidetail2` (`id`, `kas`, `accountid`) VALUES
('ADMN20160516-111408', '1', ''),
('ADMN20160516-112314', '1', ''),
('ADMN20160517-110907', '1', ''),
('ADMN20160519-101759', '1', ''),
('ADMN20160519-101857', '1', ''),
('ADMN20160602-095444', '1', ''),
('ADMN20160603-092330', '1', ''),
('ADMN20160603-092353', '1', ''),
('ADMN20160616-110539', '1', ''),
('ADMN20160718-103511', '1', ''),
('ADMN20160718-103535', '1', ''),
('ADMN20160718-103557', '1', ''),
('ADMN20160718-115725', '1', ''),
('ADMN20160718-115806', '1', ''),
('ADMN20160718-120302', '1', ''),
('ADMN20160721-085719', '1', ''),
('ADMN20160721-111803', '1', ''),
('ADMN20160721-112629', '1', ''),
('ADMN20160721-112721', '1', ''),
('ADMN20160723-104347', '1', ''),
('ADMN20160810-103510', '1', ''),
('ADMN20160810-110058', '1', ''),
('ADMN20160810-110126', '1', ''),
('ADMN20160810-110154', '1', ''),
('ADMN20160813-104036', '1', ''),
('ADMN20160820-085719', '1', ''),
('ADMN20160820-091321', '1', ''),
('ADMN20160902-093443', '1', ''),
('ADMN20160902-095854', '1', ''),
('ADMN20160905-113259', '1', ''),
('ADMN20160905-113328', '1', ''),
('ADMN20160906-113350', '1', ''),
('ADMN20160906-113436', '1', ''),
('ADMN20160906-124605', '1', ''),
('ADMN20160906-124916', '1', ''),
('ADMN20160922-084700', '1', ''),
('ADMN20160928-071024', '1', ''),
('ADMN20161005-094652', '1', ''),
('ADMN20161010-104507', '1', ''),
('ADMN20161024-111456', '1', ''),
('ADMN20161029-075743', '1', ''),
('ADMN20161029-080824', '1', ''),
('ADMN20161029-080937', '1', ''),
('ADMN20161029-082214', '1', ''),
('ADMN20161029-110412', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `pinjtransaksipenalti`
--

CREATE TABLE IF NOT EXISTS `pinjtransaksipenalti` (
  `id` varchar(30) NOT NULL,
  `angsur` double(9,2) NOT NULL,
  `terlambat` double(9,2) NOT NULL,
  `tunggakan` double(9,2) NOT NULL,
  `tpokok` double(15,2) NOT NULL,
  `tbunga` double(15,2) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `nama` varchar(300) NOT NULL,
  `header` varchar(100) NOT NULL,
  `nomor` varchar(300) NOT NULL,
  `npwp` varchar(100) NOT NULL,
  `tglpkp` date NOT NULL,
  `alamat1` varchar(300) NOT NULL,
  `alamat2` varchar(300) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `kotaid` varchar(30) NOT NULL,
  `pejabat` varchar(300) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `bendahara` varchar(100) NOT NULL,
  `sekretaris` varchar(100) NOT NULL,
  `Manajer` varchar(100) NOT NULL,
  `logo` mediumblob,
  `logo2` mediumblob,
  `logo3` mediumblob,
  KEY `id` (`kotaid`,`pejabat`,`bendahara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`nama`, `header`, `nomor`, `npwp`, `tglpkp`, `alamat1`, `alamat2`, `telepon`, `kota`, `kotaid`, `pejabat`, `jabatan`, `bendahara`, `sekretaris`, `Manajer`, `logo`, `logo2`, `logo3`) VALUES
('Koperasi Yayasan Pesantren Annajaat', 'KOYAPA', '', '', '2013-12-18', 'Kp. Sumursari RT 03 RW 09 Desa Sukasono Kec. Sukawening', 'Kabupaten Garut', '', 'Semarang', '20100321-20082011', 'Amanda Abdurahman', 'Kepala Kantor', 'Zam-zam Nurjaman', 'Saddam Almahali', 'Irham Hakim', 0xffd8ffe000104a46494600010101006000600000ffe1005a4578696600004d4d002a00000008000503010005000000010000004a030300010000000100000000511000010000000101000000511100040000000100000ec3511200040000000100000ec300000000000186a00000b18fffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc000110801a301b103012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f7fa28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28cd140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005141a42680027154ff00b52ccea3f6013a7da76eef2f3ce2b13c55e284d22136d6e43deb8e07641ea6bcc85ddc0bbfb5095bcfddbbcccf39ae6ab8850764672a96763dd01cd2d72de16f1526af12db5cb2a5e28fa0907a8f7f6aea056f19a92ba2d3bab8b4514550c28a28a0028a2a8ea9aa5be9366f7370f855e8bdd8fa0a4da4aec04d5357b5d22d1ae2e9f0a38551d58fa0a9acaf60bfb64b8b7903c6e32083fa578feb5acdceb77a6e263841c4718e8a2a7f0ff886e742baca65eddcfef22cf5f71ef5c8b14b9ed6d0cbda6a7b1515574fd42df52b44b8b6903c6df983e86ad0aeb4d35746a145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a4ce28016b9bf14789a2d160f26121ef1c7cabfdcf734ff001378961d16dbcb8f0f78e3e44ec3dcfb57955c5c4b773bcf3c8d24ae72ccc7a9ae5af5d45596e6739db4424d3497133cd2b9791ce5989ea6a3a28af39efa980f8e57865596362b221cab03c835e9be15f1526aa82d2ed825e28e0f6907afd6bcbe9c923c4eaf1b1575390ca7045694aaba6fc8a8cb94f79cd15c97857c56ba9a2d9de305bc518563c093ff00af5d6d7a909a9aba3a134d0514555d42fedf4eb47b9b9902468324fafb0aa6ecaec63752d46db4bb47b9b970a8a381dc9f415e49ae6b771adde99a525621911c79e147f8d3f5ed7ae35cbc32392b0a9fddc79e07d7deb22bcdaf59cf45b1cf39f30514515ce41aba16bb73a1dd892225a16ff59113c30ff1af59d2f53b6d56c92e6d9f72b751dd4fa1af11ad2d1b5abad16f04d031287efc64f0e2ba285770d1ec5c276d19ed34567e93abdaeb164b716cf9fef21eaa7d0d6866bd24d3574740514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028cd148680173583e24f1243a25a10b87bb71fbb8f3d3dcfb53bc45e218742b324e1ee5c7eee3cf5f73ed5e4f79793dfdd497370e5e573924ff2ae5af5d41596e6739db4425d5d4d7b72f717121795ce598d434515e73d7739c28a28a4014515d6784fc28753717b7aa45a29f950f1e61ff0ab841cdd914a2e5b0be13f0b4b7f3477f75be3b6421900e0b9fe82bd347005351163408802a8180076a2591218cbb9c28af4e9c15289d118d95879ac9d7b44875bb0f22462aea7746e3f84d4f6da9c7712942369cfcb9ef577ad54671a91d3629ab9e23a8e9b73a5de35b5cc655c1e0f661ea0d54af65d7743b6d6eccc328db22f31c83aa9af25d474eb8d32f5ed6e536c8bd0f661ea3dabcfad45d3775b1cf283454a28a2b9ccc28a28a605fd2757bad1ef16e2ddff00df43d1c7a1af59d175bb5d6acc4f0361870f193ca9af17ab9a6ea773a55dadc5abe187507a30f422b7a359c1d9ec6909b47b7839a2b2342d76db5bb4f3622165518922cf2a7fc3deb5c57a719292ba3a13b8514514c028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a004ac7f106bf0687685dcee9dc7eee307927d7e94ed7b5db6d12cccb210d2b711c63ab1ff0af25d4350b8d4ef1ee6e642eec7f003d057357aea0acb72273e51b7d7d3ea37725cdcb9691ce4fa0fa557a28af35bbeace7f30a28a2900514569e83a34bad6a490202221cc8ffdd5aa49c9d90257347c2be1b6d62e05c4ea56ce36e7fdb3e95ea9146b146a88a151460003a5436769158dac76f02048a318000a9ddd514b310001924d7a94a9aa713a631e5436595218cbb9c28ae7af6f1aee4ee231f75696faf5aea4c0ff0056a781eb552bcec4e25cdf2c76280120e475adbd3b51f3710cc70ffc27d6b128c90411d456146b4a93ba03aec66b17c43a0c3add998ce1674e62931d0fa1f6ab3a6dff009ebe5487f780707fbd5a35ecc651ab0bf413573c2eeed66b2ba92de74292c670c0d435ea3e2ff0e0d52d0dd5ba0fb5c43b0fbebe9fe15e5e410704608e083dabcead49d395ba1cf28f2b128a28ac480a28a2802d586a171a65e25cdac852453f811e86bd5fc3fe21b7d76d4321d970a3f79113c83ea3dabc7aac595edc69f749736d214910f041fd0fb56f46b3a6fc8d213e53dc852d617873c496fae5b00484ba41fbc8cff31ed5b99e95e9c64a4ae8dd3b8b4514550c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00426b2f5bd6edb46b169e63973c4718eac69dac6b36da358b5c4e727a2203cb9f415e4baaeab73abdebdcdc37cc78551d107a0ae6af5d41596e44e7ca3753d4ae755bd7b9b97cbb7403a28f4154e8a2bcd6db77673efb851451484145145003a38de695638d4b3b101547735ebfe1cd11345d3522c033b7cd2b7a9f4fa0ae47c05a30b8bb7d4a65cc717cb17a16ee7f0af47cd7a185a565cccde9c74b81ac3d4ef7cd7f250fc8bf788ee6aeea779e443e5a1f9dc7e42b02b1c6622dee44d428a28af34028a28a005566470ca70477ae8ec6ec5d4209fbe38615cdd4f6970d6d38901e3a30f515d387aee94b5d80e9cd79a78df40fb15d7f68dba62098fef00e8afebf8d7a4a3ac88194e430c8a8350b28b50b196d6619491707dabd5ab055224ca37478751562face4d3ef66b5987ef2262a7dfdeabd794d59d99ccc28a28a420a28a28026b5ba9acee12e2de468e54395615ea5e1af13c3ad402390ac7789f793fbdee2bc9ea482796da749a0731ca872aca7906b6a559d37e45c24e27bb6734b5ccf863c5316b11882e0aa5e20e4740e3d4574a0e6bd3849495d1d09a7b0b4514558c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a0d1400959fab6af6fa3d9b5c5c37038551d58fa0a76a9aa5b69368f7372f8503e551d58fa0af24d6759b9d6af4cf3b10a3848f3c20ac2b5654d5ba9139f28dd5f56b8d66f5ae6e1b8e8883a28f4aa14515e5b6dbbb39dea1451452105145140053e28de695628d4b3b90aa07ad32ba4f0458fdb3c409232e52dd4c87ebd055c23cd248695da47a4e93a7c7a669905aa7fcb35c31f53dcfe7571d822331e8064d28e959babcfb201103cb9e7e95ea549aa706ceb4ac645cce6e27690f73c7b0a8a8a2bc2949b6e4c028a28a900a28a298051451401afa3dce736ec7a72b5ae7915cac1298664917aa9fceba8460e8187208cd7ad82abcd0e57d00e07e21697b5e0d4a31f7bf77271f91fe95c2d7b46bd62351d16e6df00b3212bf51c8af18208241ea3ad658a872cee73d45677128a28ae5330a28a2800a28a2801f14af04ab2c6c55d0e5581e41af4df0b78b135545b5bb2a978a383da4f71efed5e5f4e4778dd5d18aba9c8607041ada95574de85c64d1ef00d2d71de15f172ea0a9657ac16e80c2bf693ff00af5d8035e9c26a6ae8e84d342d14515630a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a28010d53d4f52b6d2ecdee6e5c2a28e07727d053b50d42df4db392e6e5c2c683f127d07bd792ebdaedc6b97a6490ed814e238c7451fe35856aca9af32253b219ae6b771adde99a525635e238c1e147f8d66514579926e4eece7bf70a28a2a44145145001456ce8fe19d435821e28fcb80f5964181f87ad77ba5782b4bd382bcaa6e661d5e41c7e02b7a7879cf52e306cf37b1d1b51d488169692c8338dd8c28fc4f15e8be0ff000fdce896f70d74104d315c0539c01ffebae95635450aa0051d0018a78aeda5878c1dcd6304b512aa5ce9f15d3ef767c81818356f38a335b4a2a4ad23432db448ff0086561f500d579346987dc756faf15b99a01cd612c2527d00e625b2b887efc4d8f51cd415d7119aaf3d841700ee401bfbc3835cb5301fc8c0e669c88eedb514b1f402b5e3d1544a4bc84a7603835a31411c2bb6340a2a29e0a6fe2d00c587489e400bed41efc9ab89a340a3e77763e99c56974a335d91c2528f4b815069968bff002cbf326ad220450aa30a3a0a0b01de8560c783fad6f18462fdd40291915c3ea3f0f9679a59ad6eb61762c11d72064e715dcd144e9c66acc4e29ee7906a3e12d634fdccd6c668c7f1c3f37e9d6b1194a9218104750457bce33593a9f8734dd590fda2dc093b489c37e75c93c22de266e9763c6e8ae9f5af055f69bba5b6cdd403ba8f980f715cc1041c1ea2b9270943468c5a6828a28a810514514c055628c1949041c820f4af44f0a78b85d84b1d41c09c711c87a3fb1f7af3aa5048390704743574ea3a6ee8a8caccf790c33d696b84f0a78bfcdd961a93812748e563f7bd8fbd7720e4d7ab0a8a6ae8e98c93d87514515630a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800aaf7b790d85a49733b6d8a31963562992c51cd13452a0746186561904527b01e3fe20d7e7d72f0b1ca5ba12238f3d07a9f7ac7aea7c53e14934b76bbb352f66c791d4c7ffd6ae5abc9a8a4a4f98e595efa851451599214515774cd2aeb57bb5b7b54c93f798f451ea4d349b7643b15adede5ba9d618636791ce1554649af41f0ff0081e1b70b71a9e2594f221fe15fafad6de81e1db4d120c22892e187cf2b0e4fb0f415b58aefa58651d65b9b429db711515542a8000e8052d43717515b26646fa0ee6b16e7549a7cac64a27b753f8d5d5c4429ee6a6c4f7d05bfdf704ff74726a582513c2b20180c32335ca77cd747a636eb08fd862b1c3e265566d3d80b129222723aed38af1f97c47ac79cff00f1309c618e39af632320835e1b7f09b7d42e61618649594fe06ab16dab346555ec69c3e2ed6e1208bd67c767506b66cbe225dc640bbb48e55eed19da7fad7175a9a1e8573ae5d88e21b2253fbc908e147f8d7342a54bda2c8529743d3f47f11d96b6adf66de1d46591d718fc7a56c0e95474bd2ad749b35b7b58c2a8eaddd8fa9357bb57a50bdbdedcdd5fa852138a6aca8cc5558161d403d29f549a6338ed6bc75169f3496d6f68f24c8704cbf281f87535c95e78c359bb247da7c95feec431fad7a1ebfe1db4d6e0c3a84b851f24a0723d8fa8af2bd4f4bbad26edadeea3dac3a30e430f515c388f6917be86353988e5bfbb9b996ea67ff7a426baef874eeda8de02491e503c9ef9ae26bbdf86f092d7d3e38f9507ea4ff4acb0edba88987c48efab36fb5092d2e5542ab211920d695606b0737b8f4515d78b9b853bc4e8342df55826c063e5b1ecd57410c38e95c9559b6be9ad8e15b2bfdd3d2b96963ba4c0e948ae67c41e10b4d5434d6e05bddf5dc07cae7dc7f5adcb5bf8ae8601dafdd4d5ac5777b9563dc4d5cf0fbfd3aeb4cb96b7ba88a38e9e847a83556bdab55d22d357b6682e6307fbae3ef29f506bcaf5dd02eb43b9d928df0b7fab94746fafa1ae1ad41c355b184e16d51934514573198514528058803924e00f5a602007231c9edee6bd7bc2a9a9268f18d49b2d8fdd83f782f6cd62784bc25f66d9a86a280ca798a23fc1ee7debb700035e861a938fbccde9c2dab168a28aeb350a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280192a2c91b23a865618208c835e69e2af093e9ccf7b6284da1e5907263ffeb7f2af4ea6ba0752ac01523041acaad2551599328f323c1a8aecbc57e116b22f7fa7a136fd648c7f07b8f6ae7747d22e759bd5b78070397723851eb5e6ca94a33e5307169d85d1b46b9d66f0410290a397908e1457ace91a45ae8d66b6f6e98e3e673d58fa9a7695a4db6916496d6c98039663d58fa9abddabbe8d150577b9b421617359d7da92c1948c8693f4150ea1a96098a03cff00138fe958e493c9eb5cf88c5dbdd8163e491e672eec4b1ee6994515e63777700adcd1a4cdbba67956fd2b0eaf695379777b4f4718adf0b3e5aa981d05792f8d2c8da78927603093e245fc7afea2bd6874ae5bc63a0cdabc16f25b2e67470a7fdd3dff00035eae229f3c34226ae8e0344d1ae35abf5b784610732498e1457ae699a6dbe9766b6d6c9b514727b93ea6a0d0f468345b05b78865cf3239eacd5a7d2950a2a0aef70846c833591a86a58cc301e7a338fe946a5a8f58613fef30fe55915cb8ac55bdc8163e39648a4de8e430e73eb5b965a925c00926164fe75814038208e08f4ae4a35e74de8075d59dac68d6dacda341709cf5471d54fa8a669fa979988a7237f66f5ad4af5e15215637426ae78a6afa4dce8d7af6d70bee8e3a30f515e8de06b2369e1e4761869dcc87e9d07e82b4b59d12df5ab3304e30c39490755357ede04b6b78e18c612350aa3d85452a1ece6e5d098c2cee486b9bd41f7df4a7b038ae866711c6ce7a28cd72acc5d8b1ea4e4d618f968a25894514579602a92a4107047422b5ec754dd88ee0f3d037f8d63d15ad2ab2a72ba03ae04119155ef6cadf50b57b7b988491b8c106b2ac351309114c731f63e95b8ac194104107a57b14aac6ac40f22f1178727d0ee72033dab9fddc9e9ec7deb0ebdcef2ce1beb67b7b88d648dc60835e4fe21f0e4fa25e0550d25bc8711381cfd0fbd7257a1caf9a3b184e16d518a0166000c93c002bd13c25e1216aa97fa84799fac71b744f73ef4be13f097d9425fdfa03707948cff07b9f7aed074ad6861edef48aa70b6ac2968a2bb4d428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a006b286041e86aad9e9969a7a3adac291891b736d1d4d5ca29582c21ac8d4b51e4c309ff00798569dc46d240c8adb588e08ae6258de290a38218571632a4a31b2019451457940145145200a5566460cbd4722928a6b4d40ea6da759e04917b8a971591a2b49fbc1ff2cfd7deb62bdda33e7829301318acdd4eff00ca1e4c67e72393e82afcc5c42e6319703815cb3b33392e4ee3d735862eab845457501bde8a28af24028a28a4000e0823a8adcd36ff00ce02190fce0707d6b0eade9f6cf71720a92154e4b0ae8c3549c6a25103a4a28a0d7b6066eaf71b205881f99ff95615686af13adc89092558607b567d78b8b93755dc028a28ae600a28a2800ad0d3b5030308e4398c9c03e959f4a8a5d82a8c9270056b4a7284d3881d60218641c83de9b2429281bd15803b86e19c1f5a86c60782d952462cdfcbdaacd7b916e514da000314b451560145145001451450014514500145145001451450014514500145145001451450014514500145145001451484d002e6a83ead64ba90d3cdc2fda4aee099fd3ebed591e29f13c7a3c260b72af7aebc0ea107a9af3037539bafb4f9afe7eeddbf3ce6b9aae2141d919caa28bb1ee954afec45ca6e5c0957a1f5f6ac8f0b78923d66d845310b7918f997fbc3d45749906b46a1561aec5a69ad0e4995918ab0c11d41ed495d05fe9eb72a5d389477f5ac17468dcab29523a835e3d7a32a4f5d86368a28ac40281924628ab5a7c5e75e460f41c9aa8479a4a206e59c02ded9131ce32df5ab228ed581e2ad71b44d3d2484299e490050dd30393fa7f3af755a9c3c909bb1bc6b2b53b0de0cf10e7f880fe75268fab5beaf62973030e7875eea7d0d689e454ce11ab01a77391a2b5b51d348ccd02ffbcbfd6b26bc6ab4a54e566014515243049712048d727bfb5424dbb2016081ee2511a0e4f53e95d1db5ba5b422341f53ea69b696896b1ed5e58f56f5ab15ebe1b0fecd5dee029200c93c526411c7435c2f8cfc4fe507d32c9fe72313383d07a0adbf076a2751d0612e732c24c4ff00874fd315b2ab173e444a926ec6b5fdb8b8b575c7cc06457355d71ed5ccdec5e45dc8a3819c8fa1ae2c753da68a2bd14515e68051453e28de570a832c69a5776403510bb8550493d00aded3f4f16ca1e41990fe94eb2d3d6d86e6f9a53dfd2aef415eae1b0bcbef4b700ac6d63c4963a34d0c570e4c92372abc955f53ed50f893c4906896db576c974e3e48f3d3dcfb57955cdd4d7972f717121795ce598d695ebf268b7339cec7b8c13473c2b2c4e1d1c65581e08a92bca7c31e289348956dae097b263cfac7ee3dbdabd4609e2b8812589d5e37195607835ad2aaaa2f32a32e644b451456a505145140051451400514514005145140051451400514514005145140051451400514521a0009e2b9df13f89a2d1adcc50e1ef1c7cabfddf734ff001278922d16d76ae1eee41fbb4f4f73ed5e53737135e5c3cf70e6491ce598d72d7aea2b963b99ce76d1093cf25ccef34ce5e4739663c926a3a28af39bbee604d6d732d9dc25c40e5254395615eabe1af1243ad5b847c25da0f9d33d7dc7b579254b6d712da5c24f0394950e5594f35ad1ace9bf22a32b33dd73556f2c63ba5cfdd71d1ab07c35e2d835545b7b92b15e0e31d9fdc7f8575039af47dcab1ee74277573969ede4b693648b8f43d8d455d5cb0c7321591430ac7bad25d32d01dcbfdd3d6bcead83947586a866656ae8899795fd001596c8c870c083e86b6f455ff4573dcbff004acf0b1fdeab81a55e65f102efced6e3b707e586319fa9e7fc2bd36bc7bc57279be27bf27b4817f20057a18a7ee58cea7c243a26b571a25eacd0fcd19c0923278615eb7a66a76daa59adcdb3ee43d47753e86bc46b4b45d6aeb44bbf3606ca37df8c9e187f8d7350aee9bb3d8ce13b68cf68ea2b2eff004cf3332c230fdd7d69da3eb569acda89ad9fe61f7e33f790fa1ad2c66bba708558ea7427739ab6b29ae252814a8070cc474adfb6b58ed63da83ea4f5353631413819ace8e1a34b5ea019c5721e2df152e9e8f6564c1ae98619c1e231fe35078a3c64b006b2d35c34dd1e51d13e9ef5e78cecee5d892c4e4927926a2bd7b7bb1329d4e88198bb16624b13924f735da7c3abb31dfdd5a13f2c918703dc7ff58d7155bfe0c94c5e28b5c1fbfb94fe55cb45da6999c3491eb7d6b135a8f1346ffde5c1adbacbd6c7ee636f4623f4aedc5abd267498b453e386499b11a963ec2b56d747c61ae083fec8e95e5d3a139bd168067db59cb74d84185eec7a56f5ad9c76a984196eec7a9a9d515142a8000ec282db473d2bd3a386852d77602e715cf7893c510e8b118a3c4978c3e54cfddf7359fe24f19c5661ed34f6125c7469072a9fe26bce659649e5796572f239cb331c926a6b62147dd8994ea5b61f757535edcbdc5c485e57392c6a1a28ae07abbb31b85745e18f13c9a34c209b325931f9973ca7b8ff000ae768a71938bba04dad51eed6f7115d429342e1e3719561d0d4b5e4be19f13cba24fe54c5a4b373f32f74f715ea96d7315dc093c0e1e37195606bd4a559545e674c64a489a8a28ad8a0a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a434b4500799f8c7c3d7505dcba9a3493c121cb93c98ff00fad5c857bc488b246c8ea195860823ad79af8abc24fa7b3ded8a335a9e5907263ffeb7f2ae0af41af7a26338754723451457199051451400aac51832b156072083822bb7f0ff008e9e20b6daab164e009c0c91fef570f455c2a4a9bd06a4d6c7bac17115d44b2c12ac91b0c8653906a5af15d335bbfd2240f693955fe28db953f85773a578facee42a5fa1b693a161caff00f5abbe9e2632df466f1a899d6cb6f14c312461bf0a4b7b78ed90a479da4e704e692daeedeee3125bcf1ca87a14606a7cd6ca31bf322c435e75ad783756bdd6aeae6048bca9642ca4be2bd1739a2954a719ab3138a7b9e6907c3dd49cfefae2de31ec4b1fe55b565f0fac2121aee79273dd47ca3fc6bb1a5a8587a6ba12a9c5742ad8e9d67a7c5e5da5bc70af70a319fad5ae94c9258e21977551ee7159b71ac2202b08dc7d4f4a73ab4e9ad5966a51807ad6043ab5c46e4b90ea4f4f4ad38352b79f037846f46e2a29e269cf44c0ced4bc23a46a24bb5bf9329e4bc5f293f51d2b9abaf8753024da5eab0ecb22e3f515e84082320834b572a34e5d09704cf2993c09ae21c2c5149eeb20feb8abfe1ff09eaf63ae5add5c5baa451b12c448a78c1f435e8d4b50b0b04ee84a9a4ee345327b78ee02895772839c54bc519ae869356658c489235011028f614eaa57dab5869c85aeaee38bd016e4fd075ae3b55f88180d16990f3ff3d651fc85672a90a6b525c923b2bfd4ed74d80cd773ac683d7a9fa0af3bd7fc6973a96eb7b2dd05b6704838671fd2b9dbcbeb9bf98cb753bcae7bb1aaf5c3571329691d118caa36079a28a2b9ccc28a28a430a28ab1656371a85d25b5b465e47ec3b7b9f6a6936ec804b3b39efee52deda3324ac7851fe7a57ae787746fec4d384065692463b9ce7807d876a8fc3de1e8343b6c001ee1ff00d6498fd07a0adbaf4a850e4577b9bc216d58b45145749a051451400514514005145140051451400514514005145140051451400514514001a63a0752ac0107a83de9f450079b78afc22d66cf7da7a660eb24606767b8f6ae36bde5977707915e7de2bf08188bdfe9d1e5393242a3a7b8ae0c461fed44c670b6a8e1e8a28ae3310a28a2900514514c64b05ccf6afbe095e36f546c1aebbc31e2ad425d5e0b4bdb832c321dbf3019071c735c653e195a199258ce1d18329f420d5c2a4a2d6ba151934cf771d2a0bbb86b680c813760f2338a8b4cbf4d474db7bb8fa4880919e87b8ab52209236461c30c1af55b7285e274a663beb521fbb128fa9cd579354ba9011bc28ff6462abcf13433bc6c395351d78b3af56f69301ceef21cb313f539a6d14562db7ab00a28a29012c771345f72465fa1ab49abdca7dedaff00518aa1456b1ad523b3035975b3fc507e4d57ecaefed7197f2ca0071c9eb5cd8058855e493815d3da43f67b648fb81cfd6bbf0956ad497bcf40263c579cf8cf5fbd8b577b2b5b978a18d00608719279ff000af42b895208249a4384452c4fb0af11bfba6bed42e2e9bacb2337ebd2b5c54f9629266751b4b42177691cbbb1663d589c934da28af3ef7300a28a290828a28a0028a2ade9da75c6a97896d6c9b9dba9ec07a9f6a6937a218db0b0b8d4eed2dada32d237e83d4d7abe81e1f8343b4da803cefcc921ea4fa7d29fa0e836fa259848c069987ef2423963fe15ae0715e950a0a0aef737842dab0a5a28ae9340a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a4233d452d1401c0f8b3c219f3350d3631bbef4b0afea47f85705d383907d2bde4818ae23c57e101387bfd3a3c4bd64897f8bdc7bd7157c3fda898d4875479ed14a4152548208eb9a4ae0320a28a2810514514c6777f0ff5701e4d3256eb9921cfea3fad77fdabc2ed2ea5b3ba8ae213b648d8329f7af65d23538b56d361bb88fde1f32ff75bb8af430d52f1e5ea8de9caeac47ab5a6f413a0f997ef63d2b12bae203020f20f5ae76fed0db4c4807cb6e41f4f6ae6c650b3e789a14e8a28ae000a28a2900514549042d7132c6839354936ec80bda4daf99379cc3e54e9f5adce951c10ac10ac6bd00a59a54822796460a8832cc7a015edd0a6a942c072fe3bd57ec7a48b38dbf7d7276903b28ea7f90fc6bcc2b4f5ed59b59d565ba3911fdd8d4f65accae0ad539e6ce69caec28a28ac480a28a2800a28abba5e9773abde2dbdb2124fde6c70a3d4d349b7643dc4d334cb9d5aed6dad53731e49eca3d4d7ace85a1db68969e544034adcc9211cb1ff000a5d1345b6d16d04300cb9e6490f5735a8057a5428282bbdcde10482968a2ba4d028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00290d2d1401c678afc222f435f5826db9032f18e03fb8f7af38656562aca55870411d2bde48cd723e2af0926a2ad7964a16e872cbd049ff00d7ae3af87bfbd1329c2faa3cce8a7491bc5234722957538208c1069b5c060145145200ae8bc25af1d1f5111cadfe8931c3ff00b27b3573b455c26e324d0d3b3b9ef2ac194329041e41151dc40971118dc707f4ae23c13e251b534bbc7e7fe58b93ff008ed7780e6bd484a3522754649ab9cb5c40f6f298dc723a7b8a8aba5bdb45ba8b0701c7dd35ce491b4523238c3038af271141d29790c6d1452aa33b05504b1e80573ad7600556760aa32cdc015d158590b58b9e646fbc69961602d977be0c8475f4abdd2bd5c2e1b93de96e004f15e7fe38f106ece936cfc759d81ffc77fc6b67c59e255d22d8db5bb037922f1fec0f535e5acccec59892cc7249ee69e26b5972232a92e82514515c26214514521051456868fa3dceb37a2dedd70072f21e883d6a926dd90d2b8dd2b49b9d62f56dedd7dd9cf451ea6bd6b46d1adb45b358205cb1e5dcf563ea69748d1edb47b25b7b7519eaee7ab1f535a38af4a8d050577b9d108728b4514574161451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500148452d1401caf8a7c289aac6d7568a12f1793d849ec7dfdebcc66864b799e29519244386523041af7722b9bf13f85a2d66233c004778a386ece3d0d7257c3f37bd1dcce70bea8f29a2a49ede5b59de19e329221c1522a3af3f6300a28a2801558a306538607208ea0d7a7784bc50ba9c22d2edc0bb41c13ff002d07afd6bcc29f0cb241324b1394910e5594e0835ad2aae9bba2a32b33ddfad53beb15ba8f23890743eb58fe17f13c7acc02098aa5e20f997a6ff715d257a3eed58f91d09dd5ce5d6d6669fc908778ea2b72cac12d57240690f56f4ab7b1771200c9ef4a78ac68e1634ddf71874ae7bc4be268745b731c643de38f913fbbee6a1f12f8b22d251adad4acb7a7b7511fb9f7f6af30b8b896ea779e790c9239cb313d68af5d4572c77339ceda216e2e66bbb879e7919e5739663dea2a28af3deba9805145148414515a7a268973adde086105635ff59211c28ff1a69393b21a576268da2dd6b5782181708399243d107f8d7ace93a4dae9164b6f6cb8007ccddd8fa9a5d2f4bb5d26cd6dad93007563d58fa9abdd2bd4a345535aee74421ca006052d1456e585145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401cf7897c330eb701923023bc41f23e3ef7b1af2bbab59acee5ede78d9254386535eea6b07c47e1b835cb7070a97483f7727f43ed5cb5e873fbd1dcce70bea8f22a2ac5ed95c585d3dbdcc652553c83dfdeabd79cd59d998051454d6b6b35edca5bdbc6cf2b9c2a8a12be81b9269cb76d7f08b1ddf69dc366cebffeaaf69b31702ce1fb51433ec1e66ce99f6ac7f0df86e2d12df7b6d92edc7cf27a7b0f6ae8074af4f0f49c16a6f4e2d20a8e64f32364dccbb8632a7047d2a4a2ba0d0f1df10e8375a35e1f399a58643f24c7f8bebef58c2bdcafac60d42d5edae631244e3041af28f117872e343b927992d5cfc927f43ef5e6d7a0e1aa39e70b6a8c4a28a2b9880a28ad7d0741b9d72ef64794814fef2523803d3dcd38c5c9d9024de886e85a15ceb978228be5854e64931c28ff001af59d374db6d2ad16dad936a2f53dd8fa9a5d3f4eb7d32ce3b6b68c2c6bf993dc9ab95e9d1a2a9ad773a2315141451456e58514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400504668a280317c41e1eb6d72d4ab00970bcc7281c8f63ed5e51a869f73a65dbdb5d4652453f830f51ed5ee18ac9d7741b5d6ed0c728db2aff00ab947553fe15cd5a829fbcb7339c2fb1e436b6b35edca5bdbc66495ce0015eade1bf0dc1a2db6e60af74e3e7931d3d87b53bc3be1cb7d0e0ed25cb7df931fa0f6adcc52a18751d65b84216dc052d18a2ba8d028a28a002abddd9c17d6f25bdc46b244e30ca4558a29349ab303c8fc49e1a9f44b832202f66e7e57feefb1ac0af75b9b58aeede482740f1b8c329ef5c04de0198eb212293160df31727e651e95c15b0cd3bc4c254f5d0c2f0ff0087ee35cbadaa0a5ba1fde48474f61ef5eaf61a7dbe9d6896d6d1848d07e27dc9f5a5b1b2b7b0b54b6b688471a0c002ad018ae9a345535e66918f2a01451456e58514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400628a28a0028a28a0028a28a0028a28a00292968a003a51451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140081b34a4e2bcf3e1778f6fbc710ea0f7b6b0406d9942f944f3907ae6ba9f13f892c3c2da2cda95fc816341f2a67e691bb28f734aeb72e54e4a5c9d4d9cd2938af35f879e37f11f8d6e26b99f4cb6b5d2222544bf31676feeafae3b9adcf1a7c42d1fc196e05db19af24198ed6239723d4fa0f7a2ead7074e4a5cbd4eb73466bc04fc65f19eab233e8be1d8da11d0082498e3ea08ab5a7fc72d5ac2ed60f13683e50ce19a2568d97fe02dfe353ce8d5e16a58f75a4cd65e89afe9de22d363d434cb849eddfb83ca9f423b1ae67e2778d6f7c11a3d9de595bc33bcf71e530973803693dbe954dab5cca3094a5cab73bacd19af078fe30f8de681678fc2a2485d772bac129047620d749e0bf8cb6daeeab1e93abd97f67de4adb2360d9466ec0e7904d2e74692c3548eacf5427146e15e77f13fe205f781c69a6ced209fed7bc379a4f1b71d31f5ae357e3078d9d432f84f729190c20948228724850a1392e647bb6ea335e59e08f885e27f1178962d3f54f0f9b3b568dd8cde53ae081903278a67c43f89fab784bc570e91a7e9d05d096049177ee2c599986001f41473ab5c3d84f9b93a9ead9a01cd78637c68f1469ceb26afe146860cf259248cfe6457a9f847c61a6f8c749fb769ec4153b6589fef46de87fc68524c53a3382bb47434138a4cf1597e22d6a1f0f787afb55b8c6cb688b804fde3fc23f138154f43249b7646a039a5af34f85ff12e6f1a4b7b6ba8c3041770e1e358b2032743d4f507f9d7a50391493b9538383b485cd26e15c778f7e2059781ec236923fb45ecf910db86c640fe227b0af361f16be2008c5f9f0b8fecf3f36ffb24b8c7fbfd3f4a4e4932e142735747bd668dd5caf80fc629e35f0fb6a2b6ad6d247318248c9cfcc154923dbe615cef87fe246a1abfc4cbbf0c4b676e96d0b4a04aa4ee3b3a53ba12a52775d8f4dcd266806b9df1cf8827f0bf83eff59b6892596dc26d4933b4ee755edfef53d8849b764745ba8dd5c67803c6175e2df07cdac5d5bc50cb1cb22048f38c2807bfd6b92f037c691aeeb434ed6ede0b369b0b04a8c7696fee9cfaf6a9e6469ec66efa6c7b0d148a739e296a8c84cd1915e67a4fc47d4350f8a777e157b3b75b58649504a09de768e3dab3fc7bf15757f0b78c1b45b1d36dee576214ddbb73330e98153cc8d5509b972a3d733466bc2ffe16ff008dc75f091c7fd7096ac58fc799adee162d73c3f25bae796898e47be1851ce8a786a87b6e68cd64e83e22d33c4ba6a5fe957293c2dc1c1f994fa11d8d68cd3c76f0bcd348b1c680b33b1c00077269a77d4c5a69d992e69322bc73c47f1dad6dee9ad3c3d606fd81c09dc95463fec81c91587ff0b67e2222fda5fc391fd9bae7ec52818ff7b34b9d1bc70d51ab9eff009a5cd792f857e37e9baa5da596b96bfd9b3b9da25dd98f3ef9e56bd5564574dca41523820e41a69a7b194e9ca0ed2449ba96bc6f4af8d5ff001595c693acdb416f64b70f025c231f9486c02d9ec7f4af62470ea19482a464107ad09a7b04e9ca16e61d48580a5af32d57e236a165f1620f09a59dbb5ac924486524eff99431f6ef43761420e6f43d3370a335e5df133e25ea3e08d6acec6cecadee167b7f349949c83b88c71f4ae73fe16ff8e3fe852e7feb84b49cd276358e1e728a91ee99a3773d0d795f82fe21f89fc41e248ec756d03ec368637769cc4ea17033d4f159de21f8cf7926b12e99e12d2bfb41e362be714693711d76aaf247bd1cead717d5e7cdca8f65dc0d1babc2e0f8cfe27d1ae913c4fe1b68a16ea442f0b01ea03e735d97c4ef1edef826d34c9acad619cddb3861293f28500f18fad0a481d09a928f73d0b39a09c567e857efaa681a7ea122aac9736d1cccabd01650703f3a6ebfabc1a0e877baa5c1c456d13498fef10381f89c0fc6aae65677b1a5914b5e5bf0c7e285c78c752bbd3b5282dedee15049008b3871fc4393d4715ea5493ba1ce1283b4828a28a649e05f04757b3d0b40f116a37f308ada031b331fa1e07bd51863d5fe34f8cfce9f7db68368d8c2f445f41eaedebdab8ff0f785356f11f85b549f4c95a416522492598ff968307e61ea473c57adfc1af19e993697178665823b2bf833b40e05c7a9ff007bd7fc8ac56ba33d3ac945caa4757f91e8b3b587847c29349040b159d85bb32c6bc741d3ea4ff3af0df873e1a93e2478aaff00c41e20633db44e1993b48e7a27b281dbe95ebbf13d1e4f86fadac79dde46703d030cfe95cafc029627f07de46a479a97677fe2a31572f89239a9b71a529adcf54b6b4b7b38120b68522890615117000fa566f88bc39a5f8934e7b2d4ed52546042b11f321f553d8d6c521ab39949a773e75f07cf79f0dbe2abf872e2666b1ba956239e8c1bfd5be3d7902baafda0ff00e455d2bfebf7ff00646ae6be29b8baf8cfa4436bfeb93ecc8d8ece64247e84574dfb41f1e16d2bfebf7ff646acafa3477ef529c9eecef7c0807fc201e1ff00fb07c1ff00a00af19f8da967178eb4b6b00ab7cd1a99bcbebbb7fca4e3bf5a7685e0cf8957da0d84d61af086c26b746810dd32ed8ca8da30071c62ba9f087c1b974ed6e3d6fc49a92ea1791bf98b1aee652c3a333372d8fa51ac922572529b9b918bf1f779b4f0df9a3f78565dff005c266bda345c7f60e9ff00f5ed1ffe822bc6ff006851f2e839eb99bff65aad65f0f3e25cf636f2c1e265485e35645fb64830a4703eed3bda4c4e119d18dddb73def00d7cff00f14ffe4b5685feedb7fe8d6aed7c01e11f19e85e2092ebc41ad0bdb36b768d63170ef872ca41c30c7407f3ae03e3343713fc55d361b47f2ee5eda0589f38dac646c1cfd68936e24d08a8d5b5efa1ef5ac4763268f74ba92c46c8c4de779a06ddb8e735e21fb3ff009dff00091eb422dff6436ebbb3d376ef973ef82d5cef8dfc3fe3dd1ac95fc417f7575a7b90acc9705d01ff006876fc457b2fc29b6f0ec3e118e5f0fb3b094ffa4b4b8f33cc1d9b1d31dbeb45ef24538aa749eb7b9ded78bfc73d7649974df0ada1dd35d48b2caa3bf3841f9e4fe15ec934d1dbdbc934ac1638d4b313d801935f31d878bb4abef8b73789f5e95d2d22959edd150bfdd188c6074c75fad39be8678685db95b6fccb579a64df093e2168d7619dece5890cac7b8202cabf81e47d457d270c893449246c191c06523a107a1af04f89fe3bf08f8c7c36b0d95ccc6fede41241be0619cf0c338ee3f95771f06fc4a75df06a5a4cf9bad38881f9e4a7f01fcb8fc2945a4ec8baf194a0a725aadce23e30b1d37e25e8ba9df4266d3d510852320ed6cb0fad7b5e8faad86b9a6c57ba7cf14f6d228c1439c7b1f43ed55bc4de19d37c55a4be9fa943e64679471c346dea0f6af0bd5bc29e2df84f7cfab68b78f3e981816741c63d244febfca8778bf22572d58285ecd1f41d8e9763a5fda3ec36d1c02e253348b18c067200271f4515e17e09ff009381d4bfdfb9fe55eabe01f1941e35d056f913cab989bcbb88739dad8ea3d8f515e55e08ff009381d4bfdfb9fe544ada58292925352dec7d002b87f8c03fe2d6eb3f487ff47257702b87f8c1ff0024b759fa43ff00a392ae5b331a3fc48faa30be0a0cfc2ebaf5fb4cdffa0ad78df84bc1773e2dd27589ac19bedb60b1c91c5ff3d01dd91f5e062bd97e0a1c7c2ebaff00af99bff415ae73f6793fbfd7ff00dd83f9bd656bd91daa6e0ea496e6dfc27f892da9a0f0eeb7214d4611b60924e0ca07f09cff0010fd6bd70124578d7c58f87524ce7c53a0214be84f99711c6305f1cef5c7f10efeb5bbf0bfe2347e2cd3c69f7ee1358b74f9c1e3ce51fc63dfd455a76d19cf560a6bda436ea711e19ff938dd4bfebe2e3f9541e3ff00f92f9a67fd77b3fe6b53f867fe4e3352ff00af8b8fe55078ff00fe4be699ff005decff009ad4743a57f117f84fa1401597aef8774af11583da6a7671cf1b0c02c3e65f707a835a828adac79ca4d3ba3e70d39eefe137c555d35a767d2ee5d0312787898e158fba9fe46ba1f8ebe28b9492cfc2f64cc3ed0825b8d87960490a9f9827f2ac8f8e9224fe3ad2ada1f9a74b750d8ebcbf1fcaa9fc415363f1974a96fb8895acd98b74da0a86fd43562f4ba3d18c549c66f7b1eb1f0f7e1d69de13d3229668239b5591034d338c953fdd5f402bbada3d29171da9d5aa492d0f3e7373776799fc4ef86f61afe9573a969f6eb0ead6e86406318f380192adefe86b33e06f8aa7d5349b9d0ef246796c4078598f3e51e36fe07f435eaf76e91daccf21011518b13e98af9ffe078f3fe206ab3c19f2040e7f02e3150f4923a60dce8c93e8737a6f8464f18f8dbc4b6104be5dcc4d713c39e8cc25c60fb1cf5aeefe167c41b9d32fbfe110f121686489bcab7926e0a30ff966dfd0d52f84dff257bc45e9b6e3ff00470aeb7e2afc381e25b36d5f4a40babc032540c79ea3b7fbc3b1fc29453b5d1b559c5cbd9cf6b2fbcf4f52480735e03e21ff009394b3ff00aed6ff00fa2c5747f0a7e23b6a689e1cd6e429a9c00a43249c1980fe13fed0c7e38ae73c407fe324acff00ebb5bffe8b14e4d357465469b84e517d9917c7bff91d346ffaf41ffa31abe80847ee53fdd15f3f7c7f05bc61a400704d9800fa7ef1aafafc39f8a0ca0af8a54023207db65ffe26926d49e8395352a50bcac7b26bf0cd71a06a10db1c4ef6d22c78fef1538af0ef821afe95a35fea3a56a5b2dafae1d4452cbc648c82993d0e7b77aedbc07e11f1a687e207baf106b62f6ccc0c822170f261c9041c11ec693c79f08ac3c4f349a8e9922d8ea6df3371fbb94fbe3a1f714dddea888b846f4e4f47d4f40d4b4bb1d62c5ed2feda3b88241ca38cfe23d0d7907ed0aa134ed0157a0926fe49587a0f8e3c4ff0db5a8f44f13c72cd63903121dc517a6e46ee3dab63e3f4f1dce8fe1d9e170f14af2ba303c1055083fad1269c597469ca9d68f55ff00f56f0871e0bd0f1ff003e10ff00e802bcc7e3b7885cc7a7f862d0ee9ae584d32af5233845c7b9cfe55e93e189e3b5f00e917133058e2d3a276627a0118e6be7bd3fc59a56a3f15dfc4fe2099d2d2394cb0a2c65f95e23181e9c1fc2893d1226841b9b95b62c6b7a15e7c27f14e81aa425e48de257939eae38913f23c7d7dabe94b2bc8afece0bbb7903c13a078d877046457897c45f1ff837c5fe1596ca0ba9cdf44c25b72d6ec06e1db38e32322b73e05f89bfb4bc3f36893be6e34f398c13c9898f1f91c8fca945a4ec8aad19ce9f3c96a8f59e68a38a2b5388f10fd9ec7fa26b63fdb8ff0091ab9f137e18cb3ccde25f0d2343a8c4de6cd0c27697239de98e8ddfdfeb5dcf833c05a6f8223ba4d3e7b8945c952fe7b038c0ed802ba92b9150a3a599d13aed557389e53f0f7e21db78cb4e97c3be20da9a93466260e302e148c1fa37a8ae0b4fbad57e0c78da782ee1927d2ee78c81c4a99f9597b6e009e3dcd7ab6b9f08f40d675cfed78e5bab0bb24331b490202c3f8ba707e95d3ea1e1bb0d67494d3b58897508d5705a650189fef646307e98a5cafe68bf6b4d3765a3dd7f919da4fc41f0aead6ab3db6b36abb864a4afb1d7d883deb23c57f167c37a0d949f65bc8b50beda447040770dddb737403f5ac6bdf805e1c9e62f6b7d7d6e84fdc2c1c0f6048cd68e8bf04fc29a54c935c24fa848a7205c3fc99ff74019fa1c8a7ef136c3a77bb7e4717f0bfc35a9f8a7c592f8d75b56f2d6432425c63cc90f4da3fbaa3fa56dfed05cf85b4af5fb6ffec8d5eb91411c112c5122a46a30aaa3000f4ae7fc65e0ab0f1ae9f6f67a84d3c51c12f9aa6120127047707d68e5f76c0abdeaa9cb643fc067fe281f0fff00d83e1ffd00574554b48d322d1b48b2d36066686d214850be3242800671f4abb54b63093bc9b3c37f687ff9807d66ff00d92bd1748f1a78662d16c63935db0575b78d594ceb90428a778cfc01a678dfec9fda33dcc5f65ddb3c86033bb19ce41f4ae4ff00e140f863fe7f752ffbf89ffc4d45a49b68e852a52a6a3276b1df5978ab41d46ed2d6cb57b3b8b87ced8e394331c0c9c0af16f8a5ff0025a742e7f82dbff46b57a07873e10685e18d76df57b2babd79e0ddb565752a72a579e3deafebff000df4af10f8a2d35ebab8b94b9b6081123650a7631619c8f534da6d0a13a74e778bd2c7517f616daa584d65770acd6f321474619041af9ff43bbbaf849f12e6d2af1dce8f76c0163d0a13f23fd4743f8d7d15b6b98f18f80f49f1b5bc11ea3e6c7240c4c734240700f51c83c74fca9c95ecc8a35146f196cce7be31f899745f03bdbdbc9fe93a91f2632a7f831966fcb8ff00810acef87bf0bb417f06d95ceb9a547737d720ccc642c0a29fbabc1f4c1fa935b17df0934ad4d34c8eff0053d46e22d390470a3bae36e7383f2f3e9f4aefe389628d510055500003b0a2d777653a8a34d460f53903f0b3c17ff400b6ff00be9bfc6bcb7402df0d7e32cfa5b929a6df111ae4f1b18e50fe078fcebe8320d723e30f875a4f8d2e6d2e6fa5b8827b605564b760a48241e720f439c7d4d271ea854eb6ea6ee995b59f88ba6f877c60ba26ac7ecf04b02c915ce32a189c61bd3eb56fc41e2ff0c43e1dba9aeb54b39adde161e5ab873264740a3ae6a4f11fc3fd0fc55670c5aac2d25c428116ed1b6cbc0f51c1fa118ae3a0f803e1e8ee43cda85f4b0839f2f2ab9f627143e61c3d8d936da665fecff693ac5adde8564b37911133d0b0c938fa023f3accf04ffc9c06a5e9bee7f957b9695a3d8e89a7c561a75ba416d10c222ff9e4fbd739a5fc38d2f49f18cfe2582e2e9aee62e591d86c05bae0014b974457b74dcdbeab43b01cd70ff17ffe4976b3f487ff004725772060564f897c3f6fe27d02eb47bb9248e0b8dbb9a33861b5830c7e2055bd518536a334df7380f829ff0024beebfebe66ff00d056b9efd9dffe3e35ff00f761fe6f5eade16f0858f84f419348b296692077672d2905b2c003d00f4aa5e0bf87ba6781def1b4f9ee65374103f9cc0e36e718c01eb52a3b1bcaac5a9f99d5b0dc31c60d784fc4cf01ddf86b541e31f0c0685637f3678e118f29bbb01fdd3dc57bc62992c093c6d1c8aac8e0ab2b0c822aa4ae634aa3a72bad8f9b3e18ea92eb5f1857539d42cd742691c2f404ad5cf88d3476ff001d74f9e67548a396d19dd8e02804649af52d0fe15e85e1ef139d734f92e5241bf6c05c18d77761c671f8d47e28f84fa278b35b7d56fae6f639dd150889d42e00c7706a395d8ea75e9ba9cdd2d6370f8e3c2c064ebfa781ff005dd6b9bf127c60f0be8d6d21b3bc5d4aeb188e2b7e573eedd00fd6b3bfe140f863bdeea7ff007f13ff0089ad5d23e0c783f4a9d666b59af645395fb5cbb941ff0074000fe20d3bc8cad41756cf3ef87de1ad57c73e346f19eb8845a24de726f1812bafdd0a3fbab81f95759f18fc0b71e22d3a1d5f4e88c97f64a55d17ac91673c7b8393f89af518ade382258a24548d4615546001ed4fc7d29f269625d7973a9ae878d7c3ef8c3626c62d27c4d335b5d42046975203b64038f9bd1beb5e92de33f0d241e7b6b96022c67779eb591e23f857e17f12ccd717368d6f76dd67b56d8cdf51d0fe59ae593f67dd084b96d56f8c7fdd0141c7d71fd292e65a14fd84df36a8c8f88bf15e1d62d64f0f7858cb39bafdd4b728a46e0782883a9cf4cfe55d8fc27f0449e11f0fbcd7c806a37a43cabd7cb503e54fea7ffad5b3e1bf875e1bf0ab0974eb106e47fcbc4ede649f813c0fc00aea76f06851d6ec99d58f2f24168781fc25ff0092bfe22ff76e3ff470af7c2335c8f877e1d697e1af12deeb9693dcbdc5d870eb2302a3730638c0f515d7e29c559135e6a72ba3c6be2b7c3995e46f1578790c77d09125c470f0cd8fe35c7f10ef5e77e1ad72efc47f16744d4afb1f6969a14720637155db9fc715f54326e183823bd70c9f09fc3f078ba3f115b35c413a4c2610c6c3cbdddf8c6464f3d6a650d7436a5884a2e33edb9e6bf1f081e32d1d89000b4049ff00b68d5ec51f8dbc2e235075ed3c6001febd6b3bc61f0d348f1aea16f7ba8dc5d472411794a2165008c93ce41f5ae73fe140f860ff00cbeea5ff007f13ff0089a76927742e6a53846326d58ec6efc6ba19b2b96d3f55b2b9ba8e17923852604b9552d8c0f606b3bc2bf13bc3be23b18d8df4567778fde5b4ec1483ec4f047b8aa3a07c1af0f787b5a8353b7b8bd9a5843811ccca51832152080bcf0c6abeb5f03bc2fa9dc34f6a6e34f76392b0b653f053d3f0a3de252a3b5d9cafc72f10685aa5969f61653c377a8473172d090de5a1182091ea71c7b5667c53b4b8b1f87be09b5bbc89e385c383d54ec4e3f0e9f857a2f86fe0d786fc3f7c97afe75fdc467286e08daa7d4281d7eb5b5e32f0169de3786ce2d467b88d6d59993c86033bb039c83e949c5bb9a46bc20e296c8e07c79e26fec8f839a1e996f215bad4aca18ce3a88c2296fcf81f89ad2f007c2cd09bc1d653eb9a545737f703ce7321605037dd5e0f618fc49ad9d4fe13e8dabdd69b2de5ddeba69f04704316f50a553d78efdebbc48d63408a005518007614d46eeecce5552872c37ea721ff000ab7c15ff42fdb7fdf4dfe35e49a85b8f857f17a0b9b6531e9372721474f29b865ff00809e7f2afa2f15cbf8c7c07a678dad6da1d45a58daddcb47242406c118239078e87f0a251bad054ab34ed3774cd8fed8d3ff00e7ee2ffbea8ae03fe148691ff41ad67ff0207f85155a872d2ee7a8514514cc028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00fffd9, 0xffd8ffe000104a46494600010100000100010000ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc0001108005e006403012200021101031101ffc4001c0000010403010000000000000000000000000405060701030802ffc4003810000201030204050302030705000000000102030405110021061231410713225161147181329115b1c116335262a1d1e123254243f1ffc4001b01000105010100000000000000000000000002030405060107ffc4002f1100010302030605040301000000000000010002030411213141051251617191061381a1f0222332c133d1e1f1ffda000c03010002110311003f00ea9d1a34684234df7ebcd0d8aded5b739bca801e50794b166df0001df63a8a71771e9b5dc3e86c942d73a883fea55952796241d4647fe5d7edec4e4081f1871557f132c74d5713d15be465786df0a096aaa0f627fc2371d71f01b4c49531c67749c780c4f6cd283095304f15a852e512d6db6b28ad52ab14ac9d4fa98740100391db20f71a41c41e21555da6a0a5e0f159048f3059a79a9415e43b77ce00ea761d3aeb5d370c715f114713573535969931e5f98827a8e9fab7e8df953f1aac3c54b87f63afff0041575b71b82118576937d9549cfabddbb74d458df5b247f5b5ac71e77b70c2d6f74b2180e18ab529f8bef7c3f7e54e259e5b85b9e1e60f4d481795c9f7c0e98f7ee36d3b56789f6c33524566a6a8b9cb293e7471ab2bc2a075c11ea3f03b0fb6b9aadbc4556d79fa05aab9d1d5f2bb72c8aa02908580382081803bea536ae30bc5bea854334354d8c734d1867c771cc7d58fce997545553c41aedd7bad9e57f4008f70a753ecd92ac39d00b86daf6e7d6dc1748f0e7135b7881641412389a319921914aba7dc69eb540f0bf16ccb77aab8da251f575257ea286a8e449ec11f6c11b800e3e0b74d4fad5e223545c3fee56c9682daede4a4f267d320fd41be33b76e9f70264158c91a03c86bb873e5c79119a83242e8dc5a464ac0d1ac232ba2ba3065619041c82359d4b4d23468d1a108d21baddedf688d1ee759052abe794c8d8ce3a9fb0ee7b6976a86e3cbac33f185c60bf415798f1141e4f4814333212a767e7099dfd20331276c010b3687bac97cbb43c314122525c263f4d2321f2a3c1c972483860a46413b646c4ec1fb88f85aa386f87d12d46aa4b9d739159798e565960db2029018a863b671f7ceda93f8536da9b4f07c66e1232f9ce6a15242731a90324e7bb105cfcb1e873aaffc4df146692acdbb856b3cba641896ae2fd4edec87b01ee3aff38eda786291d335bf53b32a3d65732963de90f41c56da4b4d9a3b0356f175eaef4d568582a545779ef5083f4c82291491cded81d33d3550f194a2baf1475fc3a250d413196281d5229265f49f4f9602f37a4e546e474cef8d751349533b4d5123cb2b1cb3bb16663f275acf2b63bebae7ef607259c3e2293cc0437e9e1af749a4b9ddf88ef71710df4243cb03c31c6b91e692acb94427d2bb8c93b6c7a9db47d2c4232236959c0254290b93edb0d28964791d9e5792490fea6762cc7ee4ee75e428c6573a8ce859ba18cc00c958d278c66a498bd918730e873eb7d0f70975450c147f49251d7fd4bca99931297311c0ec546324b0c6fb01a921e35ac7e1b7b5d6b73bab2e243b9741bf2f4e99c77c8f9d4450b2b649c8e87df4ae094c53433a4714a627590472a0747c1ce181ea3e3506a631e634c8d160411c88d7e66b7fb16b287c43485ac27ce6624123788e00ea34bdb03a0182e94e01e27a3b820b745f4d1a4608a3f2e4fefa35033e93b8619048f620ea69ae3be0eb83d938ea24a0a88ebaa25895a0764689629bd32328cef8c9319ec4138db5d6d62b80bad9e8eb828433c61ca839e56ee3f073ab989e4dc3b3fd7cc3d1675eddd39592ed1a3469d484c9c6b77fe07c335d5cac56544e58c8193cedb0207c673f8d54965a6ad9f8deda6f068aea2694aaac922d495c04e60c09250a0e6f6dc36d83ab47c43a9a0a6e17a83748a49a3760b1a4442b17ea0827618c13939d81d8f4355f86378e1db35ce7acbdd50a499224869de423cb00449cc36190dd7b01bb77ce85d02ea5fe3a7118b570b1b653ca12b6e3e8fb443f59fcec3f275cdcdb77271df562f8dd7fb7710f1151cb68aa8eaa962a50be6c672a5b9d891fcb55c9079b07a6a3bcdcac46d898c954e0726e1f3d5671d34038ff006d19206e34020fff00348556bd139dc77d606df7d60f61a363f7d085ef98e9553396468fa91ea1fb6ffcbfd3491173b8d28a5f4d4201939f4fbe33b7f5d353337d842b5d835eed9db461a869b59c2fd0e07d8acdda591ad71f9b743047453878298c45b224da570c3f4eca01c939c8c0d748f8355b4d51c3f51051accb14522c8ab20d807404907d8b731c76ceb9eeb282eb0dbae09fc15df3006924a8a660f02061ea4cec3270b9c1d5dde0454d5cd684fa90ad13d1c4d1b804630ce0a91dbf3b939ed8d14ee20303b98cff005a9c3d05d7a76db6462adee88820e38588f63feebaab57468d1ab054ca2fe22daaaeeb618d2863f36582759cc60eec02b0c0f73b8dbfaeb9df8c2e1356dd214af2a9568bcc6210ac5ca0e495c2e0121cc8338cec33939d7515f63966b2d7c74c584ef03aa729c1e6e538c1d7355fa1b6ad9d9e966a81552287781d156283795f973fe22412bb0f4b72e4e7766a185f196853f664eda7aa64ae1700a88cd13bb2f201b1c019f7fe9f3f3adaede65ca36e7e6f59c64f419db1fd35e80562be602c990480719efaca3282ecd82cd9c37704ff00bea8db3580074bfbad1ed1f0c19ea2a258c0fb862769816b8ef616e18f324af31f39a8f349258213cc4ee081b1fdc8fdf5aabb99d32cc588eec7271f7fdb5b04b1a06c9396031b76c83fd069154d52b7a63395f7eda7222f748d2064a06dba1a2a1d995de6dbee3cb9b95ee436d6d7f2bf417d14e7c17b0d3df78cd12be35969a9226a868d8655c8202823bee73f8d4e7c6fb03575ef8669edf450c46a6434de7aa851cc4ae14fc0193fbeabff0007789a9f8738bd26af7f2e8aaa334f2487a2648218fc640fdf57fde23b35fab2cf562ed487f8754fd4a8499487f49183bfbe0fe3570d00b6cbcde8208e7a2316a4e3dc7e9577c7f6aa67f16f85a8a1a6a5485d222e8a8143859189e6036e831af3370e35c7c78963a8a25345172d5b04185e5083949c7bb81b1ebbeacfaeb25bef77cb5dd99a298dbb9cc6d19049738c648ec3738f73ad6f6ea4b05d6ffc4d334ac27810ca88bcc408d4e48f93b7b0db4bddc54f76cfdf792722f0ef403fb55af8f95945254c5495cc6374118a792008ec1cb65bcd24e5540c15520f31ce3a6ce9e0751470c42486b1e7c51a87058e0b3393903b8d8efd3b0e87502f116b6bab2fcd6f92969e5b7d648d398a292299d2465ce1e61b8031900900600dc0526e4f0ca9e35b654d4c70791cf20842f211b20c672705b7246703a600c0d36fb995a0733a74ebae9ff6d9ba9532d1a3469f42354ff8adc374a6be869adb411446bcb2bb07e512316040193caa4372b6d8c9ee064eae0d3671159a9afd6c7a3abc80487475009461d08cfe47d89d071c0aeb4969b85cb3c45411daae2f1c52c12539609cf0c859049804a82493df6dfb1c6460e9aa78cca8406008dc02700fc67b7fc6a775fc31512f124567140b3dc60592410cedccad92c339257287983ed961be0f50239c5160ace1baf969ebe3748577566dc05cedbf461fe61f900edaa9a9a631bbcd8c7a2d7d0ed08b68d23b66d63c8de16debd8f7e3d73cbac5e7a79137214a9db997719f6ce94ad2c0b113b9257219d80fd95493fbeda5ade653ca629526a797bc72a18db1f2a7b6b0179a48f288c1581c2a28271db61ed9d362a9c486bb02b375be066d2472d55238491869201cc76043bb0e58a77e11b2d1ddadf5467495dd082a69644f39463af96e40743eea720fc1d36416b9aaeeeb6fb6c53544cd27222f26189f9009c7efab47c27e1ea2e24ad5aeaea049e8692823a57f393d32cfd49f9c0db3f6d5b4b4b60e16a669e3a7a0b6c78c1648d50b7c0c6ec7e373ab46b2e16319b144d6b386e8245f88be7f2eabdf07b84b887872ff00706b9c7f4f43e572604819657c8c32e3d8677dbae9c3c5ebfad96a283cf8aa6ba9245646a4a6a9f219253fdd3b11b90795c0076caf7e9a7bbbf1edbe28c41671257dd256e44a6113ab237f9d480c3df18c9f81b8adb89ed373376a65e2aa4fa986b668d9a38e5c3543282503146e6f4976521463f4807b9740b60afa9a945345e5467be298b83f87eed6df35eded032354347480e0191ce14374df03d8018df6edd1b6aa41416ea7a65c1f2d006209ddbb9df7dce4e9b385ec3416cb7d23c568a4a0aa118e648bd66327aa873b9f93df4fba66288b5ee91f624f2d341f3b2958001adc00468d1a34fae23468d1a109838b385e9388a189ddde96e14e79a9ab22da489bafe47c7f2d57fc4d70e20a386828788ad54f5ad4f54b24756a79525c06e56e87d41b958a81938c72fbdbfad751045530bc351124b138c323a86561f20e85dbae74a94ba5445f4756e2e31c0a4ac55311ab2429507271cd111cf92485ce07c00968ad96caba9862a8b40a776984664a2af21704b6480c5b18f4ee71df5d0f6ab15b2d33cf35ba8a1a79660048ea37207419ec064edd34a6aa828eace6aa929e73ef2461bf98d21d1b5df90ba7a2a9961fe3711d0d951505e6b6d11bd051fd7d3d153f388fcead003618fa87204273f7ce4e770349a37ba4931aba8996169c95fa880b3a85e425879ce46fb67f5f738cedabe60b45b69dc3416fa38987748154ff00a0d7bba5b68eeb48696e34d1d440486e4719c107208f620f71a5d933755458eef7482f41686d42b6e5f4294a6a1dfd52e1bd0d20e552303396d94e47ab6d4df8678625a7ae379e209c56dee4180dff00ae9d7fc283faff00ce6436fb7d1db61315053454f193922350398fb9f73f274ab4211a3468d0b88d1a346842ffd9, 0xffd8ffe000104a46494600010100000100010000fffe003b43524541544f523a2067642d6a7065672076312e3020287573696e6720494a47204a50454720763830292c207175616c697479203d2039300affdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc000110800c800c803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fd52a28a2800a33451400514518a0039a28a3a5001484e3ad735e3ff00891e19f85de1f9b5bf156b569a1e991759eee4dbb8ff007547566f455049f4af8fb5dfdb07e277ed17a9dc681fb3ef84e5b6d295cc571e33d6e3091443b9456f954f7e77b63f80544e7182e693b21a573eb1f89ff19fc17f073456d4fc5fe21b2d160c131a4f2666988ed1c632ce7fdd06be50d4ff006ccf8a3f1faf66d27e01f80274d3b718dfc5be208c2409eeaa7e40475c12c7fd8ae0341f82be06d27c6335cf89ef357fda4be2c0606e2cada52fa6593f613cce762807b3b1e0711d7d0b6bf0afc69e3db2860f1af8863f0c7875176c7e0ff04335a5bac7d926ba004920c70553cb5af0f159ad3a3a2fc7f45bfdf614a5187c4cf9f25f81de297f172cfa87ed516f07c682331d825f62dd07fcf0c6f18c9c1dbb071fc07ad77565fb59fc66fd9cae22b1f8e5e02935dd054ec1e2ef0e286523fbce061093e87cb3ec6bde62f80de00b6f08ff00c23e3c19a3ff0061484936cd668c1dbfbe588dc5ff00da273ef5c949f08bc5bf0f21907c3af149b9d24a957f0978bcbdf69ec9dd22949f36118ed975ff0066bcaa39dda76a9a5fbafd56df3bfa99aad06ecd58f59f84bf1ffc07f1bf4b17be0ff11d9eaacaa1a5b40db2e60ff7e26c32fd7183d8d7a16735f9c3e37f837f0f35ef13c1712daea7fb367c4f3266cefade5c68f792ff00d329e322319f40636e79535d8697fb507c63fd976eadf4cf8e1e1b7f16784cb08e0f1a684a1ced3d0c98c2b7d18231ff006abe9a8e32956b59d9ff005b3d99b5afaa3eefa2b8df861f17bc21f18bc3f1eb5e10d72d75ab16c0730362485bfbb221c3237b3015d97eb5dc487345145001cd1cd14500147345140051451400518a3bd1400628a28a003028a4e2b83f8c5f1bfc1ff02bc2b26bde2ed5a3d3edb910c0bf34f72e07dc893ab1fd0772050077534c96f134923ac71a82ccec7000ee49af91be327eddf047e226f02fc19d19fe2478e24263f36d14bd8da9e84b38ff00598ee41083bb76af25f1578c3e267ed8ba55deb7af6aa7e0c7c02832f2dc5ccbe5dcea5167b9e37e7b0fb993c0908aefbe13f80ee24f0f0d0fe1268b27c31f01ca00b9f175f400ebbac8fefc2ae33129ed2483233f2a2d7958acc29e1d3d7fcbfe0bf240da8abc8f32bef83704de30b5d6ff00680f10ea1f15be255c2f9b63f0f3c3cde625b83c8126cc2c718e324ec4e0f2f5efda6fc27f157c42d36decfc677507837c1d128483c09e1293c88847d92e6e502b49c70523da9ee6bd13e1f7c2cf0e7c32b096df42b0114d70de65d5f4ec65bbbc93bbcd3365a463ee78ed8aeb78af85c5e6d56b3f71dbcffcbb7e6724ebb7a474464f85fc27a3782f47834ad0b4cb5d274e84623b6b3884683df03a9f73c9ad88e23348b1afde638a6d79ff00c7df8a917c19f851ab6beb201ab5c29b2d2d09e4cee0fcd8f45196ff0080e3bd70e0f0f2c6e2141bdf57e9d4e2a95234e32a937a2d59e949afe8fa9dadbda5b5dc6f24923c300cfdf910c8180f5ff5527fdf26aa81f9d7c71af78bb53f05fc23b1bfb199bfb4fc33a7f86f580598e59e469cc81bd9bed201f5dd5f5a785fc59a7f8fbc2ba4789f497dfa7eab6eb3a0cf28c7ef21f756c83ee0d7d1675865529c7114d7c3a3f45a2fbb629d5e69aa72d25cb197ca4bf47a12eb9a0e9de24d2e7d3b55b0b7d4b4f9d76cb6b771092371e854f06bc86ebe0e788fe1bdb4ebf0db5286f3c3f2295b8f02f8999ae34d950fde48256cbdbe791b7e64e7ee8af6ca2be5a8e26a507ee3d3b74348ce50d62cf84ae3e0c691a878e1f53f847aa5ff00c08f8c3083249e10d564d9697fdcfd9df94963273f7772faa2d7adfc2afdba6f3c37e248bc07f1eb426f0178ad7091eace8469f77ce036ee4267fbc094f75e95ed9e3cf871e1df893a41d37c45a5c3a840a77c3211b65b77ecf14830d1b0fef2906bc3be257c3fd4749f0dc9a0fc42d1e6f8c1f0d541f2f51f2c37887451ff003d370c19d547f1a624c750e2bec3039ca95a13febd1fe8fef3ba15a33d25a33ec7b4bb82feda2b8b6963b882550e92c4c195d4f20823820fad4d5f9c5e13d5be21fec95a545e29f875acb7c63f80d33191ecc485aeb4c4cfcd80398caf7c0db9cee453cd7dadf047e3f7837e3ff85d759f096a6b72140173653612e6d1cff0c89dbd88c83d89afaea7561555e2cd5ab1e8f45275a5ad841de8a4a5a0028a28a0028a28a002933804d0cc14673c57c6bf1fff006b6d7fc67e3193e11fc06806b9e2f94b45a8ebf110d6da5a83872aff007772f77390a781b9b8132928abbd8373b9fda63f6cad23e0c5d45e14f0cd9378c7e24df1115a68567993c976fbad36de475c841f31f61cd7ce56bf0a6e2d7c6563e32f8e6f37c4ff008bbaa2f9ba2fc3db175786d133953301f247129ea4fc8307fd61ae8be12fc30b7f859ac6a1e1ef877243e33f8b33923c4df10f544335a68ccfcbc71e4e6498e4feec1c93cc840f96be90f86bf09b48f86b6d772dbc93eabaeea0c25d4b5dd45bccbcbe93d5dfb28ec830aa3a0af94cc7368d34e10ff83f3ecbf17e44cea469e9bb397f0dfc1bd47c53ac5978a3e27dddbebbabdb11269da0daa91a4e8fe8228cff00ad907fcf5719fee850057afa8da05006052d7c356af3af2e69b3ce949cddd89da8ce283436c8e19679a58ededa152f2cf2b0548d47249278005453a73ab25082bb64dae2feed5249669120b7854c92cd21c2c68064b127a0c57e697ed5bf1ccfc6cf88822d3246ff00846749cdae9a9da539f9e623d58e31ec07bd7a17ed61fb5a278d60b9f057826764f0e06db7da9ae55afc8fe05f48ff00f42fa75f9abc0da67f6d78d7c3fa781bbed7a85bc18f5dd228feb5fa165d81582a767acdeffe47c466f992c44961283bababbeeefb7a2fc4faa3e20c42e6fbe2fe82394b5f0b5a46a9e86d05a1fd3635677ec35f1ea1f0bead2fc3fd7ee445a46ab2f99a75c4ad85b7ba381b09ecafff00a163fbc6ac5bde0f107c74f88b6a0ee5d56d35bb45f7fdcca57f58d6be45462843025581c820e306b5c2ca35e94d495d39497e27d0f154a79663f0d5a9ff00cfb49f9a5a347ece491b432346e30c38a6d7cb1fb2bfed716be2db4b1f0678eaf56db5c880874fd6276c2dd8e8b1cac7a3f60c7ef7d7afd552c4f0485241b5857c566197cf073bad60f67fa3f33b70d89a58ba6aad1775f8af263690ae6814b5e49d2792f8afe0ddee91af5d78bbe1b6a10f863c5131df7b652a16d3358ff66e611d18f69530c33ce7a57ce5ac7c287d7fc6f73e29f845e6fc22f8e3a5a99f51f05cf22adaea69d59edcfdc923623a81b09fbc10f35f736335c6fc4af855a2fc4dd3edd2ff00ceb2d4ec9fced3b59b07f2af2c25ecf148391eea720f420d7b782ccea61e494de9dffadd7e3d8e9a759c7496a8e33f668fdb2f4ff8ada8c9e0af1ad81f05fc4eb1261b9d1eec18d2e9d472d0eee73df61e71c82c39afa681c8af81be2e7c32b5f8997fa7f85fe294b1786be2244447e16f899a6c7e4dbea6ebca433e3fd5cdc7dc27939319fe13d47c07fdac7c49f0dbc670fc22f8f918d2bc468445a6789e438b6d493384defd327a07e013c300c39fd0f0b8b86222acf5feb6feb43b746aeb63ed2a2915830c839079e296bbc4145145001de992cab0c6ceec151412589c003d69659046859885503249ed5f08fc70f8d5e27fdacbc7d77f073e10de1b3f0bdb1dbe28f17464f9423ce1a38d8754e08e0e64390308093139c6117293d03725f8d5fb41f8b3f69ef1ade7c22f8237260d1a2f93c45e3442443145d1d2271fc3d46472e410bf2e58cbf0afe1de9f69a2dc7c3cf83f34ba57856293c9f137c45503ed7aacebc3c166dd3d41907ca8090b96c9ab5f0f3e1ee95e22f0ff00fc2b8f86826d1fe13e9f218b5df1342db6efc4b70389218a51cf959055e51d40d898009afa5f42d0ac3c35a45a697a5d9c3a7e9d6912c305ac08152340300002be2333cd5dfd9c37fcbcdf9f65d3d4caad5e4f763b94bc19e0bd17e1ff00876d343d02c22d374db55c470c5dcf766279662792c7249eb5b94515f1b29393bb7a9e7b770a09a3a579bfc76f8efa27c04f0d25e5f22ea3afde29feced255b05c8ff96927f7507af7e83dbb30984a98ca9c94fe6fb19d4a90a50752a3b456eceb7c6fe38f0ffc33f0f49ae78a7528f4cb04e115b99676fee469d589f6fe55f9f3fb437ed63af7c67964d234d57d0bc208df25846dfbcb9c1e1a661d7d768e07b9e6bcc7e257c52f127c5af114bacf897517bdb96c88a21c4502ff007234e8a3f53d4926b94afd030983a5838da9ad7abeaffc91f0198e733c55e951f761f8bf5f2f21318af47fd9cac06a3f1d7c0f1b0ca47aa4570c0fa467cc3fa2579cd7acfecbf1f97f14cea2781a6691a8de93e9b6d2400fe6c2bb5bb2b9e4e5d4fdae328d3ef25f9a3bdf841aa7da7e39e89732b717ba93c4e4f7136e43ff00a1d7ce5a95a369fa95ddab0c3c133c447bab11fd2bd87c0da8ff0064f8d740bece3ecfa8412e7e9229fe95c37c66d2ff00b17e2ef8d2c42ed106b3768a3dbce6c7e98af0f29973539af3fccfd53c43a56fab54f55f9338efe75f567ecedfb6b5ef83a3b5f0d78f5a6d5fc3eb88edf531f3dcd90e803779107fdf43b67815f29e3da8af6e518c938c95d33f27c2e2eb60e7ed293b7e4fd51fb23a56a961e20d22db56d1afa0d534ab95df0dddb386461f5ec7daacf5afcb2f821fb41f89fe066b627d2a7379a3ccc0de69170c4c138ee40fe17c7461f8e4715fa51f0e3e23e83f16fc216de25f0e4e5ed243e5dc5b487f7b6b2f78dc7afbf4230457c6e6394fb14eb61f58f55dbfe01fa3e5f9952cc23a6935bafd5775f89d2d0451457cc1eb18de2ef07e8fe3af0fde689aee9f0ea5a65da6c96de619047620f5041e4118208c8af9afe297c3dd3e2d022f87df171e6d6fc073bf95e1df1ebf37ba24edc470ddbff77a0129f95b80fce0d7d5b8aa7ac68f65afe9775a76a3690df585d44d0cf6d3a078e442305581ea0d77e13193c3495b6feb55e7f9f535a751d37e47ca3f073e3df8aff650f1a597c27f8d1746f3c2f7184f0e78d4e4c4d1745491ff00ba381c9ca64672b823eed8274b889248dc491b80caea72181e841f4af8a7e217c3fd2bc1fe1e7f87ff0011229b5cf835a8c823d2b5c99b7ddf85ae09c468f21c9f27270921cedcec7ca9ac2f831f18fc4dfb1df8f2cbe12fc57bd6d47c097a71e18f17b64c4919236c7237384190083feace3aa1047e9382c6c31315aebf9ffc1ee8f413525cd1d8fbda8a8e195278d1d183a30dcaca7208ec4515ea81f127ed35f1c3c49f1dbe203fc05f83f7244f2e63f13f88a227cab383389220e3d338623927e41ce69de06f86da55ce8eff0008be1bbcb61f0fb4a97cbf1778aa13b6e35aba00799691483f291c1c28f917bd7987ecdc23f0ff00ec4d6da9787e43a36b3e25f14dbe8baeeb76fcddfd9e6bb585991cfdd658e5183d8b311c9cd7dbde11f09e95e07f0e58687a259c761a658c4228608c7000ee4f724e4927924926be2b37c7ca1ee47cd2f96eff00cbef33ab3f66acb765bd1745b1f0ee9569a6e9b6b158d85a44b0c16d020548d00c050076abb452d7c3b6dbbb3ce1296928a008eeafedb48b1bdd4af5b659585bc9753b7a222966fd057e4b7c57f893a9fc5af1f6abe26d5246325d4a7c9849cac1083fbb8d7d80fcce4f7afd49f8a1a65c6b5f0a7c71a75a02d7773a25da44abd59bca6c01f5e95f9102befb25846384e65bb6eff23e3788eacd2a5497c2eefe7b0b451475af74f8812bd8bf6758fecd07c46d48f4b7f0ccd083e8d34f0c5fc99abc76bdafe0cc7f63f843f12ef4f067934db153f595e523ff00210ac2bcb968cdf93fc8fa5e1ba5ed737c3c7fbc9fdda98d1b986447070548208f6a77ed41008fe39f896751f25e982f54faf9b047213f9b1a8ce2affed30866f14785b51efa878634e998fab2c6623fac55e064f2d6a47d0fd5bc40a5cd81a553b4bf34790d1451d6be98fc104eb5edbfb237c5db9f85df16b4db79663fd85ae4a9a7dfc04fc9f3b6124faa31073e85877af13adaf04e9971ad78cf41b0b452d75757f043105ebb9a4503f9d1be8ceac2d59d1af09d3dd35fd7ccfd839e1f227923fee9e29956350ff8fc906738c0cfb8155cd7e59898469d79c23b26ff0033f60968d852d1495ce22aeaba5d9eb7a75cd85fdb457965731b4535bce8192442305581ea08af99bc73f0eb48f0ee8a7e177c43126a5f0a3589445e1cf104cdbae3c3b767223b79243c88f2488e4271fc0d90457d47599e24f0e69be2ed0afb47d62ce2d434cbd89a19eda65caba91c8ffebf635dd84c54b0d3bf4feb55e6bfe01ad3a8e9b3e60fd9dbe33f88ff00665f8870fc0bf8b97666d3243b7c2be27949114d113848598f41d00c9ca1f94f1b482b8cf8eda75b6b1fb1778fe1f1031d726f04789e4d1fc3baa5e73771c51dc431286907df215dd09ee1573c8cd15fa8616bbad4eef747a4d754737f0122974ffd8c7e34f878926f3c25e24fb6807aaf93241267f381ff002afd03b39d2eed619e320a4881d48ee08cd7c65f087c3be57c69fdae7e1a32e06b36d3de4117b4ab2e08ff00c094fd2be9af817aff00fc251f067c11aa96dd25ce8d6af21ff6fca50fff008f035f179ec2d3bf9fe697f91cd895a459dd527514b498af9438428a5a31400f825f2265723207047a8ee2bf337f6b1f82337c1ef893732da424f86b5876bbd3a651f2a0272f0fd509ff00be4ad7e97d739f107e1ce8bf16fc1f77e17d7e032dacff003413a0fde5acbfc3221f51fa8241eb5f4b93e39519fd5ea7c32dbc9ffc13cccc7031c7d1f67b496a9f9f6f99f90f457bcf89bf624f8b1a1ebd7b6361e1d6d6eca190ac37f6d710aa4c9d98067041c75047073d6b2ffe18efe31ffd09173ff8156fff00c72bee7965d8fce6597e2e2da74a5f733c6b35ee5e074fb17ecdf7b2f46d43c54b1fd561b5cff39ea97fc31d7c63ff00a122e7ff0002adff00f8e5763e31f03eb5f0b7e0ef82bc37e20b16d335696ff50d427b567562a0f931a125491c84f5ae0c7de1869b7d8fb3e0fc0d78e6f4e7520d249bd53ec79c638ad6f8f49f6bf057c2dd47a96d2ae6c58fbc5772103f290564d7a5df7c27f157c64f823e174f0ae90fac5de8dabdfc33c71cb1a148e4481d4fcec3b86af9fca1fefdc7ba3f51e34c3cb1194c9415da69fe27cc94b5ecdff0c75f18ff00e848baff00c0ab7ffe3947fc31d7c63ffa122e7ff02adfff008e57d7f2cbb1fcf3f50c5ffcfa97dcff00c8f18cd7d6dfb087c139759f12bfc45d5adcae93a4168f4e0e38b8ba231b87a8404f3fde23d0d73ff0abf618f1ef88fc5d6f0f8c34b97c35e1f8bf7b7570d345249228ff0096718466f98fa9e075e7a1fbef48d234ff000ee8f63a3691691d8693631886deda2180aa3f993d49ee6bcccc318b034b9bed3dbfcfe47d264f9554551623111b28ec9f57fe48b6cc598b1e4b1c93494b41afcd9b727767db894514b52025237029d581e3ed757c31e06f116b0e42ad869d717449edb2366fe95715cd2497503e1cfda175564fd846de64c99fc5fe37bcbb0a3ab87bcba9571ebc46b45687c65d01a5f097ec7ff0dd9732dfdc5a5ede45dc12202e48facb2fe5457eb1828da97cdff97e87b0f4b23d275b41f0ff00fe0a7565230f2edbc69e1a3193d03ba211fced57f3af4afd9841d33e1f6a5e1b6fbfe1ad7f53d1c8f444b9768fff0021c91d79cfedfe87c09f157e047c4d40638b49d7458de483bc2ec8f83ff0159bf3af4bf02a8f0d7ed0bf15341ced83545b0f12daaf6612c46de623fe076c3f3af073da578b7e8fee76fc9985657a7e87acd2f6a28c57c11e70945068638a6007a571df19bc417fe14f833e37d634bb86b4d46d34d7682e13ef46c78dc3dc678ae1d7f6b8f00477b7d05d1d72ce3b3ba9ace4bb7d16e5edcc913947c4b1a32901948eb599f15be3b7c3ef881f03fc75a6f87fc61a46a3aa5c69c522b04b90b73236e1c2c4d8727db15ede554e4b1b0badaff2d1fad855a15234a7249ad1dbee67c4fe0cb1f8c9f14adf5abdf092f893c456da48dd7f710ea6502311bb6aef90191f1ced4c9e47a8ae5b4ff887e30d626b1b7d3b5cd7efaf6fa64b7b5b486f6532cd2b9daa806eeb9e2bef4ff82685bb5b7c1bf14472c6d14a3c4b701d5d70c3f73075af8dff0067c45ff86b1f0626d1b478b6eb031c0c35c62bf48e45a799f31532aa4a9e19f34af3694b57d55fe453f1d8f8adf0b35d8346f194daff0087f52b883ed30472ea86649a3ce09578e465241e08ce46457a77c44bdbb97c19f0c6def6ea6bbb81e1e17524b712177266b899c649e4fca16bd57fe0a45e1ad47c55e3df83ba568f652ea1a9ddaead1c5042b97738b43f90e492781c9ac6f881f05f58d76e7424b2d4fc3e20d3b44b1d3cacbacdba32c91c2a2418ddfdfdd5e466b093a0e1057bb47d6f0ee0e182cdea4937c8a0ad76deafa5fe4784576775ac6a565fb39eb8da66a175613d8f88ece777b599a26292c132104a91c6513f2adc1fb3c788ff00e827e1affc1e5bff00f155bd0fc12d753e1678e341fb6e8575a8ea62ca4b0b6b6d62ddda59629b2547cfd76337d7a578397d1ab4b11194a365afe5ea7da710ca18acaebd2a4ef2b6895ef74782780ad3e2efc56bed46cfc167c43e219b4d8966bc316aa61484367682d248a0b36d385192706b973f123c5c098cebbe2017626fb31b4377379de76ed9e56ddd9ddbbe5c7ad7dbdff04d5d1aef42b0f8a761a8dac9657f6dacdbc33c132ed78d960e548f639af94658d4fed9623da361f8a0836f6c7f690afb570d133f1b96554d61f0f3e692949c54b57d77f4b1d169171f197e097c53f04a78b0ebde1f9b53bb89ad56eb511730dcc7e620911b63b2e70c328dc8cd7e9adfa88efa65038dd5f36fedfcabfda9f059c0fb9e282ccc7f854444b127b00064fd2bd13c5bfb4efc2cd07559e19fc71a45c4e0ff00a8b09bed727fdf310635f399fd3bd08f2abebfa1f4587c1ac2ce74e95da767addf7b9e8f45793785bf699f0778c7c67a5786b4d8b5a379aa79df65b8bbd227b6824f2e3323e1e555cfcaa7a03dabd641cd7c0b8b8d9b3ae51941da4ac14514541215e4dfb53dcc83e096bba640c45d6b8f6fa24207566ba9d21c0fc1dabd66bc93e2e27fc247f14fe10f8547ccb26b726bb700768aca0665cfb79b245f88aedc1c79abc3cb5fbb534a6b9a691e55e25b38fc63ff000520f879a0c0bbac3c17e1d372e83a2398e4dbff00a321fd28ab5fb1f2ff00c2c7fdaebe3f7c416fdedb5a5ca685672f50caae54e3fe036d19ff0081515fab61a0e1462bc8f4e5b9e91ff050df031f1b7ecb5e2878937dd68cd16af0e0723ca6f9cffdfb692b88f07f8d46bfa9fecf9f1144994f136853786b51933c7da046b32027febadbce07fbd5f5af8b7c3d6de2df0c6afa1deaefb3d4ace6b3994f74910a37e84d7e717c09b8d463fd963e20784e452fe29f84be261abdb45fc41209bcd7007bf97743fe042b8733a5ed297e1f7e9f9d856e68b89f7e83c5155347d52df5cd26cf51b3904b69770a4f0b8e8c8ca194fe4455ced5f95b567667922578cfed937f75a5fecd1e3bbbb2b99aceea2b48da39e0728e87cf8f90c3915ecd5e23fb6bff00c9ae7c40ff00af38ff00f47c75d584ff0078a7eabf32a3ba3c5ff63ebcd42ebf666b3ba86e229355925bf912e350666432999cee90e77119e4f39eb5afad278b6f6229e2bf84fe1df19db639b8d26f229188f5115ca29fc9eb9dfd90add6eff652b681b4d5d6564fb7a1d39d9545d66571e592dc00dd39e39acc7d27c2be1d62d37837e217c33907deb9d0e49a6b54f7fdc3c898faa0afc5b1508cb3bcc2caf255656b2d7e5cb569cfff00018c97e47e89176a34fd3fae8d7e44f6375f0dbc2778ef69378cfe09ea333ee6689ee6c2dddfa7382f6edd075aa1e10fd9f2ff00c2de2cf0f78ebc03e27d17c68da56a2da9225fb18dae5983ee569e12c849f309cf9631eb8e2ba5f0ef89f55d57741e11f8b7a078c01f94e8fe2ab544b823d19a2d8f9fac66b2f5bf0ee9fa5de35f7893e18eafe10bfea7c47e00b932a7fbecb0ed7c77f9a36f7af7b0b9de6b8092861f1534ff00964fda2ffc02b2a753ff00019c9fa9c9570b42b59d48276d53dacfd55d7e08eefc77f1375ef8a3f17fc016dad78175af06ce34fd634592fd317f6b14d7b1c290bc734209c6e8c83b95300d7995cfc0d7b3b996097c75e0d4922628ca7553c10707f82bbdf879e39f125bdc25d7863c5fa57c53d0a3252e6c6ed96cf5882320ab00cb852e01381222723a8eb5f2debde22b8bef12eab0f82344bef116876937902faeda3b673201f32eddcc0ed271904838cf715fa86599cd5ceb0f2963543da53767694a3a3d9b8cd2716ddd5b5db46ce8c1d2746a38516fded6dcbcdb6fb763d8bfe14aaffd0f9e0cff00c1a9ff00e22ad695f01a5d5752b5b3b6f1d783de79e458d163d4c96249e3036727dabc1fedfe37ff00a11e4ffc0e8eb7be1debae9f10b41d3fc6da3df787ac6f67096d35abc7334d3820ac392caa9bba6e2783dbae3d58aa2ded1d35f8d6cb57f723d3aaabd28394f992f3833ea6f87bf153c65e0ff1efc4b6f0c7c3dbfd6d355beb44b7d5b5d98e996e7ecf691dbbcaeae86562cf1b36153bf5af29d5fe0159691e23bef18fc41f887a7785b51bcd61f5d0348db03c37065f3408e698963b5ba6d4078ef5dafc45f1a6a57dae5d1f1afc4383c2e2ea56687c2de0c433ea0ca4fcaaf2ed6909c6012888339c1accf0df866686737be0ff0084f0594e793e22f1f5d7fa41ff0068a9f326fc094fc2bf35ccf8b737c4ca5ecebaa546ed45c125749d93f6956d7d2df05397933e7e182a0edcf0e66b5d75b3f45fab45248fe1cf882f92f2cbc29e2ef8bda8a9caea3aaadc5d424ffd74ba65880ff7462bb9d1a4f1e5b889749f01f853c0da6061bbedb7a24936e79c241185071fed1ae4b5ef1704b9fb378abe35450dc9e0e8de08b34f341feee409a5ff00d06aae93e1bf0deafa8db4f67f0bbc67e2fb8591586a9e2b9da345e7ef8173283c75e23af8bc53ab888ba98994a7e737524befa93a14fee83f23be368e9156f4b2fc937f89cdff00c143357bed1343f035de9d79716176b7972ab3dacad1ba831a820329079048fa57df3e13667f0b68ccec599ace12589c92760afcfbff0082900c785fc11c63fd36e3ff00404afd03f08ffc8a9a2ffd7943ff00a2d6beff0085edfeabe0dff7aa7fe947cce73fef2fe5f91af4518eb4b5ed1e0086bc0b5df1745a47c59f8a9e399581b4f87fe10165096e9f6a9c35d381efb63b71ff000215ef175711da5bc934ce238a352eeec701540c926be0ff008e5e26bbb6fd90659e056ff8487e3078adeea2847fac36ad2fee40f6f2a1b75ffb695ef65147da556fd17dff00f0133af0ebde72ec7bdffc134bc1b2f87bf670875abb53f6ef136a373aa48edf79977089727dfcb27fe05457d11f0bfc1907c3bf873e18f0c5b0022d234d82c811fc45230a5bea4827f1a2bf4f4ada23a8e9c8c822be157b087e0f7fc144758d1eee355f0dfc51d1d98c6e3f76f71b4ee07d4968a4ff00bfc3d6beebaf8e7fe0a49e12beb2f037847e29e8a846b3e06d622baf3147220775073ec2458bf026b1ad4fda53947b8d3b33b5fd99eea7d3bc0575e0ebe767d4bc1ba8dc6832973f33451b6eb77fa340f11fcebd72bc3343f13d95bfc71d07c53a6b7fc539f14f408ae227cf02fed630ca0ffb4d6ee47fdb1af72078afca71d4bd9d76fbebfe7f8dcf3eb47966d057897edaff00f26b9f103febce3ffd1f1d7b6d788fedb071fb2e7c40ff00af38ff00f47c758e13fde29ff897e6671f891e15fb23793ff0c9d6e6e0de8b702ffcc3a76efb485f364cf95b7e6dfe98e738c541a6f8bf4ab5b816fa0fc6fd4b47b9e9fd9de35b157e7fba4cc913fe4c6b0bf643f8dfe03f057c0ed1f48d77c55a7697a9453dcb3db5ccbb59434ac413f5041af6c97e31fc28f15c06dae7c59e17d4626e3c9babb8581ff80b9afc5336862f099be3fda612a4a13ab269a826ad7ed2a724fd5491fa2d2709d285a4934bbff934717ade8fe27f1159893c43e03f077c4db123e5bdd1e75b7b8c7aaacd919fa4a2b9cb3d4bc3fe17b94b7d33c59e2bf8477ec709a678a616b8d398fa299b7478ff007251ed5e870fc1cf865af4ad79e189e3d12f1b9177e15d4cdb1cfaed89b61fc54d3afbc0df11744b57b7d3fc49a6f8db4c6183a6f8b2cc2c8cbe9e7c2304fbb466b929e65856bd939727f7649c17dd255697e10f5453a72df7f4d7fc9fe679c7c50d1b5dd4bc2fa96a3acf8174ff00136a22ca53a778bfc11394b849761f2d9e30c24dbbb19daee319e2bccfe0abd99f86ba28b3c7cb195980ea25c9df9f7cff004af4cb88344f07de996e74ff00107c0fd59dbfe3fb4f6173a24edfed85dd0e3fde58cfbd795f8c3e1ff8f3e196bd77e35d22cb4ef127842f81bad4a7f0e499b77eed388492636c649da597af41c0fbeca2ad39e1e58294d4399a942eda52695b953e69d3d6f75c934aff00615cf472ac6c32fc5fb6a8af16acdf55aefb27eba6dd5d882c3c61aa4df1bf52f0f3ce0e930d82ca90ec190f8439cf5fe234ff008f0217f87d3c4416be92e215b148ff00d619f78dbb31ce71bba57096de37d26cfe34eb3e246b90da5ff6324caebd5b2b100a07f789e31eb5e8de16f867e30d6f58b3f88de36d634af87fa15b8f374b1ab6d965801e564485885f331d0be4e7a274c7d6e2a14b2ea9471555a828c2365ade73b3f75249b6df5b27647b589cda1f53af42fcf29ca69754a375afa76f33d7fc3361e20f09f86a39b4ed0bc35f0834c312fdab59d75d6e6fe66c72c577000939ff0059231e7a56585f0c78c25c84f1a7c6bbccf2c4b5b6941bdb3e5418ff00beeace87a3d86bf7e97fe19f056adf11353ce57c55e3998c3683fda89645ce3feb9c43eb5e8b1fc38f1cf89231ff00092f8f1f49b5c7fc833c256cb688a3d3cf7dd21fc36d7e4589c651c354954ab35093df56a5f747da567ff6f4e9fa23e463172564aebf0fd17e0ce76da1f1878674dcdb69fe03f847a4e3969985ccca3d7e5f2a3cfe2d583078a3c3faaeab0457df177c51e31bd12aff00a2785ad0c76e4e7a37d9a23f2fae64e95dcafc34f845e0cb8fb5eacba3cf7ebc9bcf11df8ba989f5dd3b9c1fa62b54fc7af859a1c4204f1a7876de3418115bde4440fc14d795f5c955bcb0b86a951beb1a76ff00c9a51ad37ff81234e4b693925f3ff8291e01ff000520ff00915fc11ff5fb71ff00a0257e817847fe455d17febca0ff00d16b5f9a5fb76fc55f08fc44d03c270786b5fb2d665b5bb9de64b57dc50145009fae0d7e96f843fe454d17febca1ff00d16b5fb070f50ad86e1ac1d2af07192954d1a69fc5d9d99f279c494abde2efff000c6bd14b487bd7a47827957ed2bac5dda7c2ebad174c729ad789ee21f0f586debe65cb88d987fbb1991ffe035e2be25d06d7e26fedd9f0d7e1de9d1eef0cfc2fd263be9e21cac722aa3460fe3f651f9d7aaf88b58b3d73e3f2deea1285f0dfc32d166d6efe43f756f6e23658c1f7481656f6f316b8ff00f8273f87ef3c5b17c44f8cbac445752f196af20b62fd52de362485f6dedb7fed90afbfc8f0fcb1527ebf7edf82fc4f46947969fa9f678e0514b457d79a077ae6fe247822cbe24f80f5ef0b6a2bbacb56b296ce438ceddea4061ee0e08f715d277a0f4a00fcdbf80d75adeb5fb3a78a3c0b2a13f10be0e6b8753d3e13f7dd2291dcc63b90c05cc5f474f6afb63c25e26b2f19f8634ad774e97cdb0d4ad62bb81c774750c33efcd7cc1f1aa2ff008668fdb7fc2bf1094083c25f1022fec8d60f48d2e3e54dedd87485f3fecc95ea7f05d0fc3af19f8c3e174ff2db69b70759d081e8da6dcbb36c5f5114de627d0a7ad7c267785b5e6ba6bf27bfe3afccc6bc79a2a5d8f62af3bfda17e1d6a1f16be0df89fc23a5dc5bdadfea902c514d765844a4488df31504e30a7a035e894b5f214e6e9cd4e3bad4e14ecee7e5e4bff04bbf89a8b94f10786243e9f68b81ff00b46b0755ff00826bfc62d3d58dbc7a1ea58e82db50da4ffdfc55afd60a2bde59f6316f67f237f6f33f18b5bfd8ff00e36f82d8cd2f81f553b39f374c912e48fa792cc6b1ec7e317c5df85178b6cdaf78874892338fb1ea81d947fdb39811fa57eda102a86b5e1fd2fc4766d69ab69d69a9dab7de82f205950fe0c08a75335a38b8f26370d0a8bcd27f9a66d0c5ce0eeb4f43f2dfc1dff0509f13d9a0b5f16e81a77886d186d91e0ff4795877c8f990fd302bd6be147c5cf825e25f12c37fa26a975e04beb8dc2ef41b87fb3d8deee52b874e61272720a95638e6bdcbe22fec0df087c7ab2c90684fe18bd7ce2e34497c9507feb91cc7f928af933e2aff00c1333c71e1759aefc1baa5af8b6cd7245ac83ecb7607a004946ffbe81f6af02b70d70ee3e3358572c2ce5bf2bb45fac5de0fee8b5d1a3d4a59a4d5b9f5f5ff003393d07e0369da5fed697ba2df4b045e0dd265fed992e27902c02d0812428cc4e30599539eb835ea3e2bf8ff00f05fe1e6bf73aa466ffe2778a43b18eeee9fce8adb9c8489dc048d47406353f5af94f47f825f12fc49e2b9fc2767e15d725d660d82e2c6481d3c95e76190b615579382481c9c57d4ff000b7fe0977acea4b0ddf8fbc490e9319c3369da4289a6c7a34adf2a9fa0615ea6619061f153a55335c6ca4a108c3960f979adbc9b5797bda5d269776cafaf468a7c915abbeba9e67e34ff00828078ff005d2f168369a7f86ad8f0ac91fda2603fde7f97ff001daf306f16fc5ef8c970d1437de29f13339c182cbce923ff00be231b47e55fa91f0fbf62cf843f0e9627b4f095b6ad7898ff004bd6bfd2dc9f5daff20fc1457b5d9585b69d6e96f6b0456b020c2c50a04551e800e052c32c932a56cbf0514d75695fef7ccff147055cc2ad4ddb67e3a683fb117c6ef14ed953c13756cadc99352b986dcfd48770dfa5775a67fc1343e2f5eaeeb89bc3d619eab35fbb11ff007c46c3f5afd57c0a51c577cb3fc56d08c57c8e375e67e5fa7fc12e7e259196f1178614fa79f707ff0068d7e99685612699a2e9f67295692dede3858af42554038f6e2af515e5e2f1f5f1b6559ad3c8ca5394f70c567f8835cb3f0ce85a8eafa84c20b0b0b792ea795ba2468a598fe001ad0af1df8e81fc7baef853e165ab311e21b9fb66b3b0f31e956ecaf303e9e6bf9710ff007dab9b0f4bdb5550feadd4508b9c9451f3b7c71f106afe1efd98ed74d8e271f107e35eb7f6b7b607f7b1db48c9e5c3f45885bc58ff006dabef0f83ff000eacfe13fc31f0d7846c40f2349b18ed8ba8c799201991feace59bf1af90be1ac0bfb4c7edd7ac78a1144be0bf86307f6769c00cc4f77f32861dbeff009ac08ed1c75f768e2bf57c1d2f6749696bebfe5f858f51f642d1499a2bb891734514500788fed8bf0547c74f80fafe870441f5ab54fed1d2d80f985cc409551fefaee4ff0081d7ce1e00f8ad71f103e04f81fe2f45be7f167c3a94e93e27814132dc69e42a5c161d490a229c7fb51b8afbec8dc315f046ad630feca3fb68dd417712a7c32f8b08c92a483f7105e3310c08e806f73edb67ff0066bcec7515569376bdbf2ebf814acfdd7d4faf2caf60d46ce0bab69527b79e35963963395746190c0f7041cd58af1cf81f34ff000ff5bd77e136a72bbcbe1ec5d68934a72d75a4cac7c9c1ee616cc2dfeea7ad7b166bf2aaf49d1a8e0ffa5d0f2a7170934cf34f8fbf1eb43fd9ebc171788f5db7b9bc866ba4b48ad6cc299647604f1b881801493cd741e15f88da678c7e1b5878d74e1249a5de69e3504438de1766e2879c6e182a467a8af91bf6b2f19784bc67fb52f81bc11e31d62d34cf08787ed25d47547bb7db1b4f2a1f2e33ea70b19fa39abffb0d78f20bff00825f10bc083508f503e169af16cee236cacd692ab9475f51bd643f4615eb3c045612356cf9b46fb59bb2f9ff0099a722e5bf53dfbe027ed1fe1bfda13c29a8eb5a0c3736874f9cc173657a144d1fcbb95b0a48c30ce0e7f84fa5726ffb67f85d3e0437c54fec5d5bfb19751fecd36788bed1bf76377dfdb8fc6be32fd99754bdfd9d53c0bf10e79e46f04f8dc5d689ac16fb96b3a4ceb1487d300039f412d5b9006ff826cc9ce41f159e9ff5d2bbe79650855ef0728a5afaf32fbd1a7b349f91f7878d3f68bf0df843e0841f14562b9d57c3f3c56f2c71d985f348959540c3100152d8233c60d74fe2ef893a5f82be19dff8db5112269767a7ff00683c6b8f3194a82a839c6e24851cf522bf37fe256ad7bf05fe12fc4ff80faf4ef2456b7569ab786ee25ff96f6af708cc83d48c86c0ee25f4af7afdb77c736b6bf073e1b780e6d462d353c513d90beb995b0b0d9c4232eede803321ff00809ae5965b053a718eaa527af78d93ff00327d9ad2c7d13f00fe38681fb4178324f146816d716712dcbda4d6f76144d1ba007e6da48c10c08e7bd6c7c61f89f61f067e1deade30d4ed6e2f6c74d11b4905a6df31b7c8a831b881d5877af92ff648f1b7853c1dfb517c41f03784757b4d4bc1fafc51ea7a43da4998d65440d246bee0349f8442bd93f6e5bcb7bcfd94fc72d6f3c73aaadb2968dc3007ed317071deb9aae1230c6c6959f249adf7b325c173dba1eaf17c49d33fe156c5e3bb8125ae8efa42eb2cb2637a426112ed3ce3760e3af5ae57f67afda2fc3ffb46f86f50d5f41b6bbb016175f659ed6f820954950cadf292369c9039fe135f3bfed3bf100785ff00625f873e1b8ee92d6f3c55a669761e648db4240b044f2b1f6e114fb3d617ecd7e2df067c33fdae6ffc29e0ad76cf57f07f8a346b75824b47ca2de411f43fed1d931ffb682b68e0232c354a893e6bbb76b45ebf7f4f41f22716cfab7e3ffc7fd07f677f07dbf8835db7babd8ee6e96d21b5b20a65762acc48dc40c00a73cfa567f8d7f692d23c27f087c3df10ad344d5fc45a66b4d0086d749844b708248d9f2cb9c00bb0a9e7a915f3a7ed53e31f07f8ebf6abf08782bc67acda697e0ff0e69d3de6a2f74fb51ee668cec4f720088fd0b5763ff04e7f1f45ab7c32d77c12d7d1dfcbe15d4a486de78db2b2dac8ccc8ebea37893f02293c142961635e516de8df456774bfaf30e44a3ccd11e9ff00f051ff000d6a9753db5a7c3ef195c4f6ee239e38ad237685b38c380f953c1ebe95f5d46fbd03631919e6be4cfd8f38f8f7fb46ff00d8c29ffa32e6beb5c62b8f1f0a34ea7b3a51b68badf749913493b244771711dac124d2bac5146a5dddce02a819249f4af917c67f16dfc09f07be207c6f9498f5ef18b0d0bc21138f9e2b25dcb0ba8ea371f36e0fafc95ebff1e2f2ebc6177a1fc2bd1e778b50f15b37f68dc427e6b3d2a320dcc99ec5c1112e7a990fa578bc9a55afed4bfb64e91e18d3a04ff855ff0009e24324510fdc4d7684058c7623722a63fbb0bfad7b5936139da9c96ff92ff37f823ab0f0b27367d05fb147c136f821f01f45d3ef62d9afea83fb575466fbfe7ca01084ff00b0bb57ea09ef5ef74d0368c52fe35fa09b8b45145001de8a28a002bc43f6c0f80a9fb407c18d5345b645ff008482ccff0068691367056e501c2e7b0704a1fa83dabdbe908c8a00f823e1bfc4ad53e347c14d07c7f610c937c55f8612b5aeb1604626bfb403171130eb99234de33ff2d622057d59e17f1369de32f0e69bae69370b77a6ea16e9736f327f1230c8fa1f51d8d7cabf1e6c67fd8dbf69cd3be2f699049ff0afbc6527d87c4b6b0292b0ce7932ed1dce3cc1ea4483f8ab77c21ab7c3bd5ae6e1fe12fed050785edeeee24ba4f0eea2b6d35a46f2317658e09d639514b313b55b033c57c4e699739cbddf93b74eda79ec455a7ed6cd6e5bf87ffb235aea1f11fe2178c7e2969da1f8aef35fbf5974f84ab4e9696ebb8053bd570db762f1d93ad334bfd956fbc01f1eb58f13f820691a3782f5ad064d32f74742f1b24c508578d150ae372c64f20fccfc7afa1429f1cb488566860f0378eecb19125a5d4fa64f20f60cb3479ff810a6b7c62f1868876f88be0e78b2db1d65d15edb548febfbb943e3fe035e4cbebd77aa69ab5afa5b4e8daec60e9d55d0e07c25fb265c7fc32449f097c4f73633ea60dc4d05eda1678a19cccf242e0b283c1201e3a161deb8c5fd8d3c60bfb228f859fda9a37f6f7f6d7f68fda7cd97ecde5eece33e5eeddff01c57b77fc352f816cdb6eb275cf0d483ef26b7a0de5b63eacd16dfd6b5f4cfda3be16eb042db7c40f0e173fc12ea3144dff7cb904560ebe3a0dde2fe2e6dba99b751743cb3f6c5fd92ee3f688d1f40bad0ee6c74ef13e94c62fb45e9658e6b76196462aac721802bc776f5a5d4ff00657bcf1efc77d23c4de385d1f59f06e8be1f8b4bb2d21f7cacf3851b9dd1902e373484724f09e9c7bdd8f8efc35a9a8369e21d2aec1e860bd89ff9356b477f6b2f29710bfbab83fd6b058cc4d382a7b5ae969aabee473c92b1f35fc42fd90adecbe247c3ef18fc2dd3f43f0adde837ad26a36fb5a04bcb76da0afc8ad96dbe62f3d9faf15e63ab7ec55f15a2b6d7fe1fe8be32d26dfe146b7aaff694c93c65af225deadb00d9c91b13a3004a83c648afb9bce8cff1a7e6298f796f1f2d3c6bf5702aa9e6389824b7b7757eb75f75f4053923e73f1a7ecad378fbe31780af3581a6df7c34f09691f608346b96679679761505d36eddbc47fc5ff2cc7154be317ec716175a9f833c41f0a34bd07c21e22d03554be76f2da08ae22182558c6ac49dcab8c8c619abe88bcf17e83a7026ef5ad3ad80ea66ba8d31f99ae6755f8fff000d34407edbe3ef0dc0c3aa9d5212df906268862b1778b8df4d2d676ebbaebb8d4a47917c35fd90ed6ebc71e3ff0016fc55d3342f15ea7e20d445c59c5b5ae23b3806ec282e8bf360aaf03a20ad0f01feccd77f09ff00694d43c63e0f5d2b4bf026aba58b4bcd1622f1bc7328043c68176e37229fbc3efbfe3d7bfed55f0e67629a5ea97de2097a08f44d26eef09fa18e323f5a55f8dde21d67e5f0efc23f1aea2c7eecba95bc1a6427f19e40dff8ed6dcd8ea8e574ecd5acf456d3a37a6c525525b2327e037c0fd6fe17fc4df8b1e22d4eeec6e2cfc59aa2df59476aeed24681e56c49b94007f783a13d0d7b16bbadd9787347bed5752b84b4d3eca17b8b89e43858e3504b13f402bcd9a5f8e9af2191346f067822d71969354d466d46741ebb2248d3ff001faf38f1ccfe0ab3410fc5ff00da0ed359b1495259fc37a4a5b5b5bcfb18308e48a2124ce84a8ca96e6abea55b13539eab5d36d5e9a74ff334f61524ef2d0c2f1bfc55bcf847f073c51f1835289e0f1ffc402ba7f866c241996cacb07ecca17b10acd3b7abba83dabddbf62df80a7e03fc18b1b2d463ff008aa3576fed3d6257e5fcf71c464f7d8b85faee3debe7ff0084f1ff00c36cfed512f8fe585dfe1778008b7d120990aa5d5d7de57da7dc0908ea02c408eb5f7d8e057dfe0b0fec29eaacdfe1d91d8ecb442d14515e8922514b450018a28a280128c51450050d73c3fa6789b4f96c358d3ad755b197fd65adec2b344ff556041af0df19fec17f03fc6c6479fc0d69a5ceff00f2d74791ecf07d95084ffc768a2803cbaebfe09a3a7787e669fc01f153c63e0c9b3950973e62a9ff00b66633fad573fb3b7ed59e09e3c37f1c34ff0011409d23d76dcef61ee5e397ff0042a28ac654a9cfe28a63bb1ade26fdb47c28bb6efc15e10f17c2bd5ede64466fc3ce4ffd06b1354f8edf182352be2ffd9423d6b1f79ad621303f4fdd4bfce8a2b9fea541ebcb6fbd0f999c96a1f1cfc14c49f10fec717960ff00c4f0e89193f9fd9d2b264f8f3fb3c447fd37f673f10e9eddc4560a98fca55a28a8fa8d2f3fbd957643ff000d05fb3077f827e2853fddf288ff00db9a7a7c7dfd9c24e2d7f67ef125eb7612598707f399a8a297d4a9777f7b1291a765f1cbe19e47f617ec87a86a4dfc3e76891b7ebe4bd755a4fc79f882368f07fec82da49fe0796d04207e56f1ff003a28abfa8d1eb77f37fe63e66745178fbf6c7f132797a5fc2ff0b785606e925ece8cc9f879e7ff0041a957e097ed79e37e35cf8b9a17856ddfef47a3dbee9147b15897ff0043a28ab8e16845e90426d9245ff04dd9fc532093e227c65f1878bc939689663127d0798d2e07d315e97e0aff00827ffc0ef0518dd3c1b1eb570bcf9dad4ef7593ee8c767fe3b4515d4a2a3a2441eefe1ff000c691e12d3934fd134bb2d1ec10e56d6c2dd20897e8aa00ad4a28aa0128e68a280168a28a00fffd9);

-- --------------------------------------------------------

--
-- Table structure for table `propinsi`
--

CREATE TABLE IF NOT EXISTS `propinsi` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `propinsi`
--

INSERT INTO `propinsi` (`id`, `nama`, `user`, `jam`) VALUES
('1', 'JAWA BARAT', 'admin', '2010-03-21 20:07:53'),
('10', 'SUMATERA UTARA', 'admin', '2010-03-21 20:07:53'),
('11', 'SUMATERA BARAT', 'admin', '2010-03-21 20:07:53'),
('12', 'RIAU', 'admin', '2010-03-21 20:07:53'),
('13', 'SUMATERA SELATAN', 'admin', '2010-03-21 20:07:53'),
('14', 'KEPULAUAN BANGKA BELITUNG', 'admin', '2010-03-21 20:07:53'),
('15', 'LAMPUNG', 'admin', '2010-03-21 20:07:53'),
('16', 'KALIMANTAN SELATAN', 'admin', '2010-03-21 20:07:54'),
('17', 'KALIMANTAN BARAT', 'admin', '2010-03-21 20:07:54'),
('18', 'KALIMANTAN TIMUR', 'admin', '2010-03-21 20:07:54'),
('19', 'KALIMANTAN TENGAH', 'admin', '2010-03-21 20:07:54'),
('2', 'BANTEN', 'admin', '2010-03-21 20:07:53'),
('20', 'SULAWESI TENGAH', 'admin', '2010-03-21 20:07:54'),
('21', 'SULAWESI SELATAN', 'admin', '2010-03-21 20:07:54'),
('22', 'SULAWESI UTARA', 'admin', '2010-03-21 20:07:54'),
('23', 'GORONTALO', 'admin', '2010-03-21 20:07:54'),
('24', 'SULAWESI TENGGARA', 'admin', '2010-03-21 20:07:54'),
('25', 'NUSA TENGGARA BARAT', 'admin', '2010-03-21 20:07:54'),
('26', 'BALI', 'admin', '2010-03-21 20:07:54'),
('27', 'NUSA TENGGARA TIMUR', 'admin', '2010-03-21 20:07:54'),
('28', 'MALUKU', 'admin', '2010-03-21 20:07:54'),
('29', 'PAPUA', 'admin', '2010-03-21 20:07:54'),
('3', 'DKI JAKARTA', 'admin', '2010-03-21 20:07:53'),
('30', 'MALUKU UTARA', 'admin', '2010-03-21 20:07:54'),
('4', 'D.I. YOGYAKARTA', 'admin', '2010-03-21 20:07:53'),
('5', 'JAWA TENGAH', 'admin', '2010-03-21 20:07:53'),
('6', 'JAWA TIMUR', 'admin', '2010-03-21 20:07:53'),
('7', 'BENGKULU', 'admin', '2010-03-21 20:07:53'),
('8', 'JAMBI', 'admin', '2010-03-21 20:07:53'),
('9', 'NANGGROE ACEH DARUSSALAM', 'admin', '2010-03-21 20:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `sektor`
--

CREATE TABLE IF NOT EXISTS `sektor` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE IF NOT EXISTS `sms` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `nohp` varchar(30) NOT NULL DEFAULT '',
  `transaksiid` varchar(30) NOT NULL DEFAULT '',
  `pesan` varchar(320) NOT NULL DEFAULT '',
  `jenis` char(1) NOT NULL DEFAULT '',
  `kirim` char(1) NOT NULL DEFAULT '',
  `user` varchar(30) NOT NULL DEFAULT '',
  `jam` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`transaksiid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smskeluar`
--

CREATE TABLE IF NOT EXISTS `smskeluar` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nohp` varchar(50) NOT NULL DEFAULT '',
  `pesan` varchar(300) NOT NULL DEFAULT '',
  `masukid` varchar(30) NOT NULL,
  `kirim` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smsmasuk`
--

CREATE TABLE IF NOT EXISTS `smsmasuk` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nohp` varchar(50) NOT NULL DEFAULT '',
  `pesan` varchar(300) NOT NULL DEFAULT '',
  `balas` char(1) NOT NULL DEFAULT '',
  `proses` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smstemplate`
--

CREATE TABLE IF NOT EXISTS `smstemplate` (
  `pesan` varchar(320) NOT NULL DEFAULT '',
  `jenis` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabbunga`
--

CREATE TABLE IF NOT EXISTS `tabbunga` (
  `id` varchar(30) NOT NULL,
  `minimal` double(15,2) NOT NULL,
  `maksimal` double(15,2) NOT NULL,
  `bunga` double(9,2) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabjenis`
--

CREATE TABLE IF NOT EXISTS `tabjenis` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `kode` varchar(5) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `minimum` double(15,2) NOT NULL,
  `mengendap` double(9,2) NOT NULL,
  `bungaid` varchar(30) NOT NULL,
  `jenisbunga` char(1) NOT NULL,
  `bunga` double(9,2) NOT NULL,
  `accountbunga` varchar(30) NOT NULL,
  `rumusbunga` char(1) NOT NULL,
  `bulan` char(1) NOT NULL,
  `biayaid` varchar(30) NOT NULL,
  `biaya` double(15,2) NOT NULL,
  `accountbiaya` varchar(30) NOT NULL,
  `pajakid` varchar(30) NOT NULL,
  `pajak` double(9,2) NOT NULL,
  `accountpajak` varchar(30) NOT NULL,
  `saldopajak` double(15,2) NOT NULL,
  `nominal` double(15,0) NOT NULL,
  `jenis` char(1) NOT NULL,
  `setorid` varchar(30) NOT NULL,
  `tarikid` varchar(30) NOT NULL,
  `insentif` double(9,2) NOT NULL,
  `saham` double(15,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`accountid`,`bungaid`,`accountbunga`,`biayaid`,`accountbiaya`,`pajakid`,`accountpajak`,`setorid`,`tarikid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabjenis`
--

INSERT INTO `tabjenis` (`id`, `kode`, `nama`, `accountid`, `minimum`, `mengendap`, `bungaid`, `jenisbunga`, `bunga`, `accountbunga`, `rumusbunga`, `bulan`, `biayaid`, `biaya`, `accountbiaya`, `pajakid`, `pajak`, `accountpajak`, `saldopajak`, `nominal`, `jenis`, `setorid`, `tarikid`, `insentif`, `saham`, `user`, `jam`) VALUES
('TB20090713-160824', '11', 'Simpanan', '510-01', 10000.00, 0.00, 'ADMN20090930-151120', '1', 5.00, '960-01', '2', '0', 'ADMN20090930-135857', 1500.00, '931-01', 'ADMN20090930-141434', 7.50, '931-01', 7500000.00, 0, '3', '', '', 0.00, 0.00, 'admin', '2009-09-30 15:14:45'),
('TB20160504-103411', '11-2', 'Simpanan Wajib', '800-03', 0.00, 0.00, '', '1', 0.00, '', '2', '0', '', 0.00, '', '', 0.00, '', 0.00, 0, '2', '', '', 0.00, 0.00, 'admin', '2016-06-04 09:12:31'),
('TB20160510-091024', '11-1', 'Simpanan Pokok', '800-02', 0.00, 0.00, '', '1', 0.00, '', '2', '0', '', 0.00, '', '', 0.00, '', 0.00, 0, '1', '', '', 0.00, 0.00, 'admin', '2016-05-10 09:10:24'),
('TB20160510-091608', '11-3', 'Simpanan Sukarela', '510-01', 0.00, 0.00, '', '1', 0.00, '', '2', '0', '', 0.00, '', '', 0.00, '', 0.00, 0, '3', '', '', 0.00, 0.00, 'admin', '2016-06-16 10:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `tabjeniskode`
--

CREATE TABLE IF NOT EXISTS `tabjeniskode` (
  `id` varchar(30) NOT NULL,
  `kodeid` varchar(30) NOT NULL,
  KEY `id` (`id`,`kodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabkode`
--

CREATE TABLE IF NOT EXISTS `tabkode` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `kode` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `accountdebet` varchar(30) NOT NULL,
  `accountkredit` varchar(30) NOT NULL,
  `setoran` char(1) NOT NULL,
  `tarikan` char(1) NOT NULL,
  `transfer` char(1) NOT NULL,
  `pokok` char(1) NOT NULL,
  `wajib` char(1) NOT NULL,
  `sukarela` char(1) NOT NULL,
  `pinjaman` char(1) NOT NULL,
  `saham` char(1) NOT NULL,
  `pokokpinjaman` char(1) NOT NULL,
  `rencana` char(1) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`accountdebet`,`accountkredit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabkode`
--

INSERT INTO `tabkode` (`id`, `kode`, `nama`, `accountdebet`, `accountkredit`, `setoran`, `tarikan`, `transfer`, `pokok`, `wajib`, `sukarela`, `pinjaman`, `saham`, `pokokpinjaman`, `rencana`, `keterangan`, `user`, `jam`) VALUES
('1', '11', 'Setoran Tunai', '100-01', '800-02', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '', 'admin', '2016-06-04 09:55:09'),
('10', '110', 'Bunga', '960-01', '800-02', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '', 'admin', '2009-09-30 15:11:20'),
('11', '21', 'Setoran Tunai', '100-01', '800-03', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '', 'admin', '2009-09-30 14:02:53'),
('12', '22', 'Tarikan Tunai', '800-03', '100-01', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '', 'admin', '2009-09-30 14:03:08'),
('13', '23', 'Pemindahan Simpanan', '800-03', '800-03', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', 'Pemindahan dana antar sesama simpanan anggota', 'admin', '2009-07-17 22:32:29'),
('14', '24', 'Koreksi Debet', '100-01', '800-03', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0', 'Koreksi debet pada simpanan dengan di kredit sesuai nominal yang salah', 'admin', '2009-07-17 22:32:58'),
('15', '25', 'Koreksi Kredit', '800-03', '100-01', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0', 'Koreksi kredit pada simpanan dengan di debet sesuai nominal yang salah', 'admin', '2009-07-17 22:33:03'),
('16', '26', 'Transaksi Debet', '800-03', '100-01', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', 'Tarikan simpanan bisa dengan tujuan apapun dan dalam pemakaian tidak tergantung pada account debet atau kredit yang telah di set sebelumnya.', 'admin', '2009-09-30 14:12:11'),
('17', '27', 'Transaksi Kredit', '100-01', '800-03', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', 'Setoran simpanan bisa dengan tujuan apapun dan dalam pemakaian tidak tergantung pada account debet atau kredit yang telah di set sebelumnya.', 'admin', '2009-09-30 14:12:28'),
('18', '28', 'Biaya Administrasi', '800-03', '931-01', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', 'Biaya Administrasi', 'admin', '2009-09-30 14:14:43'),
('19', '29', 'Pajak', '800-03', '931-10', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', 'Pajak simpanan', 'admin', '2009-09-30 14:14:34'),
('2', '12', 'Tarikan Tunai', '800-02', '100-01', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '', 'admin', '2016-06-04 09:55:22'),
('20', '210', 'Bunga', '960-01', '800-03', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '', 'admin', '2009-09-30 15:11:20'),
('3', '13', 'Pemindahan Simpanan', '800-02', '800-02', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', 'Pemindahan dana antar sesama simpanan anggota', 'admin', '2016-06-04 09:55:30'),
('4', '14', 'Koreksi Debet', '100-01', '800-02', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', 'Koreksi debet pada simpanan dengan di kredit sesuai nominal yang salah', 'admin', '2016-06-04 09:55:36'),
('5', '15', 'Koreksi Kredit', '800-02', '100-01', '1', '0', '1', '1', '0', '0', '0', '0', '0', '0', 'Koreksi kredit pada simpanan dengan di debet sesuai nominal yang salah', 'admin', '2016-06-04 09:55:41'),
('6', '16', 'Transaksi Debet', '800-02', '100-01', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', 'Tarikan simpanan bisa dengan tujuan apapun dan dalam pemakaian tidak tergantung pada account debet atau kredit yang telah di set sebelumnya.', 'admin', '2016-06-04 09:55:47'),
('7', '17', 'Transaksi Kredit', '100-01', '800-02', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', 'Setoran simpanan bisa dengan tujuan apapun dan dalam pemakaian tidak tergantung pada account debet atau kredit yang telah di set sebelumnya.', 'admin', '2009-09-30 14:12:28'),
('8', '18', 'Biaya Administrasi', '800-02', '931-01', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', 'Biaya Administrasi', 'admin', '2009-09-30 14:14:43'),
('9', '19', 'Pajak', '800-02', '931-10', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', 'Pajak simpanan', 'admin', '2009-09-30 14:14:34'),
('ADMN20090714-202808', '01', 'Setoran Tunai', '100-01', '510-01', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', 'admin', '2016-06-16 10:46:32'),
('ADMN20090714-202825', '02', 'Tarikan Tunai', '510-01', '100-01', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '', 'admin', '2016-06-16 10:46:46'),
('ADMN20090715-200105', '03', 'Pemindahan Simpanan', '510-01', '510-01', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', 'Pemindahan dana antar sesama simpanan anggota', 'admin', '2016-06-16 10:47:12'),
('ADMN20090715-200315', '04', 'Koreksi Debet', '100-01', '510-01', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', 'Koreksi debet pada simpanan dengan di kredit sesuai nominal yang salah', 'admin', '2016-06-16 10:47:23'),
('ADMN20090715-200424', '05', 'Koreksi Kredit', '510-01', '100-01', '1', '0', '1', '0', '0', '1', '0', '0', '0', '0', 'Koreksi kredit pada simpanan dengan di debet sesuai nominal yang salah', 'admin', '2016-06-16 10:47:35'),
('ADMN20090930-135355', '06', 'Transaksi Debet', '510-01', '100-01', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', 'Tarikan simpanan bisa dengan tujuan apapun dan dalam pemakaian tidak tergantung pada account debet atau kredit yang telah di set sebelumnya.', 'admin', '2016-06-16 10:47:47'),
('ADMN20090930-135421', '07', 'Transaksi Kredit', '100-01', '510-01', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', 'Setoran simpanan bisa dengan tujuan apapun dan dalam pemakaian tidak tergantung pada account debet atau kredit yang telah di set sebelumnya.', 'admin', '2016-06-16 10:48:02'),
('ADMN20090930-135857', '08', 'Biaya Administrasi', '510-01', '931-01', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', 'Biaya Administrasi', 'admin', '2009-09-30 14:14:43'),
('ADMN20090930-141434', '09', 'Pajak', '510-01', '931-10', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', 'Pajak simpanan', 'admin', '2009-09-30 14:14:34'),
('ADMN20090930-151120', '10', 'Bunga', '960-01', '510-01', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '', 'admin', '2009-09-30 15:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `tabpasal`
--

CREATE TABLE IF NOT EXISTS `tabpasal` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabpasal`
--

INSERT INTO `tabpasal` (`id`, `id2`, `nama`, `user`, `jam`) VALUES
('1', '1', 'Syarat-syarat Umum :', 'admin', '2016-08-10 12:12:12'),
('2', '2', 'Penyetoran dan Penarikan Dana :', 'admin', '2016-08-10 12:12:12'),
('3', '3', 'Bagi Hasil Simpanan :', 'admin', '2016-08-10 12:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `tabpasaldetail`
--

CREATE TABLE IF NOT EXISTS `tabpasaldetail` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `keterangan` varchar(1000) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabpasaldetail`
--

INSERT INTO `tabpasaldetail` (`id`, `id2`, `keterangan`) VALUES
('1', '1', 'Diperuntukkan bagi penabung perorangan, kelompok, maupun lembaga berbadan hukum.'),
('1', '2', 'Kepada setiap penabung, Koperasi akan menerbitkan kartu simpanan atas nama penabung sebagai bukti simpanan, serta Koperasi akan menata usahakan penyetoran dan pengambilan dalam administrasi Koperasi.'),
('1', '3', 'Koperasi tidak bertanggung jawab atas hilangnya Kartu Simpanan. Dalam hal kehilangan Kartu Simpanan, penabung wajib secepatnya melaporkan kepada Koperasi secara tertulis dengan disertai surat kehilangan dari kepolisian, dan berdasarkan laporan tersebut Koperasi akan menerbitkan Kartu Simpanan pengganti dan kartu yang hilang dinyatakan tidak berlaku.'),
('1', '4', 'Pengganti Kartu Simpanan yang disebabkan oleh apapun dikenakan biaya administrasi sebesar Rp. 10,000,-.'),
('1', '5', 'Apabila terjadi perbedaan saldo antara Kartu Simpanan dengan saldo yang tercatat pada pembukuan Koperasi, sementara menunggu hasil penelitian atas terjadinya perbedaan tersebut maka yang digunakan sebagai pedoman adalah saldo yang tercatat pada pembukuan Koperasi.'),
('1', '6', 'Koperasi tidak menerima titipan Kartu Simpanan.'),
('1', '7', 'Segala penyalahgunaan dalam bentuk apapun dari Kartu Simpanan tersebut menjadi tanggung jawab penabung sepenuhnya.'),
('1', '8', 'Simpanan dapat dijadikan jaminan Pinjam Uang Pada Koperasi.'),
('1', '9', 'Apabila pemegang rekening Simpanan meninggal dunia, maka saldo simpanan yang ada menjadi hal ahli waris yang sah.'),
('1', '10', 'Koperasi berhak mengadakan perubahan pada syarat-syarat dan ketentuan-ketentuan Simpanan, tanpa pemberitahuan terlebih dahulu kepada penabung. Perubahan tersebut mengikat penabung sejak diadakan perubahan walaupun pemberitahuan belum diterima penabung.'),
('2', '1', 'Setoran permulaan minimal Rp. 25.000,- selanjutnya minimal Rp. 10.000,-'),
('2', '2', 'Saldo yang harus tersisa setiap kali dilakukan pengambilan sekurang-kurangnya Rp. 25.000,-'),
('2', '3', 'Setiap penarikan / pengambilan tunai, penabung harus dapat menunjukkan Kartu Simpanan. Pengambilan oleh orang yang bukan berhak, harus disertai surat kuasa bermeterai cukup, tanda pengenal dan dengan bukti yang kuat dan sah.'),
('2', '4', 'Semua transaksi tunai dilakukan selama jam kerja kas.'),
('3', '1', 'Bagi Hasil Simpanan dihitung atas dasar saldo harian saldo Simpanan minimal Rp. 25.000,-'),
('3', '2', 'Besarnya Bagi Hasil Simpanan ditetapkan oleh Koperasi yang sewaktu-waktu dapat berubah tanpa pemberitahuan terlebih dahulu.');

-- --------------------------------------------------------

--
-- Table structure for table `tabpenyetor`
--

CREATE TABLE IF NOT EXISTS `tabpenyetor` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabpenyetor`
--

INSERT INTO `tabpenyetor` (`id`, `nama`) VALUES
('ADMN160504-103810', 'R. Saad Aliyudin'),
('ADMN160511-085757', 'R. Usman Mahali'),
('ADMN160511-085940', 'R. Usman Mahali'),
('ADMN160511-091307', 'Amanda Abdurahman'),
('ADMN160511-091410', 'Amanda Abdurahman'),
('ADMN160511-094608', 'Ratih Hartati'),
('ADMN160511-094650', 'Ratih Hartati'),
('ADMN160511-094826', 'Hj. Siti Syaripah'),
('ADMN160511-094916', 'Hj. Siti Syaripah'),
('ADMN160511-094949', 'Hj. Siti Syaripah'),
('ADMN160511-095141', 'Hj. Siti Syaripah'),
('ADMN160511-095211', 'Hj. Siti Syaripah'),
('ADMN160511-095235', 'Hj. Siti Syaripah'),
('ADMN160511-095439', 'Ratih Hartati'),
('ADMN160511-095519', 'Ratih Hartati'),
('ADMN160511-095758', 'Ratih Hartati'),
('ADMN160511-095829', 'Ratih Hartati'),
('ADMN160511-100008', 'Ratih Hartati'),
('ADMN160511-100042', 'Ratih Hartati'),
('ADMN160511-100303', 'R. Saad Aliyudin'),
('ADMN160511-100332', 'R. Saad Aliyudin'),
('ADMN160511-100429', 'R. Saad Aliyudin'),
('ADMN160511-100538', 'R. Saad Aliyudin'),
('ADMN160511-101847', 'Enung Nurhayati'),
('ADMN160511-101941', 'Enung Nurhayati'),
('ADMN160511-102142', 'Aam Maryati'),
('ADMN160511-102209', 'Aam Maryati'),
('ADMN160511-102321', 'Aam Maryati'),
('ADMN160511-102346', 'Aam Maryati'),
('ADMN160511-102455', 'Aam Maryati'),
('ADMN160511-102527', 'Aam Maryati'),
('ADMN160511-102648', 'Aam Maryati'),
('ADMN160511-102716', 'Aam Maryati'),
('ADMN160511-102851', 'Aam Maryati'),
('ADMN160511-102917', 'Aam Maryati'),
('ADMN160511-103026', 'Aam Maryati'),
('ADMN160511-103056', 'Aam Maryati'),
('ADMN160511-103156', 'Aam Maryati'),
('ADMN160511-103227', 'Aam Maryati'),
('ADMN160511-103343', 'Aam Maryati'),
('ADMN160511-103421', 'Aam Maryati'),
('ADMN160511-103719', 'Aam Maryati'),
('ADMN160511-103749', 'Aam Maryati'),
('ADMN160511-103833', 'Aam Maryati'),
('ADMN160511-104156', 'Rifa Masrifah'),
('ADMN160511-104245', 'Rifa Masrifah'),
('ADMN160511-104315', 'Rifa Masrifah'),
('ADMN160511-104546', 'Maman Supratman'),
('ADMN160511-105147', 'Enok Armilah'),
('ADMN160511-105400', 'Enok Karmilah'),
('ADMN160511-105753', 'Enok Armilah'),
('ADMN160511-105924', 'Enok Armilah'),
('ADMN160511-110407', 'Enok Armilah'),
('ADMN160511-110508', 'LALA MULYA'),
('ADMN160514-091327', 'Iin Lasmanawati'),
('ADMN160514-091418', 'Iin Lasmanawati'),
('ADMN160514-091527', 'Iin Lasmanawati'),
('ADMN160514-091619', 'Iin Lasmanawati'),
('ADMN160514-091726', 'Iin Lasmanawati'),
('ADMN160514-091808', 'Iin Lasmanawati'),
('ADMN160516-105153', 'Siti Maryam'),
('ADMN160516-105228', 'Siti Maryam'),
('ADMN160519-112415', 'Enung Nurhayati'),
('ADMN160526-084159', 'Yeni Sulastri'),
('ADMN160526-084249', 'Yeni Sulastri'),
('ADMN160601-073629', 'R. Shoffy Basyiroh Am.'),
('ADMN160601-073713', 'R. Shoffy Basyiroh Am.'),
('ADMN160601-073820', 'R. Usman Mahali'),
('ADMN160602-095737', 'N. Ilah Jamilah'),
('ADMN160603-092709', 'Aam Maryati'),
('ADMN160603-093326', 'Aam Maryati'),
('ADMN160603-093433', 'Aam Maryati'),
('ADMN160603-093520', 'Aam Maryati'),
('ADMN160603-093705', 'Aam Maryati'),
('ADMN160603-093805', 'Aam Maryati'),
('ADMN160603-093856', 'Aam Maryati'),
('ADMN160603-093935', 'Aam Maryati'),
('ADMN160603-094018', 'Aam Maryati'),
('ADMN160603-094059', 'Aam Maryati'),
('ADMN160603-094201', 'Aam Maryati'),
('ADMN160603-094236', 'Aam Maryati'),
('ADMN160603-094334', 'Aam Maryati'),
('ADMN160603-094417', 'Aam Maryati'),
('ADMN160603-094502', 'Aam Maryati'),
('ADMN160610-103324', 'Yanti Haryanti'),
('ADMN160610-103408', 'Yanti Haryanti'),
('ADMN160616-102418', 'Amanda Abdurahman'),
('ADMN160616-102508', 'R. Saad Aliyudin'),
('ADMN160616-102604', 'R. Saad Aliyudin'),
('ADMN160616-110001', 'R. Saad Aliyudin'),
('ADMN160616-110707', 'Enok Armilah'),
('ADMN160616-125749', 'Hj. R. Siti Syarifah'),
('ADMN160616-125833', 'Hj. R. Siti Syarifah'),
('ADMN160616-125920', 'Hj. R. Siti Syarifah'),
('ADMN160616-130218', 'Ratih Hartati'),
('ADMN160616-130258', 'Ratih Hartati'),
('ADMN160616-130347', 'Ratih Hartati'),
('ADMN160616-130423', 'Ratih Hartati'),
('ADMN160718-102753', 'Siti Saadah'),
('ADMN160718-102921', 'Siti Saadah'),
('ADMN160718-114728', 'Aam Maryati'),
('ADMN160718-115052', 'SAAD ALIYUDIN'),
('ADMN160718-115243', 'ILAH JAMILAH'),
('ADMN160718-115338', 'AMANDA ABDURAHMAN'),
('ADMN160718-115434', 'RATIH HARTATI'),
('ADMN160718-115530', 'SADDAM ALMAHALI'),
('ADMN160721-111027', 'R. Usman Mahali'),
('ADMN160721-111146', 'R. Usman Mahali'),
('ADMN160721-111234', 'R. Usman Mahali'),
('ADMN160721-111924', 'Enok Armilah, S.Pd.I.'),
('ADMN160721-113046', 'BU KARTINI'),
('ADMN160721-113216', 'NIA KUSNIAWATI'),
('ADMN160721-113323', 'NIA KUSNIAWATI'),
('ADMN160721-113630', 'IIN LASMANAWATI'),
('ADMN160721-113753', 'IIN LISMANAWATI'),
('ADMN160726-103351', 'ANI MILAYANI'),
('ADMN160726-103503', 'AI MILAYANI'),
('ADMN160726-103602', 'WINI WIDIARTI'),
('ADMN160726-103757', 'WINI WIDIARTI'),
('ADMN160726-103922', 'ANI K.S'),
('ADMN160726-104012', 'ANI K.S'),
('ADMN160726-104121', 'SITI ASRI JUBAEDAH'),
('ADMN160726-104212', 'SITI ASRI JUBAEDAH'),
('ADMN160726-104723', 'ZAMZAM NURJAMAN'),
('ADMN160810-103624', 'N ILAH JAMILAH'),
('ADMN160810-103748', 'KARTINI'),
('ADMN160810-103924', 'R. INA ARIANDINA'),
('ADMN160810-104104', 'R. INA ARIANDINA'),
('ADMN160810-104200', 'SRI RAHAYU'),
('ADMN160810-104333', 'SRI RAHAYU'),
('ADMN160810-104541', 'ANI MILAYANI'),
('ADMN160810-104705', 'ANI MILAYANI'),
('ADMN160810-104806', 'SITI ASRI JUBAEDAH'),
('ADMN160810-104901', 'SITI ASRI JUBAEDAH'),
('ADMN160810-104944', 'WINI WIDIARTI'),
('ADMN160810-105030', 'WINI WIDIARTI'),
('ADMN160810-105128', 'ANI K.S'),
('ADMN160810-105213', 'ANI K.S'),
('ADMN160810-105305', 'AAM MARYATI'),
('ADMN160810-105418', 'HJ. AI NURJANAH'),
('ADMN160810-105510', 'HJ. AI NURJANAH'),
('ADMN160810-105604', 'HJ. ETI PURHAYATI'),
('ADMN160810-105651', 'HJ. ETI PURHAYATI'),
('ADMN160810-105749', 'TISNA WIJAYA'),
('ADMN160810-105836', 'TISNA WIJAYA'),
('ADMN160810-105931', 'NIA KUSNIAWATI'),
('ADMN160810-115936', 'lala mulya hidayah'),
('ADMN160810-120024', 'lala mulya hidayah'),
('ADMN160810-120926', 'LALA MULYA HIDAYAH'),
('ADMN160813-102754', 'RINI ADAWIYAH'),
('ADMN160813-103012', 'RINI ADAWIYAH'),
('ADMN160813-103432', 'ENUNG NURHAYATI'),
('ADMN160813-103750', 'ENUNG NURHAYATI'),
('ADMN160813-104538', 'R.SAAD ALIYUDIN'),
('ADMN160813-104738', 'AMANDA ABDURAHMAN'),
('ADMN160813-104843', 'BKM.320816'),
('ADMN160813-104939', 'SADDAM ALMAHALI'),
('ADMN160813-105125', 'R.SAAD ALIYUDIN'),
('ADMN160820-085337', 'RINI ADAWIYAH'),
('ADMN160820-085530', 'ENOK ARMILAH'),
('ADMN160902-093332', 'nia kusniawati'),
('ADMN160902-093532', 'LALA MULYA'),
('ADMN160902-095033', 'SRI RAHAYU'),
('ADMN160902-095329', 'KARTINI'),
('ADMN160902-095415', 'N.ILAH'),
('ADMN160905-113700', 'IIN LASMANAWATI'),
('ADMN160905-113752', 'IIN LASMANAWATI'),
('ADMN160905-114224', 'HJ SITI SYARIFAH'),
('ADMN160905-114402', 'HJ SITI SYARIFAH'),
('ADMN160905-114824', 'SITI SAADAH'),
('ADMN160905-114932', 'SITI SAADAH'),
('ADMN160905-115022', 'SITI SAADAH'),
('ADMN160905-115138', 'SITI SAADAH'),
('ADMN160906-113551', 'AAM MARYATI'),
('ADMN160906-113755', 'ANI MILAYANI'),
('ADMN160906-113909', 'AI NURJANAH'),
('ADMN160906-114020', 'Hj ETI'),
('ADMN160906-114137', 'ANI K.S'),
('ADMN160906-114248', 'WINI WIDIARTI'),
('ADMN160906-114345', 'SITI ASRI'),
('ADMN160906-114516', 'TISNA WIJAYA'),
('ADMN160906-125045', 'INTAN PERMATA'),
('ADMN160906-125223', 'AI NURLAELA'),
('ADMN160906-125311', 'INTAN PERMATA'),
('ADMN160906-125359', 'INTAN PERMATA'),
('ADMN160906-125455', 'INTAN PERMATA'),
('ADMN160906-125543', 'INTAN PERMATA'),
('ADMN160906-125624', 'INTAN PERMATA'),
('ADMN160906-125718', 'AI NURLAELA'),
('ADMN160906-125756', 'AI NURLAELA'),
('ADMN160906-125843', 'AI NURLAELA'),
('ADMN160906-125924', 'AI NURLAELA'),
('ADMN160906-130010', 'AI NURLAELA'),
('ADMN160916-074028', 'NURUL AINI'),
('ADMN160916-074510', 'NURUL AENI'),
('ADMN160916-074559', 'NURUL AENI'),
('ADMN160916-074706', 'NURUL AENI'),
('ADMN160922-084849', 'Enok Armilah'),
('ADMN160930-094904', 'R. Ina Ariandina'),
('ADMN160930-094951', 'Ratih Hartati'),
('ADMN161005-094803', 'Hj. Siti Syaripah'),
('ADMN161010-104335', 'NIA KUSNIAWATI'),
('ADMN161024-111354', 'ENOK ARMILAH'),
('ADMN161029-075704', 'N ILAH JAMILAH'),
('ADMN161029-075911', 'SRI RAHAYU'),
('ADMN161029-080206', 'R. INA ARIANDINA'),
('ADMN161029-080300', 'KARTINI'),
('ADMN161029-081048', 'HJ SITI SYARIFAH'),
('ADMN161029-081155', 'AAM MARYATI'),
('ADMN161029-081904', 'NURUL AENI'),
('ADMN161029-082045', 'SITI ASRI JUBAEDAH'),
('ADMN161029-082554', 'LALA MULYA'),
('ADMN161029-083200', 'ANI KS'),
('ADMN161029-084537', 'WINI WIDIARTI'),
('ADMN161029-084636', 'ANI MILAYANI'),
('ADMN161029-084734', 'ETI PURHAYATI'),
('ADMN161029-084824', 'AI NURJANAH'),
('ADMN161029-085020', 'TISNA WIJAYA');

-- --------------------------------------------------------

--
-- Table structure for table `tabrencana`
--

CREATE TABLE IF NOT EXISTS `tabrencana` (
  `id` varchar(30) NOT NULL,
  `tanggal1` date NOT NULL,
  `tanggal2` date NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `jangkawaktu` double(9,2) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `bunga` double(9,2) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabrencanadetail`
--

CREATE TABLE IF NOT EXISTS `tabrencanadetail` (
  `id` varchar(30) NOT NULL,
  `tabunganid` varchar(30) NOT NULL,
  KEY `id` (`id`,`tabunganid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabsetor`
--

CREATE TABLE IF NOT EXISTS `tabsetor` (
  `id` varchar(30) NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `marketingid` varchar(30) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`marketingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabsetordetail`
--

CREATE TABLE IF NOT EXISTS `tabsetordetail` (
  `id` varchar(30) NOT NULL,
  `nosetor` varchar(30) NOT NULL,
  `tabunganid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`,`tabunganid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabtarik`
--

CREATE TABLE IF NOT EXISTS `tabtarik` (
  `id` varchar(30) NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `marketingid` varchar(30) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`marketingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabtarikdetail`
--

CREATE TABLE IF NOT EXISTS `tabtarikdetail` (
  `id` varchar(30) NOT NULL,
  `nosetor` varchar(30) NOT NULL,
  `tabunganid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`,`tabunganid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabtransaksi`
--

CREATE TABLE IF NOT EXISTS `tabtransaksi` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `tabunganid` varchar(30) NOT NULL,
  `kodeid` varchar(30) NOT NULL,
  `jurnalid` varchar(30) NOT NULL,
  `nobukti` varchar(30) NOT NULL,
  `novalidasi` varchar(30) NOT NULL,
  `debet` double(15,2) NOT NULL,
  `kredit` double(15,2) NOT NULL,
  `saldo` double(15,2) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `tipe` char(2) NOT NULL,
  `cetak` char(1) NOT NULL,
  `nobaris` double(9,0) NOT NULL,
  `bukti` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`tabunganid`,`kodeid`,`jurnalid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabtransaksi`
--

INSERT INTO `tabtransaksi` (`id`, `tanggal`, `tabunganid`, `kodeid`, `jurnalid`, `nobukti`, `novalidasi`, `debet`, `kredit`, `saldo`, `keterangan`, `tipe`, `cetak`, `nobaris`, `bukti`, `kantorid`, `user`, `jam`) VALUES
('ADMN160504-103810', '2016-05-04', 'ADMN160504-103633', '11', 'ADMN1605040001', 'BKM.230516', '', 0.00, 20000.00, 20000.00, '', '1', '1', 0, '1', '1', 'admin', '2016-05-04 10:38:11'),
('ADMN160511-085757', '2016-05-11', 'ADMN160511-085638', '1', 'ADMN1605110001', 'BKM.010516', '', 0.00, 100000.00, 100000.00, '', '1', '1', 0, '1', '1', 'admin', '2016-05-11 08:57:58'),
('ADMN160511-085940', '2016-05-11', 'ADMN160511-085846', '11', 'ADMN1605110002', 'BKM.020516', '', 0.00, 20000.00, 20000.00, '', '1', '1', 0, '1', '1', 'admin', '2016-05-11 08:59:40'),
('ADMN160511-091307', '2016-05-11', 'ADMN160511-091202', '1', 'ADMN1605110003', 'BKM.030516', '', 0.00, 100000.00, 100000.00, '', '1', '1', 0, '1', '1', 'admin', '2016-05-11 09:13:07'),
('ADMN160511-091410', '2016-05-11', 'ADMN160511-091214', '11', 'ADMN1605110004', 'BKM.040516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:14:10'),
('ADMN160511-094608', '2016-05-11', 'ADMN160511-094453', '1', 'ADMN1605110005', 'BKM.050516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:46:08'),
('ADMN160511-094650', '2016-05-11', 'ADMN160511-094505', '11', 'ADMN1605110006', 'BKM.060516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:46:50'),
('ADMN160511-094826', '2016-05-11', 'ADMN160511-094714', '1', 'ADMN1605110007', 'BKM.070516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:48:26'),
('ADMN160511-094916', '2016-05-11', 'ADMN160511-094724', '11', 'ADMN1605110008', 'BKM.080516', '', 0.00, 20000.00, 20000.00, 'SIM WAJIB MEI', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:49:17'),
('ADMN160511-094949', '2016-05-11', 'ADMN160511-094740', '11', 'ADMN1605110009', 'BKM.090516', '', 0.00, 20000.00, 20000.00, 'SIM WAJIB BLN JUNI\r\n', '1', '1', 0, '0', '1', 'admin', '2016-05-11 09:49:49'),
('ADMN160511-095141', '2016-05-11', 'ADMN160511-095017', '1', 'ADMN1605110010', 'BKM.100516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:51:41'),
('ADMN160511-095211', '2016-05-11', 'ADMN160511-095041', '11', 'ADMN1605110011', 'BKM.110516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:52:11'),
('ADMN160511-095235', '2016-05-11', 'ADMN160511-095051', 'ADMN20090714-202808', 'ADMN1605110012', 'BKM.120516', '', 0.00, 10000.00, 10000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:52:35'),
('ADMN160511-095439', '2016-05-11', 'ADMN160511-095315', '1', 'ADMN1605110013', 'BKM.130516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:54:39'),
('ADMN160511-095519', '2016-05-11', 'ADMN160511-095327', '11', 'ADMN1605110014', 'BKM.140516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:55:19'),
('ADMN160511-095758', '2016-05-11', 'ADMN160511-095701', '1', 'ADMN1605110015', 'BKM.150516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:57:59'),
('ADMN160511-095829', '2016-05-11', 'ADMN160511-095712', '11', 'ADMN1605110016', 'BKM.160516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 09:58:29'),
('ADMN160511-100008', '2016-05-11', 'ADMN160511-095922', '1', 'ADMN1605110017', 'BKM.170516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:00:08'),
('ADMN160511-100042', '2016-05-11', 'ADMN160511-095935', '11', 'ADMN1605110018', 'BKM.180516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:00:42'),
('ADMN160511-100303', '2016-05-11', 'ADMN160511-100207', '1', 'ADMN1605110019', 'BKM.190516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:03:03'),
('ADMN160511-100332', '2016-05-11', 'ADMN160511-100221', '11', 'ADMN1605110020', 'BKM.200516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:03:32'),
('ADMN160511-100429', '2016-05-11', 'ADMN160511-100348', 'ADMN20090714-202808', 'ADMN1605110021', 'BKM.210516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:04:29'),
('ADMN160511-100538', '2016-05-11', 'ADMN160511-100446', '1', 'ADMN1605110022', 'BKM.220516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:05:38'),
('ADMN160511-101847', '2016-05-11', 'ADMN160511-101750', '1', 'ADMN1605110023', 'BKM.240516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:18:47'),
('ADMN160511-101941', '2016-05-11', 'ADMN160511-101800', '11', 'ADMN1605110024', 'BKM.250516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:19:42'),
('ADMN160511-102142', '2016-05-11', 'ADMN160511-102046', '1', 'ADMN1605110025', 'BKM.260516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:21:43'),
('ADMN160511-102209', '2016-05-11', 'ADMN160511-102058', '11', 'ADMN1605110026', 'BKM.270516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:22:09'),
('ADMN160511-102321', '2016-05-11', 'ADMN160511-102235', '1', 'ADMN1605110027', 'BKM.280516', '', 0.00, 30000.00, 30000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:23:21'),
('ADMN160511-102346', '2016-05-11', 'ADMN160511-102245', '11', 'ADMN1605110028', 'BKM.290516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:23:47'),
('ADMN160511-102455', '2016-05-11', 'ADMN160511-102408', '1', 'ADMN1605110029', 'BKM.300516', '', 0.00, 30000.00, 30000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:24:56'),
('ADMN160511-102527', '2016-05-11', 'ADMN160511-102422', '11', 'ADMN1605110030', 'BKM.310516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:25:28'),
('ADMN160511-102648', '2016-05-11', 'ADMN160511-102556', '1', 'ADMN1605110031', 'BKM.320516', '', 0.00, 30000.00, 30000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:26:48'),
('ADMN160511-102716', '2016-05-11', 'ADMN160511-102608', '11', 'ADMN1605110032', 'BKM.330516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:27:16'),
('ADMN160511-102851', '2016-05-11', 'ADMN160511-102755', '1', 'ADMN1605110033', 'BKM.340516', '', 0.00, 30000.00, 30000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:28:51'),
('ADMN160511-102917', '2016-05-11', 'ADMN160511-102809', '11', 'ADMN1605110034', 'BKM.350516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:29:18'),
('ADMN160511-103026', '2016-05-11', 'ADMN160511-102943', '1', 'ADMN1605110035', 'BKM.360516', '', 0.00, 30000.00, 30000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:30:26'),
('ADMN160511-103056', '2016-05-11', 'ADMN160511-102953', '11', 'ADMN1605110036', 'BKM.370516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:30:56'),
('ADMN160511-103156', '2016-05-11', 'ADMN160511-103115', '1', 'ADMN1605110037', 'BKM.380516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:31:56'),
('ADMN160511-103227', '2016-05-11', 'ADMN160511-103125', '11', 'ADMN1605110038', 'BKM.390516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:32:27'),
('ADMN160511-103343', '2016-05-11', 'ADMN160511-103258', '1', 'ADMN1605110039', 'BKM.400516', '', 0.00, 80000.00, 80000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:33:43'),
('ADMN160511-103421', '2016-05-11', 'ADMN160511-103312', '11', 'ADMN1605110040', 'BKM.410516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:34:21'),
('ADMN160511-103719', '2016-05-11', 'ADMN160511-103625', '1', 'ADMN1605110041', 'BKM.420516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:37:20'),
('ADMN160511-103749', '2016-05-11', 'ADMN160511-103634', '11', 'ADMN1605110042', 'BKM.430516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:37:49'),
('ADMN160511-103833', '2016-05-11', 'ADMN160511-103644', 'ADMN20090714-202808', 'ADMN1605110043', 'BKM.440516', '', 0.00, 10000.00, 10000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:38:34'),
('ADMN160511-104156', '2016-05-11', 'ADMN160511-104044', '1', 'ADMN1605110044', 'BKM.450516', '', 0.00, 25000.00, 25000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:41:56'),
('ADMN160511-104245', '2016-05-11', 'ADMN160511-104057', '1', 'ADMN1605110045', 'BKM.460516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:42:45'),
('ADMN160511-104315', '2016-05-11', 'ADMN160511-104118', 'ADMN20090714-202808', 'ADMN1605110046', 'BKM.470516', '', 0.00, 5000.00, 5000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:43:15'),
('ADMN160511-104546', '2016-05-11', 'ADMN160511-104417', '1', 'ADMN1605110047', 'BKM.480516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:45:46'),
('ADMN160511-104642', '2016-05-11', 'ADMN160511-104426', '11', 'ADMN1605110048', 'BKM.490516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:46:42'),
('ADMN160511-105147', '2016-05-11', 'ADMN160511-104847', '1', 'ADMN1605110049', 'BKM.500516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:51:47'),
('ADMN160511-105400', '2016-05-11', 'ADMN160511-104905', '11', 'ADMN1605110050', 'BKM.510516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:54:00'),
('ADMN160511-105753', '2016-05-11', 'ADMN160511-105509', '1', 'ADMN1605110051', 'BKM.520516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:57:53'),
('ADMN160511-105924', '2016-05-11', 'ADMN160511-105538', '11', 'ADMN1605110052', 'BKM.530516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 10:59:24'),
('ADMN160511-110407', '2016-05-11', 'ADMN160511-110056', '1', 'ADMN1605110053', 'BKM.540516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 11:04:07'),
('ADMN160511-110508', '2016-05-11', 'ADMN160511-110130', '11', 'ADMN1605110054', 'BKM.550516', '', 0.00, 20000.00, 20000.00, 'SIMPANAN WAJIB BLN MEI', '1', '0', 0, '0', '1', 'admin', '2016-05-11 11:05:08'),
('ADMN160511-110802', '2016-05-11', 'ADMN160511-110622', '1', 'ADMN1605110055', 'BKM.560516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 11:08:02'),
('ADMN160511-110845', '2016-05-11', 'ADMN160511-110655', '11', 'ADMN1605110056', 'BKM.570516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 11:08:46'),
('ADMN160511-111133', '2016-05-11', 'ADMN160511-111025', '1', 'ADMN1605110057', 'BKM.580516', '', 0.00, 45000.00, 45000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 11:11:34'),
('ADMN160511-111342', '2016-05-11', 'ADMN160511-111230', '1', 'ADMN1605110058', 'BKM.590516', '', 0.00, 100000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 11:13:42'),
('ADMN160511-111423', '2016-05-11', 'ADMN160511-111249', '11', 'ADMN1605110059', 'BKM.600516', '', 0.00, 20000.00, 20000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-05-11 11:14:24'),
('ADMN160514-091327', '2016-05-14', 'ADMN160514-091159', '1', 'ADMN1605140001', 'BKM.610516', '', 0.00, 30000.00, 30000.00, 'Setoran Simpanan Pokok', '1', '0', 0, '0', '1', 'admin', '2016-05-14 09:13:27'),
('ADMN160514-091418', '2016-05-14', 'ADMN160514-091217', '11', 'ADMN1605140002', 'BKM.620516', '', 0.00, 20000.00, 20000.00, 'Simpanan Wajib Bln Mei', '1', '0', 0, '0', '1', 'admin', '2016-05-14 09:14:18'),
('ADMN160514-091527', '2016-05-14', 'ADMN160514-091434', '1', 'ADMN1605140003', 'BKM.630516', '', 0.00, 30000.00, 30000.00, 'Simpanan Pokok', '1', '0', 0, '0', '1', 'admin', '2016-05-14 09:15:28'),
('ADMN160514-091619', '2016-05-14', 'ADMN160514-091447', '11', 'ADMN1605140004', 'BKM.640516', '', 0.00, 20000.00, 20000.00, 'Simpanan Wajib Bln Mei', '1', '0', 0, '0', '1', 'admin', '2016-05-14 09:16:20'),
('ADMN160514-091726', '2016-05-14', 'ADMN160514-091637', '1', 'ADMN1605140005', 'BKM.650516', '', 0.00, 30000.00, 30000.00, 'Simpanan Pokok', '1', '0', 0, '0', '1', 'admin', '2016-05-14 09:17:26'),
('ADMN160514-091808', '2016-05-14', 'ADMN160514-091650', '11', 'ADMN1605140006', 'BKM.660516', '', 0.00, 20000.00, 20000.00, 'Simpanan Wajib\r\n', '1', '0', 0, '0', '1', 'admin', '2016-05-14 09:18:08'),
('ADMN160516-105153', '2016-05-16', 'ADMN160516-105048', '1', 'ADMN1605160001', 'BKM.670516', '', 0.00, 100000.00, 100000.00, 'Simpanan Pokok', '1', '1', 0, '0', '1', 'admin', '2016-05-16 10:51:53'),
('ADMN160516-105228', '2016-05-16', 'ADMN160516-105059', '11', 'ADMN1605160002', 'BKM.680516', '', 0.00, 20000.00, 20000.00, 'Simpanan Wajib', '1', '1', 0, '0', '1', 'admin', '2016-05-16 10:52:28'),
('ADMN160519-112415', '2016-05-19', 'ADMN160519-112311', '1', 'ADMN1605190003', 'BKM.690516', '', 0.00, 30000.00, 30000.00, 'Simpanan Sukarela', '1', '0', 0, '0', '1', 'admin', '2016-05-19 11:24:15'),
('ADMN160526-084159', '2016-05-26', 'ADMN160526-084033', '1', 'ADMN1605260001', 'BKM.700516', '', 0.00, 100000.00, 100000.00, 'Simpanan Pokok', '1', '0', 0, '0', '1', 'admin', '2016-05-26 08:41:59'),
('ADMN160526-084249', '2016-05-26', 'ADMN160526-084110', '11', 'ADMN1605260002', 'BKM.710516', '', 0.00, 20000.00, 20000.00, 'Simpanan Wajib', '1', '0', 0, '0', '1', 'admin', '2016-05-26 08:42:49'),
('ADMN160601-073629', '2016-06-01', 'ADMN160601-073504', '1', 'ADMN1606010001', 'BKM.010616', '', 0.00, 100000.00, 100000.00, 'Simpanan Pokok', '1', '0', 0, '0', '1', 'admin', '2016-06-01 07:36:30'),
('ADMN160601-073713', '2016-06-01', 'ADMN160601-073524', '11', 'ADMN1606010002', 'BKM.020616', '', 0.00, 20000.00, 20000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-01 07:37:13'),
('ADMN160601-073820', '2016-06-01', 'ADMN160511-085846', '11', 'ADMN1606010003', 'BKM.030616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-01 07:38:20'),
('ADMN160602-095737', '2016-06-02', 'ADMN160511-095712', '11', 'ADMN1606020002', 'BKM.040616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-02 09:57:37'),
('ADMN160603-092709', '2016-06-03', 'ADMN160511-103634', '11', 'ADMN1606030003', 'BKM.050616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:27:09'),
('ADMN160603-093326', '2016-06-03', 'ADMN160511-102058', '11', 'ADMN1606030004', 'BKM.060616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:33:26'),
('ADMN160603-093433', '2016-06-03', 'ADMN160511-103258', '1', 'ADMN1606030005', 'BKM.070616', '', 0.00, 20000.00, 100000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:34:33'),
('ADMN160603-093520', '2016-06-03', 'ADMN160511-103312', '11', 'ADMN1606030006', 'BKM.080616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:35:20'),
('ADMN160603-093705', '2016-06-03', 'ADMN160511-102943', '1', 'ADMN1606030007', 'BKM.090616', '', 0.00, 30000.00, 60000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:37:05'),
('ADMN160603-093805', '2016-06-03', 'ADMN160511-102953', '11', 'ADMN1606030008', 'BKM.100616', '', 0.00, 20000.00, 40000.00, 'Bln Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:38:06'),
('ADMN160603-093856', '2016-06-03', 'ADMN160511-102235', '1', 'ADMN1606030009', 'BKM.110616', '', 0.00, 30000.00, 60000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:38:57'),
('ADMN160603-093935', '2016-06-03', 'ADMN160511-102245', '11', 'ADMN1606030010', 'BKM.120616', '', 0.00, 20000.00, 40000.00, 'Bln Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:39:36'),
('ADMN160603-094018', '2016-06-03', 'ADMN160511-102408', '1', 'ADMN1606030011', 'BKM.130616', '', 0.00, 30000.00, 60000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:40:18'),
('ADMN160603-094059', '2016-06-03', 'ADMN160511-102422', '11', 'ADMN1606030012', 'BKM.140616', '', 0.00, 20000.00, 40000.00, 'Bln Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:41:00'),
('ADMN160603-094201', '2016-06-03', 'ADMN160511-102556', '1', 'ADMN1606030013', 'BKM.150616', '', 0.00, 30000.00, 60000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:42:01'),
('ADMN160603-094236', '2016-06-03', 'ADMN160511-102608', '11', 'ADMN1606030014', 'BKM.160616', '', 0.00, 20000.00, 40000.00, 'Bln Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:42:36'),
('ADMN160603-094334', '2016-06-03', 'ADMN160511-103125', '11', 'ADMN1606030015', 'BKM.170616', '', 0.00, 20000.00, 40000.00, 'Bln Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:43:34'),
('ADMN160603-094417', '2016-06-03', 'ADMN160511-102755', '1', 'ADMN1606030016', 'BKM.180616', '', 0.00, 30000.00, 60000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:44:17'),
('ADMN160603-094502', '2016-06-03', 'ADMN160511-102809', '11', 'ADMN1606030017', 'BKM.190616', '', 0.00, 20000.00, 40000.00, 'Bln Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-03 09:45:02'),
('ADMN160610-103324', '2016-06-10', 'ADMN160514-091434', '1', 'ADMN1606100001', 'BKM.200616', '', 0.00, 30000.00, 60000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-06-10 10:33:24'),
('ADMN160610-103408', '2016-06-10', 'ADMN160514-091447', '11', 'ADMN1606100002', 'BKM.210616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-10 10:34:09'),
('ADMN160616-102418', '2016-06-16', 'ADMN160511-091214', '11', 'ADMN1606160001', 'BKM.220616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-16 10:24:18'),
('ADMN160616-102508', '2016-06-16', 'ADMN160511-100221', '11', 'ADMN1606160002', 'BKM.230616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-16 10:25:08'),
('ADMN160616-102604', '2016-06-16', 'ADMN160504-103633', '11', 'ADMN1606160003', 'BKM.240616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-16 10:26:04'),
('ADMN160616-110001', '2016-06-16', 'ADMN160511-100348', 'ADMN20090714-202808', 'ADMN1606160004', 'BKM.250616', '', 0.00, 40000.00, 60000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-06-16 11:00:02'),
('ADMN160616-110707', '2016-06-16', 'ADMN160511-104905', '11', 'ADMN1606160006', 'BKM.260616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-16 11:07:07'),
('ADMN160616-125749', '2016-06-16', 'ADMN160511-094724', '11', 'ADMN1606160007', 'BKM.270616', '', 0.00, 20000.00, 40000.00, 'Simpanan wajib bulan juli', '1', '0', 0, '0', '1', 'admin', '2016-06-16 12:57:49'),
('ADMN160616-125833', '2016-06-16', 'ADMN160511-095041', '11', 'ADMN1606160008', 'BKM.280616', '', 0.00, 20000.00, 40000.00, 'Wajib Bulan Juni ', '1', '0', 0, '0', '1', 'admin', '2016-06-16 12:58:34'),
('ADMN160616-125920', '2016-06-16', 'ADMN160511-094740', 'ADMN20090714-202808', 'ADMN1606160009', 'BKM.280616', '', 0.00, 10000.00, 30000.00, '', '1', '1', 0, '0', '1', 'admin', '2016-06-16 12:59:20'),
('ADMN160616-130218', '2016-06-16', 'ADMN160511-094505', '11', 'ADMN1606160010', 'BKM.290616', '', 0.00, 20000.00, 40000.00, 'Wajib Bln Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-16 13:02:18'),
('ADMN160616-130258', '2016-06-16', 'ADMN160511-095935', '11', 'ADMN1606160011', 'BKM.300616', '', 0.00, 20000.00, 40000.00, 'Wajib Bln Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-16 13:02:58'),
('ADMN160616-130347', '2016-06-16', 'ADMN160511-095327', '11', 'ADMN1606160012', 'BKM.310616', '', 0.00, 20000.00, 40000.00, 'Wajib Bln Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-16 13:03:47'),
('ADMN160616-130423', '2016-06-16', 'ADMN160511-111249', '11', 'ADMN1606160013', 'BKM.320616', '', 0.00, 20000.00, 40000.00, 'Wajib Bln Juni', '1', '0', 0, '0', '1', 'admin', '2016-06-16 13:04:23'),
('ADMN160718-102753', '2016-07-18', 'ADMN160514-091637', '1', 'ADMN1607180001', 'BKM.330616', '', 0.00, 30000.00, 60000.00, 'Cicilan Simpanan Pokok', '1', '0', 0, '0', '1', 'admin', '2016-07-18 10:27:53'),
('ADMN160718-102921', '2016-07-18', 'ADMN160514-091650', '11', 'ADMN1607180002', 'BKM.340616', '', 0.00, 20000.00, 40000.00, 'Simpanan Wajib Bulan Juni', '1', '0', 0, '0', '1', 'admin', '2016-07-18 10:29:21'),
('ADMN160718-114728', '2016-07-18', 'ADMN160511-103125', '11', 'ADMN1607180007', 'BKM.010716', '', 0.00, 20000.00, 60000.00, 'Simpanan Wajib Bln Juli', '1', '0', 0, '0', '1', 'admin', '2016-07-18 11:47:28'),
('ADMN160718-115052', '2016-07-18', 'ADMN160511-100221', '11', 'ADMN1607180008', 'BKM.020716', '', 0.00, 20000.00, 60000.00, 'SIMPAAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-18 11:50:52'),
('ADMN160718-115243', '2016-07-18', 'ADMN160511-095712', '11', 'ADMN1607180009', 'BKM.030716', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-18 11:52:44'),
('ADMN160718-115338', '2016-07-18', 'ADMN160511-091214', '11', 'ADMN1607180010', 'BKM.040116', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-18 11:53:38'),
('ADMN160718-115434', '2016-07-18', 'ADMN160511-094505', '11', 'ADMN1607180011', 'BKM.050716', '', 0.00, 20000.00, 60000.00, 'SIMPANA WAJIB BULAN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-18 11:54:35'),
('ADMN160718-115530', '2016-07-18', 'ADMN160504-103633', '11', 'ADMN1607180012', 'BKM.060716', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BULAN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-18 11:55:30'),
('ADMN160721-111027', '2016-07-21', 'ADMN160511-085846', '11', 'ADMN1607210002', 'BKM.070716', '', 0.00, 20000.00, 60000.00, 'Simpanan Wajib bulan Juli', '1', '0', 0, '0', '1', 'admin', '2016-07-21 11:10:27'),
('ADMN160721-111146', '2016-07-21', 'ADMN160721-111107', 'ADMN20090714-202808', 'ADMN1607210003', 'BKM.080716', '', 0.00, 10000.00, 10000.00, '', '1', '0', 0, '0', '1', 'admin', '2016-07-21 11:11:47'),
('ADMN160721-111234', '2016-07-21', 'ADMN160511-085846', '11', 'ADMN1607210004', 'BKM.090716', '', 0.00, 20000.00, 80000.00, 'Simpanan Wajib Bulan Agustus', '1', '0', 0, '0', '1', 'admin', '2016-07-21 11:12:34'),
('ADMN160721-111924', '2016-07-21', 'ADMN160511-104905', '11', 'ADMN1607210006', 'BKM.100716', '', 0.00, 20000.00, 60000.00, 'Simpanan Wajib Bulan Juli', '1', '0', 0, '0', '1', 'admin', '2016-07-21 11:19:24'),
('ADMN160721-113046', '2016-07-21', 'ADMN160511-095935', '11', 'ADMN1607210009', 'BKM.110716', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-21 11:30:46'),
('ADMN160721-113216', '2016-07-21', 'ADMN160511-110655', '11', 'ADMN1607210010', 'BKM.120716', '', 0.00, 20000.00, 40000.00, 'SIMPANAN WAJIB BLN JUNI', '1', '0', 0, '0', '1', 'admin', '2016-07-21 11:32:17'),
('ADMN160721-113323', '2016-07-21', 'ADMN160511-110655', '11', 'ADMN1607210011', 'BKM.130716', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-21 11:33:23'),
('ADMN160721-113630', '2016-07-21', 'ADMN160514-091217', '11', 'ADMN1607210012', 'BKM.140716', '', 0.00, 20000.00, 40000.00, 'SIMPANAN WAJIB BLN JUNI', '1', '1', 0, '0', '1', 'admin', '2016-07-21 11:36:31'),
('ADMN160721-113753', '2016-07-21', 'ADMN160514-091217', '11', 'ADMN1607210013', 'BKM.150716', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '1', 0, '0', '1', 'admin', '2016-07-21 11:37:53'),
('ADMN160726-103351', '2016-07-26', 'ADMN160511-102608', '11', 'ADMN1607260001', 'BKM.160716', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-26 10:33:51'),
('ADMN160726-103503', '2016-07-26', 'ADMN160511-102556', '1', 'ADMN1607260002', 'BKM.170716', '', 0.00, 30000.00, 90000.00, 'SIMPANAN POKOK ', '1', '0', 0, '0', '1', 'admin', '2016-07-26 10:35:03'),
('ADMN160726-103602', '2016-07-26', 'ADMN160511-102408', '1', 'ADMN1607260003', 'BKM.180716', '', 0.00, 30000.00, 90000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-07-26 10:36:02'),
('ADMN160726-103757', '2016-07-26', 'ADMN160511-102422', '11', 'ADMN1607260004', 'BKM.190716', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-26 10:37:57'),
('ADMN160726-103922', '2016-07-26', 'ADMN160511-102943', '1', 'ADMN1607260005', 'BKM.200716', '', 0.00, 30000.00, 90000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-07-26 10:39:22'),
('ADMN160726-104012', '2016-07-26', 'ADMN160511-102953', '11', 'ADMN1607260006', 'BKM.210716', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-26 10:40:12'),
('ADMN160726-104121', '2016-07-26', 'ADMN160511-102235', '1', 'ADMN1607260007', 'BKM.220716', '', 0.00, 30000.00, 90000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-07-26 10:41:22'),
('ADMN160726-104212', '2016-07-26', 'ADMN160511-102245', '11', 'ADMN1607260008', 'BKM.230716', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-07-26 10:42:12'),
('ADMN160726-104723', '2016-07-26', 'ADMN160726-104523', '1', 'ADMN1607260009', 'BKM.240716', '', 0.00, 100000.00, 100000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-07-26 10:47:23'),
('ADMN160810-103624', '2016-08-10', 'ADMN160511-095712', '11', 'ADMN1608100002', 'bkm.010816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BULAN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:36:24'),
('ADMN160810-103748', '2016-08-10', 'ADMN160511-095935', '11', 'ADMN1608100003', 'BKM.020816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:37:48'),
('ADMN160810-103924', '2016-08-10', 'ADMN160511-095327', '11', 'ADMN1608100004', 'BKM.030816', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BULAN JULI', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:39:24'),
('ADMN160810-104104', '2016-08-10', 'ADMN160511-095327', '11', 'ADMN1608100005', 'BKM.040816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:41:04'),
('ADMN160810-104200', '2016-08-10', 'ADMN160511-111249', '11', 'ADMN1608100006', 'BKM.050816', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:42:00'),
('ADMN160810-104333', '2016-08-10', 'ADMN160511-111249', '11', 'ADMN1608100007', 'BKM.060816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:43:34'),
('ADMN160810-104541', '2016-08-10', 'ADMN160511-102556', '1', 'ADMN1608100008', 'BKM.070816', '', 0.00, 10000.00, 100000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:45:42'),
('ADMN160810-104705', '2016-08-10', 'ADMN160511-102608', '11', 'ADMN1608100009', 'BKM.080816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:47:05'),
('ADMN160810-104806', '2016-08-10', 'ADMN160511-102235', '1', 'ADMN1608100010', 'BKM.090816', '', 0.00, 10000.00, 100000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:48:06'),
('ADMN160810-104901', '2016-08-10', 'ADMN160511-102245', '11', 'ADMN1608100011', 'BKM.100816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:49:02'),
('ADMN160810-104944', '2016-08-10', 'ADMN160511-102408', '1', 'ADMN1608100012', 'BKM.110816', '', 0.00, 10000.00, 100000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:49:44'),
('ADMN160810-105030', '2016-08-10', 'ADMN160511-102422', '11', 'ADMN1608100013', 'BKM.120816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:50:30'),
('ADMN160810-105128', '2016-08-10', 'ADMN160511-102943', '1', 'ADMN1608100014', 'BKM.130816', '', 0.00, 10000.00, 100000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:51:28'),
('ADMN160810-105213', '2016-08-10', 'ADMN160511-102953', '11', 'ADMN1608100015', 'BKM.140816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:52:13'),
('ADMN160810-105305', '2016-08-10', 'ADMN160511-103125', '11', 'ADMN1608100016', 'BKM.150816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:53:05'),
('ADMN160810-105418', '2016-08-10', 'ADMN160511-102058', '11', 'ADMN1608100017', 'BKM.160816', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:54:19'),
('ADMN160810-105510', '2016-08-10', 'ADMN160511-102058', '11', 'ADMN1608100018', 'BKM.170816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:55:10'),
('ADMN160810-105604', '2016-08-10', 'ADMN160511-103634', '11', 'ADMN1608100019', 'BKM.180816', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:56:04'),
('ADMN160810-105651', '2016-08-10', 'ADMN160511-103634', '11', 'ADMN1608100020', 'BKM.190816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:56:51'),
('ADMN160810-105749', '2016-08-10', 'ADMN160511-103312', '11', 'ADMN1608100021', 'BKM.200816', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:57:50'),
('ADMN160810-105836', '2016-08-10', 'ADMN160511-103312', '11', 'ADMN1608100022', 'BKM.210816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:58:36'),
('ADMN160810-105931', '2016-08-10', 'ADMN160511-110655', '11', 'ADMN1608100023', 'BKM.220816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 10:59:31'),
('ADMN160810-115936', '2016-08-10', 'ADMN160511-110130', '11', 'ADMN1608100028', 'BKM.230816', '', 0.00, 20000.00, 40000.00, 'simpanan wajib bln juni', '1', '0', 0, '0', '1', 'admin', '2016-08-10 11:59:37'),
('ADMN160810-120024', '2016-08-10', 'ADMN160511-110130', '11', 'ADMN1608100029', 'BKM.240816', '', 0.00, 20000.00, 60000.00, 'simpanan wajib bln juli', '1', '0', 0, '0', '1', 'admin', '2016-08-10 12:00:24'),
('ADMN160810-120926', '2016-08-10', 'ADMN160511-110130', '11', 'ADMN1608100030', 'BKM.250816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-10 12:09:27'),
('ADMN160813-102754', '2016-08-13', 'ADMN160511-105538', '11', 'ADMN1608130001', 'BKM.260816', '', 0.00, 20000.00, 40000.00, 'SIMPANAN WAJIB BLN JUNI', '1', '0', 0, '0', '1', 'admin', '2016-08-13 10:27:55'),
('ADMN160813-103012', '2016-08-13', 'ADMN160511-105538', '11', 'ADMN1608130002', 'BKM.270816', '', 0.00, 20000.00, 60000.00, 'SIMPANAN BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-08-13 10:30:12'),
('ADMN160813-103432', '2016-08-13', 'ADMN160511-101800', '11', 'ADMN1608130003', 'BKM.280816', '', 0.00, 20000.00, 40000.00, 'SIMPANAN WAJIB BLN JUNI', '1', '0', 0, '0', '1', 'admin', '2016-08-13 10:34:32'),
('ADMN160813-103750', '2016-08-13', 'ADMN160511-101800', '11', 'ADMN1608130004', 'BKM.290816', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-08-13 10:37:50'),
('ADMN160813-104538', '2016-08-13', 'ADMN160511-100221', '11', 'ADMN1608130006', 'BKM.300816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-13 10:45:38'),
('ADMN160813-104738', '2016-08-13', 'ADMN160511-091214', '11', 'ADMN1608130007', 'BKM.310816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-13 10:47:38'),
('ADMN160813-104843', '2016-08-13', 'ADMN160511-094505', '11', 'ADMN1608130008', 'BKM.320816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-13 10:48:43'),
('ADMN160813-104939', '2016-08-13', 'ADMN160504-103633', '11', 'ADMN1608130009', 'BKM.330816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-13 10:49:39'),
('ADMN160813-105125', '2016-08-13', 'ADMN160511-100207', '1', 'ADMN1608130010', 'BKM.340816', '', 0.00, 25000.00, 125000.00, 'SIMPANAN SUKARELA', '1', '0', 0, '0', '1', 'admin', '2016-08-13 10:51:25'),
('ADMN160820-085337', '2016-08-20', 'ADMN160511-105538', '11', 'ADMN1608200001', 'BKM.350816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-20 08:53:38'),
('ADMN160820-085530', '2016-08-20', 'ADMN160511-104905', '11', 'ADMN1608200002', 'BKM.360816', '', 0.00, 20000.00, 80000.00, 'SIMPANAN WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-08-20 08:55:30'),
('ADMN160902-093332', '2016-09-02', 'ADMN160511-110622', '11', 'ADMN1609020001', 'BKM.010916', '', 0.00, 20000.00, 100000.00, 'simpanan wajib bln september', '1', '0', 0, '0', '1', 'admin', '2016-09-02 09:33:32'),
('ADMN160902-093532', '2016-09-02', 'ADMN160511-110056', '11', 'ADMN1609020003', 'BKM.020916', '', 0.00, 20000.00, 100000.00, 'SIMPANAN WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-02 09:35:32'),
('ADMN160902-095033', '2016-09-02', 'ADMN160511-111249', '11', 'ADMN1609020004', 'BKM.030916', '', 0.00, 20000.00, 100000.00, 'SIMPANAN WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-02 09:50:33'),
('ADMN160902-095329', '2016-09-02', 'ADMN160511-095935', '11', 'ADMN1609020005', 'BKM.040916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-02 09:53:29'),
('ADMN160902-095415', '2016-09-02', 'ADMN160511-095712', '11', 'ADMN1609020006', 'BKM.050916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-02 09:54:16'),
('ADMN160905-113700', '2016-09-05', 'ADMN160514-091217', '11', 'ADMN1609050003', 'BKM.060916', '', 0.00, 20000.00, 80000.00, 'SIMPANAN BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-09-05 11:37:00'),
('ADMN160905-113752', '2016-09-05', 'ADMN160514-091217', '11', 'ADMN1609050004', 'BKM.070916', '', 0.00, 20000.00, 100000.00, 'SIMPANAN BLN SEPTEMBER\r\n', '1', '0', 0, '0', '1', 'admin', '2016-09-05 11:37:52'),
('ADMN160905-114224', '2016-09-05', 'ADMN160511-094724', '11', 'ADMN1609050005', 'BKM.090916', '', 0.00, 20000.00, 60000.00, 'SIMPANAN BLN SEPTEMBER\r\n', '1', '0', 0, '0', '1', 'admin', '2016-09-05 11:42:25'),
('ADMN160905-114402', '2016-09-05', 'ADMN160511-094724', '11', 'ADMN1609050006', 'BKM.080916', '', 0.00, 20000.00, 80000.00, 'SIMPANAN BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-09-05 11:44:02'),
('ADMN160905-114824', '2016-09-05', 'ADMN160514-091637', '1', 'ADMN1609050007', 'BKM.100916', '', 0.00, 40000.00, 100000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-09-05 11:48:24'),
('ADMN160905-114932', '2016-09-05', 'ADMN160514-091650', '11', 'ADMN1609050008', 'BKM.110916', '', 0.00, 20000.00, 60000.00, 'SIMPANAN WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-09-05 11:49:32'),
('ADMN160905-115022', '2016-09-05', 'ADMN160514-091650', '11', 'ADMN1609050009', 'BKM.120916', '', 0.00, 20000.00, 80000.00, 'SIM WAJIB BLN AGUSTUS\r\n', '1', '0', 0, '0', '1', 'admin', '2016-09-05 11:50:23'),
('ADMN160905-115138', '2016-09-05', 'ADMN160514-091650', '11', 'ADMN1609050010', 'BKM.130916', '', 0.00, 20000.00, 100000.00, 'SIMPANAN WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-05 11:51:38'),
('ADMN160906-113551', '2016-09-06', 'ADMN160511-103125', '11', 'ADMN1609060003', 'BKM.140916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-06 11:35:51'),
('ADMN160906-113755', '2016-09-06', 'ADMN160511-102608', '11', 'ADMN1609060004', 'BKM.150916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-06 11:37:56'),
('ADMN160906-113909', '2016-09-06', 'ADMN160511-102058', '11', 'ADMN1609060005', 'BKM.160916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-06 11:39:09'),
('ADMN160906-114020', '2016-09-06', 'ADMN160511-103634', '11', 'ADMN1609060006', 'BKM.170916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-06 11:40:20'),
('ADMN160906-114137', '2016-09-06', 'ADMN160511-102953', '11', 'ADMN1609060007', 'BKM.180916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-06 11:41:37'),
('ADMN160906-114248', '2016-09-06', 'ADMN160511-102422', '11', 'ADMN1609060008', 'BKM.190916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-06 11:42:48'),
('ADMN160906-114345', '2016-09-06', 'ADMN160511-102245', '11', 'ADMN1609060009', 'BKM.200916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-06 11:43:46'),
('ADMN160906-114516', '2016-09-06', 'ADMN160511-103312', '11', 'ADMN1609060010', 'BKM.210916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-06 11:45:17'),
('ADMN160906-125045', '2016-09-06', 'ADMN160906-124703', '1', 'ADMN1609060013', 'BKM.220916', '', 0.00, 100000.00, 100000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:50:45'),
('ADMN160906-125223', '2016-09-06', 'ADMN160906-124748', '1', 'ADMN1609060014', 'BKM.230916', '', 0.00, 100000.00, 100000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:52:23'),
('ADMN160906-125311', '2016-09-06', 'ADMN160906-124731', '11', 'ADMN1609060015', 'BKM.240916', '', 0.00, 20000.00, 20000.00, 'SIM WAJIB BLN MEI', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:53:11'),
('ADMN160906-125359', '2016-09-06', 'ADMN160906-124731', '11', 'ADMN1609060016', 'BKM.250916', '', 0.00, 20000.00, 40000.00, 'SIM WAJIB BLN JUNI', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:53:59'),
('ADMN160906-125455', '2016-09-06', 'ADMN160906-124731', '11', 'ADMN1609060017', 'BKM.260916', '', 0.00, 20000.00, 60000.00, 'SIM WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:54:55'),
('ADMN160906-125543', '2016-09-06', 'ADMN160906-124731', '11', 'ADMN1609060018', 'BKM.270916', '', 0.00, 20000.00, 80000.00, 'SIM WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:55:44'),
('ADMN160906-125624', '2016-09-06', 'ADMN160906-124731', '11', 'ADMN1609060019', 'BKM.280916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:56:25'),
('ADMN160906-125718', '2016-09-06', 'ADMN160906-124811', '11', 'ADMN1609060020', 'BKM.290916', '', 0.00, 20000.00, 20000.00, 'SIM WAJIB BLN MEI', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:57:18'),
('ADMN160906-125756', '2016-09-06', 'ADMN160906-124811', '11', 'ADMN1609060021', 'BKM.300916', '', 0.00, 20000.00, 40000.00, 'SIM WAJIB BLN JUNI', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:57:57'),
('ADMN160906-125843', '2016-09-06', 'ADMN160906-124811', '11', 'ADMN1609060022', 'BKM.310916', '', 0.00, 20000.00, 60000.00, 'SIM WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:58:44'),
('ADMN160906-125924', '2016-09-06', 'ADMN160906-124811', '11', 'ADMN1609060023', 'BKM.320916', '', 0.00, 20000.00, 80000.00, 'SIM WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-09-06 12:59:24'),
('ADMN160906-130010', '2016-09-06', 'ADMN160906-124811', '11', 'ADMN1609060024', 'BKM.330916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-06 13:00:10'),
('ADMN160916-074028', '2016-09-16', 'ADMN160511-102755', '1', 'ADMN1609160001', 'BKM.340916', '', 0.00, 40000.00, 100000.00, 'SIMPANAN POKOK', '1', '0', 0, '0', '1', 'admin', '2016-09-16 07:40:28'),
('ADMN160916-074510', '2016-09-16', 'ADMN160511-102809', '11', 'ADMN1609160002', 'BKM.350916', '', 0.00, 20000.00, 60000.00, 'SIM WAJIB BLN JULI', '1', '0', 0, '0', '1', 'admin', '2016-09-16 07:45:10'),
('ADMN160916-074559', '2016-09-16', 'ADMN160511-102809', '11', 'ADMN1609160003', 'BKM.360916', '', 0.00, 20000.00, 80000.00, 'SIM WAJIB BLN AGUSTUS', '1', '0', 0, '0', '1', 'admin', '2016-09-16 07:45:59'),
('ADMN160916-074706', '2016-09-16', 'ADMN160511-102809', '11', 'ADMN1609160004', 'BKM.370916', '', 0.00, 20000.00, 100000.00, 'SIM WAJIB BLN SEPTEMBER', '1', '0', 0, '0', '1', 'admin', '2016-09-16 07:47:06'),
('ADMN160922-084849', '2016-09-22', 'ADMN160511-104905', '11', 'ADMN1609220002', 'BKM.380916', '', 0.00, 20000.00, 100000.00, 'Simpanan Wajib Bln September', '1', '0', 0, '0', '1', 'admin', '2016-09-22 08:48:49'),
('ADMN160930-094904', '2016-09-30', 'ADMN160511-095327', '11', 'ADMN1609300001', 'BKM.400916', '', 0.00, 20000.00, 100000.00, 'Simpanan Wajib Bln September', '1', '0', 0, '0', '1', 'admin', '2016-09-30 09:49:04'),
('ADMN160930-094951', '2016-09-30', 'ADMN160511-094505', '11', 'ADMN1609300002', 'BKM.410916', '', 0.00, 20000.00, 100000.00, 'Simpanan Wajib Bln September', '1', '0', 0, '0', '1', 'admin', '2016-09-30 09:49:51'),
('ADMN161005-094803', '2016-10-05', 'ADMN160511-094724', '11', 'ADMN1610050002', 'BKM.011016', '', 0.00, 20000.00, 100000.00, 'Simpanan Wajib Bln Oktober', '1', '0', 0, '0', '1', 'admin', '2016-10-05 09:48:04'),
('ADMN161010-104335', '2016-10-10', 'ADMN160511-110655', '11', 'ADMN1610100001', 'BKM.021016', '', 0.00, 20000.00, 100000.00, 'SIMPANAN WAJIB BLN OKTOBER\r\n', '1', '0', 0, '0', '1', 'admin', '2016-10-10 10:43:35'),
('ADMN161024-111354', '2016-10-24', 'ADMN160511-104905', '11', 'ADMN1610240001', 'BKM.031016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-24 11:13:54'),
('ADMN161029-075704', '2016-10-29', 'ADMN160511-095712', '11', 'ADMN1610290001', 'BKM.041016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 07:57:05'),
('ADMN161029-075911', '2016-10-29', 'ADMN160511-111249', '11', 'ADMN1610290003', 'BKM.051016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 07:59:11'),
('ADMN161029-080206', '2016-10-29', 'ADMN160511-095327', '11', 'ADMN1610290004', 'BKM.061016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER\r\n', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:02:06'),
('ADMN161029-080300', '2016-10-29', 'ADMN160511-095935', '11', 'ADMN1610290005', 'BKM.071016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:03:01'),
('ADMN161029-081048', '2016-10-29', 'ADMN160511-094724', '11', 'ADMN1610290008', 'BKM.081016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:10:48'),
('ADMN161029-081155', '2016-10-29', 'ADMN160511-103125', '11', 'ADMN1610290009', 'BKM.091016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER\r\n', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:11:55'),
('ADMN161029-081904', '2016-10-29', 'ADMN160511-102809', '11', 'ADMN1610290010', 'BKM.101016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:19:04'),
('ADMN161029-082045', '2016-10-29', 'ADMN160511-102245', '11', 'ADMN1610290011', 'BKM.101016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER\r\n', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:20:45'),
('ADMN161029-082554', '2016-10-29', 'ADMN160511-110130', '11', 'ADMN1610290013', 'BKM.111016', '', 0.00, 20000.00, 100000.00, 'SIMPANAN WAJIB BLN OKTOBER\r\n', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:25:54'),
('ADMN161029-083200', '2016-10-29', 'ADMN160511-102953', '11', 'ADMN1610290014', 'BKM.121016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:32:00'),
('ADMN161029-084537', '2016-10-29', 'ADMN160511-102422', '11', 'ADMN1610290015', 'BKM.131016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:45:38'),
('ADMN161029-084636', '2016-10-29', 'ADMN160511-102608', '11', 'ADMN1610290016', 'BKM.141016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:46:36'),
('ADMN161029-084734', '2016-10-29', 'ADMN160511-103634', '11', 'ADMN1610290017', 'BKM.151016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:47:34'),
('ADMN161029-084824', '2016-10-29', 'ADMN160511-102058', '11', 'ADMN1610290018', 'BKM.161016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:48:24'),
('ADMN161029-085020', '2016-10-29', 'ADMN160511-103312', '11', 'ADMN1610290019', 'BKM.171016', '', 0.00, 20000.00, 120000.00, 'SIMPANAN WAJIB BLN OKTOBER', '1', '0', 0, '0', '1', 'admin', '2016-10-29 08:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `tabtransaksidetail2`
--

CREATE TABLE IF NOT EXISTS `tabtransaksidetail2` (
  `id` varchar(30) NOT NULL,
  `kas` char(1) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabtransaksidetail2`
--

INSERT INTO `tabtransaksidetail2` (`id`, `kas`, `accountid`) VALUES
('ADMN160504-103810', '1', ''),
('ADMN160511-085757', '1', ''),
('ADMN160511-085940', '1', ''),
('ADMN160511-091307', '1', ''),
('ADMN160511-091410', '1', ''),
('ADMN160511-094608', '1', ''),
('ADMN160511-094650', '1', ''),
('ADMN160511-094826', '1', ''),
('ADMN160511-094916', '1', ''),
('ADMN160511-094949', '1', ''),
('ADMN160511-095141', '1', ''),
('ADMN160511-095211', '1', ''),
('ADMN160511-095235', '1', ''),
('ADMN160511-095439', '1', ''),
('ADMN160511-095519', '1', ''),
('ADMN160511-095758', '1', ''),
('ADMN160511-095829', '1', ''),
('ADMN160511-100008', '1', ''),
('ADMN160511-100042', '1', ''),
('ADMN160511-100303', '1', ''),
('ADMN160511-100332', '1', ''),
('ADMN160511-100429', '1', ''),
('ADMN160511-100538', '1', ''),
('ADMN160511-101847', '1', ''),
('ADMN160511-101941', '1', ''),
('ADMN160511-102142', '1', ''),
('ADMN160511-102209', '1', ''),
('ADMN160511-102321', '1', ''),
('ADMN160511-102346', '1', ''),
('ADMN160511-102455', '1', ''),
('ADMN160511-102527', '1', ''),
('ADMN160511-102648', '1', ''),
('ADMN160511-102716', '1', ''),
('ADMN160511-102851', '1', ''),
('ADMN160511-102917', '1', ''),
('ADMN160511-103026', '1', ''),
('ADMN160511-103056', '1', ''),
('ADMN160511-103156', '1', ''),
('ADMN160511-103227', '1', ''),
('ADMN160511-103343', '1', ''),
('ADMN160511-103421', '1', ''),
('ADMN160511-103719', '1', ''),
('ADMN160511-103749', '1', ''),
('ADMN160511-103833', '1', ''),
('ADMN160511-104156', '1', ''),
('ADMN160511-104245', '1', ''),
('ADMN160511-104315', '1', ''),
('ADMN160511-104546', '1', ''),
('ADMN160511-104642', '1', ''),
('ADMN160511-105147', '1', ''),
('ADMN160511-105400', '1', ''),
('ADMN160511-105753', '1', ''),
('ADMN160511-105924', '1', ''),
('ADMN160511-110407', '1', ''),
('ADMN160511-110508', '1', ''),
('ADMN160511-110802', '1', ''),
('ADMN160511-110845', '1', ''),
('ADMN160511-111133', '1', ''),
('ADMN160511-111342', '1', ''),
('ADMN160511-111423', '1', ''),
('ADMN160514-091327', '1', ''),
('ADMN160514-091418', '1', ''),
('ADMN160514-091527', '1', ''),
('ADMN160514-091619', '1', ''),
('ADMN160514-091726', '1', ''),
('ADMN160514-091808', '1', ''),
('ADMN160516-105153', '1', ''),
('ADMN160516-105228', '1', ''),
('ADMN160519-112415', '1', ''),
('ADMN160526-084159', '1', ''),
('ADMN160526-084249', '1', ''),
('ADMN160601-073629', '1', ''),
('ADMN160601-073713', '1', ''),
('ADMN160601-073820', '1', ''),
('ADMN160602-095737', '1', ''),
('ADMN160603-092709', '1', ''),
('ADMN160603-093326', '1', ''),
('ADMN160603-093433', '1', ''),
('ADMN160603-093520', '1', ''),
('ADMN160603-093705', '1', ''),
('ADMN160603-093805', '1', ''),
('ADMN160603-093856', '1', ''),
('ADMN160603-093935', '1', ''),
('ADMN160603-094018', '1', ''),
('ADMN160603-094059', '1', ''),
('ADMN160603-094201', '1', ''),
('ADMN160603-094236', '1', ''),
('ADMN160603-094334', '1', ''),
('ADMN160603-094417', '1', ''),
('ADMN160603-094502', '1', ''),
('ADMN160610-103324', '1', ''),
('ADMN160610-103408', '1', ''),
('ADMN160616-102418', '1', ''),
('ADMN160616-102508', '1', ''),
('ADMN160616-102604', '1', ''),
('ADMN160616-110001', '1', ''),
('ADMN160616-110707', '1', ''),
('ADMN160616-125749', '1', ''),
('ADMN160616-125833', '1', ''),
('ADMN160616-125920', '1', ''),
('ADMN160616-130218', '1', ''),
('ADMN160616-130258', '1', ''),
('ADMN160616-130347', '1', ''),
('ADMN160616-130423', '1', ''),
('ADMN160718-102753', '1', ''),
('ADMN160718-102921', '1', ''),
('ADMN160718-114728', '1', ''),
('ADMN160718-115052', '1', ''),
('ADMN160718-115243', '1', ''),
('ADMN160718-115338', '1', ''),
('ADMN160718-115434', '1', ''),
('ADMN160718-115530', '1', ''),
('ADMN160721-111027', '1', ''),
('ADMN160721-111146', '1', ''),
('ADMN160721-111234', '1', ''),
('ADMN160721-111924', '1', ''),
('ADMN160721-113046', '1', ''),
('ADMN160721-113216', '1', ''),
('ADMN160721-113323', '1', ''),
('ADMN160721-113630', '1', ''),
('ADMN160721-113753', '1', ''),
('ADMN160726-103351', '1', ''),
('ADMN160726-103503', '1', ''),
('ADMN160726-103602', '1', ''),
('ADMN160726-103757', '1', ''),
('ADMN160726-103922', '1', ''),
('ADMN160726-104012', '1', ''),
('ADMN160726-104121', '1', ''),
('ADMN160726-104212', '1', ''),
('ADMN160726-104723', '1', ''),
('ADMN160810-103624', '1', ''),
('ADMN160810-103748', '1', ''),
('ADMN160810-103924', '1', ''),
('ADMN160810-104104', '1', ''),
('ADMN160810-104200', '1', ''),
('ADMN160810-104333', '1', ''),
('ADMN160810-104541', '1', ''),
('ADMN160810-104705', '1', ''),
('ADMN160810-104806', '1', ''),
('ADMN160810-104901', '1', ''),
('ADMN160810-104944', '1', ''),
('ADMN160810-105030', '1', ''),
('ADMN160810-105128', '1', ''),
('ADMN160810-105213', '1', ''),
('ADMN160810-105305', '1', ''),
('ADMN160810-105418', '1', ''),
('ADMN160810-105510', '1', ''),
('ADMN160810-105604', '1', ''),
('ADMN160810-105651', '1', ''),
('ADMN160810-105749', '1', ''),
('ADMN160810-105836', '1', ''),
('ADMN160810-105931', '1', ''),
('ADMN160810-115936', '1', ''),
('ADMN160810-120024', '1', ''),
('ADMN160810-120926', '1', ''),
('ADMN160813-102754', '1', ''),
('ADMN160813-103012', '1', ''),
('ADMN160813-103432', '1', ''),
('ADMN160813-103750', '1', ''),
('ADMN160813-104538', '1', ''),
('ADMN160813-104738', '1', ''),
('ADMN160813-104843', '1', ''),
('ADMN160813-104939', '1', ''),
('ADMN160813-105125', '1', ''),
('ADMN160820-085337', '1', ''),
('ADMN160820-085530', '1', ''),
('ADMN160902-093332', '1', ''),
('ADMN160902-093532', '1', ''),
('ADMN160902-095033', '1', ''),
('ADMN160902-095329', '1', ''),
('ADMN160902-095415', '1', ''),
('ADMN160905-113700', '1', ''),
('ADMN160905-113752', '1', ''),
('ADMN160905-114224', '1', ''),
('ADMN160905-114402', '1', ''),
('ADMN160905-114824', '1', ''),
('ADMN160905-114932', '1', ''),
('ADMN160905-115022', '1', ''),
('ADMN160905-115138', '1', ''),
('ADMN160906-113551', '1', ''),
('ADMN160906-113755', '1', ''),
('ADMN160906-113909', '1', ''),
('ADMN160906-114020', '1', ''),
('ADMN160906-114137', '1', ''),
('ADMN160906-114248', '1', ''),
('ADMN160906-114345', '1', ''),
('ADMN160906-114516', '1', ''),
('ADMN160906-125045', '1', ''),
('ADMN160906-125223', '1', ''),
('ADMN160906-125311', '1', ''),
('ADMN160906-125359', '1', ''),
('ADMN160906-125455', '1', ''),
('ADMN160906-125543', '1', ''),
('ADMN160906-125624', '1', ''),
('ADMN160906-125718', '1', ''),
('ADMN160906-125756', '1', ''),
('ADMN160906-125843', '1', ''),
('ADMN160906-125924', '1', ''),
('ADMN160906-130010', '1', ''),
('ADMN160916-074028', '1', ''),
('ADMN160916-074510', '1', ''),
('ADMN160916-074559', '1', ''),
('ADMN160916-074706', '1', ''),
('ADMN160922-084849', '1', ''),
('ADMN160930-094904', '1', ''),
('ADMN160930-094951', '1', ''),
('ADMN161005-094803', '1', ''),
('ADMN161010-104335', '1', ''),
('ADMN161024-111354', '1', ''),
('ADMN161029-075704', '1', ''),
('ADMN161029-075911', '1', ''),
('ADMN161029-080206', '1', ''),
('ADMN161029-080300', '1', ''),
('ADMN161029-081048', '1', ''),
('ADMN161029-081155', '1', ''),
('ADMN161029-081904', '1', ''),
('ADMN161029-082045', '1', ''),
('ADMN161029-082554', '1', ''),
('ADMN161029-083200', '1', ''),
('ADMN161029-084537', '1', ''),
('ADMN161029-084636', '1', ''),
('ADMN161029-084734', '1', ''),
('ADMN161029-084824', '1', ''),
('ADMN161029-085020', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `tabtutup`
--

CREATE TABLE IF NOT EXISTS `tabtutup` (
  `id` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabungan`
--

CREATE TABLE IF NOT EXISTS `tabungan` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `norekening` varchar(30) NOT NULL,
  `anggotaid` varchar(30) NOT NULL,
  `jenisid` varchar(30) NOT NULL,
  `marketingid` varchar(30) NOT NULL,
  `qq` varchar(100) NOT NULL,
  `bunga` double(9,2) NOT NULL,
  `baris` double(9,0) NOT NULL,
  `ttd` mediumblob,
  `blokir` char(1) NOT NULL,
  `blokirnominal` char(1) NOT NULL,
  `nblokirnominal` double(15,2) NOT NULL,
  `sms` char(1) NOT NULL,
  `aktif` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`anggotaid`,`jenisid`,`marketingid`,`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabungan`
--

INSERT INTO `tabungan` (`id`, `tanggal`, `norekening`, `anggotaid`, `jenisid`, `marketingid`, `qq`, `bunga`, `baris`, `ttd`, `blokir`, `blokirnominal`, `nblokirnominal`, `sms`, `aktif`, `kantorid`, `user`, `jam`) VALUES
('ADMN160504-103633', '2016-05-04', '12.16050001', 'ADMN20160504-103221', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-04 10:36:33'),
('ADMN160511-085638', '2016-05-11', '11-1.16050001', 'ADMN20160510-100427', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 08:56:38'),
('ADMN160511-085846', '2016-05-11', '11-2.16050001', 'ADMN20160510-100427', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 08:58:46'),
('ADMN160511-091202', '2016-05-11', '11-1.16050002', 'ADMN20160510-100634', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:12:02'),
('ADMN160511-091214', '2016-05-11', '11-2.16050002', 'ADMN20160510-100634', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:12:14'),
('ADMN160511-094453', '2016-05-11', '11-1.16050003', 'ADMN20160504-110951', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:44:53'),
('ADMN160511-094505', '2016-05-11', '11-2.16050003', 'ADMN20160504-110951', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:45:05'),
('ADMN160511-094714', '2016-05-11', '11-1.16050004', 'ADMN20160504-111419', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:47:14'),
('ADMN160511-094724', '2016-05-11', '11-2.16050004', 'ADMN20160504-111419', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:47:24'),
('ADMN160511-094740', '2016-05-11', '11-3.16050001', 'ADMN20160504-111419', 'TB20160510-091608', '', '', 0.00, 2, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:47:40'),
('ADMN160511-095017', '2016-05-11', '11-1.16050005', 'ADMN20160504-111749', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:50:17'),
('ADMN160511-095041', '2016-05-11', '11-2.16050005', 'ADMN20160504-111749', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:50:41'),
('ADMN160511-095051', '2016-05-11', '11-3.16050002', 'ADMN20160504-111749', 'TB20160510-091608', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:50:51'),
('ADMN160511-095315', '2016-05-11', '11-1.16050006', 'ADMN20160504-110547', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:53:15'),
('ADMN160511-095327', '2016-05-11', '11-2.16050006', 'ADMN20160504-110547', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:53:27'),
('ADMN160511-095701', '2016-05-11', '11-1.16050007', 'ADMN20160504-105207', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:57:01'),
('ADMN160511-095712', '2016-05-11', '11-2.16050007', 'ADMN20160504-105207', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:57:12'),
('ADMN160511-095922', '2016-05-11', '11-1.16050008', 'ADMN20160504-105703', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:59:22'),
('ADMN160511-095935', '2016-05-11', '11-2.16050008', 'ADMN20160504-105703', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 09:59:35'),
('ADMN160511-100207', '2016-05-11', '11-1.16050009', 'ADMN20160510-100742', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:02:07'),
('ADMN160511-100221', '2016-05-11', '11-2.16050009', 'ADMN20160510-100742', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:02:21'),
('ADMN160511-100348', '2016-05-11', '11-3.16050003', 'ADMN20160510-100742', 'TB20160510-091608', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:03:48'),
('ADMN160511-100446', '2016-05-11', '11-1.16050010', 'ADMN20160504-103221', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:04:46'),
('ADMN160511-101750', '2016-05-11', '11-1.16050011', 'ADMN20160504-115717', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:17:50'),
('ADMN160511-101800', '2016-05-11', '11-2.16050010', 'ADMN20160504-115717', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:18:00'),
('ADMN160511-102046', '2016-05-11', '11-1.16050012', 'ADMN20160504-114537', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:20:46'),
('ADMN160511-102058', '2016-05-11', '11-2.16050011', 'ADMN20160504-114537', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:20:58'),
('ADMN160511-102235', '2016-05-11', '11-1.16050013', 'ADMN20160504-112850', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:22:35'),
('ADMN160511-102245', '2016-05-11', '11-2.16050012', 'ADMN20160504-112850', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:22:45'),
('ADMN160511-102408', '2016-05-11', '11-1.16050014', 'ADMN20160504-115050', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:24:08'),
('ADMN160511-102422', '2016-05-11', '11-2.16050013', 'ADMN20160504-115050', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:24:22'),
('ADMN160511-102556', '2016-05-11', '11-1.16050015', 'ADMN20160504-114819', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:25:56'),
('ADMN160511-102608', '2016-05-11', '11-2.16050014', 'ADMN20160504-114819', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:26:08'),
('ADMN160511-102755', '2016-05-11', '11-1.16050016', 'ADMN20160504-113203', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:27:55'),
('ADMN160511-102809', '2016-05-11', '11-2.16050015', 'ADMN20160504-113203', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:28:09'),
('ADMN160511-102943', '2016-05-11', '11-1.16050017', 'ADMN20160504-114037', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:29:43'),
('ADMN160511-102953', '2016-05-11', '11-2.16050016', 'ADMN20160504-114037', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:29:53'),
('ADMN160511-103115', '2016-05-11', '11-1.16050018', 'ADMN20160504-115300', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:31:15'),
('ADMN160511-103125', '2016-05-11', '11-2.16050017', 'ADMN20160504-115300', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:31:25'),
('ADMN160511-103258', '2016-05-11', '11-1.16050019', 'ADMN20160504-114314', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:32:58'),
('ADMN160511-103312', '2016-05-11', '11-2.16050018', 'ADMN20160504-114314', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:33:12'),
('ADMN160511-103625', '2016-05-11', '11-1.16050020', 'ADMN20160504-112422', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:36:25'),
('ADMN160511-103634', '2016-05-11', '11-2.16050019', 'ADMN20160504-112422', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:36:34'),
('ADMN160511-103644', '2016-05-11', '11-3.16050004', 'ADMN20160504-112422', 'TB20160510-091608', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:36:44'),
('ADMN160511-104044', '2016-05-11', '11-1.16050021', 'ADMN20160504-120920', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:40:44'),
('ADMN160511-104057', '2016-05-11', '11-2.16050020', 'ADMN20160504-120920', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:40:57'),
('ADMN160511-104118', '2016-05-11', '11-3.16050005', 'ADMN20160504-120920', 'TB20160510-091608', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:41:18'),
('ADMN160511-104417', '2016-05-11', '11-1.16050022', 'ADMN20160509-110426', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:44:17'),
('ADMN160511-104426', '2016-05-11', '11-2.16050021', 'ADMN20160509-110426', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:44:26'),
('ADMN160511-104847', '2016-05-11', '11-1.16050023', 'ADMN20160510-101031', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:48:47'),
('ADMN160511-104905', '2016-05-11', '11-2.16050022', 'ADMN20160510-101031', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:49:05'),
('ADMN160511-105509', '2016-05-11', '11-1.16050024', 'ADMN20160509-110817', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:55:09'),
('ADMN160511-105538', '2016-05-11', '11-2.16050023', 'ADMN20160509-110817', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 10:55:38'),
('ADMN160511-110056', '2016-05-11', '11-1.16050025', 'ADMN20160510-101123', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 11:00:56'),
('ADMN160511-110130', '2016-05-11', '11-2.16050024', 'ADMN20160510-101123', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 11:01:30'),
('ADMN160511-110622', '2016-05-11', '11-1.16050026', 'ADMN20160510-101211', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 11:06:22'),
('ADMN160511-110655', '2016-05-11', '11-2.16050025', 'ADMN20160510-101211', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 11:06:55'),
('ADMN160511-111025', '2016-05-11', '11-1.16050027', 'ADMN20160510-101244', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 11:10:25'),
('ADMN160511-111230', '2016-05-11', '11-1.16050028', 'ADMN20160504-110156', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 11:12:30'),
('ADMN160511-111249', '2016-05-11', '11-2.16050026', 'ADMN20160504-110156', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-11 11:12:49'),
('ADMN160514-091159', '2016-05-14', '11-1.16050029', 'ADMN20160514-090943', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-14 09:11:59'),
('ADMN160514-091217', '2016-05-14', '11-2.16050027', 'ADMN20160514-090943', 'TB20160504-103411', '', '', 0.00, 4, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-14 09:12:17'),
('ADMN160514-091434', '2016-05-14', '11-1.16050030', 'ADMN20160514-091012', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-14 09:14:34'),
('ADMN160514-091447', '2016-05-14', '11-2.16050028', 'ADMN20160514-091012', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-14 09:14:47'),
('ADMN160514-091637', '2016-05-14', '11-1.16050031', 'ADMN20160514-091057', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-14 09:16:37'),
('ADMN160514-091650', '2016-05-14', '11-2.16050029', 'ADMN20160514-091057', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-14 09:16:50'),
('ADMN160516-105048', '2016-05-16', '11-1.16050032', 'ADMN20160516-105019', 'TB20160510-091024', '', '', 0.00, 30, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-16 10:50:48'),
('ADMN160516-105059', '2016-05-16', '11-2.16050030', 'ADMN20160516-105019', 'TB20160504-103411', '', '', 0.00, 1, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-16 10:50:59'),
('ADMN160519-112311', '2016-05-19', '11-3.16050006', 'ADMN20160504-115717', 'TB20160510-091608', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-19 11:23:11'),
('ADMN160526-084033', '2016-05-26', '11-1.16050033', 'ADMN20160525-112634', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-26 08:40:33'),
('ADMN160526-084110', '2016-05-26', '11-2.16050031', 'ADMN20160525-112634', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-05-26 08:41:10'),
('ADMN160601-073504', '2016-06-01', '11-1.16060001', 'ADMN20160601-073443', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-06-01 07:35:04'),
('ADMN160601-073524', '2016-06-01', '11-2.16060001', 'ADMN20160601-073443', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-06-01 07:35:24'),
('ADMN160721-111107', '2016-07-21', '11-3.16070001', 'ADMN20160510-100427', 'TB20160510-091608', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-07-21 11:11:07'),
('ADMN160726-104523', '2016-07-26', '11-1.16070001', 'ADMN20160726-104424', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-07-26 10:45:23'),
('ADMN160726-104547', '2016-07-26', '11-2.16070001', 'ADMN20160726-104424', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-07-26 10:45:47'),
('ADMN160726-104605', '2016-07-26', '11-3.16070002', 'ADMN20160726-104424', 'TB20160510-091608', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-07-26 10:46:05'),
('ADMN160906-124703', '2016-09-06', '11-1.16090001', 'ADMN20160905-113056', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-09-06 12:47:03'),
('ADMN160906-124718', '2016-09-06', '11-3.16090001', 'ADMN20160905-113056', 'TB20160510-091608', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-09-06 12:47:18'),
('ADMN160906-124731', '2016-09-06', '11-2.16090001', 'ADMN20160905-113056', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-09-06 12:47:31'),
('ADMN160906-124748', '2016-09-06', '11-1.16090002', 'ADMN20160905-113127', 'TB20160510-091024', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-09-06 12:47:48'),
('ADMN160906-124800', '2016-09-06', '11-3.16090002', 'ADMN20160905-113127', 'TB20160510-091608', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-09-06 12:48:00'),
('ADMN160906-124811', '2016-09-06', '11-2.16090002', 'ADMN20160905-113127', 'TB20160504-103411', '', '', 0.00, 0, NULL, '0', '0', 0.00, '0', '1', '1', 'admin', '2016-09-06 12:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `tabungandetail`
--

CREATE TABLE IF NOT EXISTS `tabungandetail` (
  `id` varchar(30) NOT NULL,
  `suratid` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `surat` mediumblob,
  KEY `id` (`id`,`suratid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmplaporanfilter`
--

CREATE TABLE IF NOT EXISTS `tmplaporanfilter` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `filterid` varchar(50) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `kolom` varchar(100) NOT NULL,
  `user` varchar(30) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmppinjtemplate`
--

CREATE TABLE IF NOT EXISTS `tmppinjtemplate` (
  `id` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `surat` mediumblob,
  `jenis` char(1) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmppinjtransaksidenda`
--

CREATE TABLE IF NOT EXISTS `tmppinjtransaksidenda` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `rumus` varchar(300) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmppinjtransaksidetail`
--

CREATE TABLE IF NOT EXISTS `tmppinjtransaksidetail` (
  `id` varchar(30) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `accountid` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `swpid` varchar(30) NOT NULL,
  `kodeid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmptabbunga`
--

CREATE TABLE IF NOT EXISTS `tmptabbunga` (
  `id` varchar(30) NOT NULL,
  `minimal` double(15,2) NOT NULL,
  `maksimal` double(15,2) NOT NULL,
  `bunga` double(9,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmptabbungaimpor`
--

CREATE TABLE IF NOT EXISTS `tmptabbungaimpor` (
  `nosimpanan` varchar(30) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`nosimpanan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmptabpasaldetail`
--

CREATE TABLE IF NOT EXISTS `tmptabpasaldetail` (
  `id` varchar(30) NOT NULL,
  `id2` varchar(10) NOT NULL,
  `keterangan` varchar(1000) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmptabsetoran`
--

CREATE TABLE IF NOT EXISTS `tmptabsetoran` (
  `id` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `norekening` varchar(100) NOT NULL,
  `nominal` double(15,2) NOT NULL,
  `user` varchar(30) NOT NULL,
  KEY `id` (`id`,`norekening`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `passw` varchar(30) NOT NULL,
  `code` varchar(4) NOT NULL,
  `level` char(1) NOT NULL,
  `antarkantor` char(1) NOT NULL,
  `edittanggal` char(1) NOT NULL,
  `editbiaya` char(1) NOT NULL,
  `kantorid` varchar(30) NOT NULL,
  `limitid` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `jam` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id2` (`kantorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `passw`, `code`, `level`, `antarkantor`, `edittanggal`, `editbiaya`, `kantorid`, `limitid`, `user`, `jam`) VALUES
('admin', 'n105m100a', 'ADMN', '1', '1', '1', '1', '1', '', 'admin', '2016-06-04 09:07:28');

-- --------------------------------------------------------

--
-- Table structure for table `userdetail`
--

CREATE TABLE IF NOT EXISTS `userdetail` (
  `id` varchar(30) NOT NULL,
  `menu` varchar(100) NOT NULL,
  `tambah` char(1) NOT NULL,
  `edit` char(1) NOT NULL,
  `hapus` char(1) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdetail`
--

INSERT INTO `userdetail` (`id`, `menu`, `tambah`, `edit`, `hapus`) VALUES
('admin', 'mnSetup', '0', '0', '0'),
('admin', 'mnAgama', '1', '1', '1'),
('admin', 'mnHariLibur', '0', '0', '0'),
('admin', 'mnKabupaten', '1', '1', '1'),
('admin', 'mnKantor', '1', '1', '1'),
('admin', 'mnKunciTransaksi', '1', '1', '1'),
('admin', 'mnLimitTransaksi', '1', '1', '1'),
('admin', 'mnMarketing', '1', '1', '1'),
('admin', 'mnPekerjaan', '1', '1', '1'),
('admin', 'mnPendidikan', '1', '1', '1'),
('admin', 'mnPropinsi', '1', '1', '1'),
('admin', 'mnSektor', '1', '1', '1'),
('admin', 'GSetup1', '0', '0', '0'),
('admin', 'mnJaminan', '1', '1', '1'),
('admin', 'mnKodeTransaksi', '1', '1', '1'),
('admin', 'mnJenisPinjaman', '1', '1', '1'),
('admin', 'mnJenisSimpanan', '1', '1', '1'),
('admin', 'mnJenisSimpananBerjangka', '1', '1', '1'),
('admin', 'GSetup2', '0', '0', '0'),
('admin', 'mnKelompokTransaksiKas', '1', '1', '1'),
('admin', 'mnKodeTransaksiKas', '1', '1', '1'),
('admin', 'GSetup3', '0', '0', '0'),
('admin', 'mnPenilaianManajemen', '1', '1', '1'),
('admin', 'GSetup4', '0', '0', '0'),
('admin', 'mnDatabase', '0', '0', '0'),
('admin', 'mnBackup', '0', '0', '0'),
('admin', 'mnRestore', '0', '0', '0'),
('admin', 'mnEkspor', '0', '0', '0'),
('admin', 'mnImpor', '0', '0', '0'),
('admin', 'mnUser', '1', '1', '1'),
('admin', 'mnSettingNoAccount', '0', '0', '0'),
('admin', 'mnKata', '0', '0', '0'),
('admin', 'mnProfile', '0', '0', '0'),
('admin', 'mnReset', '0', '0', '0'),
('admin', 'mnAccounting', '0', '0', '0'),
('admin', 'mnChartOfAccount', '0', '0', '0'),
('admin', 'mnAccount', '1', '1', '1'),
('admin', 'mnHeader', '1', '1', '1'),
('admin', 'mnJurnalUmum', '1', '1', '1'),
('admin', 'mnValidasiJurnal', '0', '0', '0'),
('admin', 'mnBudgetAnggaran', '1', '1', '1'),
('admin', 'mnTutupBuku', '0', '0', '0'),
('admin', 'GAccounting1', '0', '0', '0'),
('admin', 'mnNeracaSaldoAwal', '0', '0', '0'),
('admin', 'GAccounting2', '0', '0', '0'),
('admin', 'mnSHU', '0', '0', '0'),
('admin', 'GAccounting3', '0', '0', '0'),
('admin', 'mnTransaksiNonSimpananPinjaman', '0', '0', '0'),
('admin', 'mnTransaksiKas', '1', '1', '1'),
('admin', 'mnTransaksiBank', '1', '1', '1'),
('admin', 'mnAktivaTetap', '1', '1', '1'),
('admin', 'mnKelompok', '1', '1', '1'),
('admin', 'mnAktivaTetap1', '1', '1', '1'),
('admin', 'mnAkumulasiPenyusutan', '1', '1', '1'),
('admin', 'mnManajemenSurat', '0', '0', '0'),
('admin', 'mnSuratMasuk', '1', '1', '1'),
('admin', 'mnSuratKeluar', '1', '1', '1'),
('admin', 'mnCustomerService', '0', '0', '0'),
('admin', 'mnAnggota', '1', '1', '1'),
('admin', 'mnNonAnggota', '1', '1', '1'),
('admin', 'GCS1', '0', '0', '0'),
('admin', 'mnPinjaman', '1', '1', '1'),
('admin', 'mnJadwalUlangPinjaman', '1', '1', '1'),
('admin', 'mnPenghapusanPinjaman', '1', '1', '1'),
('admin', 'mnProposalPinjaman', '1', '1', '1'),
('admin', 'mnTagihanPinjaman', '1', '1', '1'),
('admin', 'mnSuratPeringatanPinjaman', '1', '1', '1'),
('admin', 'mnPengembalianJaminanPinjaman', '1', '1', '1'),
('admin', 'GCS2', '0', '0', '0'),
('admin', 'mnSimpanan', '1', '1', '1'),
('admin', 'mnSimpananBerjangka', '1', '1', '1'),
('admin', 'mnSimpananRencana', '1', '1', '1'),
('admin', 'mnFrontOffice', '0', '0', '0'),
('admin', 'mnKas', '0', '0', '0'),
('admin', 'mnKasHarian', '0', '0', '0'),
('admin', 'mnKasAkhir', '0', '0', '0'),
('admin', 'mnKasMasuk', '1', '1', '1'),
('admin', 'mnKasKeluar', '1', '1', '1'),
('admin', 'mnPinjaman1', '0', '0', '0'),
('admin', 'mnPencairanPinjaman', '1', '1', '1'),
('admin', 'mnPenaltiPinjaman', '1', '1', '1'),
('admin', 'mnPenaltiPinjamanKolektifTunai', '1', '1', '1'),
('admin', 'mnSetoranAngsuran', '1', '1', '1'),
('admin', 'mnAngsuranPinjamanKolektif', '0', '0', '0'),
('admin', 'mnAngsuranPinjamanKolektifTunai', '0', '0', '0'),
('admin', 'mnAngsuranPinjamanKolektifBank', '0', '0', '0'),
('admin', 'mnSimpanan1', '0', '0', '0'),
('admin', 'mnPemindahbukuanSimpanan', '1', '1', '1'),
('admin', 'mnPenutupanSimpanan', '1', '1', '1'),
('admin', 'mnSetoranSimpanan', '1', '1', '1'),
('admin', 'mnSetoranSimpananKolektif', '0', '0', '0'),
('admin', 'mnTarikanSimpanan', '1', '1', '1'),
('admin', 'mnTarikanSimpananKolektif', '0', '0', '0'),
('admin', 'mnSimpananBerjangka1', '0', '0', '0'),
('admin', 'mnPencairanSimpananBerjangka', '1', '1', '1'),
('admin', 'mnPenaltiSimpananBerjangka', '1', '1', '1'),
('admin', 'mnSetoranSimpananBerjangka', '1', '1', '1'),
('admin', 'mnPenarikanTitipanDanaAnggota', '1', '1', '1'),
('admin', 'mnPersonalia', '0', '0', '0'),
('admin', 'mnBagian', '1', '1', '1'),
('admin', 'mnJabatan', '1', '1', '1'),
('admin', 'mnHariKerja', '1', '1', '1'),
('admin', 'mnJamKerja', '1', '1', '1'),
('admin', 'mnKaryawan', '1', '1', '1'),
('admin', 'mnKehadiran', '0', '0', '0'),
('admin', 'mnPenggajian', '1', '1', '1'),
('admin', 'mnSettingAccountBonus', '1', '1', '1'),
('admin', 'mnLaporan', '0', '0', '0'),
('admin', 'mnLapAccounting', '0', '0', '0'),
('admin', 'mnDaftarAccount', '0', '0', '0'),
('admin', 'mnDaftarAktivaTetap', '0', '0', '0'),
('admin', 'mnLaporanPenyusutanAktivaTetapBulan', '0', '0', '0'),
('admin', 'mnLaporanPenyusutanAktivaTetap', '0', '0', '0'),
('admin', 'mnDaftarSaldo', '0', '0', '0'),
('admin', 'mnDaftarSaldoGabungan', '0', '0', '0'),
('admin', 'mnLapJurnalUmum', '0', '0', '0'),
('admin', 'mnJurnalPenerimaanKas', '0', '0', '0'),
('admin', 'mnJurnalPengeluaranKas', '0', '0', '0'),
('admin', 'mnBukuBesar', '0', '0', '0'),
('admin', 'mnNeraca', '0', '0', '0'),
('admin', 'mnNeraca1', '0', '0', '0'),
('admin', 'mnNeracaDetail', '0', '0', '0'),
('admin', 'mnNeracaHarian', '0', '0', '0'),
('admin', 'mnNeracaHarianDetail', '0', '0', '0'),
('admin', 'mnNeracaLajur', '0', '0', '0'),
('admin', 'mnNeracaGabungan', '0', '0', '0'),
('admin', 'mnNeracaGabunganDetail', '0', '0', '0'),
('admin', 'mnNeracaKomparatif', '0', '0', '0'),
('admin', 'mnNeracaKomparatifDetail', '0', '0', '0'),
('admin', 'mnNeracaPercobaan', '0', '0', '0'),
('admin', 'mnLampiranNeraca', '0', '0', '0'),
('admin', 'mnLaporanLabaRugi1', '0', '0', '0'),
('admin', 'mnLaporanLabaRugi', '0', '0', '0'),
('admin', 'mnLaporanLabaRugiDetail', '0', '0', '0'),
('admin', 'mnLaporanLabaRugiDetailTahun', '0', '0', '0'),
('admin', 'mnLaporanLabaRugiKomparatifDetail', '0', '0', '0'),
('admin', 'mnLaporanLabaRugiGabungan', '0', '0', '0'),
('admin', 'mnLaporanLabaRugiGabunganDetail', '0', '0', '0'),
('admin', 'mnLaporanLabaRugiGabunganDetailTahun', '0', '0', '0'),
('admin', 'mnAnalisisLaporanKeuangan', '0', '0', '0'),
('admin', 'mnAnalisisUsaha', '0', '0', '0'),
('admin', 'mnLaporanNIM', '0', '0', '0'),
('admin', 'mnPenilaianKesehatanKoperasiSimpanPinjam', '0', '0', '0'),
('admin', 'mnBukuKasHarian', '0', '0', '0'),
('admin', 'mnBukuKasUmum', '0', '0', '0'),
('admin', 'mnBukuBantuPenerimaan', '0', '0', '0'),
('admin', 'mnBukuBantuPengeluaran', '0', '0', '0'),
('admin', 'mnLaporanArusKas', '0', '0', '0'),
('admin', 'mnLaporanArusKasDetail', '0', '0', '0'),
('admin', 'mnLaporanTransaksiKasNonSimpananPinjaman', '0', '0', '0'),
('admin', 'mnRencanaRealisasiBudgetAnggaran', '0', '0', '0'),
('admin', 'mnLaporanAccrualBagiHasilPinjaman', '0', '0', '0'),
('admin', 'mnLaporanAccrualBagiHasilSimpananBerjangka', '0', '0', '0'),
('admin', 'mnLapCustomerService', '0', '0', '0'),
('admin', 'mnLapAnggota', '0', '0', '0'),
('admin', 'mnDaftarAnggota', '0', '0', '0'),
('admin', 'mnDaftarNonAnggota', '0', '0', '0'),
('admin', 'mnDaftarPengawas', '0', '0', '0'),
('admin', 'mnDaftarPengurus', '0', '0', '0'),
('admin', 'mnKartuAnggota', '0', '0', '0'),
('admin', 'mnLaporanPenarikanDanaTitipanAnggota', '0', '0', '0'),
('admin', 'mnLaporanSimpananPinjamanAnggota', '0', '0', '0'),
('admin', 'mnLaporanSimpananPinjamanAnggotaDetail', '0', '0', '0'),
('admin', 'mnCetakQRCodeNoSimpanan', '0', '0', '0'),
('admin', 'mnLapPinjaman', '0', '0', '0'),
('admin', 'mnDaftarPinjaman', '0', '0', '0'),
('admin', 'mnKartuPinjaman', '0', '0', '0'),
('admin', 'mnKartuPinjaman2', '0', '0', '0'),
('admin', 'mnLaporanAngsuranPinjaman', '0', '0', '0'),
('admin', 'mnLaporanAngsuranPinjamanDetail', '0', '0', '0'),
('admin', 'mnLaporanKolektibilitas', '0', '0', '0'),
('admin', 'mnLaporanMutasiPinjaman', '0', '0', '0'),
('admin', 'mnLapNominatifPinjaman', '0', '0', '0'),
('admin', 'mnLapNominatifPinjaman2', '0', '0', '0'),
('admin', 'mnLaporanNominatifPinjamanJaminan', '0', '0', '0'),
('admin', 'mnLaporanNominatifPinjamanDenda', '0', '0', '0'),
('admin', 'mnLaporanPinjamanCustom', '0', '0', '0'),
('admin', 'mnLaporanPinjamanJatuhTempo', '0', '0', '0'),
('admin', 'mnLapPinjamanLunas', '0', '0', '0'),
('admin', 'mnLaporanPendapatanBagiHasilPinjaman', '0', '0', '0'),
('admin', 'mnLaporanPengembalianJaminan', '0', '0', '0'),
('admin', 'mnLapProposalPinjaman', '0', '0', '0'),
('admin', 'mnProposalPenaltiPinjaman', '0', '0', '0'),
('admin', 'mnTabelAngsuranPinjaman', '0', '0', '0'),
('admin', 'mnTabelAngsuranPinjamanKosong', '0', '0', '0'),
('admin', 'mnTransaksiPinjaman', '0', '0', '0'),
('admin', 'mnRekapitulasiPinjaman', '0', '0', '0'),
('admin', 'mnRekapitulasiPinjamanSektor', '0', '0', '0'),
('admin', 'mnRekapitulasiPendapatanBagiHasilPinjaman', '0', '0', '0'),
('admin', 'mnLaporanRekapNominatifPinjamanProduk', '0', '0', '0'),
('admin', 'mnLaporanRekapNominatifPinjamanMarketing', '0', '0', '0'),
('admin', 'mnSuratPerjanjianPinjaman', '0', '0', '0'),
('admin', 'mnSuratKuasa', '0', '0', '0'),
('admin', 'mnSuratPernyataan', '0', '0', '0'),
('admin', 'mnTandaTerimajaminan', '0', '0', '0'),
('admin', 'mnLapSimpanan', '0', '0', '0'),
('admin', 'mnKartuSimpanan', '0', '0', '0'),
('admin', 'mnDepan', '0', '0', '0'),
('admin', 'mnBelakang', '0', '0', '0'),
('admin', 'mnBagianBelakangDataAnggota', '0', '0', '0'),
('admin', 'mnCetakRekeningKoran', '0', '0', '0'),
('admin', 'mnTransaksiSimpanan', '0', '0', '0'),
('admin', 'mnDaftarSimpanan', '0', '0', '0'),
('admin', 'mnMutasiBulananSimpanan', '0', '0', '0'),
('admin', 'mnMutasiHarianSimpanan', '0', '0', '0'),
('admin', 'mnLaporanBagiHasilSimpanan', '0', '0', '0'),
('admin', 'mnLapNominatifSimpanan', '0', '0', '0'),
('admin', 'mnLaporanNominatifSimpananDetail', '0', '0', '0'),
('admin', 'mnLaporanSaldoSimpanan', '0', '0', '0'),
('admin', 'mnLaporanSimpananBaru', '0', '0', '0'),
('admin', 'mnLaporanPenutupanSimpanan', '0', '0', '0'),
('admin', 'mnLaporanTunggakanSetoranSimpananWajib', '0', '0', '0'),
('admin', 'mnRekapitulasiProdukSimpanan', '0', '0', '0'),
('admin', 'mnRekapitulasiSimpananGrafik', '0', '0', '0'),
('admin', 'mnRekapitulasiPengeluaranBagiHasilSimpanan', '0', '0', '0'),
('admin', 'mnLapSimpananBerjangka', '0', '0', '0'),
('admin', 'mnDaftarSimpananBerjangka', '0', '0', '0'),
('admin', 'mnBilyetSimpananBerjangka', '0', '0', '0'),
('admin', 'mnKartuSimpananBerjangka', '0', '0', '0'),
('admin', 'mnKonfirmasi', '0', '0', '0'),
('admin', 'mnLaporanSimpananBerjangkaBaru', '0', '0', '0'),
('admin', 'mnLaporanPencairanSimpananBerjangka', '0', '0', '0'),
('admin', 'mnLaporanBagiHasilSimpananBerjangka', '0', '0', '0'),
('admin', 'mnLaporanPostingBagiHasilSimpananBerjangka', '0', '0', '0'),
('admin', 'mnLaporanNominatifSimpananBerjangka', '0', '0', '0'),
('admin', 'mnSimpananBerjangkaJatuhtempo', '0', '0', '0'),
('admin', 'mnRekapitulasiPengeluaranBagiHasilSimpananBerjangka', '0', '0', '0'),
('admin', 'mnLapFrontOffice', '0', '0', '0'),
('admin', 'mnCetakTransaksiSimpanan', '0', '0', '0'),
('admin', 'mnLaporanTransaksiKas', '0', '0', '0'),
('admin', 'mnLapMarketing', '0', '0', '0'),
('admin', 'mnDaftarMarketing', '0', '0', '0'),
('admin', 'mnLaporanAngsuranPinjamanMarketing', '0', '0', '0'),
('admin', 'mnLaporanAngsuranPinjamanMarketingDetail', '0', '0', '0'),
('admin', 'mnLaporanInsentifMarketing', '0', '0', '0'),
('admin', 'mnLaporanInsentifMarketingAngsuranPinjaman', '0', '0', '0'),
('admin', 'mnLaporanPinjaman', '0', '0', '0'),
('admin', 'mnLaporanTagihanMarketing', '0', '0', '0'),
('admin', 'mnLaporanTagihanMarketingDetail', '0', '0', '0'),
('admin', 'mnLaporanTagihanMarketingStatus', '0', '0', '0'),
('admin', 'mnLaporanSimpananMarketing', '0', '0', '0'),
('admin', 'mnLaporanTransaksiSimpananMarketing', '0', '0', '0'),
('admin', 'mnLaporanTransaksiSimpananMarketingDetail', '0', '0', '0'),
('admin', 'mnLaporanNPLMarketing', '0', '0', '0'),
('admin', 'mnRekapitulasiPinjamanMarketing', '0', '0', '0'),
('admin', 'mnLapPersonalia', '0', '0', '0'),
('admin', 'mnDaftarKaryawan', '0', '0', '0'),
('admin', 'mnLaporanGajiKaryawan', '0', '0', '0'),
('admin', 'mnLaporanKehadiranKaryawan', '0', '0', '0'),
('admin', 'mnSSP', '0', '0', '0'),
('admin', 'mnSPTMasa', '0', '0', '0'),
('admin', 'mnForm1721', '0', '0', '0'),
('admin', 'mnForm1721A', '0', '0', '0'),
('admin', 'mnForm1721A1', '0', '0', '0'),
('admin', 'mnForm1721I', '0', '0', '0'),
('admin', 'mnForm1721II', '0', '0', '0'),
('admin', 'mnForm1721T', '0', '0', '0'),
('admin', 'mnLaporanCustom', '1', '1', '1'),
('admin', 'mnTools', '0', '0', '0'),
('admin', 'mnKoreksiSaldoAkhirSimpanan', '0', '0', '0'),
('admin', 'mnPostingBungaSimpanan', '0', '0', '0'),
('admin', 'mnPostingBungaSimpananBerjangka', '0', '0', '0'),
('admin', 'mnPostingBungaPinjamanRekeningKoran', '0', '0', '0'),
('admin', 'mnPostingJurnalAccrual', '0', '0', '0'),
('admin', 'mnSMS', '1', '1', '1'),
('admin', 'mnLaporanPerubahanEkuitas', '1', '1', '1'),
('admin', 'mnLapNominatifPinjamanJaminan', '1', '1', '1'),
('admin', 'mnTunggakanPinjaman', '1', '1', '1'),
('admin', 'mnParkir', '1', '1', '1'),
('admin', 'mnJenisTarif', '1', '1', '1'),
('admin', 'mnTarifPerJam', '1', '1', '1'),
('admin', 'mnGerbang', '1', '1', '1'),
('admin', 'mnParkAnggota', '1', '1', '1'),
('admin', 'mnParkirBulanan', '1', '1', '1'),
('admin', 'mnGerbangMasuk', '1', '1', '1'),
('admin', 'mnGerbangKeluar', '1', '1', '1'),
('admin', 'mnLapParkir', '1', '1', '1'),
('admin', 'mnLaporanParkirKendaraan', '1', '1', '1'),
('admin', 'mnLaporanPersentasePencapaianAngsuranHarian', '1', '1', '1'),
('admin', 'mnLaporanPersentasePencapaianAngsuranMingguan', '1', '1', '1'),
('admin', 'mnLaporanPersentasePencapaianAngsuranBulanan', '1', '1', '1'),
('admin', 'mnPasalKartuSimpanan', '1', '1', '1'),
('admin', 'mnPasalSuratPerjanjianPinjaman', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `userdetail2`
--

CREATE TABLE IF NOT EXISTS `userdetail2` (
  `id` varchar(30) NOT NULL,
  `menu` varchar(100) NOT NULL,
  `tambah` char(1) NOT NULL,
  `edit` char(1) NOT NULL,
  `hapus` char(1) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userdetail3`
--

CREATE TABLE IF NOT EXISTS `userdetail3` (
  `id` varchar(30) NOT NULL,
  `menu` varchar(100) NOT NULL,
  `tambah` char(1) NOT NULL,
  `edit` char(1) NOT NULL,
  `hapus` char(1) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `variabel`
--

CREATE TABLE IF NOT EXISTS `variabel` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `keterangan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `variabel`
--

INSERT INTO `variabel` (`id`, `keterangan`) VALUES
('accgaji', '970-01'),
('accmodalcadangan', '800-05'),
('accmodaldonasi', '800-06'),
('accparkir', '940-02'),
('accpembulatan', '940-02'),
('ayangsuran', '0'),
('aybalamat', '1200'),
('aybanggota', '900'),
('aybangsuranbunga', '2400'),
('aybangsuranke', '1800'),
('aybangsuranpokok', '2100'),
('aybbunga', '600'),
('aybdenda', '2700'),
('aybjatuhtempo', '1500'),
('aybjumlah', '3000'),
('aybnopinjaman', '300'),
('aybtanggal', '3600'),
('aybterbilang', '3300'),
('aykalamat', '300'),
('aykanggota', '300'),
('aykangsuranbunga', '300'),
('aykangsuranke', '300'),
('aykangsuranpokok', '300'),
('aykbunga', '300'),
('aykdenda', '300'),
('aykjatuhtempo', '300'),
('aykjumlah', '300'),
('ayknopinjaman', '300'),
('ayktanggal', '300'),
('aykterbilang', '300'),
('balamat', '540'),
('balamatanggota', '0'),
('balassmsangsuran', 'Angsuran ke-<<Angsuran Ke>> Rp. <<Sisa Pinjaman>>\r\nExpired Tgl. <<Tanggal>>'),
('balassmsceksaldo', 'Saldo Akhir No. Simpanan : <<No. Simpanan>>\r\nRp. <<Saldo>>'),
('balassmspenalti', 'Rp. <<Sisa Pinjaman>>\r\nExpired Tgl. <<Tanggal>>'),
('balassmspinjaman', 'Angsuran : <<Jumlah Angsuran>> x\r\nSisa : <<Sisa Angsuran>> x\r\nTunggakan : <<Tunggakan>>'),
('balassmssetor1', 'Tgl. <<Tanggal>> Rp. <<Saldo>>'),
('balassmssetor2', 'No. Simpanan : <<No. Simpanan>>\r\nBelum pernah melakukan Setoran Simpanan'),
('balassmstransfer', 'Transfer Berhasil No. Simpanan : <<No. Simpanan>>\r\nke No. Simpanan : <<No. Simpanan Tujuan>>\r\nRp. <<Nominal>>'),
('banggota', '0'),
('bangsuran', '0'),
('bankkeluar', 'TB'),
('bankmasuk', 'TB'),
('baris1', '20'),
('baris2', '20'),
('barisstruk', '10'),
('bbunga', '0'),
('biayasmsangsuran', '500'),
('biayasmsceksaldo', '500'),
('biayasmspenalti', '500'),
('biayasmspinjaman', '500'),
('biayasmssetor', '500'),
('biayasmstransfer', '500'),
('biayatutup', '931-01'),
('bjaminan', '0'),
('bjangkawaktu', '0'),
('bjatuhtempo', '0'),
('bjenis', '0'),
('bnama', '270'),
('bnoanggota', '0'),
('bnopinjaman', '0'),
('bnorekening', '0'),
('bonuspendapatan', '10'),
('bpejabat', '0'),
('bplafon', '0'),
('bproduk', '0'),
('bsatuan', '0'),
('btglpinjam', '0'),
('btgltabungan', '0'),
('btotalpinjaman', '0'),
('depositojatuhtempo', '0'),
('editaccount', '0'),
('editbiaya', '0'),
('formatcetak', '1'),
('formatcetakkartu', '1'),
('formatfooter', '1'),
('formatnoanggota', 'Y2M2X3'),
('formatnodeposito', 'P2.Y2M2X4'),
('formatnomor', '1'),
('formatnopinjaman', 'P2.Y2M2X4'),
('formatnorekening', 'P2.Y2M2X4'),
('formatsmsangsuran', 'ANGSURAN <<No. Pinjaman>>'),
('formatsmsceksaldo', 'SALDO <<No. Simpanan>>'),
('formatsmspenalti', 'PENALTI <<No. Pinjaman>>'),
('formatsmspinjaman', 'PINJAMAN <<No. Pinjaman>>'),
('formatsmssetor', 'SETOR <<No. Simpanan>>'),
('formatsmstransfer', 'TRANSFER <<No. Simpanan Asal>> <<No. Simpanan Tujuan>> <<Nominal Transfer>> <<PIN>>'),
('gjenissimpanan', '3'),
('gkodetarikan', '02'),
('gkodetarikanid', 'ADMN20090714-202825'),
('gkoreksidebet', '01'),
('gkoreksidebetid', 'ADMN20090714-202808'),
('hari', '365'),
('harilibur', '1'),
('hitungtunggakanpokok', '1'),
('isiibu', '0'),
('isiktp', '0'),
('jarak1', '1040'),
('jarak2', '0'),
('jatuhtempolibur', '0'),
('jbaris1', '24'),
('jbaris2', '0'),
('jkolomatas', '4430'),
('jkolomatas2', '0'),
('jkolombunga', '3510'),
('jkolomdenda', '5130'),
('jkolomid', '10080'),
('jkolomjumlah', '6750'),
('jkolompokok', '1890'),
('jkolomsisa', '8370'),
('jkolomswp', '0'),
('jkolomtanggal', '720'),
('jkolomtinggi', '460'),
('kalamat', '1710'),
('kalamatanggota', '0'),
('kanggota', '0'),
('kangsuran', '0'),
('kartudepan', '1'),
('kas', '100-01'),
('kasharian', '1'),
('kaskecil', '100-02'),
('kaskeluar', 'TK'),
('kasmasuk', 'TK'),
('kataanggota', 'Anggota'),
('katabunga', 'Bagi Hasil'),
('katakantor', 'Kantor'),
('katamarketing', 'Marketing'),
('katanonanggota', 'Non Anggota'),
('kbunga', '0'),
('kenlysisapinjaman', '1'),
('ketsisapinjaman', '1'),
('kjaminan', '0'),
('kjangkawaktu', '0'),
('kjatuhtempo', '0'),
('kjenis', '0'),
('knama', '1710'),
('knoanggota', '0'),
('knopinjaman', '0'),
('knorekening', '1710'),
('kode', NULL),
('kodekredit', 'ADMN20090930-135421'),
('kolomdebet', '3470'),
('kolomid', '10490'),
('kolomkode', '2390'),
('kolomkredit', '5720'),
('kolomnomor', '-1000'),
('kolomsaldo', '7970'),
('kolomtanggal', '1130'),
('koreksikredit', 'ADMN20090714-202825'),
('kpejabat', '0'),
('kplafon', '0'),
('kproduk', '0'),
('ksatuan', '0'),
('ktglpinjam', '0'),
('ktgltabungan', '0'),
('ktotalpinjaman', '0'),
('lebarlogo', '1350'),
('minggu', '52'),
('neracalajurminus', '1'),
('noanggota', '1'),
('nobukti', '0'),
('nodeposito', '1'),
('nojurnal', '1'),
('nopinjaman', '1'),
('norekening', '1'),
('panjanglogo', '1350'),
('pembulatan', '100'),
('penyisihankredit', '160-01'),
('pinjaman2', '1'),
('pinjamanjatuhtempo', '0'),
('port', '4'),
('saldobank', '1'),
('shu', '800-01'),
('shuanggota', '40'),
('tbendahara', '1'),
('terlambatminustoleransi', '1'),
('tinggi', '360'),
('titipan', '500-12'),
('tsekretaris', '1'),
('ttdbuktikas', '1'),
('tunggakanpinjaman', '1'),
('ukuranfoto', '25000'),
('ukurantransaksisimpanan', '8'),
('validasiatas', '500'),
('validasikiri', '500'),
('versi', '1.0.048-94');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
