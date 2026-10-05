USE CarService;
GO

-- =========================================================
-- 1. Clear old data
-- =========================================================

DELETE FROM SaleItems;
DELETE FROM PurchaseItems;

DELETE FROM Sales;
DELETE FROM Purchases;

DELETE FROM Products;
DELETE FROM Categories;
DELETE FROM Suppliers;
GO

-- =========================================================
-- 2. Default values
-- =========================================================

IF NOT EXISTS (
    SELECT 1
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('Categories')
      AND name = 'DF_Categories_IsDeleted'
)
BEGIN
    ALTER TABLE Categories
    ADD CONSTRAINT DF_Categories_IsDeleted
    DEFAULT 0 FOR IsDeleted;
END
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.default_constraints
    WHERE parent_object_id = OBJECT_ID('Categories')
      AND name = 'DF_Categories_CreatedAt'
)
BEGIN
    ALTER TABLE Categories
    ADD CONSTRAINT DF_Categories_CreatedAt
    DEFAULT GETDATE() FOR CreatedAt;
END
GO

-- =========================================================
-- 3. Categories
-- =========================================================

INSERT INTO Categories (CategoryName, Description)
VALUES
('Chevrolet', 'Chevrolet Cars'),
('Toyota', 'Toyota Cars'),
('Hyundai', 'Hyundai Cars'),
('Kia', 'Kia Cars'),
('BMW', 'BMW Cars'),
('Mercedes-Benz', 'Mercedes-Benz Cars'),
('Engine Oils', 'Engine Oils'),
('Oil Filters', 'Oil Filters'),
('Air Filters', 'Air Filters'),
('Brake System', 'Brake System Parts'),
('Batteries', 'Car Batteries'),
('Tires', 'Car Tires'),
('Spark Plugs', 'Spark Plugs'),
('Cooling System', 'Cooling System Parts'),
('Suspension', 'Suspension Parts'),
('Electrical Parts', 'Electrical Parts'),
('Belts', 'Belts and Timing Kits'),
('Transmission', 'Transmission Parts and Fluids');
GO

-- =========================================================
-- 4. Products
-- =========================================================

INSERT INTO Products
(
    SKU,
    ProductName,
    CategoryId,
    UnitPrice,
    StockQuantity,
    LowStockThreshold
)
VALUES

-- Chevrolet
('CHEV-001','Chevrolet Aveo',(SELECT Id FROM Categories WHERE CategoryName='Chevrolet'),250000,10,2),
('CHEV-002','Chevrolet Cruze',(SELECT Id FROM Categories WHERE CategoryName='Chevrolet'),350000,10,2),
('CHEV-003','Chevrolet Optra',(SELECT Id FROM Categories WHERE CategoryName='Chevrolet'),280000,8,2),
('CHEV-004','Chevrolet Captiva',(SELECT Id FROM Categories WHERE CategoryName='Chevrolet'),650000,6,2),
('CHEV-005','Chevrolet Malibu',(SELECT Id FROM Categories WHERE CategoryName='Chevrolet'),750000,5,1),
('CHEV-006','Chevrolet N300',(SELECT Id FROM Categories WHERE CategoryName='Chevrolet'),320000,8,2),
('CHEV-007','Chevrolet Lanos',(SELECT Id FROM Categories WHERE CategoryName='Chevrolet'),230000,10,2),
('CHEV-008','Chevrolet Spark',(SELECT Id FROM Categories WHERE CategoryName='Chevrolet'),300000,8,2),
('CHEV-009','Chevrolet Equinox',(SELECT Id FROM Categories WHERE CategoryName='Chevrolet'),850000,5,1),
('CHEV-010','Chevrolet Traverse',(SELECT Id FROM Categories WHERE CategoryName='Chevrolet'),1100000,4,1),

