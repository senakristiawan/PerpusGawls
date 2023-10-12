-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2023 at 07:47 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpusgawls`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` char(4) NOT NULL CHECK (`author_id` regexp '^A[[:digit:]]{3}$'),
  `author_name` varchar(50) NOT NULL CHECK (octet_length(`author_name`) <= 50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `author_name`) VALUES
('A001', 'Coleridge'),
('A002', 'Lewis Carrol'),
('A003', 'G.B.Shaw'),
('A004', 'Jules Verne'),
('A005', 'Anna Karenina'),
('A006', 'Jane Austen'),
('A007', 'Jean Jacques Rousseau'),
('A008', 'Jonathan Swift'),
('A009', 'D.P. Moynihan'),
('A010', 'Sir Walter Scott');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` char(4) NOT NULL CHECK (`book_id` regexp '^B[[:digit:]]{3}$'),
  `book_title` varchar(50) NOT NULL CHECK (octet_length(`book_title`) <= 50),
  `book_typeid` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_title`, `book_typeid`) VALUES
('B001', 'Ancient Mariner', NULL),
('B002', 'Alice in Wonderland', NULL),
('B003', 'Arms and the Man', NULL),
('B004', 'Around the World in eighty days', NULL),
('B005', 'Leo Tolstoy', NULL),
('B006', 'Pride and Prejudice', NULL),
('B007', 'Le Contract Social', NULL),
('B008', 'Gulliver’s Travels', NULL),
('B009', 'A Dangerous place', NULL),
('B010', 'The Lady of the Last Minstrel', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookdetail`
--

CREATE TABLE `bookdetail` (
  `book_typeid` char(5) NOT NULL CHECK (`book_typeid` regexp '^BT[[:digit:]]{3}$'),
  `category_id` char(5) NOT NULL,
  `author_id` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookdetail`
--

INSERT INTO `bookdetail` (`book_typeid`, `category_id`, `author_id`) VALUES
('BT001', 'CAT01', 'A001'),
('BT002', 'CAT02', 'A002'),
('BT003', 'CAT03', 'A003'),
('BT004', 'CAT04', 'A004'),
('BT005', 'CAT05', 'A005'),
('BT006', 'CAT06', 'A006'),
('BT007', 'CAT07', 'A007'),
('BT008', 'CAT08', 'A008'),
('BT009', 'CAT09', 'A009'),
('BT010', 'CAT10', 'A010');

-- --------------------------------------------------------

--
-- Table structure for table `borrowrecord`
--

CREATE TABLE `borrowrecord` (
  `borrow_id` char(5) NOT NULL CHECK (`borrow_id` regexp '^BOK[[:digit:]]{2}$'),
  `customer_id` char(5) NOT NULL,
  `staff_id` char(6) NOT NULL,
  `book_id` char(4) NOT NULL,
  `borrow_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrowrecord`
--

INSERT INTO `borrowrecord` (`borrow_id`, `customer_id`, `staff_id`, `book_id`, `borrow_date`) VALUES
('BOK01', 'C001', 'S00001', 'B001', '2022-01-10'),
('BOK02', 'C002', 'S00002', 'B002', '2021-02-09'),
('BOK03', 'C003', 'S00003', 'B003', '2022-03-08'),
('BOK04', 'C004', 'S00004', 'B004', '2021-04-07'),
('BOK05', 'C005', 'S00005', 'B005', '2022-05-06'),
('BOK06', 'C006', 'S00006', 'B006', '2021-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `categorydetail`
--

CREATE TABLE `categorydetail` (
  `category_id` char(5) NOT NULL CHECK (`category_id` regexp '^CAT[[:digit:]]{2}$'),
  `category_name` varchar(10) NOT NULL CHECK (`category_name` = 'Classics' or `category_name` = 'Fantasy' or `category_name` = 'Drama' or `category_name` = 'Mystery' or `category_name` = 'Action' or `category_name` = 'Detective' or `category_name` = 'Comic Book' or `category_name` = 'Crime' or `category_name` = 'Horror' or `category_name` = 'Adventure')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorydetail`
--

INSERT INTO `categorydetail` (`category_id`, `category_name`) VALUES
('CAT01', 'Action'),
('CAT02', 'Adventure'),
('CAT03', 'Comic Book'),
('CAT04', 'Crime'),
('CAT05', 'Detective'),
('CAT06', 'Mystery'),
('CAT07', 'Fantasy'),
('CAT08', 'Classics'),
('CAT09', 'Horror'),
('CAT10', 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` char(4) NOT NULL CHECK (`customer_id` regexp '^C[[:digit:]]{3}$'),
  `customer_name` varchar(50) NOT NULL CHECK (octet_length(`customer_name`) <= 50),
  `customer_age` int(11) NOT NULL CHECK (`customer_age` > 0),
  `customer_bornplace` varchar(50) NOT NULL,
  `customer_gender` varchar(10) DEFAULT NULL CHECK (`customer_gender` = 'Male' or `customer_gender` = 'Female'),
  `customer_phonenumber` varchar(12) DEFAULT NULL CHECK (`customer_phonenumber` regexp '^[[:digit:]]+$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_age`, `customer_bornplace`, `customer_gender`, `customer_phonenumber`) VALUES
('C001', 'Novelia Radikala', 19, 'Jakarta', 'Female', '087812443123'),
('C002', 'Christiano Ronaldo', 22, 'Tangerang Selatan', 'Female', '087875194227'),
('C003', 'Lionel Messi', 24, 'Banjarmasin', 'Male', '088875194157'),
('C004', 'Budi', 19, 'Aceh', 'Male', '081234432111'),
('C005', 'Abigail Zeta', 47, 'Jepara', 'Female', '081234194757'),
('C006', 'Nurul Hermansyah', 14, 'Depok', 'Male', '088108085656'),
('C007', 'Khairul Iqomastotim', 18, 'Irian Jaya', 'Female', '081233212222'),
('C008', 'Rian Candradimana', 18, 'Depok', 'Female', '082156567777'),
('C009', 'Michael Gatot Panjenengan', 32, 'Bandung', 'Female', '081211770032'),
('C010', 'Bambang Christian', 43, 'Surabaya', 'Male', '088112125314');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` char(6) NOT NULL CHECK (`staff_id` regexp '^S[[:digit:]]{5}$'),
  `staff_name` varchar(50) NOT NULL CHECK (octet_length(`staff_name`) <= 50),
  `staff_bornplace` varchar(50) NOT NULL,
  `staff_borndate` date NOT NULL,
  `staff_salary` int(11) NOT NULL,
  `staff_gender` varchar(10) NOT NULL CHECK (`staff_gender` = 'Male' or `staff_gender` = 'Female')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `staff_bornplace`, `staff_borndate`, `staff_salary`, `staff_gender`) VALUES
('S00001', 'Abdul Hadi Ismail', 'Surabaya', '2003-01-12', 10000000, 'Male'),
('S00002', 'Afandi Hermawan Oey', 'Jakarta', '2003-01-12', 20000000, 'Female'),
('S00003', 'Catherine Gina Hambali', 'Jogja', '2003-01-12', 30000000, 'Male'),
('S00004', 'Han Jung Kuk', 'Surakarta', '2003-01-12', 40000000, 'Female'),
('S00005', 'Eddy Daud', 'Bandung', '2003-01-12', 50000000, 'Male'),
('S00006', 'Doni Irawan', 'Ciputat', '2003-01-12', 60000000, 'Female'),
('S00007', 'Ignatius Toni Gunawan', 'Cikampek', '2003-01-12', 70000000, 'Male'),
('S00008', 'Mira Savira', 'Bogor', '2003-01-12', 80000000, 'Female'),
('S00009', 'Ibrahim', 'Surabaya', '2003-01-12', 90000000, 'Male'),
('S00010', 'Hosea Hadeli', 'Surabaya', '2003-01-12', 100000000, 'Female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_booktypeid` (`book_typeid`);

--
-- Indexes for table `bookdetail`
--
ALTER TABLE `bookdetail`
  ADD PRIMARY KEY (`book_typeid`),
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `fk_author` (`author_id`);

--
-- Indexes for table `borrowrecord`
--
ALTER TABLE `borrowrecord`
  ADD PRIMARY KEY (`borrow_id`),
  ADD KEY `fk_customer` (`customer_id`),
  ADD KEY `fk_staff` (`staff_id`),
  ADD KEY `fk_book` (`book_id`);

--
-- Indexes for table `categorydetail`
--
ALTER TABLE `categorydetail`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_booktypeid` FOREIGN KEY (`book_typeid`) REFERENCES `bookdetail` (`book_typeid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookdetail`
--
ALTER TABLE `bookdetail`
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categorydetail` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrowrecord`
--
ALTER TABLE `borrowrecord`
  ADD CONSTRAINT `fk_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
