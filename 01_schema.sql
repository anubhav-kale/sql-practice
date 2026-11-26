DROP TABLE IF EXISTS nozzles;
DROP TABLE IF EXISTS tanks;
DROP TABLE IF EXISTS fuel_types;

CREATE TABLE fuel_types (
    id INT PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    price_per_litre DECIMAL(10,2) NOT NULL CHECK(price_per_litre>0),
    code TEXT --abbreviation/short name
);

CREATE TABLE tanks (
    id INT PRIMARY KEY,
    tank_name TEXT UNIQUE NOT NULL,
    fuel_type_id INT REFERENCES fuel_types NOT NULL,
    max_capacity DECIMAL(10,2) NOT NULL CHECK (max_capacity>0),
    amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT chk_tanks_amount CHECK (amount >= 0 AND amount <= max_capacity)
);

CREATE TABLE nozzles (
    id INT PRIMARY KEY,
    nozzle_number TEXT UNIQUE NOT NULL,
    tank_id INT REFERENCES tanks NOT NULL, 
    current_meter_reading DECIMAL(12,2) NOT NULL CHECK (current_meter_reading >=0)
);