-- Toyota
('TOY-001','Toyota Corolla',(SELECT Id FROM Categories WHERE CategoryName='Toyota'),500000,15,3),
('TOY-002','Toyota Camry',(SELECT Id FROM Categories WHERE CategoryName='Toyota'),850000,8,2),
('TOY-003','Toyota Yaris',(SELECT Id FROM Categories WHERE CategoryName='Toyota'),420000,10,2),
('TOY-004','Toyota Fortuner',(SELECT Id FROM Categories WHERE CategoryName='Toyota'),950000,6,2),
('TOY-005','Toyota Hilux',(SELECT Id FROM Categories WHERE CategoryName='Toyota'),900000,7,2),
('TOY-006','Toyota Rush',(SELECT Id FROM Categories WHERE CategoryName='Toyota'),650000,8,2),
('TOY-007','Toyota RAV4',(SELECT Id FROM Categories WHERE CategoryName='Toyota'),900000,6,2),
('TOY-008','Toyota Land Cruiser',(SELECT Id FROM Categories WHERE CategoryName='Toyota'),2500000,4,1),
('TOY-009','Toyota C-HR',(SELECT Id FROM Categories WHERE CategoryName='Toyota'),800000,5,1),
('TOY-010','Toyota Prius',(SELECT Id FROM Categories WHERE CategoryName='Toyota'),700000,5,1),

-- Hyundai
('HYU-001','Hyundai Elantra',(SELECT Id FROM Categories WHERE CategoryName='Hyundai'),450000,12,3),
('HYU-002','Hyundai Accent',(SELECT Id FROM Categories WHERE CategoryName='Hyundai'),400000,10,2),
('HYU-003','Hyundai Tucson',(SELECT Id FROM Categories WHERE CategoryName='Hyundai'),700000,8,2),
('HYU-004','Hyundai Creta',(SELECT Id FROM Categories WHERE CategoryName='Hyundai'),650000,7,2),
('HYU-005','Hyundai Santa Fe',(SELECT Id FROM Categories WHERE CategoryName='Hyundai'),950000,5,1),
('HYU-006','Hyundai Verna',(SELECT Id FROM Categories WHERE CategoryName='Hyundai'),350000,10,2),
('HYU-007','Hyundai i10',(SELECT Id FROM Categories WHERE CategoryName='Hyundai'),300000,8,2),
('HYU-008','Hyundai i20',(SELECT Id FROM Categories WHERE CategoryName='Hyundai'),380000,8,2),
('HYU-009','Hyundai Sonata',(SELECT Id FROM Categories WHERE CategoryName='Hyundai'),750000,6,2),
('HYU-010','Hyundai Palisade',(SELECT Id FROM Categories WHERE CategoryName='Hyundai'),1200000,4,1),

-- Kia
('KIA-001','Kia Cerato',(SELECT Id FROM Categories WHERE CategoryName='Kia'),420000,10,2),
('KIA-002','Kia Sportage',(SELECT Id FROM Categories WHERE CategoryName='Kia'),700000,8,2),
('KIA-003','Kia Picanto',(SELECT Id FROM Categories WHERE CategoryName='Kia'),320000,10,2),
('KIA-004','Kia Sorento',(SELECT Id FROM Categories WHERE CategoryName='Kia'),950000,5,1),
('KIA-005','Kia Rio',(SELECT Id FROM Categories WHERE CategoryName='Kia'),380000,8,2),
('KIA-006','Kia Soul',(SELECT Id FROM Categories WHERE CategoryName='Kia'),550000,6,2),
('KIA-007','Kia K5',(SELECT Id FROM Categories WHERE CategoryName='Kia'),750000,6,2),
('KIA-008','Kia Carnival',(SELECT Id FROM Categories WHERE CategoryName='Kia'),1200000,4,1),
('KIA-009','Kia Seltos',(SELECT Id FROM Categories WHERE CategoryName='Kia'),650000,7,2),

