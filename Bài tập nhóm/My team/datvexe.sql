-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2025 at 11:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datvexe`
--

-- --------------------------------------------------------

--
-- Table structure for table `chuyenxe`
--

CREATE TABLE `chuyenxe` (
  `id` int(11) NOT NULL,
  `tu_noi` int(11) DEFAULT NULL,
  `den_noi` int(11) DEFAULT NULL,
  `gio_khoi_hanh` datetime DEFAULT NULL,
  `gia` decimal(10,2) DEFAULT NULL,
  `so_cho` int(11) DEFAULT NULL,
  `bien_so_xe` varchar(20) DEFAULT NULL,
  `nhaxe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chuyenxe`
--

INSERT INTO `chuyenxe` (`id`, `tu_noi`, `den_noi`, `gio_khoi_hanh`, `gia`, `so_cho`, `bien_so_xe`, `nhaxe_id`) VALUES
(1, 1, 2, '2025-08-02 08:00:00', 120000.00, 38, '29A-12345', 1),
(2, 3, 4, '2025-08-03 22:00:00', 250000.00, 44, '51B-67890', 2),
(3, 5, 6, '2025-08-04 10:30:00', 100000.00, 30, '43C-11223', 1),
(4, 1, 7, '2025-08-05 07:00:00', 180000.00, 32, '29B-55667', 3),
(5, 8, 3, '2025-08-06 15:30:00', 200000.00, 50, '65A-99999', 4),
(6, 6, 5, '2025-08-07 09:00:00', 90000.00, 25, '75C-33445', 3),
(7, 3, 9, '2025-08-08 22:00:00', 220000.00, 39, '51F-88888', 2),
(8, 2, 10, '2025-08-09 13:30:00', 150000.00, 30, '15B-44556', 1),
(9, 11, 12, '2025-08-10 14:00:00', 170000.00, 38, '61A-77665', 2),
(10, 13, 14, '2025-08-11 06:00:00', 195000.00, 35, '47C-88990', 4),
(11, 15, 16, '2025-08-12 17:30:00', 160000.00, 29, '99A-11223', 1),
(12, 3, 6, '2025-08-01 09:30:00', 190000.00, 40, '36C-23942', 3),
(13, 3, 6, '2025-08-05 09:30:00', 290000.00, 0, '51C-23924', 2),
(15, 15, 21, '2025-08-15 12:30:00', 300000.00, 38, '43C-83861', 5);

-- --------------------------------------------------------

--
-- Table structure for table `datxe`
--

CREATE TABLE `datxe` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chuyenxe_id` int(11) DEFAULT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `ngay_dat` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `datxe`
--

INSERT INTO `datxe` (`id`, `user_id`, `chuyenxe_id`, `so_luong`, `ngay_dat`) VALUES
(1, 1, 1, 2, '2025-08-01 14:09:19'),
(2, 2, 2, 1, '2025-08-01 14:09:19'),
(3, 1, 3, 3, '2025-08-01 14:09:19'),
(4, 3, 4, 1, '2025-08-01 14:09:19'),
(5, 4, 5, 2, '2025-08-01 14:09:19'),
(6, 5, 6, 4, '2025-08-01 14:09:19'),
(7, 6, 7, 2, '2025-08-01 14:09:19'),
(8, 1, 8, 1, '2025-08-01 14:09:19'),
(9, 2, 5, 3, '2025-08-01 14:09:19'),
(10, 3, 6, 2, '2025-08-01 14:09:19'),
(11, 4, 3, 1, '2025-08-01 14:09:19'),
(12, 5, 2, 1, '2025-08-01 14:09:19'),
(13, 6, 1, 1, '2025-08-01 14:09:19'),
(14, 7, 9, 2, '2025-08-01 14:09:19'),
(15, 8, 10, 1, '2025-08-01 14:09:19'),
(16, 9, 11, 3, '2025-08-01 14:09:19'),
(17, 10, 2, 1, '2025-08-01 14:09:19'),
(18, 3, 9, 1, '2025-08-01 14:09:19'),
(19, 13, 1, 2, '2025-08-01 22:24:55'),
(20, 13, 11, 2, '2025-08-01 22:35:57'),
(21, 14, 10, 1, '2025-08-01 22:55:20'),
(22, 13, 4, 1, '2025-08-01 22:58:57'),
(23, 13, 4, 1, '2025-08-02 11:34:45'),
(24, 15, 4, 1, '2025-08-02 11:36:12'),
(25, 13, 2, 1, '2025-08-02 12:21:25'),
(26, 13, 7, 1, '2025-08-02 12:54:54'),
(27, 13, 11, 1, '2025-08-02 14:03:41'),
(28, 18, 15, 1, '2025-08-02 16:09:43'),
(29, 15, 15, 1, '2025-08-02 16:15:08');

-- --------------------------------------------------------

--
-- Table structure for table `diadiem`
--

