-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 25, 2026 at 05:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pc_builder`
--

-- --------------------------------------------------------

--
-- Table structure for table `build`
--

CREATE TABLE `build` (
  `Build_ID` int(11) NOT NULL,
  `Build_Name` varchar(100) NOT NULL,
  `Total_Price` decimal(10,2) NOT NULL,
  `CPU_ID` int(11) NOT NULL,
  `Motherboard_ID` int(11) NOT NULL,
  `GPU_ID` int(11) NOT NULL,
  `RAM_ID` int(11) NOT NULL,
  `Storage_ID` int(11) NOT NULL,
  `PSU_ID` int(11) NOT NULL,
  `Case_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `build`
--

INSERT INTO `build` (`Build_ID`, `Build_Name`, `Total_Price`, `CPU_ID`, `Motherboard_ID`, `GPU_ID`, `RAM_ID`, `Storage_ID`, `PSU_ID`, `Case_ID`) VALUES
(2, 'Database Test Build', 100000.00, 1, 1, 1, 1, 1, 1, 1),
(4, 'ASDASada', 214500.00, 6, 7, 6, 4, 5, 4, 3),
(5, 'adadsass', 173000.00, 1, 3, 5, 3, 3, 3, 4),
(6, 'Mahfuj er bou Sumaiyya', 191000.00, 2, 2, 5, 5, 4, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `build_component`
--

CREATE TABLE `build_component` (
  `Build_ID` int(11) NOT NULL,
  `CPU_ID` int(11) NOT NULL,
  `Motherboard_ID` int(11) NOT NULL,
  `GPU_ID` int(11) NOT NULL,
  `RAM_ID` int(11) NOT NULL,
  `Storage_ID` int(11) NOT NULL,
  `PSU_ID` int(11) NOT NULL,
  `Case_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cpu`
--

CREATE TABLE `cpu` (
  `CPU_ID` int(11) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Socket` varchar(20) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cpu`
--

INSERT INTO `cpu` (`CPU_ID`, `Brand`, `Model`, `Socket`, `Price`) VALUES
(1, 'AMD', 'Ryzen 5 7600', 'AM5', 25000.00),
(2, 'AMD', 'Ryzen 7 7700', 'AM5', 35000.00),
(3, 'AMD', 'Ryzen 7 7800X3D', 'AM5', 52000.00),
(4, 'AMD', 'Ryzen 9 9900X', 'AM5', 68000.00),
(5, 'Intel', 'Core i5-14600K', 'LGA1700', 37000.00),
(6, 'Intel', 'Core i7-14700K', 'LGA1700', 52000.00),
(7, 'Intel', 'Core Ultra 7 265K', 'LGA1851', 60000.00),
(8, 'Intel', 'Core Ultra 9 285K', 'LGA1851', 85000.00);

-- --------------------------------------------------------

--
-- Table structure for table `gpu`
--

CREATE TABLE `gpu` (
  `GPU_ID` int(11) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gpu`
--

INSERT INTO `gpu` (`GPU_ID`, `Brand`, `Model`, `Price`) VALUES
(1, 'NVIDIA', 'RTX 5060 Ti', 40000.00),
(2, 'NVIDIA', 'RTX 5070', 50000.00),
(3, 'NVIDIA', 'RTX 5070 Ti', 60000.00),
(4, 'NVIDIA', 'RTX 5080', 70000.00),
(5, 'AMD', 'RX 9070', 80000.00),
(6, 'AMD', 'RX 9070 XT', 90000.00),
(7, 'AMD', 'RX 9060 XT', 100000.00),
(8, 'Intel', 'Arc B580', 110000.00);

-- --------------------------------------------------------

--
-- Table structure for table `motherboard`
--

CREATE TABLE `motherboard` (
  `Motherboard_ID` int(11) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Socket` varchar(20) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motherboard`
--

INSERT INTO `motherboard` (`Motherboard_ID`, `Brand`, `Model`, `Socket`, `Price`) VALUES
(1, 'MSI', 'B650M', 'AM5', 18000.00),
(2, 'Gigabyte', 'B650M', 'AM5', 19000.00),
(3, 'ASUS', 'TUF B650M', 'AM5', 21000.00),
(4, 'MSI', 'B850M', 'AM5', 25000.00),
(5, 'MSI', 'B760M', 'LGA1700', 20000.00),
(6, 'Gigabyte', 'B760M', 'LGA1700', 19000.00),
(7, 'ASUS', 'TUF B760M', 'LGA1700', 22000.00),
(8, 'MSI', 'B860M', 'LGA1851', 26000.00);

-- --------------------------------------------------------

--
-- Table structure for table `pc_case`
--

CREATE TABLE `pc_case` (
  `Case_ID` int(11) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pc_case`
--

INSERT INTO `pc_case` (`Case_ID`, `Brand`, `Model`, `Price`) VALUES
(1, 'DeepCool', 'CH370', 6000.00),
(2, 'Lian Li', 'DAN A3', 7000.00),
(3, 'ASUS', 'AP201', 8000.00),
(4, 'Montech', 'Air 100', 9000.00),
(5, 'MSI', 'MAG Forge M100', 10000.00),
(6, 'DeepCool', 'CC360', 11000.00),
(7, 'Antec', 'CX200M', 12000.00),
(8, 'Cooler Master', 'NR400', 13000.00);

-- --------------------------------------------------------

--
-- Table structure for table `psu`
--

CREATE TABLE `psu` (
  `PSU_ID` int(11) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Wattage` varchar(20) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `psu`
--

INSERT INTO `psu` (`PSU_ID`, `Brand`, `Model`, `Wattage`, `Price`) VALUES
(1, 'Corsair', 'RM1000e', '1000W', 15000.00),
(2, 'MSI', 'MAG A1000GL', '1000W', 16000.00),
(3, 'DeepCool', 'PX1000G', '1000W', 17000.00),
(4, 'Cooler Master', 'GX III 1000', '1000W', 18000.00),
(5, 'Thermaltake', 'Toughpower GF3', '1000W', 19000.00);

-- --------------------------------------------------------

--
-- Table structure for table `ram`
--

CREATE TABLE `ram` (
  `RAM_ID` int(11) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Capacity` varchar(20) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ram`
--

INSERT INTO `ram` (`RAM_ID`, `Brand`, `Model`, `Capacity`, `Price`) VALUES
(1, 'Generic', 'DDR5', '16GB', 6000.00),
(2, 'Generic', 'DDR5 RGB', '16GB', 7500.00),
(3, 'Generic', 'DDR5', '32GB', 9000.00),
(4, 'Generic', 'DDR5 RGB', '32GB', 10500.00),
(5, 'Generic', 'DDR5', '48GB', 12000.00),
(6, 'Generic', 'DDR5', '64GB', 15000.00),
(7, 'Generic', 'DDR5 RGB', '64GB', 17000.00),
(8, 'Generic', 'DDR5', '96GB', 22000.00);

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `Storage_ID` int(11) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Capacity` varchar(20) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`Storage_ID`, `Brand`, `Model`, `Capacity`, `Price`) VALUES
(1, 'Generic', 'NVMe', '500GB', 5000.00),
(2, 'Generic', 'NVMe', '1TB', 8000.00),
(3, 'Generic', 'NVMe', '2TB', 12000.00),
(4, 'Generic', 'NVMe', '4TB', 18000.00),
(5, 'Generic', 'Gen5', '1TB', 14000.00),
(6, 'Generic', 'Gen5', '2TB', 22000.00),
(7, 'Generic', 'SATA SSD', '2TB', 10000.00),
(8, 'Generic', 'SATA SSD', '4TB', 17000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `build`
--
ALTER TABLE `build`
  ADD PRIMARY KEY (`Build_ID`),
  ADD KEY `fk_build_cpu` (`CPU_ID`),
  ADD KEY `fk_build_motherboard` (`Motherboard_ID`),
  ADD KEY `fk_build_gpu` (`GPU_ID`),
  ADD KEY `fk_build_ram` (`RAM_ID`),
  ADD KEY `fk_build_storage` (`Storage_ID`),
  ADD KEY `fk_build_psu` (`PSU_ID`),
  ADD KEY `fk_build_case` (`Case_ID`);

--
-- Indexes for table `build_component`
--
ALTER TABLE `build_component`
  ADD PRIMARY KEY (`Build_ID`),
  ADD KEY `CPU_ID` (`CPU_ID`),
  ADD KEY `Motherboard_ID` (`Motherboard_ID`),
  ADD KEY `GPU_ID` (`GPU_ID`),
  ADD KEY `RAM_ID` (`RAM_ID`),
  ADD KEY `Storage_ID` (`Storage_ID`),
  ADD KEY `PSU_ID` (`PSU_ID`),
  ADD KEY `Case_ID` (`Case_ID`);

--
-- Indexes for table `cpu`
--
ALTER TABLE `cpu`
  ADD PRIMARY KEY (`CPU_ID`);

--
-- Indexes for table `gpu`
--
ALTER TABLE `gpu`
  ADD PRIMARY KEY (`GPU_ID`);

--
-- Indexes for table `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`Motherboard_ID`);

--
-- Indexes for table `pc_case`
--
ALTER TABLE `pc_case`
  ADD PRIMARY KEY (`Case_ID`);

--
-- Indexes for table `psu`
--
ALTER TABLE `psu`
  ADD PRIMARY KEY (`PSU_ID`);

--
-- Indexes for table `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`RAM_ID`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`Storage_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `build`
--
ALTER TABLE `build`
  MODIFY `Build_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cpu`
--
ALTER TABLE `cpu`
  MODIFY `CPU_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `gpu`
--
ALTER TABLE `gpu`
  MODIFY `GPU_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `motherboard`
--
ALTER TABLE `motherboard`
  MODIFY `Motherboard_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pc_case`
--
ALTER TABLE `pc_case`
  MODIFY `Case_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `psu`
--
ALTER TABLE `psu`
  MODIFY `PSU_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ram`
--
ALTER TABLE `ram`
  MODIFY `RAM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `storage`
--
ALTER TABLE `storage`
  MODIFY `Storage_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `build`
--
ALTER TABLE `build`
  ADD CONSTRAINT `fk_build_case` FOREIGN KEY (`Case_ID`) REFERENCES `pc_case` (`Case_ID`),
  ADD CONSTRAINT `fk_build_cpu` FOREIGN KEY (`CPU_ID`) REFERENCES `cpu` (`CPU_ID`),
  ADD CONSTRAINT `fk_build_gpu` FOREIGN KEY (`GPU_ID`) REFERENCES `gpu` (`GPU_ID`),
  ADD CONSTRAINT `fk_build_motherboard` FOREIGN KEY (`Motherboard_ID`) REFERENCES `motherboard` (`Motherboard_ID`),
  ADD CONSTRAINT `fk_build_psu` FOREIGN KEY (`PSU_ID`) REFERENCES `psu` (`PSU_ID`),
  ADD CONSTRAINT `fk_build_ram` FOREIGN KEY (`RAM_ID`) REFERENCES `ram` (`RAM_ID`),
  ADD CONSTRAINT `fk_build_storage` FOREIGN KEY (`Storage_ID`) REFERENCES `storage` (`Storage_ID`);

--
-- Constraints for table `build_component`
--
ALTER TABLE `build_component`
  ADD CONSTRAINT `build_component_ibfk_1` FOREIGN KEY (`Build_ID`) REFERENCES `build` (`Build_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `build_component_ibfk_2` FOREIGN KEY (`CPU_ID`) REFERENCES `cpu` (`CPU_ID`),
  ADD CONSTRAINT `build_component_ibfk_3` FOREIGN KEY (`Motherboard_ID`) REFERENCES `motherboard` (`Motherboard_ID`),
  ADD CONSTRAINT `build_component_ibfk_4` FOREIGN KEY (`GPU_ID`) REFERENCES `gpu` (`GPU_ID`),
  ADD CONSTRAINT `build_component_ibfk_5` FOREIGN KEY (`RAM_ID`) REFERENCES `ram` (`RAM_ID`),
  ADD CONSTRAINT `build_component_ibfk_6` FOREIGN KEY (`Storage_ID`) REFERENCES `storage` (`Storage_ID`),
  ADD CONSTRAINT `build_component_ibfk_7` FOREIGN KEY (`PSU_ID`) REFERENCES `psu` (`PSU_ID`),
  ADD CONSTRAINT `build_component_ibfk_8` FOREIGN KEY (`Case_ID`) REFERENCES `pc_case` (`Case_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