-- BMW
('BMW-001','BMW 320i',(SELECT Id FROM Categories WHERE CategoryName='BMW'),1200000,5,1),
('BMW-002','BMW 520i',(SELECT Id FROM Categories WHERE CategoryName='BMW'),1600000,4,1),
('BMW-003','BMW X3',(SELECT Id FROM Categories WHERE CategoryName='BMW'),1800000,4,1),
('BMW-004','BMW 118i',(SELECT Id FROM Categories WHERE CategoryName='BMW'),1100000,5,1),
('BMW-005','BMW 330i',(SELECT Id FROM Categories WHERE CategoryName='BMW'),1400000,4,1),
('BMW-006','BMW 530i',(SELECT Id FROM Categories WHERE CategoryName='BMW'),1700000,4,1),
('BMW-007','BMW X1',(SELECT Id FROM Categories WHERE CategoryName='BMW'),1300000,5,1),
('BMW-008','BMW X5',(SELECT Id FROM Categories WHERE CategoryName='BMW'),2200000,3,1),

-- Mercedes
('MER-001','Mercedes-Benz C200',(SELECT Id FROM Categories WHERE CategoryName='Mercedes-Benz'),1500000,5,1),
('MER-002','Mercedes-Benz E200',(SELECT Id FROM Categories WHERE CategoryName='Mercedes-Benz'),1900000,4,1),
('MER-003','Mercedes-Benz GLC',(SELECT Id FROM Categories WHERE CategoryName='Mercedes-Benz'),2200000,3,1),
('MER-004','Mercedes-Benz A200',(SELECT Id FROM Categories WHERE CategoryName='Mercedes-Benz'),1200000,5,1),
('MER-005','Mercedes-Benz CLA200',(SELECT Id FROM Categories WHERE CategoryName='Mercedes-Benz'),1400000,4,1),
('MER-006','Mercedes-Benz GLA200',(SELECT Id FROM Categories WHERE CategoryName='Mercedes-Benz'),1600000,4,1),
('MER-007','Mercedes-Benz GLE350',(SELECT Id FROM Categories WHERE CategoryName='Mercedes-Benz'),2500000,3,1),