CREATE TABLE `diadiem` (
  `id` int(11) NOT NULL,
  `ten_tinh` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diadiem`
--

INSERT INTO `diadiem` (`id`, `ten_tinh`) VALUES
(1, 'An Giang'),
(2, 'Bà Rịa - Vũng Tàu'),
(3, 'Bắc Giang'),
(4, 'Bắc Kạn'),
(5, 'Bạc Liêu'),
(6, 'Bắc Ninh'),
(7, 'Bến Tre'),
(8, 'Bình Định'),
(9, 'Bình Dương'),
(10, 'Bình Phước'),
(11, 'Bình Thuận'),
(12, 'Cà Mau'),
(13, 'Cần Thơ'),
(14, 'Cao Bằng'),
(15, 'Đà Nẵng'),
(16, 'Đắk Lắk'),
(17, 'Đắk Nông'),
(18, 'Điện Biên'),
(19, 'Đồng Nai'),
(20, 'Đồng Tháp'),
(21, 'Gia Lai'),
(22, 'Hà Giang'),
(23, 'Hà Nam'),
(24, 'Hà Nội'),
(25, 'Hà Tĩnh'),
(26, 'Hải Dương'),
(27, 'Hải Phòng'),
(28, 'Hậu Giang'),
(29, 'Hòa Bình'),
(30, 'Hưng Yên'),
(31, 'Khánh Hòa'),
(32, 'Kiên Giang'),
(33, 'Kon Tum'),
(34, 'Lai Châu'),
(35, 'Lâm Đồng'),
(36, 'Lạng Sơn'),
(37, 'Lào Cai'),
(38, 'Long An'),
(39, 'Nam Định'),
(40, 'Nghệ An'),
(41, 'Ninh Bình'),
(42, 'Ninh Thuận'),
(43, 'Phú Thọ'),
(44, 'Phú Yên'),
(45, 'Quảng Bình'),
(46, 'Quảng Nam'),
(47, 'Quảng Ngãi'),
(48, 'Quảng Ninh'),
(49, 'Quảng Trị'),
(50, 'Sóc Trăng'),
(51, 'Sơn La'),
(52, 'Tây Ninh'),
(53, 'Thái Bình'),
(54, 'Thái Nguyên'),
(55, 'Thanh Hóa'),
(56, 'Thừa Thiên Huế'),
(57, 'Tiền Giang'),
(58, 'TP. Hồ Chí Minh'),
(59, 'Trà Vinh'),
(60, 'Tuyên Quang'),
(61, 'Vĩnh Long'),
(62, 'Vĩnh Phúc'),
(63, 'Yên Bái');

-- --------------------------------------------------------

--
-- Table structure for table `nhaxe`
--

CREATE TABLE `nhaxe` (
  `id` int(11) NOT NULL,
  `ten_nhaxe` varchar(100) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `sdt` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nhaxe`
--

INSERT INTO `nhaxe` (`id`, `ten_nhaxe`, `dia_chi`, `sdt`) VALUES
(1, 'Nhà xe Hoàng Long', '123 Lê Lợi, Hà Nội', '0988888888'),
(2, 'Nhà xe Phương Trang', '456 Trần Hưng Đạo, TP.HCM', '0977777777'),
(3, 'Nhà xe Mai Linh', '789 Nguyễn Trãi, Đà Nẵng', '0966666666'),
(4, 'Nhà xe Thành Bưởi', '1010 Quang Trung, Cần Thơ', '0955555555'),
(5, 'Nhà xe Hiếu Hoa', '215 Tôn Đức Thắng, Đà Nẵng', '0983866780');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `name_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `name_role`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `role`) VALUES
(1, 'Nguyen Van A', 'a@gmail.com', '123456', '0901234567', 2),
(2, 'Tran Thi B', 'b@gmail.com', 'abcdef', '0912345678', 1),
(3, 'Le Van C', 'c@gmail.com', 'qwerty', '0933456789', 1),
(4, 'Pham Thi D', 'd@gmail.com', 'password', '0944567890', 1),
(5, 'Hoang Van E', 'e@gmail.com', 'letmein', '0955678901', 1),
(6, 'Nguyen Thi F', 'f@gmail.com', '123abc', '0966789012', 1),
(7, 'Do Van G', 'g@gmail.com', '123456', '0901122334', 1),
(8, 'Bui Thi H', 'h@gmail.com', 'abcdef', '0912233445', 1),
(9, 'Ly Van I', 'i@gmail.com', 'zxcvbn', '0923344556', 1),
(10, 'Trịnh Minh Đạt', 'dat@gmail.com', '111111', '0934455667', 1),
(13, 'Lương Văn Võ', 'luongvanvo29@gmail.com', 'voluong', '0865321921', 1),
(14, 'Nguyễn Đặng Bảo Nguyên', 'nguyennguyendangbao8@gmail.com', 'baonguyen', '0392663097', 2),
(15, 'Nguyễn Đặng Bảo Nguyên', 'vohocgioi@gmail.com', 'baonguyen', '0392663097', 1),
(18, 'Nguyễn Quang Anh', 'anh1306@gmail.com', '123456', '0987451422', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chuyenxe`
--
ALTER TABLE `chuyenxe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tu_noi` (`tu_noi`),
  ADD KEY `den_noi` (`den_noi`),
  ADD KEY `nhaxe_id` (`nhaxe_id`);

--
-- Indexes for table `datxe`
--
ALTER TABLE `datxe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `chuyenxe_id` (`chuyenxe_id`);

--
-- Indexes for table `diadiem`
--
ALTER TABLE `diadiem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nhaxe`
--
ALTER TABLE `nhaxe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chuyenxe`
--
ALTER TABLE `chuyenxe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `datxe`
--
ALTER TABLE `datxe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `diadiem`
--
ALTER TABLE `diadiem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `nhaxe`
--
ALTER TABLE `nhaxe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chuyenxe`
--
ALTER TABLE `chuyenxe`
  ADD CONSTRAINT `chuyenxe_diadiem_1` FOREIGN KEY (`tu_noi`) REFERENCES `diadiem` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `chuyenxe_diadiem_2` FOREIGN KEY (`den_noi`) REFERENCES `diadiem` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `chuyenxe_ibfk_3` FOREIGN KEY (`nhaxe_id`) REFERENCES `nhaxe` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `datxe`
--
ALTER TABLE `datxe`
  ADD CONSTRAINT `datxe_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `datxe_ibfk_2` FOREIGN KEY (`chuyenxe_id`) REFERENCES `chuyenxe` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
