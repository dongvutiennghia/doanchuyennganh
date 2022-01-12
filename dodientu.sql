-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2022 at 07:34 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dodientu`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `product_title` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `qty` int(100) NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`, `visible`) VALUES
(1, 'HP', 1),
(2, 'DELL', 1),
(3, 'LG', 1),
(4, 'Samsung', 1),
(5, 'Sony', 1),
(6, 'Toshiba', 1),
(7, 'Lenovo', 1),
(8, 'Apples', 1),
(21, 'test1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `product_id`, `product_title`, `quantity`, `user_id`) VALUES
(438, 46, 'asd', 4, 30),
(445, 45, 'asd', 5, 31),
(446, 46, 'asd', 11, 31),
(450, 48, 'ád', 7, 31),
(456, 46, 'asd', 7, 39),
(457, 45, 'asd', 2, 39),
(462, 44, 'asd', 9, 34),
(464, 46, 'asd', 1, 34),
(465, 45, 'asd', 1, 34);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `visible`) VALUES
(1, 'Laptops', 1),
(2, 'Cameras', 1),
(3, 'Mobiles', 1),
(4, 'Computers', 1),
(5, 'iPhones', 1),
(20, 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `product_image` text COLLATE utf8_unicode_ci NOT NULL,
  `product_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `views` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `date` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_soluong` tinyint(255) DEFAULT 1,
  `brand_id` int(100) NOT NULL,
  `cat_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`, `views`, `visible`, `date`, `product_soluong`, `brand_id`, `cat_id`) VALUES
(5, 'Desktop Apple', 4000001, 'Màn hình:\r\n\r\n8.7\"TFT LCD<br>\r\nHệ điều hành:\r\n\r\nAndroid 11<br>\r\nRAM:\r\n\r\n3 GB<br>\r\nBộ nhớ trong:\r\n\r\n32 GB<br>\r\nKết nối:\r\n\r\n4GCó nghe gọi<br>\r\nSIM:\r\n\r\n1 Nano SIM<br>\r\nCamera sau:\r\n\r\n8 MP<br>\r\nCamera trước:\r\n\r\n2 MP<br>\r\nPin, Sạc:\r\n\r\n5100 mAh15 W', '8-640-1634396279-967-width640height480.jpg', 'desktop apple,pc,máy tính', 0, 1, 'December 20, 21', 19, 1, 1),
(6, 'Desktop Dell', 10000, 'This is greate product. Finding the right laptop has never been easier', '1634201500-168-thumbnail-width640height480.jpg', 'desktop dell,pa,máy tính', 0, 0, 'December 20, 21', 100, 1, 1),
(8, 'Laptop Apple', 100000, 'This is great product finding the right laptop has never been easier', 'thinkbook13sg2-1.jpg', 'apple laptop,máy tính', 0, 1, '', 19, 1, 2),
(9, 'Apple Tablet', 1000000, 'This is great product finding the right laptop has never been easier.', 'thinkbook13sg2-1.jpg', 'apple laptop,máy tính bảng', 0, 1, '', 19, 1, 2),
(10, 'Camera Canon', 100000, 'This is great product finding the right laptop has never been easier.', 'thinkbook13sg2-1.jpg', 'camera,máy ảnh', 0, 0, '', 20, 2, 2),
(11, 'Desktop Lenovo', 1000000, 'This is great product finding the right laptop has never been easier.', 'thinkbook13sg2-1.jpg', 'desktop lenovo,pc,máy tính,game', 0, 0, '', 20, 4, 3),
(12, 'Laptop Pro HP', 100000, 'This is great product finding the right laptop has never been easier.', 'thinkbook13sg2-1.jpg', 'hp laptop,máy tính ', 0, 0, '', 19, 2, 3),
(13, 'Laptop Dell Gaming G3', 20000002, 'Laptop dell gaming g3 15 3500: Laptop chơi game cao cấp\r\nBạn là một người chuyên đi công tác và vẫn mong muốn có thể sử dụng một chiếc laptop linh hoạt đem theo tiện cho việc chiến game', 'thinkbook13sg2-1.jpg', 'laptop dell,game,máy tính,pc', 0, 0, 'June 27, 21', 10, 4, 4),
(25, 'MacBook Pro 13', 20000000, 'ngon,bổ rẻ', 'thinkbook13sg2-1.jpg', 'apple laptop,code,mac,macbook', 0, 1, 'June 29, 21', 24, 2, 4),
(29, '123', 100, 'asd', '8-640-1634396279-967-width640height480.jpg', 'dsa', 0, 1, '', 1, 3, 2),
(30, '123', 10000, 'asd', '8-640-1634396279-967-width640height480.jpg', 'dsa', 0, 1, '', 1, 3, 2),
(31, 'asd', 1000, 'asd', '8-640-1634396279-967-width640height480.jpg', 'ad', 0, 1, '', 1, 2, 3),
(32, 'asd', 100, 'asd', '1634201500-168-thumbnail-width640height480.jpg', 'ad', 0, 1, '', 20, 1, 2),
(34, 'asd', 1, 'asd', '8-640-1634396279-967-width640height480.jpg', 'asd', 0, 1, '', 10, 1, 1),
(35, 'asd', 1, 'asd', '8-640-1634396279-967-width640height480.jpg', 'asd', 0, 1, '', 10, 1, 1),
(36, 'asd', 1, 'asd', '8-640-1634396279-967-width640height480.jpg', 'asd', 0, 1, '', 10, 1, 1),
(37, '111', 1100, '123', '1634263844-698-thumbnail-width640height480.jpg', '321', 0, 1, 'December 20, 21', 32, 1, 1),
(40, 'ád', 1, 'ad', '1634288267-626-thumbnail-width640height480.jpg', 'a', 0, 1, '', 1, 1, 1),
(41, 'qw', 1, 'sdf', '8-640-1634396279-967-width640height480.jpg', 'asd', 0, 1, NULL, 1, 3, 3),
(43, 'asd', 1, 'asd', '8-640-1634396279-967-width640height480.jpg', 'asd', 0, 1, NULL, 10, 1, 1),
(44, 'asd', 1, 'asd', '1634273411-60-thumbnail-width640height480.jpg', 'asd', 0, 1, NULL, 10, 1, 20),
(45, 'asd', 1, 'asd', '1634397683-183-thumbnail-width640height480.jpg', 'ads', 0, 1, NULL, 10, 21, 1),
(46, 'asd', 10, 'asd', '1634376313-892-thumbnail-width640height480.jpg', 'asd', 0, 1, NULL, 10, 21, 20),
(47, 'tét', 1, 'hello', 'untitled-1-1634272134-504-width640height480.jpg', 'ádasd', 0, 1, NULL, 0, 1, 1),
(48, 'ád', 1, 'ád', '8-640-1634396279-967-width640height480.jpg', 'ád', 0, 1, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` text COLLATE utf8_unicode_ci NOT NULL,
  `user_address` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'guest',
  `visible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `ip_address`, `name`, `email`, `password`, `country`, `city`, `contact`, `user_address`, `image`, `role`, `visible`) VALUES
