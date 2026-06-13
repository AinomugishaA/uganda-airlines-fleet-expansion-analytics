-- 1. Creating a dedicated database for this project
DROP DATABASE IF EXISTS UgandaAviationDB;
CREATE DATABASE UgandaAviationDB;
USE UgandaAviationDB;

-- 2. Creating the Fleet Table
CREATE TABLE Fleet (
    AircraftID INT AUTO_INCREMENT PRIMARY KEY,
    Manufacturer VARCHAR(50),
    Model VARCHAR(50),
    Type VARCHAR(20), -- 'Passenger' or 'Cargo'
    Capacity INT,     -- Seats or cargo capacity in tons
    Status VARCHAR(50),
    Estimated_Cost_USD DECIMAL(12,2),
    Annual_Operating_Cost_USD DECIMAL(12,2),
    Annual_Expected_Revenue_USD DECIMAL(12,2)
);

-- 3. Creating the Routes Table
CREATE TABLE Routes (
    RouteID INT AUTO_INCREMENT PRIMARY KEY,
    Destination_City VARCHAR(50),
    Country VARCHAR(50),
    Distance_KM INT,
    Route_Type VARCHAR(20), -- 'Regional' or 'International'
    Target_Launch_Year INT
);

-- 4. Creating the Economic Impact Table
CREATE TABLE Economic_Impact (
    ImpactID INT AUTO_INCREMENT PRIMARY KEY,
    RouteID INT,
    Est_Annual_Tourism_Revenue_USD DECIMAL(12,2),
    Est_Cargo_Trade_Value_USD DECIMAL(12,2),
    GDP_Multiplier_Factor DECIMAL(3,2),
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

-- 5. Inserting Fleet data (The newly procured 10 planes + operational financials)
INSERT INTO Fleet (Manufacturer, Model, Type, Capacity, Status, Estimated_Cost_USD, Annual_Operating_Cost_USD, Annual_Expected_Revenue_USD) VALUES
('Boeing', '787 Dreamliner', 'Passenger', 294, 'On Order (2026 Deal)', 145000000.00, 18000000.00, 22000000.00),
('Boeing', '737 MAX', 'Passenger', 180, 'On Order (2026 Deal)', 95000000.00, 10000000.00, 13500000.00),
('Boeing', '767-300BCCF', 'Cargo', 50, 'On Order (2026 Deal)', 80000000.00, 12000000.00, 16000000.00),
('Boeing', '737-800BCF', 'Cargo', 22, 'On Order (2026 Deal)', 45000000.00, 6000000.00, 8500000.00);

-- 6. Inserting new expansion routes enabled by this procurement
INSERT INTO Routes (Destination_City, Country, Distance_KM, Route_Type, Target_Launch_Year) VALUES
('London-Gatwick', 'United Kingdom', 6030, 'International', 2026),
('Guangzhou', 'China', 8400, 'International', 2027),
('Jeddah', 'Saudi Arabia', 2900, 'Regional', 2026),
('Cape Town', 'South Africa', 4300, 'Regional', 2026);

-- 7. Inserting macroeconomic assumptions and projections
INSERT INTO Economic_Impact (RouteID, Est_Annual_Tourism_Revenue_USD, Est_Cargo_Trade_Value_USD, GDP_Multiplier_Factor) VALUES
(1, 45000000.00, 12000000.00, 2.1),
(2, 25000000.00, 85000000.00, 2.1),
(3, 15000000.00, 30000000.00, 2.1),
(4, 18000000.00, 14000000.00, 2.1);
