SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT(10) AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(25),
    customer_email VARCHAR(50) UNIQUE,
    customer_password VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS vehicles (
    vehicle_id INT(10) AUTO_INCREMENT PRIMARY KEY,
    vehicle_brandname VARCHAR(100),
    vehicle_modelname VARCHAR(100),
    vehicle_price DECIMAL(10, 2),
    vehicle_year INT(4),
    vehicle_enginetype VARCHAR(50),
    vehicle_enginecapacity VARCHAR(20),
    vehicle_fueltype VARCHAR(50),
    vehicle_transmission VARCHAR(50),
    vehicle_seatingcapacity INT(2),
    vehicle_mileage VARCHAR(50),
    vehicle_bodytype VARCHAR(50),
    vehicle_topspeed INT(3),
    vehicle_acceleration DECIMAL(3, 1),
    vehicle_torque VARCHAR(50),
    vehicle_drivetrain VARCHAR(50),
    vehicle_fuelcapacity DECIMAL(5, 2),
    vehicle_safetyrating VARCHAR(20),
    vehicle_warranty VARCHAR(50),
    vehicle_description TEXT
);

CREATE TABLE IF NOT EXISTS sales (
    sale_id INT(10) AUTO_INCREMENT PRIMARY KEY,
    customer_id INT(10),
    vehicle_id INT(10),
    sale_date DATE,
    sale_price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS payments (
    payment_id INT(10) AUTO_INCREMENT PRIMARY KEY,
    sale_id INT(10),
    payment_date DATE,
    payment_amount DECIMAL(10, 2),
    payment_method VARCHAR(100),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS images (
    image_id INT(10) AUTO_INCREMENT PRIMARY KEY,
    image_name VARCHAR(255),
    vehicle_id INT(10),
    image_path VARCHAR(255),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id) ON DELETE CASCADE
);


-- Insert sample data into customers table
INSERT INTO customers (customer_name, customer_email, customer_password) VALUES
('Harish', 'harish@example.com', 'harish123'),
('Ajai', 'ajai@example.com', 'ajai123'),
('Karthik', 'karthik@example.com', 'karthik123'),
('Vignesh', 'vignesh@example.com', 'vignesh123'),
('Dinesh', 'dinesh@example.com', 'dinesh123');


INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, vehicle_safetyrating, vehicle_warranty, vehicle_description)
VALUES
('Audi', 'A4', 39100, 2024, 'V4', '2.0L', 'Petrol', 'Automatic', 5, '26 mpg', 'Sedan', 130, 5.6, '295 lb-ft', 'AWD', 15.6, '5-star', '4 years/50,000 miles', 'Compact executive sedan with a blend of performance and luxury.'),
('Audi', 'A6', 54900, 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 5, '25 mpg', 'Sedan', 155, 5.1, '369 lb-ft', 'AWD', 19.3, '5-star', '4 years/50,000 miles', 'Luxurious mid-size sedan with advanced technology and comfort features.'),
('Audi', 'e-tron GT', 99900, 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '250+ miles', 'Sedan', 155, 3.9, '630 lb-ft', 'AWD', 'N/A', '5-star', '4 years/50,000 miles', 'High-performance electric sedan with cutting-edge design and technology.'),
('Audi', 'Q3', 38200, 2024, 'V4', '2.0L', 'Petrol', 'Automatic', 5, '28 mpg', 'SUV', 130, 7.0, '258 lb-ft', 'AWD', 15.9, '5-star', '4 years/50,000 miles', 'Compact luxury SUV ideal for urban adventures.'),
('Audi', 'Q3 Sportback', 40200, 2024, 'V4', '2.0L', 'Petrol', 'Automatic', 5, '27 mpg', 'SUV', 130, 6.9, '258 lb-ft', 'AWD', 16.3, '5-star', '4 years/50,000 miles', 'Sporty and stylish compact SUV coupe.'),
('Audi', 'Q5', 44100, 2024, 'V4', '2.0L', 'Petrol', 'Automatic', 5, '27 mpg', 'SUV', 130, 5.7, '273 lb-ft', 'AWD', 18.5, '5-star', '4 years/50,000 miles', 'Versatile and spacious mid-size luxury SUV.'),
('Audi', 'Q7', 60400, 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 7, '25 mpg', 'SUV', 130, 5.7, '369 lb-ft', 'AWD', 22.5, '5-star', '4 years/50,000 miles', 'Luxurious and powerful full-size SUV with advanced features.'),
('Audi', 'Q8', 68900, 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 5, '24 mpg', 'SUV', 155, 5.6, '369 lb-ft', 'AWD', 22.5, '5-star', '4 years/50,000 miles', 'Flagship SUV combining elegance with dynamic performance.'),
('Audi', 'RS5', 76850, 2024, 'V6', '2.9L', 'Petrol', 'Automatic', 5, '23 mpg', 'Coupe', 174, 3.7, '443 lb-ft', 'AWD', 15.3, '5-star', '4 years/50,000 miles', 'High-performance coupe delivering exhilarating driving dynamics.'),
('Audi', 'S5 Sportback', 60000, 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 5, '24 mpg', 'Sedan', 155, 4.5, '369 lb-ft', 'AWD', 15.3, '5-star', '4 years/50,000 miles', 'Sporty and sophisticated sedan with enhanced performance.');

