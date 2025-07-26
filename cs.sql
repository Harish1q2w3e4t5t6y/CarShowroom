-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2024 at 06:03 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_responses`
--

CREATE TABLE `chatbot_responses` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatbot_responses`
--

INSERT INTO `chatbot_responses` (`id`, `question`, `answer`) VALUES
(1, 'how to buy a car', 'You have to select the brand and model with parts then click the buy button.'),
(2, 'hello', 'helloo\r\n'),
(3, 'how to select a brand', 'To select a brand, navigate to the \'Brands\' section and click on your preferred brand.'),
(4, 'how to select a model', 'After choosing a brand, select a model from the available options for that brand.'),
(5, 'how to choose car parts', 'You can choose additional parts and accessories from the \'Parts\' section after selecting your car model.'),
(6, 'where can i view my bill', 'Once you\'ve completed your selections, click \'View Bill\' to see a summary of your purchases and total price.'),
(7, 'how to proceed to payment', 'After reviewing your bill, click \'Proceed to Payment\' to complete your purchase.'),
(8, 'can i see car features', 'Yes, you can see detailed car features on the model\'s page before making a purchase.'),
(9, 'what payment methods are available', 'We accept credit cards, debit cards, and online bank transfers.'),
(10, 'how can i contact support', 'You can contact support by clicking on the \'Support\' tab or calling our helpline at 1-800-CAR-HELP.'),
(11, 'how to see a brand', 'go to brands then scroll down the wesbite then select the car brand'),
(12, 'hi', 'welcome to francis');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(25) DEFAULT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `customer_password` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_password`) VALUES
(1, 'Harish', 'harish@example.com', 'harish123'),
(2, 'Ajai', 'ajai@example.com', 'ajai123'),
(3, 'Karthik', 'karthik@example.com', 'karthik123'),
(4, 'Vignesh', 'vignesh@example.com', 'vignesh123'),
(5, 'Dinesh', 'dinesh@example.com', 'dinesh123'),
(17, 'ah', 'ah@gmail.com', 'ah'),
(18, 'harish', 'harish@gmail.com', '1234'),
(19, 'ha', 'h@a', 'ha'),
(20, 'madhu', 'madhu@gmail.com', 'madhu123'),
(21, 'Yazhini', 'yazh@gmail.com', '12345'),
(22, 'ajai', 'ajai@gmail.com', '1234'),
(23, 'admin', 'admin@123', 'admin'),
(24, 'hari', 'hari@gmail.com', '1234'),
(25, 'balaji', 'balaji@gmail.com', '123789456'),
(26, 'maha', 'maha@gmail.com', '1234'),
(27, 'kowsalya', 'kowsi@gmail.com', 'shiva123'),
(28, 'hello', 'hello@gmail.com', '1234'),
(29, 'reshma', 'reshma@gmail.com', '1234'),
(30, 'sathish kumar', 'sa@gmail.com', '1234'),
(31, 'h', 'h@gmail.com', '1234'),
(32, 'ha', 'ha@gmail.com', '1234'),
(33, 'a', 'a@a', '1234'),
(34, 'francis', 'francis@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `feedback` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `customer_name`, `feedback`, `submitted_at`) VALUES
(1, 'maha', 'super and nice website i am so happy to buy here', '2024-11-23 16:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(10) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `vehicle_id` int(10) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `image_name`, `vehicle_id`, `image_path`) VALUES
(1, 'A4', 1, 'image/audi/a4.jpeg'),
(2, 'A6', 2, 'image/audi/a6.jpeg'),
(3, 'e-tron GT', 3, 'image/audi/e-tron-gt.jpeg'),
(4, 'Q3', 4, 'image/audi/q3.jpeg'),
(5, 'Q3 Sportback', 5, 'image/audi/q3-sportback.jpeg'),
(6, 'Q5', 6, 'image/audi/q5.jpeg'),
(7, 'Q7', 7, 'image/audi/q7.jpeg'),
(8, 'Q8', 8, 'image/audi/q8.jpeg'),
(9, 'RS5', 9, 'image/audi/rs5.jpeg'),
(10, 'S5 Sportback', 10, 'image/audi/s5-sportback.jpeg'),
(11, '2 Series Gran Coupe', 11, 'image/bmw/2-series-gran-coupe.jpeg'),
(12, '3 Series Gran Limousine', 12, 'image/bmw/3-series-gran-limousine.jpeg'),
(13, '7 Series', 13, 'image/bmw/7-series.jpeg'),
(14, 'M4 Competition', 14, 'image/bmw/m4-competition.jpeg'),
(15, 'M8', 15, 'image/bmw/m8.jpeg'),
(16, 'M340i', 16, 'image/bmw/m340i.jpeg'),
(17, 'X1', 17, 'image/bmw/x1.jpeg'),
(18, 'X7', 18, 'image/bmw/x7.jpeg'),
(19, 'XM', 19, 'image/bmw/xm.jpeg'),
(20, 'Z4', 20, 'image/bmw/z4.jpeg'),
(21, '296 GTB', 21, 'image/ferrari/296-gtb.jpeg'),
(22, '296 GTS', 22, 'image/ferrari/296-gts.jpeg'),
(23, 'F8 Tributo', 23, 'image/ferrari/f8-tributo.jpeg'),
(24, 'Portofino', 24, 'image/ferrari/portofino.jpeg'),
(25, 'Purosangue SUV', 25, 'image/ferrari/purosangue-suv.jpeg'),
(26, 'Roma', 26, 'image/ferrari/roma.jpeg'),
(27, 'Aspire', 27, 'image/ford/aspire.jpeg'),
(28, 'Classic', 28, 'image/ford/classic.jpg'),
(29, 'EcoSport', 29, 'image/ford/ecosport.jpg'),
(30, 'Endeavour', 30, 'image/ford/endeavour.jpeg'),
(31, 'Fiesta', 31, 'image/ford/fiesta.jpg'),
(32, 'Figo', 32, 'image/ford/figo.jpeg'),
(33, 'Freestyle', 33, 'image/ford/freestyle.jpeg'),
(34, 'Ikon', 34, 'image/ford/ikon.jpg'),
(35, 'Mondeo', 35, 'image/ford/mondeo.jpg'),
(36, 'Mustang', 36, 'image/ford/mustang.jpg'),
(37, 'Alcazar', 37, 'image/hyundai/alcazar.jpeg'),
(38, 'Aura', 38, 'image/hyundai/aura.jpeg'),
(39, 'Creta', 39, 'image/hyundai/creta.png'),
(40, 'Creta N Line', 40, 'image/hyundai/creta-n-line.png'),
(41, 'Exter', 41, 'image/hyundai/exter.jpeg'),
(42, 'Grand i10 Nios', 42, 'image/hyundai/grand-i10-nios.jpeg'),
(43, 'i20', 43, 'image/hyundai/i20.jpeg'),
(44, 'Tucson', 44, 'image/hyundai/tucson.jpeg'),
(45, 'Venue', 45, 'image/hyundai/venue.jpeg'),
(46, 'Verna', 46, 'image/hyundai/verna.jpeg'),
(47, 'ES', 47, 'image/lexus/es.jpeg'),
(48, 'LC 500h', 48, 'image/lexus/lc-500h.jpeg'),
(49, 'LM', 49, 'image/lexus/lm.png'),
(50, 'LX', 50, 'image/lexus/lx.jpeg'),
(51, 'NX 2022', 51, 'image/lexus/nx-2022.jpeg'),
(52, 'RX', 52, 'image/lexus/rx.jpeg'),
(53, 'AMG GLA 35', 53, 'image/mercedes-benz/amg-gla-35.jpeg'),
(54, 'AMG GLE 53', 54, 'image/mercedes-benz/amg-gle-53.jpg'),
(55, 'C-Class', 55, 'image/mercedes-benz/c-class.jpg'),
(56, 'E-Class', 56, 'image/mercedes-benz/e-class.jpg'),
(57, 'GLA', 57, 'image/mercedes-benz/gla.jpg'),
(58, 'GLC', 58, 'image/mercedes-benz/glc.jpg'),
(59, 'GLE', 59, 'image/mercedes-benz/gle.jpg'),
(60, 'GLS', 60, 'image/mercedes-benz/gls.jpg'),
(61, 'Maybach GLS', 61, 'image/mercedes-benz/maybach-gls.jpg'),
(62, 'S-Class', 62, 'image/mercedes-benz/s-class.jpg'),
(63, '718', 63, 'image/porsche/718.jpeg'),
(64, '911', 64, 'image/porsche/911.jpg'),
(65, 'Cayenne', 65, 'image/porsche/cayenne.jpeg'),
(66, 'Cayenne Coupe', 66, 'image/porsche/cayenne-coupe.jpeg'),
(67, 'Macan', 67, 'image/porsche/macan.jpeg'),
(68, 'Macan Turbo EV', 68, 'image/porsche/macan-turbo-ev.jpeg'),
(69, 'Panamera', 69, 'image/porsche/panamera.jpeg'),
(70, 'Taycan', 70, 'image/porsche/taycan.jpeg'),
(71, 'Taycan Cross Turismo', 71, 'image/porsche/taycan-cross-turismo.jpeg'),
(72, 'Cybertruck', 72, 'image/tesla/cybertruck.png'),
(73, 'Model 3', 73, 'image/tesla/model3.png'),
(74, 'Model S', 74, 'image/tesla/models.png'),
(76, 'Model Y', 76, 'image/tesla/modely.png'),
(77, 'camry.jpg', 77, 'image/toyota/camry.jpg'),
(78, 'Fortuner', 78, 'image/toyota/fortuner.jpg'),
(79, 'Fortuner Legender', 79, 'image/toyota/fortuner_legender.jpg'),
(80, 'Hilux', 80, 'image/toyota/hilux.jpg'),
(81, 'Innova Crysta', 81, 'image/toyota/innova_crysta.jpg'),
(82, 'Land Cruiser 300', 82, 'image/toyota/land_cruiser_300.jpg'),
(83, 'Rumion', 83, 'image/toyota/rumion.jpg'),
(84, 'Taisor', 84, 'image/toyota/taisor.jpg'),
(85, 'Urban Cruiser Hyryder', 85, 'image/toyota/urban_cruiser_hyryder.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `sale_id` int(10) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `sale_id`, `payment_date`, `payment_amount`, `payment_method`) VALUES
(1, 1, '2024-01-15', '15000.00', 'Credit Card'),
(2, 2, '2024-02-10', '18000.00', 'Bank Transfer'),
(3, 3, '2024-03-20', '20000.00', 'Cash'),
(4, 4, '2024-04-05', '15500.00', 'Credit Card'),
(5, 5, '2024-05-25', '17500.00', 'Debit Card');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(10) NOT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `vehicle_id` int(10) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `customer_id`, `vehicle_id`, `sale_date`, `sale_price`) VALUES
(1, 1, 1, '2024-01-15', '15000.00'),
(2, 2, 2, '2024-02-10', '18000.00'),
(3, 3, 3, '2024-03-20', '20000.00'),
(4, 4, 1, '2024-04-05', '15500.00'),
(5, 5, 2, '2024-05-25', '17500.00');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicle_id` int(10) NOT NULL,
  `vehicle_brandname` varchar(100) DEFAULT NULL,
  `vehicle_modelname` varchar(100) DEFAULT NULL,
  `vehicle_price` decimal(10,2) DEFAULT NULL,
  `vehicle_year` int(4) DEFAULT NULL,
  `vehicle_enginetype` varchar(50) DEFAULT NULL,
  `vehicle_enginecapacity` varchar(20) DEFAULT NULL,
  `vehicle_fueltype` varchar(50) DEFAULT NULL,
  `vehicle_transmission` varchar(50) DEFAULT NULL,
  `vehicle_seatingcapacity` int(2) DEFAULT NULL,
  `vehicle_mileage` varchar(50) DEFAULT NULL,
  `vehicle_bodytype` varchar(50) DEFAULT NULL,
  `vehicle_topspeed` int(3) DEFAULT NULL,
  `vehicle_acceleration` decimal(3,1) DEFAULT NULL,
  `vehicle_torque` varchar(50) DEFAULT NULL,
  `vehicle_drivetrain` varchar(50) DEFAULT NULL,
  `vehicle_fuelcapacity` decimal(5,2) DEFAULT NULL,
  `vehicle_safetyrating` varchar(20) DEFAULT NULL,
  `vehicle_warranty` varchar(50) DEFAULT NULL,
  `vehicle_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicle_id`, `vehicle_brandname`, `vehicle_modelname`, `vehicle_price`, `vehicle_year`, `vehicle_enginetype`, `vehicle_enginecapacity`, `vehicle_fueltype`, `vehicle_transmission`, `vehicle_seatingcapacity`, `vehicle_mileage`, `vehicle_bodytype`, `vehicle_topspeed`, `vehicle_acceleration`, `vehicle_torque`, `vehicle_drivetrain`, `vehicle_fuelcapacity`, `vehicle_safetyrating`, `vehicle_warranty`, `vehicle_description`) VALUES
