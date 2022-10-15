-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2022 at 09:14 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srfarm`
--

-- --------------------------------------------------------

--
-- Table structure for table `buy`
--

CREATE TABLE `buy` (
  `buy_id` int(11) DEFAULT NULL,
  `product` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `kg` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `purchase_d` date DEFAULT NULL,
  `name` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Triggers `buy`
--
DELIMITER $$
CREATE TRIGGER `delt` AFTER DELETE ON `buy` FOR EACH ROW delete from purchase where buy_id=old.buy_id and purchase_d=old.purchase_d
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `myt` AFTER INSERT ON `buy` FOR EACH ROW insert into purchase set
product=new.product,kg=new.kg,total=new.total,purchase_d=new.purchase_d,name=new.name,buy_id=new.buy_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cust_reg`
--

CREATE TABLE `cust_reg` (
  `name` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(260) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `username` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `cust_reg`
--

INSERT INTO `cust_reg` (`name`, `address`, `phone`, `email`, `dob`, `age`, `username`, `password`) VALUES
('Dola Roy', 'Bagerhat ', 1986653488, 'dola@gmail.com', '2000-03-03', 20, 'dola', 'dola40'),
('Nova Islam Neha', 'Jessore', 1986345722, 'nova@gmail.com', '2022-10-14', 24, 'nova', 'nova12');

-- --------------------------------------------------------

--
-- Table structure for table `farmer_reg`
--

CREATE TABLE `farmer_reg` (
  `farmer_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `city` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `phone` bigint(30) DEFAULT NULL,
  `username` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `farmer_reg`
--

INSERT INTO `farmer_reg` (`farmer_id`, `name`, `city`, `address`, `phone`, `username`, `password`) VALUES
(1, 'Sikta Mondal', 'Bagerhat', 'Bosu para road', 1976348966, 'admin1', 'sadmin1'),
(2, 'Ripon Mollic', 'Khulna', 'm/a road', 1304786346, 'admin2', 'radmin2'),
(4, 'Raju Shek', 'khulna', '7\\4a ios road', 10304863775, 'raju', 'raju123');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `price`) VALUES
(1, 'apple', 300),
(2, 'mango', 600),
(3, 'Orange', 280),
(4, 'Custard Apple', 500);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `product` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `kg` int(11) DEFAULT NULL,
  `total` int(50) DEFAULT NULL,
  `purchase_d` date DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `buy_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`product`, `kg`, `total`, `purchase_d`, `name`, `buy_id`) VALUES
('mango', 60, 36000, '2020-12-29', 'dola', 1),
('mango', 2, 1200, '2022-10-14', 'Dola Roy', 2),
('mango', 4, 2400, '2022-10-14', 'Nova Islam Neha', 2),
('Orange', 2, 560, '2022-10-15', 'Dola Roy', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cust_reg`
--
ALTER TABLE `cust_reg`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `farmer_reg`
--
ALTER TABLE `farmer_reg`
  ADD PRIMARY KEY (`farmer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `farmer_reg`
--
ALTER TABLE `farmer_reg`
  MODIFY `farmer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