(14, '127.0.0.1', 'Tien Nghia', 'admin@gmail.com', '750a301a171efe0917a93d2c0c441d8b', NULL, NULL, 'contact2', 'address2', '1.jpg', 'admin', 1),
(29, '::1', 'asd', 'admin2@gmail.com', '0cc175b9c0f1b6a831c399e269772661', '', 'asd', 'asd', 'asd', '8-640-1634396279-967-width640height480.jpg', 'guest', 1),
(30, '::1', 'asd', 'test1@gmail.com', '7815696ecbf1c96e6894b779456d330e', 'AD', 'asd', 'asd', 'asd', '8-640-1634396279-967-width640height480.jpg', 'guest', 1),
(31, '::1', 'asdasdasdasd', 'test@gmail.com', '7815696ecbf1c96e6894b779456d330e', 'AO', 'asd', 'asd', 'asdasd', '8-640-1634396279-967-width640height480.jpg', 'admin', 1),
(32, '::1', 'asd', 'test2@gmail.com', '7815696ecbf1c96e6894b779456d330e', '', 'asd', 'asd', 'asd', '1634263844-698-thumbnail-width640height480.jpg', 'admin', 1),
(33, '::1', 'asd', 'test3@gmail.com', '7815696ecbf1c96e6894b779456d330e', '', 'asd', 'asd', 'asd', '1634263844-698-thumbnail-width640height480.jpg', 'guest', 1),
(34, '::1', 'asd', 'test4@gmail.com', '7815696ecbf1c96e6894b779456d330e', 'VN', 'asd', 'asd', 'asd', '1634375061-925-thumbnail-width640height480.jpg', 'admin', 1),
(35, '::1', 'asd', 'test5@gmail.com', '7815696ecbf1c96e6894b779456d330e', 'AO', 'asd', 'asd', 'asd', '1634263844-698-thumbnail-width640height480.jpg', 'guest', 1),
(37, '::1', 'asd', 'asd@gmail.com', '7815696ecbf1c96e6894b779456d330e', 'AD', 'asd', 'asd', 'asd', '1634263844-698-thumbnail-width640height480.jpg', 'guest', 1),
(39, '::1', 'asd', 'asd7@gmail.com', '7815696ecbf1c96e6894b779456d330e', 'AS', 'asd', 'asd', 'asd', '1634201500-168-thumbnail-width640height480.jpg', 'admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=466;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