(1, 'Audi', 'A4', '391000.00', 2024, 'V4', '2.0L', 'Petrol', 'Automatic', 5, '26 mpg', 'Sedan', 130, '5.6', '295 lb-ft', 'AWD', '15.60', '5-star', '4 years/50,000 miles', 'Compact executive sedan with a blend of performance and luxury.'),
(2, 'Audi', 'A6', '549000.00', 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 5, '25 mpg', 'Sedan', 155, '5.1', '369 lb-ft', 'AWD', '19.30', '5-star', '4 years/50,000 miles', 'Luxurious mid-size sedan with advanced technology and comfort features.'),
(3, 'Audi', 'e-tron GT', '999000.00', 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '250+ miles', 'Sedan', 155, '3.9', '630 lb-ft', 'AWD', '0.00', '5-star', '4 years/50,000 miles', 'High-performance electric sedan with cutting-edge design and technology.'),
(4, 'Audi', 'Q3', '382000.00', 2024, 'V4', '2.0L', 'Petrol', 'Automatic', 5, '28 mpg', 'SUV', 130, '7.0', '258 lb-ft', 'AWD', '15.90', '5-star', '4 years/50,000 miles', 'Compact luxury SUV ideal for urban adventures.'),
(5, 'Audi', 'Q3 Sportback', '402000.00', 2024, 'V4', '2.0L', 'Petrol', 'Automatic', 5, '27 mpg', 'SUV', 130, '6.9', '258 lb-ft', 'AWD', '16.30', '5-star', '4 years/50,000 miles', 'Sporty and stylish compact SUV coupe.'),
(6, 'Audi', 'Q5', '441000.00', 2024, 'V4', '2.0L', 'Petrol', 'Automatic', 5, '27 mpg', 'SUV', 130, '5.7', '273 lb-ft', 'AWD', '18.50', '5-star', '4 years/50,000 miles', 'Versatile and spacious mid-size luxury SUV.'),
(7, 'Audi', 'Q7', '604000.00', 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 7, '25 mpg', 'SUV', 130, '5.7', '369 lb-ft', 'AWD', '22.50', '5-star', '4 years/50,000 miles', 'Luxurious and powerful full-size SUV with advanced features.'),
(8, 'Audi', 'Q8', '608900.00', 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 5, '24 mpg', 'SUV', 155, '5.6', '369 lb-ft', 'AWD', '22.50', '5-star', '4 years/50,000 miles', 'Flagship SUV combining elegance with dynamic performance.'),
(9, 'Audi', 'RS5', '768500.00', 2024, 'V6', '2.9L', 'Petrol', 'Automatic', 5, '23 mpg', 'Coupe', 174, '3.7', '443 lb-ft', 'AWD', '15.30', '5-star', '4 years/50,000 miles', 'High-performance coupe delivering exhilarating driving dynamics.'),
(10, 'Audi', 'S5 Sportback', '600000.00', 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 5, '24 mpg', 'Sedan', 155, '4.5', '369 lb-ft', 'AWD', '15.30', '5-star', '4 years/50,000 miles', 'Sporty and sophisticated sedan with enhanced performance.'),
(11, 'BMW', '2 Series Gran Coupe', '380000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '27 mpg', 'Coupe', 155, '6.0', '258 lb-ft', 'AWD', '13.70', '5-star', '4 years/50,000 miles', 'Sporty compact coupe with modern design and agile performance.'),
(12, 'BMW', '3 Series Gran Limousine', '450000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '28 mpg', 'Sedan', 155, '5.8', '295 lb-ft', 'AWD', '15.60', '5-star', '4 years/50,000 miles', 'Luxury sedan with extended wheelbase offering superior comfort and advanced technology.'),
(13, 'BMW', '7 Series', '870000.00', 2024, 'V8', '4.4L', 'Petrol', 'Automatic', 5, '24 mpg', 'Sedan', 155, '4.3', '553 lb-ft', 'AWD', '20.60', '5-star', '4 years/50,000 miles', 'Flagship luxury sedan known for its opulence, performance, and cutting-edge features.'),
(14, 'BMW', 'M4 Competition', '760000.00', 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 4, '22 mpg', 'Coupe', 180, '3.8', '479 lb-ft', 'AWD', '15.60', '5-star', '4 years/50,000 miles', 'High-performance sports coupe with aggressive styling and exceptional driving dynamics.'),
(15, 'BMW', 'M8', '932000.00', 2024, 'V8', '4.4L', 'Petrol', 'Automatic', 4, '20 mpg', 'Coupe', 190, '3.0', '553 lb-ft', 'AWD', '20.60', '5-star', '4 years/50,000 miles', 'Luxury grand tourer with powerful performance and sophisticated interior.'),
(16, 'BMW', 'M340i', '580000.00', 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 5, '26 mpg', 'Sedan', 155, '4.1', '369 lb-ft', 'AWD', '15.60', '5-star', '4 years/50,000 miles', 'Sporty sedan with enhanced performance and modern design cues.'),
(17, 'BMW', 'X1', '380000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '28 mpg', 'SUV', 155, '6.3', '258 lb-ft', 'AWD', '16.20', '5-star', '4 years/50,000 miles', 'Compact luxury SUV perfect for urban environments.'),
(18, 'BMW', 'X7', '750000.00', 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 7, '21 mpg', 'SUV', 155, '5.4', '553 lb-ft', 'AWD', '21.90', '5-star', '4 years/50,000 miles', 'Spacious and luxurious SUV offering top-tier comfort and advanced technology.'),
(19, 'BMW', 'XM', '951000.00', 2024, 'V8', '4.4L', 'Petrol', 'Automatic', 5, '20 mpg', 'SUV', 155, '3.8', '553 lb-ft', 'AWD', '21.90', '5-star', '4 years/50,000 miles', 'High-performance SUV with M-series dynamics and premium amenities.'),
(20, 'BMW', 'Z4', '500000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 2, '29 mpg', 'Roadster', 155, '5.2', '295 lb-ft', 'RWD', '13.70', '5-star', '4 years/50,000 miles', 'Iconic roadster with sleek design and exhilarating driving experience.'),
(21, 'Ferrari', '296 GTB', '300000.00', 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 2, '22 mpg', 'Coupe', 205, '2.9', '568 lb-ft', 'RWD', '20.60', '5-star', '3 years/unlimited miles', 'Mid-engine supercar combining style, speed, and cutting-edge technology.'),
(22, 'Ferrari', '296 GTS', '350000.00', 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 2, '21 mpg', 'Convertible', 205, '2.9', '568 lb-ft', 'RWD', '20.60', '5-star', '3 years/unlimited miles', 'Open-top sports car offering exhilarating driving experience and iconic design.'),
(23, 'Ferrari', 'F8 Tributo', '300000.00', 2024, 'V8', '3.9L', 'Petrol', 'Automatic', 2, '19 mpg', 'Coupe', 211, '2.9', '568 lb-ft', 'RWD', '20.60', '5-star', '3 years/unlimited miles', 'High-performance V8 supercar with striking design and advanced aerodynamics.'),
(24, 'Ferrari', 'Portofino', '220000.00', 2024, 'V8', '3.9L', 'Petrol', 'Automatic', 2, '20 mpg', 'Convertible', 199, '3.2', '568 lb-ft', 'RWD', '20.60', '5-star', '3 years/unlimited miles', 'Elegant grand tourer convertible combining luxury and exhilarating performance.'),
(25, 'Ferrari', 'Purosangue SUV', '350000.00', 2024, 'V8', '4.0L', 'Petrol', 'Automatic', 5, '18 mpg', 'SUV', 185, '3.5', '640 lb-ft', 'AWD', '25.40', '5-star', '3 years/unlimited miles', 'First-ever Ferrari SUV delivering sports car dynamics with SUV versatility.'),
(26, 'Ferrari', 'Roma', '250000.00', 2024, 'V8', '3.9L', 'Petrol', 'Automatic', 2, '19 mpg', 'Coupe', 199, '3.3', '568 lb-ft', 'RWD', '20.60', '5-star', '3 years/unlimited miles', 'Timeless grand tourer coupe with sophisticated design and impressive performance.'),
(27, 'Ford', 'Aspire', '1010000.00', 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '18 km/l', 'Sedan', 150, '15.0', '90 Nm', 'FWD', '42.00', '4-star', '3 years/100,000 km', 'Compact sedan known for its affordability and fuel efficiency.'),
(28, 'Ford', 'Classic', '1015000.00', 2024, 'I4', '1.6L', 'Petrol', 'Manual', 5, '15 km/l', 'Sedan', 160, '13.0', '120 Nm', 'FWD', '45.00', '3-star', '3 years/100,000 km', 'Basic sedan offering practicality and reliable performance.'),
(29, 'Ford', 'EcoSport', '1020000.00', 2024, 'I3', '1.0L', 'Petrol', 'Automatic', 5, '17 km/l', 'SUV', 170, '12.5', '95 Nm', 'FWD', '52.00', '4-star', '3 years/100,000 km', 'Compact SUV with rugged styling and versatile features.'),
(30, 'Ford', 'Endeavour', '1035000.00', 2024, 'I4', '2.0L', 'Diesel', 'Automatic', 7, '13 km/l', 'SUV', 180, '10.0', '420 Nm', '4WD', '80.00', '5-star', '3 years/100,000 km', 'Full-size SUV known for its robustness and off-road capabilities.'),
(31, 'Ford', 'Fiesta', '1018000.00', 2024, 'I4', '1.5L', 'Petrol', 'Automatic', 5, '16 km/l', 'Hatchback', 185, '11.0', '115 Nm', 'FWD', '50.00', '4-star', '3 years/100,000 km', 'Compact hatchback offering agile handling and modern features.'),
(32, 'Ford', 'Figo', '1015000.00', 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '18 km/l', 'Hatchback', 170, '12.0', '100 Nm', 'FWD', '40.00', '3-star', '3 years/100,000 km', 'Affordable hatchback with practical design and efficient performance.'),
(33, 'Ford', 'Freestyle', '1019000.00', 2024, 'I3', '1.2L', 'Petrol', 'Manual', 5, '17 km/l', 'Crossover', 175, '11.5', '96 Nm', 'FWD', '45.00', '3-star', '3 years/100,000 km', 'Cross-hatch with rugged styling and enhanced ground clearance.'),
(34, 'Ford', 'Ikon', '1016000.00', 2024, 'I4', '1.3L', 'Petrol', 'Manual', 5, '16 km/l', 'Sedan', 165, '12.5', '110 Nm', 'FWD', '43.00', '3-star', '3 years/100,000 km', 'Compact sedan offering practicality and comfort.'),
(35, 'Ford', 'Mondeo', '1028000.00', 2024, 'I4', '2.0L', 'Diesel', 'Automatic', 5, '15 km/l', 'Sedan', 190, '9.5', '350 Nm', 'FWD', '60.00', '4-star', '3 years/100,000 km', 'Executive sedan known for its refined interior and advanced features.'),
(36, 'Ford', 'Mustang', '1050000.00', 2024, 'V8', '5.0L', 'Petrol', 'Automatic', 4, '14 km/l', 'Coupe', 250, '4.5', '529 Nm', 'RWD', '61.00', '5-star', '3 years/100,000 km', 'Legendary sports car with iconic design and exhilarating performance.'),
(37, 'Hyundai', 'Alcazar', '925000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 7, '14 km/l', 'SUV', 185, '10.0', '191 Nm', 'FWD', '60.00', '4-star', '5 years/unlimited miles', 'Spacious SUV with flexible seating and advanced connectivity features.'),
(38, 'Hyundai', 'Aura', '913000.00', 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '20 km/l', 'Sedan', 165, '12.0', '115 Nm', 'FWD', '45.00', '3-star', '5 years/unlimited miles', 'Compact sedan offering comfort and efficiency for urban driving.'),
(39, 'Hyundai', 'Creta', '920000.00', 2024, 'I4', '1.5L', 'Petrol', 'Automatic', 5, '17 km/l', 'SUV', 180, '11.0', '144 Nm', 'FWD', '50.00', '4-star', '5 years/unlimited miles', 'Popular compact SUV known for its modern design and feature-rich interior.'),
(40, 'Hyundai', 'Creta N Line', '923000.00', 2024, 'I4', '1.4L', 'Petrol', 'Automatic', 5, '16 km/l', 'SUV', 185, '10.5', '242 Nm', 'FWD', '52.00', '4-star', '5 years/unlimited miles', 'Sporty variant of the Creta SUV with enhanced performance and dynamic styling.'),
(41, 'Hyundai', 'Exter', '918000.00', 2024, 'I4', '1.3L', 'Petrol', 'Manual', 5, '18 km/l', 'Hatchback', 170, '11.5', '110 Nm', 'FWD', '45.00', '3-star', '5 years/unlimited miles', 'Compact hatchback designed for urban mobility and efficiency.'),
(42, 'Hyundai', 'Grand i10 Nios', '914000.00', 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '19 km/l', 'Hatchback', 165, '12.0', '114 Nm', 'FWD', '42.00', '3-star', '5 years/unlimited miles', 'Feature-packed hatchback offering comfort and convenience for city driving.'),
(43, 'Hyundai', 'i20', '916000.00', 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '20 km/l', 'Hatchback', 170, '11.9', '115 Nm', 'FWD', '45.00', '4-star', '5 years/unlimited miles', 'Premium hatchback with sophisticated design and advanced safety features.'),
(44, 'Hyundai', 'Tucson', '925000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '16 km/l', 'SUV', 190, '10.0', '192 Nm', 'AWD', '58.00', '5-star', '5 years/unlimited miles', 'Stylish SUV with cutting-edge technology and spacious interior.'),
(45, 'Hyundai', 'Venue', '915000.00', 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '18 km/l', 'SUV', 175, '12.0', '115 Nm', 'FWD', '45.00', '4-star', '5 years/unlimited miles', 'Compact SUV with bold design and smart features ideal for urban adventures.'),
(46, 'Hyundai', 'Verna', '918000.00', 2024, 'I4', '1.5L', 'Petrol', 'Automatic', 5, '19 km/l', 'Sedan', 180, '10.5', '145 Nm', 'FWD', '50.00', '4-star', '5 years/unlimited miles', 'Elegant sedan offering comfort, performance, and advanced safety features.'),
(47, 'Lexus', 'ES', '542000.00', 2024, 'I4', '2.5L', 'Petrol', 'Automatic', 5, '30 mpg', 'Sedan', 131, '8.0', '203 lb-ft', 'FWD', '15.90', '5-star', '4 years/50,000 miles', 'Luxury sedan with refined styling, comfort, and advanced technology.'),
(48, 'Lexus', 'LC 500h', '600000.00', 2024, 'V6', '3.5L', 'Hybrid', 'Automatic', 4, '30 mpg', 'Coupe', 168, '4.7', '348 lb-ft', 'RWD', '22.20', '5-star', '4 years/50,000 miles', 'High-performance hybrid coupe combining luxury and efficiency.'),
(49, 'Lexus', 'LM', '620000.00', 2024, 'V6', '3.5L', 'Petrol', 'Automatic', 4, '24 mpg', 'MPV', 145, '7.0', '361 lb-ft', 'AWD', '87.00', '5-star', '4 years/50,000 miles', 'Luxury multi-purpose vehicle (MPV) with opulent interior and advanced features.'),
(50, 'Lexus', 'LX', '598000.00', 2024, 'V8', '5.7L', 'Petrol', 'Automatic', 5, '16 mpg', 'SUV', 137, '7.2', '403 lb-ft', 'AWD', '24.60', '5-star', '4 years/50,000 miles', 'Full-size luxury SUV known for its robustness and comfort.'),
(51, 'Lexus', 'NX 2022', '545000.00', 2024, 'I4', '2.5L', 'Petrol', 'Automatic', 5, '29 mpg', 'SUV', 127, '7.1', '176 lb-ft', 'AWD', '14.50', '5-star', '4 years/50,000 miles', 'Compact SUV offering a blend of luxury, efficiency, and innovative technology.'),
(52, 'Lexus', 'RX', '552000.00', 2024, 'V6', '3.5L', 'Petrol', 'Automatic', 5, '28 mpg', 'SUV', 124, '7.7', '267 lb-ft', 'AWD', '19.20', '5-star', '4 years/50,000 miles', 'Mid-size luxury SUV with spacious interior and advanced safety features.'),
(53, 'Mercedes-Benz', 'AMG GLA 35', '552000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '25 mpg', 'SUV', 155, '5.1', '295 lb-ft', 'AWD', '15.60', '5-star', '4 years/50,000 miles', 'High-performance compact SUV with AMG-enhanced dynamics and luxury features.'),
(54, 'Mercedes-Benz', 'AMG GLE 53', '578000.00', 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 5, '22 mpg', 'SUV', 174, '5.2', '384 lb-ft', 'AWD', '22.50', '5-star', '4 years/50,000 miles', 'Sporty and powerful SUV with AMG performance and advanced technology.'),
(55, 'Mercedes-Benz', 'C-Class', '546000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '27 mpg', 'Sedan', 155, '5.7', '273 lb-ft', 'RWD', '17.40', '5-star', '4 years/50,000 miles', 'Compact luxury sedan offering comfort, style, and cutting-edge features.'),
(56, 'Mercedes-Benz', 'E-Class', '557000.00', 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 5, '26 mpg', 'Sedan', 155, '5.8', '362 lb-ft', 'AWD', '21.10', '5-star', '4 years/50,000 miles', 'Executive sedan known for its elegance, performance, and innovative technology.'),
(57, 'Mercedes-Benz', 'GLA', '540000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '28 mpg', 'SUV', 143, '6.6', '258 lb-ft', 'AWD', '13.70', '5-star', '4 years/50,000 miles', 'Compact SUV combining versatility with luxurious features and advanced safety.'),
(58, 'Mercedes-Benz', 'GLC', '550000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '27 mpg', 'SUV', 140, '6.1', '273 lb-ft', 'AWD', '17.40', '5-star', '4 years/50,000 miles', 'Mid-size SUV offering premium comfort, agility, and advanced technology.'),
(59, 'Mercedes-Benz', 'GLE', '567000.00', 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 5, '24 mpg', 'SUV', 155, '5.2', '369 lb-ft', 'AWD', '21.10', '5-star', '4 years/50,000 miles', 'Luxurious SUV with spacious interior, powerful performance, and state-of-the-art features.'),
(60, 'Mercedes-Benz', 'GLS', '590000.00', 2024, 'V8', '4.0L', 'Petrol', 'Automatic', 7, '21 mpg', 'SUV', 180, '5.3', '627 lb-ft', 'AWD', '23.80', '5-star', '4 years/50,000 miles', 'Full-size SUV offering unparalleled luxury, comfort, and cutting-edge technology.'),
(61, 'Mercedes-Benz', 'Maybach GLS', '680000.00', 2024, 'V8', '4.0L', 'Petrol', 'Automatic', 5, '20 mpg', 'SUV', 155, '4.8', '627 lb-ft', 'AWD', '25.40', '5-star', '4 years/50,000 miles', 'Ultra-luxury SUV with exclusive amenities and exceptional craftsmanship.'),
(62, 'Mercedes-Benz', 'S-Class', '610000.00', 2024, 'V8', '4.0L', 'Petrol', 'Automatic', 5, '22 mpg', 'Sedan', 155, '4.4', '700 lb-ft', 'AWD', '23.80', '5-star', '4 years/50,000 miles', 'Flagship sedan setting standards in luxury, comfort, and advanced technology.'),
(63, 'Porsche', '718', '561000.00', 2024, 'H6', '4.0L', 'Petrol', 'Automatic', 2, '24 mpg', 'Coupe', 182, '4.0', '317 lb-ft', 'RWD', '16.90', '5-star', '4 years/50,000 miles', 'Iconic sports car with superb handling and exhilarating performance.'),
(64, 'Porsche', '911', '602100.00', 2024, 'H6', '3.0L', 'Petrol', 'Automatic', 4, '23 mpg', 'Coupe', 191, '3.1', '331 lb-ft', 'AWD', '16.90', '5-star', '4 years/50,000 miles', 'Legendary sports car known for its timeless design and dynamic driving experience.'),
(65, 'Porsche', 'Cayenne', '569000.00', 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 5, '23 mpg', 'SUV', 152, '5.9', '332 lb-ft', 'AWD', '23.70', '5-star', '4 years/50,000 miles', 'Luxury SUV offering sporty performance and off-road capability.'),
(66, 'Porsche', 'Cayenne Coupe', '574000.00', 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 5, '22 mpg', 'SUV', 151, '5.7', '332 lb-ft', 'AWD', '23.70', '5-star', '4 years/50,000 miles', 'Sleek and sporty SUV coupe combining style with Porsche performance.'),
(67, 'Porsche', 'Macan', '557000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '23 mpg', 'SUV', 141, '6.1', '273 lb-ft', 'AWD', '19.80', '5-star', '4 years/50,000 miles', 'Compact SUV offering agility, comfort, and Porsche driving dynamics.'),
(68, 'Porsche', 'Macan Turbo EV', '605000.00', 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '250+ miles', 'SUV', 160, '3.5', 'NA', 'AWD', '0.00', '5-star', '4 years/50,000 miles', 'High-performance electric SUV combining Porsche heritage with sustainable mobility.'),
(69, 'Porsche', 'Panamera', '589000.00', 2024, 'V6', '2.9L', 'Petrol', 'Automatic', 4, '23 mpg', 'Sedan', 180, '4.2', '405 lb-ft', 'AWD', '23.70', '5-star', '4 years/50,000 miles', 'Luxury sedan offering power, elegance, and cutting-edge technology.'),
(70, 'Porsche', 'Taycan', '610000.00', 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 4, '250+ miles', 'Sedan', 161, '3.0', 'NA', 'AWD', '0.00', '5-star', '4 years/50,000 miles', 'Electric sports sedan with blistering acceleration and Porsche performance DNA.'),
(71, 'Porsche', 'Taycan Cross Turismo', '615000.00', 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '250+ miles', 'Wagon', 155, '3.1', 'NA', 'AWD', '0.00', '5-star', '4 years/50,000 miles', 'Electric sport wagon offering versatility, performance, and cutting-edge technology.'),
(72, 'Tesla', 'Cybertruck', '7500000.00', 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 6, '250+ miles', 'Pickup', 120, '6.5', 'NA', 'AWD', '0.00', '5-star', '4 years/50,000 miles', 'Electric pickup truck with futuristic design and impressive capabilities.'),
(73, 'Tesla', 'Model 3', '547000.00', 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '300+ miles', 'Sedan', 140, '4.0', 'NA', 'AWD', '0.00', '5-star', '4 years/50,000 miles', 'Affordable electric sedan known for its range, performance, and technology.'),
(74, 'Tesla', 'Model S', '592000.00', 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '370+ miles', 'Sedan', 200, '3.1', 'NA', 'AWD', '0.00', '5-star', '4 years/50,000 miles', 'Flagship electric sedan offering luxury, speed, and cutting-edge features.'),
(76, 'Tesla', 'Model Y', '552000.00', 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '300+ miles', 'SUV', 135, '4.8', 'NA', 'AWD', '0.00', '5-star', '4 years/50,000 miles', 'Compact electric SUV offering versatility, efficiency, and advanced technology.'),
(77, 'Toyota', 'Camry_1', '526000.00', 2024, 'I4', '2.5L', 'Petrol', 'Automatic', 5, '39 mpg', 'Sedan', 135, '7.5', '184 lb-ft', 'FWD', '15.80', '5-star', '3 years/36,000 miles', 'Reliable sedan with a focus on comfort, efficiency, and advanced technology.'),
(78, 'Toyota', 'Fortuner', '536200.00', 2024, 'I4', '2.8L', 'Diesel', 'Automatic', 7, '30 mpg', 'SUV', 115, '11.2', '295 lb-ft', 'AWD', '19.00', '5-star', '3 years/36,000 miles', 'Robust SUV built for off-road adventures and spacious family travel.'),
(79, 'Toyota', 'Fortuner Legender', '539200.00', 2024, 'I4', '2.8L', 'Diesel', 'Automatic', 7, '30 mpg', 'SUV', 115, '11.2', '295 lb-ft', 'AWD', '19.00', '5-star', '3 years/36,000 miles', 'Premium variant of the Fortuner with enhanced styling and luxury features.'),
(80, 'Toyota', 'Hilux', '532000.00', 2024, 'I4', '2.8L', 'Diesel', 'Automatic', 5, '30 mpg', 'Pickup', 108, '10.5', '295 lb-ft', '4WD', '19.00', '5-star', '3 years/36,000 miles', 'Durable pickup truck known for reliability, ruggedness, and off-road capability.'),
(81, 'Toyota', 'Innova Crysta', '529000.00', 2024, 'I4', '2.7L', 'Petrol', 'Automatic', 7, '35 mpg', 'MPV', 115, '11.3', '181 lb-ft', 'FWD', '17.00', '5-star', '3 years/36,000 miles', 'Spacious and versatile MPV offering comfort, reliability, and family-friendly features.'),
(82, 'Toyota', 'Land Cruiser 300', '585000.00', 2024, 'V6', '3.5L', 'Petrol', 'Automatic', 8, '20 mpg', 'SUV', 130, '6.7', '409 lb-ft', 'AWD', '23.00', '5-star', '3 years/36,000 miles', 'Iconic SUV with legendary off-road capabilities, luxury features, and robust performance.'),
(83, 'Toyota', 'Rumion', '525000.00', 2024, 'I4', '1.8L', 'Petrol', 'Automatic', 5, '33 mpg', 'Hatchback', 110, '10.5', '130 lb-ft', 'FWD', '12.00', '5-star', '3 years/36,000 miles', 'Compact hatchback with practicality, fuel efficiency, and Toyota reliability.'),
(84, 'Toyota', 'Taisor', '531000.00', 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '31 mpg', 'SUV', 120, '9.8', '150 lb-ft', 'FWD', '15.00', '5-star', '3 years/36,000 miles', 'Compact SUV designed for urban adventures with modern features and comfort.'),
(85, 'Toyota', 'Urban Cruiser Hyryder', '523000.00', 2024, 'I4', '1.5L', 'Petrol', 'Automatic', 5, '32 mpg', 'SUV', 110, '12.0', '105 lb-ft', 'FWD', '15.00', '5-star', '3 years/36,000 miles', 'Stylish and compact SUV offering efficiency, versatility, and Toyota s renowned reliability.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatbot_responses`
--
ALTER TABLE `chatbot_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbot_responses`
--
ALTER TABLE `chatbot_responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicle_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