INSERT INTO images (image_name, vehicle_id, image_path)
VALUES
('A4', 1, 'image/audi/a4.jpeg'),
('A6', 2, 'image/audi/a6.jpeg'),
('e-tron GT', 3, 'image/audi/e-tron-gt.jpeg'),
('Q3', 4, 'image/audi/q3.jpeg'),
('Q3 Sportback', 5, 'image/audi/q3-sportback.jpeg'),
('Q5', 6, 'image/audi/q5.jpeg'),
('Q7', 7, 'image/audi/q7.jpeg'),
('Q8', 8, 'image/audi/q8.jpeg'),
('RS5', 9, 'image/audi/rs5.jpeg'),
('S5 Sportback', 10, 'image/audi/s5-sportback.jpeg');


INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, vehicle_safetyrating, vehicle_warranty, vehicle_description)
VALUES
('BMW', '2 Series Gran Coupe', 38000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '27 mpg', 'Coupe', 155, 6.0, '258 lb-ft', 'AWD', 13.7, '5-star', '4 years/50,000 miles', 'Sporty compact coupe with modern design and agile performance.'),
('BMW', '3 Series Gran Limousine', 45000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '28 mpg', 'Sedan', 155, 5.8, '295 lb-ft', 'AWD', 15.6, '5-star', '4 years/50,000 miles', 'Luxury sedan with extended wheelbase offering superior comfort and advanced technology.'),
('BMW', '7 Series', 87000, 2024, 'V8', '4.4L', 'Petrol', 'Automatic', 5, '24 mpg', 'Sedan', 155, 4.3, '553 lb-ft', 'AWD', 20.6, '5-star', '4 years/50,000 miles', 'Flagship luxury sedan known for its opulence, performance, and cutting-edge features.'),
('BMW', 'M4 Competition', 76000, 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 4, '22 mpg', 'Coupe', 180, 3.8, '479 lb-ft', 'AWD', 15.6, '5-star', '4 years/50,000 miles', 'High-performance sports coupe with aggressive styling and exceptional driving dynamics.'),
('BMW', 'M8', 132000, 2024, 'V8', '4.4L', 'Petrol', 'Automatic', 4, '20 mpg', 'Coupe', 190, 3.0, '553 lb-ft', 'AWD', 20.6, '5-star', '4 years/50,000 miles', 'Luxury grand tourer with powerful performance and sophisticated interior.'),
('BMW', 'M340i', 58000, 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 5, '26 mpg', 'Sedan', 155, 4.1, '369 lb-ft', 'AWD', 15.6, '5-star', '4 years/50,000 miles', 'Sporty sedan with enhanced performance and modern design cues.'),
('BMW', 'X1', 38000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '28 mpg', 'SUV', 155, 6.3, '258 lb-ft', 'AWD', 16.2, '5-star', '4 years/50,000 miles', 'Compact luxury SUV perfect for urban environments.'),
('BMW', 'X7', 75000, 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 7, '21 mpg', 'SUV', 155, 5.4, '553 lb-ft', 'AWD', 21.9, '5-star', '4 years/50,000 miles', 'Spacious and luxurious SUV offering top-tier comfort and advanced technology.'),
('BMW', 'XM', 95000, 2024, 'V8', '4.4L', 'Petrol', 'Automatic', 5, '20 mpg', 'SUV', 155, 3.8, '553 lb-ft', 'AWD', 21.9, '5-star', '4 years/50,000 miles', 'High-performance SUV with M-series dynamics and premium amenities.'),
('BMW', 'Z4', 50000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 2, '29 mpg', 'Roadster', 155, 5.2, '295 lb-ft', 'RWD', 13.7, '5-star', '4 years/50,000 miles', 'Iconic roadster with sleek design and exhilarating driving experience.');

-- Inserting images for BMW vehicles
INSERT INTO images (image_name, vehicle_id, image_path)
VALUES
('2 Series Gran Coupe', 11, 'image/bmw/2-series-gran-coupe.jpeg'),
('3 Series Gran Limousine', 12, 'image/bmw/3-series-gran-limousine.jpeg'),
('7 Series', 13, 'image/bmw/7-series.jpeg'),
('M4 Competition', 14, 'image/bmw/m4-competition.jpeg'),
('M8', 15, 'image/bmw/m8.jpeg'),
('M340i', 16, 'image/bmw/m340i.jpeg'),
('X1', 17, 'image/bmw/x1.jpeg'),
('X7', 18, 'image/bmw/x7.jpeg'),
('XM', 19, 'image/bmw/xm.jpeg'),
('Z4', 20, 'image/bmw/z4.jpeg');

INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, vehicle_safetyrating, vehicle_warranty, vehicle_description)
VALUES
('Ferrari', '296 GTB', 300000, 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 2, '22 mpg', 'Coupe', 205, 2.9, '568 lb-ft', 'RWD', 20.6, '5-star', '3 years/unlimited miles', 'Mid-engine supercar combining style, speed, and cutting-edge technology.'),
('Ferrari', '296 GTS', 350000, 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 2, '21 mpg', 'Convertible', 205, 2.9, '568 lb-ft', 'RWD', 20.6, '5-star', '3 years/unlimited miles', 'Open-top sports car offering exhilarating driving experience and iconic design.'),
('Ferrari', 'F8 Tributo', 300000, 2024, 'V8', '3.9L', 'Petrol', 'Automatic', 2, '19 mpg', 'Coupe', 211, 2.9, '568 lb-ft', 'RWD', 20.6, '5-star', '3 years/unlimited miles', 'High-performance V8 supercar with striking design and advanced aerodynamics.'),
('Ferrari', 'Portofino', 220000, 2024, 'V8', '3.9L', 'Petrol', 'Automatic', 2, '20 mpg', 'Convertible', 199, 3.2, '568 lb-ft', 'RWD', 20.6, '5-star', '3 years/unlimited miles', 'Elegant grand tourer convertible combining luxury and exhilarating performance.'),
('Ferrari', 'Purosangue SUV', 350000, 2024, 'V8', '4.0L', 'Petrol', 'Automatic', 5, '18 mpg', 'SUV', 185, 3.5, '640 lb-ft', 'AWD', 25.4, '5-star', '3 years/unlimited miles', 'First-ever Ferrari SUV delivering sports car dynamics with SUV versatility.'),
('Ferrari', 'Roma', 250000, 2024, 'V8', '3.9L', 'Petrol', 'Automatic', 2, '19 mpg', 'Coupe', 199, 3.3, '568 lb-ft', 'RWD', 20.6, '5-star', '3 years/unlimited miles', 'Timeless grand tourer coupe with sophisticated design and impressive performance.');

-- Inserting images for Ferrari vehicles
INSERT INTO images (image_name, vehicle_id, image_path)
VALUES
('296 GTB', 21, 'image/ferrari/296-gtb.jpeg'),
('296 GTS', 22, 'image/ferrari/296-gts.jpeg'),
('F8 Tributo', 23, 'image/ferrari/f8-tributo.jpeg'),
('Portofino', 24, 'image/ferrari/portofino.jpeg'),
('Purosangue SUV', 25, 'image/ferrari/purosangue-suv.jpeg'),
('Roma', 26, 'image/ferrari/roma.jpeg');

INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, vehicle_safetyrating, vehicle_warranty, vehicle_description)
VALUES
('Ford', 'Aspire', 10000, 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '18 km/l', 'Sedan', 150, 15.0, '90 Nm', 'FWD', 42, '4-star', '3 years/100,000 km', 'Compact sedan known for its affordability and fuel efficiency.'),
('Ford', 'Classic', 15000, 2024, 'I4', '1.6L', 'Petrol', 'Manual', 5, '15 km/l', 'Sedan', 160, 13.0, '120 Nm', 'FWD', 45, '3-star', '3 years/100,000 km', 'Basic sedan offering practicality and reliable performance.'),
('Ford', 'EcoSport', 20000, 2024, 'I3', '1.0L', 'Petrol', 'Automatic', 5, '17 km/l', 'SUV', 170, 12.5, '95 Nm', 'FWD', 52, '4-star', '3 years/100,000 km', 'Compact SUV with rugged styling and versatile features.'),
('Ford', 'Endeavour', 35000, 2024, 'I4', '2.0L', 'Diesel', 'Automatic', 7, '13 km/l', 'SUV', 180, 10.0, '420 Nm', '4WD', 80, '5-star', '3 years/100,000 km', 'Full-size SUV known for its robustness and off-road capabilities.'),
('Ford', 'Fiesta', 18000, 2024, 'I4', '1.5L', 'Petrol', 'Automatic', 5, '16 km/l', 'Hatchback', 185, 11.0, '115 Nm', 'FWD', 50, '4-star', '3 years/100,000 km', 'Compact hatchback offering agile handling and modern features.'),
('Ford', 'Figo', 15000, 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '18 km/l', 'Hatchback', 170, 12.0, '100 Nm', 'FWD', 40, '3-star', '3 years/100,000 km', 'Affordable hatchback with practical design and efficient performance.'),
('Ford', 'Freestyle', 19000, 2024, 'I3', '1.2L', 'Petrol', 'Manual', 5, '17 km/l', 'Crossover', 175, 11.5, '96 Nm', 'FWD', 45, '3-star', '3 years/100,000 km', 'Cross-hatch with rugged styling and enhanced ground clearance.'),
('Ford', 'Ikon', 16000, 2024, 'I4', '1.3L', 'Petrol', 'Manual', 5, '16 km/l', 'Sedan', 165, 12.5, '110 Nm', 'FWD', 43, '3-star', '3 years/100,000 km', 'Compact sedan offering practicality and comfort.'),
('Ford', 'Mondeo', 28000, 2024, 'I4', '2.0L', 'Diesel', 'Automatic', 5, '15 km/l', 'Sedan', 190, 9.5, '350 Nm', 'FWD', 60, '4-star', '3 years/100,000 km', 'Executive sedan known for its refined interior and advanced features.'),
('Ford', 'Mustang', 50000, 2024, 'V8', '5.0L', 'Petrol', 'Automatic', 4, '14 km/l', 'Coupe', 250, 4.5, '529 Nm', 'RWD', 61, '5-star', '3 years/100,000 km', 'Legendary sports car with iconic design and exhilarating performance.');


