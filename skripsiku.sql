-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2020 at 06:51 AM
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
(1, 'Kursi', 100, 'Ada'),
(2, 'Meja', 100, 'Ya');

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

--
-- Dumping data for table `peminjaman_barang`
--

INSERT INTO `peminjaman_barang` (`id`, `user`, `acara`, `tanggal_mulai`, `tanggal_selesai`, `nama_barang`, `QTY`, `status`, `komen`, `submit_date`, `status_date`) VALUES
(1, 'hmpssi', '', '2020-07-01T14:04:46.070Z', '2020-07-01T14:04:46.070Z', '', 10, 'Approved', '', '2020-07-01T14:04:56.436Z', '2020-07-01T14:13:16.313Z'),
(2, 'hmpssi', '', '2020-07-01T15:14:04.729Z', '2020-07-02T15:14:04.000Z', '', 10, 'Pending', '', '2020-07-01T15:14:19.666Z', '2020-07-01T15:14:19.667Z'),
(3, 'hmpssi', 'Anjay', '2020-07-01T15:24:26.601Z', '2020-07-02T15:24:26.000Z', 'Kursi', 10, 'Approved', '', '2020-07-01T15:24:42.840Z', '2020-07-01T15:26:26.788Z');

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
(1, 'hmpssi', 'Test Progdi', '2020-06-23T14:52:14.966Z', '2020-06-23T14:52:14.966Z', 'Lapangan Albertus', 'Approved', '', '2020-06-23T14:52:24.445Z', '2020-06-23T14:57:39.398Z'),
(2, 'hmpssi', 'Test Progdi', '2020-06-29T01:07:12.892Z', '2020-06-29T01:07:12.893Z', 'Lapangan Albertus', 'Approved', '', '2020-06-29T01:07:31.956Z', '2020-06-29T01:12:52.996Z');

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
(2, 'Test Lagi Kak', '2020-06-25T11:55:54.607Z', '2020-06-25T11:55:54.607Z', 1, 'Disana', 'Rp. 10,000,000', 'C:fakepathBimbingan1.docx', 'hmpssi', 'Rejected', '', 'asdasfasdgasgafhdfshsdgsjrgsrgsrg', '', '', '2020-06-25T11:57:04.927Z', '2020-06-25T14:31:44.391Z', '', ''),
(3, 'Test Prenstasi', '2020-06-29T03:00:00.460Z', '2020-06-29T07:00:00.460Z', 1, 'DIkampis, Lapangan', 'Rp. 10,000,000', 'C:fakepathBimbingan3.docx', 'hmpssi', 'Rejected', '', 'Proposal Kurang', '', '', '2020-06-29T01:05:26.286Z', '2020-06-29T01:10:13.866Z', '', ''),
(4, 'Test Presentasi', '2020-06-29T01:20:37.277Z', '2020-06-29T01:20:37.277Z', 1, 'DIkampus, Sporthall', 'Rp. 1,000,000', 'C:fakepathBimbingan1.docx', 'bem_ikom', 'Approved', 'Approved', '', 'Rp. 10,000,000', '', '2020-06-29T01:21:28.492Z', '2020-06-29T01:26:30.203Z', '2020-06-29T01:29:24.940Z', ''),
(5, 'Anjay', '2020-06-29T01:49:29.449Z', '2020-06-29T01:49:29.449Z', 1, 'ABCD', 'Rp. 12,415,256', 'C:fakepathBimbingan1.docx', 'hmpssi', 'Approved', '', 'Rp. 100,000', '', '', '2020-06-29T01:49:59.281Z', '2020-07-01T15:13:14.977Z', '', ''),
(6, 'Test 2', '2020-09-10T03:30:00.000Z', '2020-09-11T03:30:00.000Z', 1, 'Dikampus, Lapangan albertus', 'Rp. 10,000,000', 'C:fakepathAlur utama aplikasi photo.pdf', 'hmpssi', 'Rejected', '', 'Kurang', '', '', '2020-07-01T03:33:38.291Z', '2020-07-01T03:41:36.369Z', '', ''),
(7, 'Tes BEm', '2020-07-01T03:46:56.916Z', '2020-07-01T03:46:56.916Z', 1, 'Kampus, Auditorium', 'Rp. 1,000,000', 'C:fakepathTI073200.pdf', 'bem_ikom', 'Approved', 'Pending', '', '', '', '2020-07-01T03:47:24.288Z', '2020-07-01T03:48:21.311Z', '2020-07-01T03:47:24.288Z', ''),
(8, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2020-07-01T03:52:49.345Z', '2020-07-01T03:52:49.346Z', 1, 'asdasd', 'Rp. 121,241,251', 'C:fakepath71395214.pdf', 'bem_ikom', 'Pending', 'Pending', '', '', '', '2020-07-01T03:53:31.075Z', '2020-07-01T03:53:31.075Z', '2020-07-01T03:53:31.075Z', ''),
(9, 'Upload File COba', '2020-07-01T12:37:10.048Z', '2020-07-01T12:37:10.048Z', 1, 'adasd', 'Rp. 1,423,525', 'C:fakepathKOMPONEN.PNG', 'hmpssi', 'Pending', '', '', '', '', '2020-07-01T12:51:45.600Z', '2020-07-01T12:51:45.600Z', '', ''),
(10, 'asd', '2020-07-01T12:52:55.573Z', '2020-07-01T12:52:55.573Z', 1, 'asd', 'Rp. 1,234', 'C:fakepath\000293421_1-f19e5a68f2298c21e6546d86e7c100ec.png', 'hmpssi', 'Pending', '', '', '', '', '2020-07-01T12:53:24.322Z', '2020-07-01T12:53:24.322Z', '', ''),
(11, 'z', '2020-07-01T12:55:04.289Z', '2020-07-01T12:55:04.289Z', 1, 'z', 'Rp. 123', '[object Object]', 'hmpssi', 'Pending', '', '', '', '', '2020-07-01T12:56:24.724Z', '2020-07-01T12:56:24.724Z', '', ''),
(12, 'asd', '2020-07-01T12:55:04.289Z', '2020-07-01T12:55:04.289Z', 1, 'asd', 'Rp. 123', '[object Object]', 'hmpssi', 'Pending', '', '', '', '', '2020-07-01T12:57:22.529Z', '2020-07-01T12:57:22.529Z', '', ''),
(13, 'z', '2020-07-01T12:55:04.289Z', '2020-07-01T12:55:04.289Z', 1, 'z', 'Rp. 1', '[object Object]', 'hmpssi', 'Pending', '', '', '', '', '2020-07-01T12:58:27.591Z', '2020-07-01T12:58:27.591Z', '', ''),
(14, 'z', '2020-07-01T12:55:04.289Z', '2020-07-01T12:55:04.289Z', 1, 'z', 'Rp. 123', '[object Object]', 'hmpssi', 'Pending', '', '', '', '', '2020-07-01T13:04:33.739Z', '2020-07-01T13:04:33.739Z', '', ''),
(15, 'z', '2020-07-01T12:55:04.289Z', '2020-07-01T12:55:04.289Z', 1, 'z', 'Rp. 1', '[object Object]', 'hmpssi', 'Pending', '', '', '', '', '2020-07-01T13:06:28.080Z', '2020-07-01T13:06:28.080Z', '', '');

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
(2, 'Sporthall', 'Buat basket, wisuda, manggung, tawur', 'Tersedia'),
(3, 'Kapel', 'Ibadah', 'Ada'),
(4, 'Auditorium', 'Tempat', 'Ada');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `peminjaman_barang`
--
ALTER TABLE `peminjaman_barang`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peminjaman_tempat`
--
ALTER TABLE `peminjaman_tempat`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tempat`
--
ALTER TABLE `tempat`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