-- Engine Oils
('OIL-001','Shell Helix Ultra 5W-40 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),1200,20,5),
('OIL-002','Shell Helix HX8 5W-40 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),1000,20,5),
('OIL-003','Mobil 1 ESP 5W-30 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),1500,15,4),
('OIL-004','Mobil Super 3000 5W-40 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),950,20,5),
('OIL-005','Castrol EDGE 5W-40 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),1300,15,4),
('OIL-006','Castrol MAGNATEC 5W-40 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),1100,20,5),
('OIL-007','Shell Helix Ultra 5W-30 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),1250,20,5),
('OIL-008','Shell Helix HX7 10W-40 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),900,20,5),
('OIL-009','Shell Rimula R4 15W-40 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),950,15,4),
('OIL-010','Mobil 1 FS 5W-30 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),1450,15,4),
('OIL-011','Mobil Super 2000 10W-40 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),850,20,5),
('OIL-012','Castrol EDGE 5W-30 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),1350,15,4),
('OIL-013','Castrol GTX 10W-40 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),800,20,5),
('OIL-014','Valvoline Advanced 5W-30 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),1100,15,4),
('OIL-015','Total Quartz 9000 5W-40 4L',(SELECT Id FROM Categories WHERE CategoryName='Engine Oils'),1000,15,4),

-- Oil Filters
('OF-001','Bosch Oil Filter',(SELECT Id FROM Categories WHERE CategoryName='Oil Filters'),250,20,5),
('OF-002','MANN Oil Filter',(SELECT Id FROM Categories WHERE CategoryName='Oil Filters'),300,20,5),
('OF-003','ACDelco Oil Filter',(SELECT Id FROM Categories WHERE CategoryName='Oil Filters'),280,20,5),
('OF-004','Toyota Genuine Oil Filter',(SELECT Id FROM Categories WHERE CategoryName='Oil Filters'),350,15,4),
('OF-005','Hyundai Genuine Oil Filter',(SELECT Id FROM Categories WHERE CategoryName='Oil Filters'),320,15,4),
('OF-006','Kia Genuine Oil Filter',(SELECT Id FROM Categories WHERE CategoryName='Oil Filters'),320,15,4),
('OF-007','Mahle Oil Filter',(SELECT Id FROM Categories WHERE CategoryName='Oil Filters'),280,20,5),
('OF-008','Purflux Oil Filter',(SELECT Id FROM Categories WHERE CategoryName='Oil Filters'),270,20,5),

-- Air Filters
('AF-001','Bosch Air Filter',(SELECT Id FROM Categories WHERE CategoryName='Air Filters'),350,15,4),
('AF-002','MANN Air Filter',(SELECT Id FROM Categories WHERE CategoryName='Air Filters'),400,15,4),
('AF-003','ACDelco Air Filter',(SELECT Id FROM Categories WHERE CategoryName='Air Filters'),380,15,4),
('AF-004','Toyota Genuine Air Filter',(SELECT Id FROM Categories WHERE CategoryName='Air Filters'),450,15,4),
('AF-005','Hyundai Genuine Air Filter',(SELECT Id FROM Categories WHERE CategoryName='Air Filters'),420,15,4),
('AF-006','Kia Genuine Air Filter',(SELECT Id FROM Categories WHERE CategoryName='Air Filters'),420,15,4),
('AF-007','Mahle Air Filter',(SELECT Id FROM Categories WHERE CategoryName='Air Filters'),400,15,4),
('AF-008','Purflux Air Filter',(SELECT Id FROM Categories WHERE CategoryName='Air Filters'),390,15,4),

-- Brake
('BR-001','Bosch Brake Pads',(SELECT Id FROM Categories WHERE CategoryName='Brake System'),1800,10,3),
('BR-002','Brembo Brake Discs',(SELECT Id FROM Categories WHERE CategoryName='Brake System'),3500,8,2),
('BR-003','Bosch Brake Discs',(SELECT Id FROM Categories WHERE CategoryName='Brake System'),2800,8,2),
('BR-004','Brembo Brake Pads',(SELECT Id FROM Categories WHERE CategoryName='Brake System'),2200,10,3),
('BR-005','TRW Brake Pads',(SELECT Id FROM Categories WHERE CategoryName='Brake System'),1900,10,3),
('BR-006','ATE Brake Pads',(SELECT Id FROM Categories WHERE CategoryName='Brake System'),2100,8,2),
('BR-007','Ferodo Brake Pads',(SELECT Id FROM Categories WHERE CategoryName='Brake System'),1700,10,3),
('BR-008','Textar Brake Pads',(SELECT Id FROM Categories WHERE CategoryName='Brake System'),2000,8,2),
('BR-009','TRW Brake Discs',(SELECT Id FROM Categories WHERE CategoryName='Brake System'),3000,8,2),
('BR-010','ATE Brake Discs',(SELECT Id FROM Categories WHERE CategoryName='Brake System'),3200,8,2),

-- Batteries
('BAT-001','ACDelco 60Ah Battery',(SELECT Id FROM Categories WHERE CategoryName='Batteries'),4500,8,2),
('BAT-002','VARTA 70Ah Battery',(SELECT Id FROM Categories WHERE CategoryName='Batteries'),5000,6,2),
('BAT-003','Bosch 60Ah Battery',(SELECT Id FROM Categories WHERE CategoryName='Batteries'),4700,8,2),
('BAT-004','VARTA Blue Dynamic 60Ah',(SELECT Id FROM Categories WHERE CategoryName='Batteries'),4800,8,2),
('BAT-005','VARTA Silver Dynamic 70Ah',(SELECT Id FROM Categories WHERE CategoryName='Batteries'),5500,6,2),
('BAT-006','ACDelco 70Ah',(SELECT Id FROM Categories WHERE CategoryName='Batteries'),4900,8,2),
('BAT-007','Exide 60Ah',(SELECT Id FROM Categories WHERE CategoryName='Batteries'),4300,8,2),
('BAT-008','Bosch 60Ah',(SELECT Id FROM Categories WHERE CategoryName='Batteries'),4700,8,2),

-- Tires
('TIR-001','Michelin 205/55 R16',(SELECT Id FROM Categories WHERE CategoryName='Tires'),5500,10,2),
('TIR-002','Bridgestone 205/55 R16',(SELECT Id FROM Categories WHERE CategoryName='Tires'),5200,10,2),
('TIR-003','Goodyear 195/65 R15',(SELECT Id FROM Categories WHERE CategoryName='Tires'),4800,10,2),
('TIR-004','Continental 195/65 R15',(SELECT Id FROM Categories WHERE CategoryName='Tires'),5000,10,2),
('TIR-005','Michelin 215/60 R16',(SELECT Id FROM Categories WHERE CategoryName='Tires'),6000,8,2),
('TIR-006','Bridgestone 205/55 R16',(SELECT Id FROM Categories WHERE CategoryName='Tires'),5300,10,2),
('TIR-007','Goodyear 195/65 R15',(SELECT Id FROM Categories WHERE CategoryName='Tires'),4900,10,2),
('TIR-008','Continental 195/65 R15',(SELECT Id FROM Categories WHERE CategoryName='Tires'),5100,10,2),
('TIR-009','Pirelli 225/45 R17',(SELECT Id FROM Categories WHERE CategoryName='Tires'),6500,8,2),
('TIR-010','Michelin 225/45 R17',(SELECT Id FROM Categories WHERE CategoryName='Tires'),6800,8,2),

-- Spark Plugs
('SP-001','NGK Spark Plug',(SELECT Id FROM Categories WHERE CategoryName='Spark Plugs'),300,30,5),
('SP-002','Bosch Spark Plug',(SELECT Id FROM Categories WHERE CategoryName='Spark Plugs'),280,30,5),
('SP-003','DENSO Spark Plug',(SELECT Id FROM Categories WHERE CategoryName='Spark Plugs'),320,30,5),
('SP-004','NGK Iridium Spark Plug',(SELECT Id FROM Categories WHERE CategoryName='Spark Plugs'),650,20,5),
('SP-005','NGK Laser Platinum Spark Plug',(SELECT Id FROM Categories WHERE CategoryName='Spark Plugs'),550,20,5),
('SP-006','DENSO Iridium Spark Plug',(SELECT Id FROM Categories WHERE CategoryName='Spark Plugs'),700,20,5),
('SP-007','Bosch Iridium Spark Plug',(SELECT Id FROM Categories WHERE CategoryName='Spark Plugs'),600,20,5),

-- Cooling
('COOL-001','Valeo Radiator',(SELECT Id FROM Categories WHERE CategoryName='Cooling System'),4500,5,1),
('COOL-002','Gates Coolant Hose',(SELECT Id FROM Categories WHERE CategoryName='Cooling System'),700,10,2),
('COOL-003','Shell Coolant',(SELECT Id FROM Categories WHERE CategoryName='Cooling System'),500,15,3),
('COOL-004','Denso Radiator',(SELECT Id FROM Categories WHERE CategoryName='Cooling System'),5000,5,1),
('COOL-005','Mahle Radiator',(SELECT Id FROM Categories WHERE CategoryName='Cooling System'),4800,5,1),
('COOL-006','Gates Radiator Hose',(SELECT Id FROM Categories WHERE CategoryName='Cooling System'),750,10,2),
('COOL-007','Gates Thermostat',(SELECT Id FROM Categories WHERE CategoryName='Cooling System'),900,8,2),
('COOL-008','Valeo Thermostat',(SELECT Id FROM Categories WHERE CategoryName='Cooling System'),850,8,2),

-- Suspension
('SUS-001','Monroe Shock Absorber',(SELECT Id FROM Categories WHERE CategoryName='Suspension'),2500,8,2),
('SUS-002','KYB Shock Absorber',(SELECT Id FROM Categories WHERE CategoryName='Suspension'),2700,8,2),
('SUS-003','Sachs Shock Absorber',(SELECT Id FROM Categories WHERE CategoryName='Suspension'),3000,6,2),
('SUS-004','TRW Ball Joint',(SELECT Id FROM Categories WHERE CategoryName='Suspension'),900,10,2),
('SUS-005','TRW Tie Rod End',(SELECT Id FROM Categories WHERE CategoryName='Suspension'),850,10,2),
('SUS-006','Lemforder Control Arm',(SELECT Id FROM Categories WHERE CategoryName='Suspension'),2500,6,2),

-- Electrical
('EL-001','Bosch Alternator',(SELECT Id FROM Categories WHERE CategoryName='Electrical Parts'),6500,5,1),
('EL-002','Bosch Starter Motor',(SELECT Id FROM Categories WHERE CategoryName='Electrical Parts'),5500,5,1),
('EL-003','HELLA Headlight',(SELECT Id FROM Categories WHERE CategoryName='Electrical Parts'),3000,6,2),
('EL-004','Bosch Alternator',(SELECT Id FROM Categories WHERE CategoryName='Electrical Parts'),6800,5,1),
('EL-005','DENSO Alternator',(SELECT Id FROM Categories WHERE CategoryName='Electrical Parts'),7000,5,1),
('EL-006','Bosch Starter',(SELECT Id FROM Categories WHERE CategoryName='Electrical Parts'),5600,5,1),
('EL-007','DENSO Starter',(SELECT Id FROM Categories WHERE CategoryName='Electrical Parts'),5800,5,1),
('EL-008','HELLA Headlight',(SELECT Id FROM Categories WHERE CategoryName='Electrical Parts'),3200,6,2),
('EL-009','Philips Car Bulb',(SELECT Id FROM Categories WHERE CategoryName='Electrical Parts'),450,20,5),

-- Belts
('BELT-001','Gates Timing Belt',(SELECT Id FROM Categories WHERE CategoryName='Belts'),1500,10,2),
('BELT-002','Continental Drive Belt',(SELECT Id FROM Categories WHERE CategoryName='Belts'),900,10,2),
('BELT-003','Gates Drive Belt',(SELECT Id FROM Categories WHERE CategoryName='Belts'),850,10,2),
('BELT-004','Gates Timing Kit',(SELECT Id FROM Categories WHERE CategoryName='Belts'),2500,6,2),
('BELT-005','Gates Drive Belt',(SELECT Id FROM Categories WHERE CategoryName='Belts'),900,10,2),
('BELT-006','Continental Drive Belt',(SELECT Id FROM Categories WHERE CategoryName='Belts'),950,10,2),
('BELT-007','Dayco Timing Belt',(SELECT Id FROM Categories WHERE CategoryName='Belts'),1400,10,2),

-- Transmission
('TR-001','Shell Spirax S4 ATF',(SELECT Id FROM Categories WHERE CategoryName='Transmission'),900,15,3),
('TR-002','Mobil ATF 220',(SELECT Id FROM Categories WHERE CategoryName='Transmission'),850,15,3),
('TR-003','Castrol Transmax DEX/MERC',(SELECT Id FROM Categories WHERE CategoryName='Transmission'),950,15,3),
('TR-004','Shell Spirax S4 ATF',(SELECT Id FROM Categories WHERE CategoryName='Transmission'),900,15,3),
('TR-005','Mobil ATF 220',(SELECT Id FROM Categories WHERE CategoryName='Transmission'),850,15,3),
('TR-006','Castrol Transmax DEX/MERC',(SELECT Id FROM Categories WHERE CategoryName='Transmission'),950,15,3),
('TR-007','Valvoline ATF',(SELECT Id FROM Categories WHERE CategoryName='Transmission'),900,15,3);

GO

SELECT
    ProductName,
    StockQuantity,
    LowStockThreshold
FROM Products;