-- Inserting images for Ford vehicles
INSERT INTO images (image_name, vehicle_id, image_path)
VALUES
('Aspire', 27, 'image/ford/aspire.jpeg'),
('Classic', 28, 'image/ford/classic.jpg'),
('EcoSport', 29, 'image/ford/ecosport.jpg'),
('Endeavour', 30, 'image/ford/endeavour.jpeg'),
('Fiesta', 31, 'image/ford/fiesta.jpg'),
('Figo', 32, 'image/ford/figo.jpeg'),
('Freestyle', 33, 'image/ford/freestyle.jpeg'),
('Ikon', 34, 'image/ford/ikon.jpg'),
('Mondeo', 35, 'image/ford/mondeo.jpg'),
('Mustang', 36, 'image/ford/mustang.jpg');

INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, vehicle_safetyrating, vehicle_warranty, vehicle_description)
VALUES
('Hyundai', 'Alcazar', 25000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 7, '14 km/l', 'SUV', 185, 10.0, '191 Nm', 'FWD', 60, '4-star', '5 years/unlimited miles', 'Spacious SUV with flexible seating and advanced connectivity features.'),
('Hyundai', 'Aura', 13000, 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '20 km/l', 'Sedan', 165, 12.0, '115 Nm', 'FWD', 45, '3-star', '5 years/unlimited miles', 'Compact sedan offering comfort and efficiency for urban driving.'),
('Hyundai', 'Creta', 20000, 2024, 'I4', '1.5L', 'Petrol', 'Automatic', 5, '17 km/l', 'SUV', 180, 11.0, '144 Nm', 'FWD', 50, '4-star', '5 years/unlimited miles', 'Popular compact SUV known for its modern design and feature-rich interior.'),
('Hyundai', 'Creta N Line', 23000, 2024, 'I4', '1.4L', 'Petrol', 'Automatic', 5, '16 km/l', 'SUV', 185, 10.5, '242 Nm', 'FWD', 52, '4-star', '5 years/unlimited miles', 'Sporty variant of the Creta SUV with enhanced performance and dynamic styling.'),
('Hyundai', 'Exter', 18000, 2024, 'I4', '1.3L', 'Petrol', 'Manual', 5, '18 km/l', 'Hatchback', 170, 11.5, '110 Nm', 'FWD', 45, '3-star', '5 years/unlimited miles', 'Compact hatchback designed for urban mobility and efficiency.'),
('Hyundai', 'Grand i10 Nios', 14000, 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '19 km/l', 'Hatchback', 165, 12.0, '114 Nm', 'FWD', 42, '3-star', '5 years/unlimited miles', 'Feature-packed hatchback offering comfort and convenience for city driving.'),
('Hyundai', 'i20', 16000, 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '20 km/l', 'Hatchback', 170, 11.9, '115 Nm', 'FWD', 45, '4-star', '5 years/unlimited miles', 'Premium hatchback with sophisticated design and advanced safety features.'),
('Hyundai', 'Tucson', 25000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '16 km/l', 'SUV', 190, 10.0, '192 Nm', 'AWD', 58, '5-star', '5 years/unlimited miles', 'Stylish SUV with cutting-edge technology and spacious interior.'),
('Hyundai', 'Venue', 15000, 2024, 'I4', '1.2L', 'Petrol', 'Manual', 5, '18 km/l', 'SUV', 175, 12.0, '115 Nm', 'FWD', 45, '4-star', '5 years/unlimited miles', 'Compact SUV with bold design and smart features ideal for urban adventures.'),
('Hyundai', 'Verna', 18000, 2024, 'I4', '1.5L', 'Petrol', 'Automatic', 5, '19 km/l', 'Sedan', 180, 10.5, '145 Nm', 'FWD', 50, '4-star', '5 years/unlimited miles', 'Elegant sedan offering comfort, performance, and advanced safety features.');

