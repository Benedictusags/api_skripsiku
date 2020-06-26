-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2020 at 12:40 PM
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
  `komen` varchar(100) DEFAULT NULL,
  `submit_date` varchar(100) DEFAULT NULL,
  `status_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `komen` varchar(100) DEFAULT NULL,
  `submit_date` varchar(100) DEFAULT NULL,
  `status_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman_tempat`
--

INSERT INTO `peminjaman_tempat` (`id`, `user`, `acara`, `tanggal_mulai`, `tanggal_selesai`, `nama_tempat`, `status`, `komen`, `submit_date`, `status_date`) VALUES
(1, 'hmpssi', 'Test Progdi', '2020-06-23T14:52:14.966Z', '2020-06-23T14:52:14.966Z', 'Lapangan Albertus', 'Approved', '', '2020-06-23T14:52:24.445Z', '2020-06-23T14:57:39.398Z');

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
  `aprf` varchar(100) DEFAULT NULL,
  `aprp` varchar(100) DEFAULT NULL,
  `komenf` varchar(100) DEFAULT NULL,
  `komenp` varchar(100) DEFAULT NULL,
  `Lpj` varchar(100) DEFAULT NULL,
  `submit_date` varchar(100) DEFAULT NULL,
  `aprf_date` varchar(100) DEFAULT NULL,
  `aprp_date` varchar(100) DEFAULT NULL,
  `lpj_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`ID`, `judul_acara`, `tanggal_mulai`, `tanggal_selesai`, `dikampus`, `tempat`, `anggaran`, `file`, `user`, `aprf`, `aprp`, `komenf`, `komenp`, `Lpj`, `submit_date`, `aprf_date`, `aprp_date`, `lpj_date`) VALUES
(1, 'Test Progdi', '2020-06-23T03:00:00.763Z', '2020-06-23T09:00:00.763Z', 1, 'Sporthall Unika', '10000000', 'C:fakepathBimbingan1.docx', 'hmpssi', 'Approved', '', '8500000', '', '', '2020-06-23T14:51:00.416Z', '2020-06-23T14:51:45.566Z', '', ''),
(2, 'Test Lagi Kak', '2020-06-25T11:55:54.607Z', '2020-06-25T11:55:54.607Z', 1, 'Disana', 'Rp. 10,000,000', 'C:fakepathBimbingan1.docx', 'hmpssi', 'Rejected', '', 'asdasfasdgasgafhdfshsdgsjrgsrgsrg', '', '', '2020-06-25T11:57:04.927Z', '2020-06-25T14:31:44.391Z', '', '');

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
(1, 'Lapangan Albertus', 'Buat futsal, apel, manggung, tawur', 'Tersedia'),
(2, 'Sporthall', 'Buat basket, wisuda, manggung, tawur', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `kode_user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `user`, `kode_user`) VALUES
(1, 'adeanbenedictus@gmail.com', '12345678', 'admin_progdi.si', 'progdi.si'),
(2, 'adeanbenedictus@gmail.com', '12345678', 'hmpssi', 'progdi.si'),
(3, 'adeanbenedictus@gmail.com', '12345678', 'admin_progdi.ti', 'progdi.ti'),
(4, 'adeanbenedictus@gmail.com', '12345678', 'hmti', 'progdi.ti'),
(5, 'adeanbenedictus@gmail.com', '12345678', 'admin_ikom', 'fakultas.ikom'),
(6, 'adeanbenedictus@gmail.com', '12345678', 'bem_ikom', 'fakultas.ikom'),
(7, 'adeanbenedictus@gmail.com', '12345678', 'senat_ikom', 'fakultas.ikom'),
(8, 'adeanbenedictus@gmail.com', '12345678', 'admin_universitas', 'universitas.unika'),
(9, 'adeanbenedictus@gmail.com', '12345678', 'bem_universitas', 'universitas.unika'),
(10, 'adeanbenedictus@gmail.com', '12345678', 'senat_universitas', 'universitas.unika'),
(11, 'adeanbenedictus@gmail.com', '12345678', 'unit_peminjaman_tempat', 'upt'),
(12, 'adeanbenedictus@gmail.com', '12345678', 'biro_administrasi_umum', 'bau'),
(13, 'adeanbenedictus@gmail.com', '12345678', 'admin_fad', 'fakultas.fad'),
(14, 'adeanbenedictus@gmail.com', '12345678', 'bem_fad', 'fakultas.fad');

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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjaman_barang`
--
ALTER TABLE `peminjaman_barang`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjaman_tempat`
--
ALTER TABLE `peminjaman_tempat`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tempat`
--
ALTER TABLE `tempat`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
