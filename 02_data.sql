TRUNCATE TABLE nozzles, tanks, fuel_types;

INSERT INTO fuel_types(id, name, price_per_litre, code) VALUES 
(1, 'PETROL', 111.49,'MS'),
(2, 'DIESEL', 98.16,'HSD'),
(3, 'POWER PETROL', 121.61,'PWR');

INSERT INTO tanks(id,tank_name,fuel_type_id,max_capacity,amount) VALUES
(1, 'PETROL TANK', 1, 15000, 4259),
(2, 'DIESEL TANK', 2, 20000, 7853);

INSERT INTO nozzles(id, nozzle_number, tank_id, current_meter_reading) VALUES
(1,'MS-1',1, 149171.630),
(2,'MS-2',1,  241026.530 ),
(3,'MS-3',1, 57729.235),
(4,'MS-4',1, 93910.11),
(5,'MS-5',1, 9021.88),
(6,'MS-6',1, 35116.09),
(7,'MS-7',1, 410349.48),
(8,'MS-8',1, 923471.21),
(9,'HSD-1',2, 705215.56),
(10,'HSD-2',2, 515012.99)
;