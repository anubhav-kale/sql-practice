-- All fuel types sorted by price per litre
SELECT * FROM fuel_types ORDER BY price_per_litre DESC;

--Fuel types that cost more than 100
SELECT * FROM fuel_types WHERE price_per_litre >100;

--Tanks with capacity more than 15000
SELECT * FROM tanks WHERE max_capacity>15000;

--Count the number of nozzles the pump has
SELECT COUNT(*) FROM nozzles;

-- Each nozzle with its tank name
SELECT n.id, n.nozzle_number, t.tank_name
FROM nozzles n
JOIN tanks t ON n.tank_id=t.id;

--Each nozzle with its fuel name
SELECT n.id, n.nozzle_number, f.name
FROM nozzles n 
JOIN tanks t ON n.tank_id=t.id
JOIN fuel_types f ON f.id=t.fuel_type_id;

--Total Tank capacity per fuel type
SELECT f.id,f.name,SUM(t.max_capacity) AS total_capacity
FROM tanks t
JOIN fuel_types f ON t.fuel_type_id = f.id
GROUP BY f.id;

-- Number of nozzles per fuel type
SELECT f.name, COUNT(n.id) AS number_of_nozzles
FROM fuel_types f 
JOIN tanks t ON f.id=t.fuel_type_id
JOIN nozzles n ON t.id = n.tank_id
GROUP BY f.id;

-- Fuel types that have no tank
SELECT f.name
FROM fuel_types f
LEFT JOIN tanks t ON f.id=t.fuel_type_id
WHERE t.fuel_type_id IS NULL; 

-- Most expensive fuel
SELECT name
FROM fuel_types
ORDER BY price_per_litre DESC
LIMIT 1;

--Each tank's % full (current stock ÷ capacity × 100), rounded to 1 decimal
SELECT tank_name , ROUND(((amount / max_capacity) * 100),1)||'%' AS per_filled 
FROM tanks;

--Tanks lower than 30% of max capacity
WITH tanks_pct AS(
    SELECT tank_name , ROUND(((amount / max_capacity) * 100),1) AS per_filled 
    FROM tanks
)
SELECT tank_name,per_filled ||'%' AS "%_filled"
FROM tanks_pct
WHERE per_filled<30;