-- Inserting images for Hyundai vehicles
INSERT INTO images (image_name, vehicle_id, image_path)
VALUES
('Alcazar', 37, 'image/hyundai/alcazar.jpeg'),
('Aura', 38, 'image/hyundai/aura.jpeg'),
('Creta', 39, 'image/hyundai/creta.png'),
('Creta N Line', 40, 'image/hyundai/creta-n-line.png'),
('Exter', 41, 'image/hyundai/exter.jpeg'),
('Grand i10 Nios', 42, 'image/hyundai/grand-i10-nios.jpeg'),
('i20', 43, 'image/hyundai/i20.jpeg'),
('Tucson', 44, 'image/hyundai/tucson.jpeg'),
('Venue', 45, 'image/hyundai/venue.jpeg'),
('Verna', 46, 'image/hyundai/verna.jpeg');

INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, vehicle_safetyrating, vehicle_warranty, vehicle_description)
VALUES
('Lexus', 'ES', 42000, 2024, 'I4', '2.5L', 'Petrol', 'Automatic', 5, '30 mpg', 'Sedan', 131, 8.0, '203 lb-ft', 'FWD', 15.9, '5-star', '4 years/50,000 miles', 'Luxury sedan with refined styling, comfort, and advanced technology.'),
('Lexus', 'LC 500h', 100000, 2024, 'V6', '3.5L', 'Hybrid', 'Automatic', 4, '30 mpg', 'Coupe', 168, 4.7, '348 lb-ft', 'RWD', 22.2, '5-star', '4 years/50,000 miles', 'High-performance hybrid coupe combining luxury and efficiency.'),
('Lexus', 'LM', 120000, 2024, 'V6', '3.5L', 'Petrol', 'Automatic', 4, '24 mpg', 'MPV', 145, 7.0, '361 lb-ft', 'AWD', 87, '5-star', '4 years/50,000 miles', 'Luxury multi-purpose vehicle (MPV) with opulent interior and advanced features.'),
('Lexus', 'LX', 98000, 2024, 'V8', '5.7L', 'Petrol', 'Automatic', 5, '16 mpg', 'SUV', 137, 7.2, '403 lb-ft', 'AWD', 24.6, '5-star', '4 years/50,000 miles', 'Full-size luxury SUV known for its robustness and comfort.'),
('Lexus', 'NX 2022', 45000, 2024, 'I4', '2.5L', 'Petrol', 'Automatic', 5, '29 mpg', 'SUV', 127, 7.1, '176 lb-ft', 'AWD', 14.5, '5-star', '4 years/50,000 miles', 'Compact SUV offering a blend of luxury, efficiency, and innovative technology.'),
('Lexus', 'RX', 52000, 2024, 'V6', '3.5L', 'Petrol', 'Automatic', 5, '28 mpg', 'SUV', 124, 7.7, '267 lb-ft', 'AWD', 19.2, '5-star', '4 years/50,000 miles', 'Mid-size luxury SUV with spacious interior and advanced safety features.');

-- Inserting images for Lexus vehicles
INSERT INTO images (image_name, vehicle_id, image_path)
VALUES
('ES', 47, 'image/lexus/es.jpeg'),
('LC 500h', 48, 'image/lexus/lc-500h.jpeg'),
('LM', 49, 'image/lexus/lm.png'),
('LX', 50, 'image/lexus/lx.jpeg'),
('NX 2022', 51, 'image/lexus/nx-2022.jpeg'),
('RX', 52, 'image/lexus/rx.jpeg');


INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, vehicle_safetyrating, vehicle_warranty, vehicle_description)
VALUES
('Mercedes-Benz', 'AMG GLA 35', 52000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '25 mpg', 'SUV', 155, 5.1, '295 lb-ft', 'AWD', 15.6, '5-star', '4 years/50,000 miles', 'High-performance compact SUV with AMG-enhanced dynamics and luxury features.'),
('Mercedes-Benz', 'AMG GLE 53', 78000, 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 5, '22 mpg', 'SUV', 174, 5.2, '384 lb-ft', 'AWD', 22.5, '5-star', '4 years/50,000 miles', 'Sporty and powerful SUV with AMG performance and advanced technology.'),
('Mercedes-Benz', 'C-Class', 46000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '27 mpg', 'Sedan', 155, 5.7, '273 lb-ft', 'RWD', 17.4, '5-star', '4 years/50,000 miles', 'Compact luxury sedan offering comfort, style, and cutting-edge features.'),
('Mercedes-Benz', 'E-Class', 57000, 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 5, '26 mpg', 'Sedan', 155, 5.8, '362 lb-ft', 'AWD', 21.1, '5-star', '4 years/50,000 miles', 'Executive sedan known for its elegance, performance, and innovative technology.'),
('Mercedes-Benz', 'GLA', 40000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '28 mpg', 'SUV', 143, 6.6, '258 lb-ft', 'AWD', 13.7, '5-star', '4 years/50,000 miles', 'Compact SUV combining versatility with luxurious features and advanced safety.'),
('Mercedes-Benz', 'GLC', 50000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '27 mpg', 'SUV', 140, 6.1, '273 lb-ft', 'AWD', 17.4, '5-star', '4 years/50,000 miles', 'Mid-size SUV offering premium comfort, agility, and advanced technology.'),
('Mercedes-Benz', 'GLE', 67000, 2024, 'I6', '3.0L', 'Petrol', 'Automatic', 5, '24 mpg', 'SUV', 155, 5.2, '369 lb-ft', 'AWD', 21.1, '5-star', '4 years/50,000 miles', 'Luxurious SUV with spacious interior, powerful performance, and state-of-the-art features.'),
('Mercedes-Benz', 'GLS', 90000, 2024, 'V8', '4.0L', 'Petrol', 'Automatic', 7, '21 mpg', 'SUV', 180, 5.3, '627 lb-ft', 'AWD', 23.8, '5-star', '4 years/50,000 miles', 'Full-size SUV offering unparalleled luxury, comfort, and cutting-edge technology.'),
('Mercedes-Benz', 'Maybach GLS', 180000, 2024, 'V8', '4.0L', 'Petrol', 'Automatic', 5, '20 mpg', 'SUV', 155, 4.8, '627 lb-ft', 'AWD', 25.4, '5-star', '4 years/50,000 miles', 'Ultra-luxury SUV with exclusive amenities and exceptional craftsmanship.'),
('Mercedes-Benz', 'S-Class', 110000, 2024, 'V8', '4.0L', 'Petrol', 'Automatic', 5, '22 mpg', 'Sedan', 155, 4.4, '700 lb-ft', 'AWD', 23.8, '5-star', '4 years/50,000 miles', 'Flagship sedan setting standards in luxury, comfort, and advanced technology.');

-- Inserting images for Mercedes-Benz vehicles
INSERT INTO images (image_name, vehicle_id, image_path)
VALUES
('AMG GLA 35', 53, 'image/mercedes-benz/amg-gla-35.jpeg'),
('AMG GLE 53', 54, 'image/mercedes-benz/amg-gle-53.jpg'),
('C-Class', 55, 'image/mercedes-benz/c-class.jpg'),
('E-Class', 56, 'image/mercedes-benz/e-class.jpg'),
('GLA', 57, 'image/mercedes-benz/gla.jpg'),
('GLC', 58, 'image/mercedes-benz/glc.jpg'),
('GLE', 59, 'image/mercedes-benz/gle.jpg'),
('GLS', 60, 'image/mercedes-benz/gls.jpg'),
('Maybach GLS', 61, 'image/mercedes-benz/maybach-gls.jpg'),
('S-Class', 62, 'image/mercedes-benz/s-class.jpg');


INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, vehicle_safetyrating, vehicle_warranty, vehicle_description)
VALUES
('Porsche', '718', 61000, 2024, 'H6', '4.0L', 'Petrol', 'Automatic', 2, '24 mpg', 'Coupe', 182, 4.0, '317 lb-ft', 'RWD', 16.9, '5-star', '4 years/50,000 miles', 'Iconic sports car with superb handling and exhilarating performance.'),
('Porsche', '911', 102100, 2024, 'H6', '3.0L', 'Petrol', 'Automatic', 4, '23 mpg', 'Coupe', 191, 3.1, '331 lb-ft', 'AWD', 16.9, '5-star', '4 years/50,000 miles', 'Legendary sports car known for its timeless design and dynamic driving experience.'),
('Porsche', 'Cayenne', 69000, 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 5, '23 mpg', 'SUV', 152, 5.9, '332 lb-ft', 'AWD', 23.7, '5-star', '4 years/50,000 miles', 'Luxury SUV offering sporty performance and off-road capability.'),
('Porsche', 'Cayenne Coupe', 74000, 2024, 'V6', '3.0L', 'Petrol', 'Automatic', 5, '22 mpg', 'SUV', 151, 5.7, '332 lb-ft', 'AWD', 23.7, '5-star', '4 years/50,000 miles', 'Sleek and sporty SUV coupe combining style with Porsche performance.'),
('Porsche', 'Macan', 57000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '23 mpg', 'SUV', 141, 6.1, '273 lb-ft', 'AWD', 19.8, '5-star', '4 years/50,000 miles', 'Compact SUV offering agility, comfort, and Porsche driving dynamics.'),
('Porsche', 'Macan Turbo EV', 105000, 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '250+ miles', 'SUV', 160, 3.5, 'NA', 'AWD', 'N/A', '5-star', '4 years/50,000 miles', 'High-performance electric SUV combining Porsche heritage with sustainable mobility.'),
('Porsche', 'Panamera', 89000, 2024, 'V6', '2.9L', 'Petrol', 'Automatic', 4, '23 mpg', 'Sedan', 180, 4.2, '405 lb-ft', 'AWD', 23.7, '5-star', '4 years/50,000 miles', 'Luxury sedan offering power, elegance, and cutting-edge technology.'),
('Porsche', 'Taycan', 110000, 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 4, '250+ miles', 'Sedan', 161, 3.0, 'NA', 'AWD', 'N/A', '5-star', '4 years/50,000 miles', 'Electric sports sedan with blistering acceleration and Porsche performance DNA.'),
('Porsche', 'Taycan Cross Turismo', 115000, 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '250+ miles', 'Wagon', 155, 3.1, 'NA', 'AWD', 'N/A', '5-star', '4 years/50,000 miles', 'Electric sport wagon offering versatility, performance, and cutting-edge technology.');

-- Inserting images for Porsche vehicles
INSERT INTO images (image_name, vehicle_id, image_path)
VALUES
('718', 63, 'image/porsche/718.jpeg'),
('911', 64, 'image/porsche/911.jpg'),
('Cayenne', 65, 'image/porsche/cayenne.jpeg'),
('Cayenne Coupe', 66, 'image/porsche/cayenne-coupe.jpeg'),
('Macan', 67, 'image/porsche/macan.jpeg'),
('Macan Turbo EV', 68, 'image/porsche/macan-turbo-ev.jpeg'),
('Panamera', 69, 'image/porsche/panamera.jpeg'),
('Taycan', 70, 'image/porsche/taycan.jpeg'),
('Taycan Cross Turismo', 71, 'image/porsche/taycan-cross-turismo.jpeg');

INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, vehicle_safetyrating, vehicle_warranty, vehicle_description) VALUES
('Tesla', 'Cybertruck', 70000, 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 6, '250+ miles', 'Pickup', 120, 6.5, 'NA', 'AWD', 'N/A', '5-star', '4 years/50,000 miles', 'Electric pickup truck with futuristic design and impressive capabilities.'),
('Tesla', 'Model 3', 47000, 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '300+ miles', 'Sedan', 140, 4.0, 'NA', 'AWD', 'N/A', '5-star', '4 years/50,000 miles', 'Affordable electric sedan known for its range, performance, and technology.'),
('Tesla', 'Model S', 92000, 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '370+ miles', 'Sedan', 200, 3.1, 'NA', 'AWD', 'N/A', '5-star', '4 years/50,000 miles', 'Flagship electric sedan offering luxury, speed, and cutting-edge features.'),
('Tesla', 'Model X', 95000, 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 7, '340+ miles', 'SUV', 155, 3.8, 'NA', 'AWD', 'N/A', '5-star', '4 years/50,000 miles', 'Electric SUV with falcon-wing doors and impressive performance.'),
('Tesla', 'Model Y', 52000, 2024, 'Electric', 'N/A', 'Electric', 'Automatic', 5, '300+ miles', 'SUV', 135, 4.8, 'NA', 'AWD', 'N/A', '5-star', '4 years/50,000 miles', 'Compact electric SUV offering versatility, efficiency, and advanced technology.');

-- Inserting images for Tesla vehicles
INSERT INTO images (image_name, vehicle_id, image_path)
VALUES
('Cybertruck', 72, 'image/tesla/cybertruck.png'),
('Model 3', 73, 'image/tesla/model3.png'),
('Model S', 74, 'image/tesla/models.png'),
('Model X', 75, 'image/tesla/modelx.png'),
('Model Y', 76, 'image/tesla/modely.png');


INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, vehicle_safetyrating, vehicle_warranty, vehicle_description) VALUES
('Toyota', 'Camry', 26000, 2024, 'I4', '2.5L', 'Petrol', 'Automatic', 5, '39 mpg', 'Sedan', 135, 7.5, '184 lb-ft', 'FWD', 15.8, '5-star', '3 years/36,000 miles', 'Reliable sedan with a focus on comfort, efficiency, and advanced technology.'),
('Toyota', 'Fortuner', 36200, 2024, 'I4', '2.8L', 'Diesel', 'Automatic', 7, '30 mpg', 'SUV', 115, 11.2, '295 lb-ft', 'AWD', 19.0, '5-star', '3 years/36,000 miles', 'Robust SUV built for off-road adventures and spacious family travel.'),
('Toyota', 'Fortuner Legender', 39200, 2024, 'I4', '2.8L', 'Diesel', 'Automatic', 7, '30 mpg', 'SUV', 115, 11.2, '295 lb-ft', 'AWD', 19.0, '5-star', '3 years/36,000 miles', 'Premium variant of the Fortuner with enhanced styling and luxury features.'),
('Toyota', 'Hilux', 32000, 2024, 'I4', '2.8L', 'Diesel', 'Automatic', 5, '30 mpg', 'Pickup', 108, 10.5, '295 lb-ft', '4WD', 19.0, '5-star', '3 years/36,000 miles', 'Durable pickup truck known for reliability, ruggedness, and off-road capability.'),
('Toyota', 'Innova Crysta', 29000, 2024, 'I4', '2.7L', 'Petrol', 'Automatic', 7, '35 mpg', 'MPV', 115, 11.3, '181 lb-ft', 'FWD', 17.0, '5-star', '3 years/36,000 miles', 'Spacious and versatile MPV offering comfort, reliability, and family-friendly features.'),
('Toyota', 'Land Cruiser 300', 85000, 2024, 'V6', '3.5L', 'Petrol', 'Automatic', 8, '20 mpg', 'SUV', 130, 6.7, '409 lb-ft', 'AWD', 23.0, '5-star', '3 years/36,000 miles', 'Iconic SUV with legendary off-road capabilities, luxury features, and robust performance.'),
('Toyota', 'Rumion', 25000, 2024, 'I4', '1.8L', 'Petrol', 'Automatic', 5, '33 mpg', 'Hatchback', 110, 10.5, '130 lb-ft', 'FWD', 12.0, '5-star', '3 years/36,000 miles', 'Compact hatchback with practicality, fuel efficiency, and Toyota reliability.'),
('Toyota', 'Taisor', 31000, 2024, 'I4', '2.0L', 'Petrol', 'Automatic', 5, '31 mpg', 'SUV', 120, 9.8, '150 lb-ft', 'FWD', 15.0, '5-star', '3 years/36,000 miles', 'Compact SUV designed for urban adventures with modern features and comfort.'),
('Toyota', 'Urban Cruiser Hyryder', 23000, 2024, 'I4', '1.5L', 'Petrol', 'Automatic', 5, '32 mpg', 'SUV', 110, 12.0, '105 lb-ft', 'FWD', 15.0, '5-star', '3 years/36,000 miles', 'Stylish and compact SUV offering efficiency, versatility, and Toyota s renowned reliability.'),
('Toyota', 'Vellfire', 70000, 2024, 'V6', '3.5L', 'Petrol', 'Automatic', 7, '28 mpg', 'MPV', 115, 7.5, '300 lb-ft', 'AWD', 18.0, '5-star', '3 years/36,000 miles', 'Luxurious and spacious MPV with premium amenities and advanced safety features.');

-- Inserting images for Toyota vehicles
INSERT INTO images (image_name, vehicle_id, image_path)
VALUES
('Camry', 77, 'image/toyota/camry.jpg'),
('Fortuner', 78, 'image/toyota/fortuner.jpg'),
('Fortuner Legender', 79, 'image/toyota/fortuner_legender.jpg'),
('Hilux', 80, 'image/toyota/hilux.jpg'),
('Innova Crysta', 81, 'image/toyota/innova_crysta.jpg'),
('Land Cruiser 300', 82, 'image/toyota/land_cruiser_300.jpg'),
('Rumion', 83, 'image/toyota/rumion.jpg'),
('Taisor', 84, 'image/toyota/taisor.jpg'),
('Urban Cruiser Hyryder', 85, 'image/toyota/urban_cruiser_hyryder.jpg'),
('Vellfire', 86, 'image/toyota/vellfire.jpg');


-- Insert sample data into sales table
INSERT INTO sales (customer_id, vehicle_id, sale_date, sale_price) VALUES
(1, 1, '2024-01-15', 15000.00),
(2, 2, '2024-02-10', 18000.00),
(3, 3, '2024-03-20', 20000.00),
(4, 1, '2024-04-05', 15500.00),
(5, 2, '2024-05-25', 17500.00);


-- Insert sample data into payments table
INSERT INTO payments (sale_id, payment_date, payment_amount, payment_method) VALUES
(1, '2024-01-15', 15000.00, 'Credit Card'),
(2, '2024-02-10', 18000.00, 'Bank Transfer'),
(3, '2024-03-20', 20000.00, 'Cash'),
(4, '2024-04-05', 15500.00, 'Credit Card'),
(5, '2024-05-25', 17500.00, 'Debit Card');


