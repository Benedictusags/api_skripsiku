-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2020 at 03:54 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsiku`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `QTY` int(100) NOT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`ID`, `nama_barang`, `QTY`, `status`) VALUES
(1, 'Kursi', 80, 'dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_barang`
--

CREATE TABLE `peminjaman_barang` (
  `id` int(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `acara` varchar(100) NOT NULL,
  `tanggal_mulai` varchar(100) NOT NULL,
  `tanggal_selesai` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `QTY` int(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `komen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman_barang`
--

INSERT INTO `peminjaman_barang` (`id`, `user`, `acara`, `tanggal_mulai`, `tanggal_selesai`, `nama_barang`, `QTY`, `status`, `komen`) VALUES
(1, 'hmpssi', 'bambu gila on the road', '1234', '4321', 'undefined', 20, 'pending', ''),
(2, 'BEM', 'bambu gila on the road', '1234', '4321', 'undefined', 20, 'Rejected', 'Mau dipake univ'),
(3, 'hmpssi', 'bambu gila on the road', '1234', '4321', 'undefined', 20, 'pending', ''),
(4, 'Senat', 'Perang Sarung', '1234', '4321', 'undefined', 20, 'pending', ''),
(5, 'Senat', 'Perang Sarung', '1234', '4321', 'undefined', 20, 'pending', ''),
(6, 'Senat', 'Perang Sarung', '1234', '4321', 'undefined', 20, 'pending', ''),
(7, 'Senat', 'Perang Sarung', '1234', '4321', 'kursi', 20, 'pending', '');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_tempat`
--

CREATE TABLE `peminjaman_tempat` (
  `id` int(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `acara` varchar(100) NOT NULL,
  `tanggal_mulai` varchar(100) NOT NULL,
  `tanggal_selesai` varchar(100) NOT NULL,
  `nama_tempat` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `komen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman_tempat`
--

INSERT INTO `peminjaman_tempat` (`id`, `user`, `acara`, `tanggal_mulai`, `tanggal_selesai`, `nama_tempat`, `status`, `komen`) VALUES
(1, 'Senat', 'Perang Sarung', '1234', '4321', 'undefined', 'pending', ''),
(2, 'Senat', 'Perang Sarung', '1234', '4321', 'lapangan', 'Rejected', 'Mau dipake univ');

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `ID` int(11) NOT NULL,
  `judul_acara` varchar(100) NOT NULL,
  `tanggal_mulai` varchar(100) NOT NULL,
  `tanggal_selesai` varchar(100) NOT NULL,
  `dikampus` tinyint(1) NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `anggaran` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `aprf` varchar(100) NOT NULL,
  `aprp` varchar(100) NOT NULL,
  `komenf` varchar(100) DEFAULT NULL,
  `komenp` varchar(100) DEFAULT NULL,
  `Lpj` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`ID`, `judul_acara`, `tanggal_mulai`, `tanggal_selesai`, `dikampus`, `tempat`, `anggaran`, `file`, `user`, `aprf`, `aprp`, `komenf`, `komenp`, `Lpj`) VALUES
(1, 'Dies', '321425', '124124', 1, 'UNIQ', '5000000', 'asu', 'SOPOAKU', 'Approved', 'pending', '5000000', '', 'MANTAP.CO'),
(2, 'Test2', '321425', '124124', 1, 'Luar', '450000', 'oke', 'SOPOAKU', 'Approved', 'undefined', '5000000', 'undefined', 'undefined'),
(3, 'acaraan', '1234', '4321', 1, 'Unika', '300000', 'aaaaa', 'hmpssi', 'Rejected', 'Approved', 'Proposalmu Rakmutu!', '5000000', 'undefined');

-- --------------------------------------------------------

--
-- Table structure for table `tempat`
--

CREATE TABLE `tempat` (
  `id` int(100) NOT NULL,
  `nama_tempat` varchar(100) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tempat`
--

INSERT INTO `tempat` (`id`, `nama_tempat`, `deskripsi`, `status`) VALUES
(1, 'lapang', 'undefined', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `pass`, `user`) VALUES
('adean@skripsi.com', 'adean123', ''),
('farell@gmail.com', '12345678', ''),
('test', 'asd', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `peminjaman_barang`
--
ALTER TABLE `peminjaman_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman_tempat`
--
ALTER TABLE `peminjaman_tempat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tempat`
--
ALTER TABLE `tempat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `peminjaman_barang`
--
ALTER TABLE `peminjaman_barang`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `peminjaman_tempat`
--
ALTER TABLE `peminjaman_tempat`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tempat`
--
ALTER TABLE `tempat`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
