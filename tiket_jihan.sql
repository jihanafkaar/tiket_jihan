-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2025 at 02:35 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiket_jihan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `name`, `password`, `created_at`) VALUES
(1, 'afkaarjihan@gmail.com', 'jihan', '$2y$10$llZUM0nFM44ShjvDG4jgtu.hObXI/NMpta7qM9pNlTQjD1u9Gt/Pq', '2025-02-15 07:51:06'),
(3, 'afkaarjihan@gmail.com', 'jihan', '$2y$10$ZCnud6yYs0K9H4j0.Tw9juD/Ajg4jJhQ8yPY2tVUcmhBpsYaqp.Jq', '2025-02-21 06:38:44'),
(4, 'afkaarjihan@gmail.com', 'jihan', '$2y$10$jCr82nYyXqUqnIExxQr0begjzZ.lOW.rdGWo2coYlp2/CyyZKvcpq', '2025-02-21 07:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `akun_mall`
--

CREATE TABLE `akun_mall` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(231) NOT NULL,
  `nama_mall` varchar(231) NOT NULL,
  `nik` varchar(231) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun_mall`
--

INSERT INTO `akun_mall` (`id`, `email`, `password`, `nama_mall`, `nik`) VALUES
(4, 'afkaarjihan@gmail.com', '123', 'Depok Town Square', ''),
(5, 'afkaarjihan@gmail.com', '123', 'Depok Town Square', '');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `banner` varchar(231) NOT NULL,
  `trailer` varchar(231) NOT NULL,
  `nama_film` varchar(231) NOT NULL,
  `judul` longtext NOT NULL,
  `total_menit` varchar(231) NOT NULL,
  `usia` varchar(231) NOT NULL,
  `genre` varchar(231) NOT NULL,
  `dimensi` varchar(231) NOT NULL,
  `Producer` varchar(231) NOT NULL,
  `Director` varchar(231) NOT NULL,
  `Writer` varchar(231) NOT NULL,
  `Cast` varchar(231) NOT NULL,
  `Distributor` varchar(231) NOT NULL,
  `harga` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `poster`, `banner`, `trailer`, `nama_film`, `judul`, `total_menit`, `usia`, `genre`, `dimensi`, `Producer`, `Director`, `Writer`, `Cast`, `Distributor`, `harga`) VALUES
(15, 'uploads/poster/Nokta Merah Perkawinan.jpg', 'uploads/banner/noktah.jpeg', 'uploads/trailer/WhatsApp Video 2025-02-25 at 12.00.07.mp4', 'Noktah Merah Perkawinan', 'Film ini mengisahkan tentang pasangan suami istri yang menghadapi krisis dalam pernikahan mereka ketika hadirnya orang ketiga, memicu konflik emosional yang mendalam.', '120', '17', 'Drama,Romance', '3D', ' Robert Ronny ', 'Sabrina Rochelle Kalangie', 'Titien Wattimena', 'Marsha Timothy, Oka Antara, Sheila Dara Aisha, Ayu Azhari, Nungki Kusumastuti', 'Netflix, Rapi Films', '35000'),
(18, 'uploads/poster/Terima Kasih Emak Terima Kasih Abah (2020).jpg', 'uploads/banner/terimakasih.jpeg', 'uploads/trailer/WhatsApp Video 2025-02-25 at 08.39.50.mp4', 'Terima Kasih Emak Terima Kasih Abah', 'Terima Kasih Emak, Terima Kasih Abah adalah film drama keluarga yang mengisahkan perjuangan seorang ibu dan ayah dalam membesarkan anak-anak mereka', '107', '13', 'Drama,Family', '2D', ' FX Rudy Gunawan dan Imran Hasibuan.', 'Dedy Mizwar', 'Dedy Arliansyah Siregar', 'Adhisty Zara, Cut Mini, Indro Warkop, Widuri Puteri, Zulfa Maharani.', 'DDM Entertainment', '30000');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_film`
--

CREATE TABLE `jadwal_film` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `studio` varchar(231) NOT NULL,
  `jam_tayang_1` time NOT NULL,
  `jam_tayang_2` time NOT NULL,
  `jam_tayang_3` time NOT NULL,
  `tanggal_tayang` date NOT NULL,
  `tanggal_akhir_tayang` date NOT NULL,
  `total_menit` varchar(231) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_film`
--

INSERT INTO `jadwal_film` (`id`, `mall_id`, `film_id`, `studio`, `jam_tayang_1`, `jam_tayang_2`, `jam_tayang_3`, `tanggal_tayang`, `tanggal_akhir_tayang`, `total_menit`) VALUES
(6, 4, 15, 'Studio 1', '09:00:00', '11:00:00', '13:00:00', '2025-02-24', '2025-04-25', '120'),
(8, 4, 18, 'Studio 1', '09:00:00', '12:00:00', '15:00:00', '2025-04-25', '2025-05-25', '107');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `mall_name` varchar(255) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `status` enum('available','occupled') NOT NULL,
  `film_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `mall_name`, `seat_number`, `status`, `film_name`) VALUES
(8, 'Depok Town Square', 'A1', '', 'Noktah Merah Perkawinan'),
(9, 'Depok Town Square', 'A2', '', 'Noktah Merah Perkawinan');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `transaction_time` datetime NOT NULL,
  `username` varchar(250) NOT NULL,
  `seat_number` varchar(250) NOT NULL,
  `nama_film` varchar(231) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `status`, `payment_type`, `amount`, `transaction_time`, `username`, `seat_number`, `nama_film`) VALUES
(4, 'TIX-1740495180', 'settlement', 'qris', 35000, '2025-02-25 21:53:03', 'afkaarjihan@gmail.com', 'A1', 'Noktah Merah Perkawinan'),
(5, 'TIX-1740495222', 'settlement', 'qris', 35000, '2025-02-25 21:53:45', 'afkaarjihan@gmail.com', 'A2', 'Noktah Merah Perkawinan');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `created_at`) VALUES
(2, 'veeltzee23@gmail.com', 'bayu', '$2y$10$PggPmTWAIclz4YypKox/M.zrHUVQE5qLIATMUTr2T4WF/FQLByosG', '2025-02-14 06:02:59'),
(3, 'afkaarjihan@gmail.com', 'jihan', '$2y$10$wSeZ950jHSur4V4pE/dbLu/WwGD9rM8dHZ.30zaNDFumXLSLvYimC', '2025-02-15 04:01:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akun_mall`
--
ALTER TABLE `akun_mall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_film`
--
ALTER TABLE `jadwal_film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `akun_mall`
--
ALTER TABLE `akun_mall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jadwal_film`
--
ALTER TABLE `jadwal_film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
