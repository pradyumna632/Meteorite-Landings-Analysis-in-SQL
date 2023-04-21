USE nasa_meteorite_landings;

-- Dispaly all records
SELECT * FROM meteorite_landings
ORDER BY id ASC;

-- count all records(rows)
SELECT COUNT(*) AS no_of_rows FROM meteorite_landings;

-- Alter table name mass(g) to mass
ALTER TABLE meteorite_landings 
RENAME COLUMN `mass (g)` TO mass;

-- Fetch rows from 1000
SELECT * FROM meteorite_landings
ORDER BY id
LIMIT 1000, 1000;

-- find missing data in mass, fall, year, reclat, reclong, GeoLocation
SELECT id, name, nametype, recclass, mass
FROM meteorite_landings
WHERE mass IS NULL; -- Not working because mass has not any NULL values, it contains empty string

-- Query For empty string
SELECT id, name, nametype, recclass, mass
FROM meteorite_landings
WHERE mass = '';

-- count of how Many values are null in mass column
SELECT COUNT(*) AS missing_value FROM meteorite_landings
WHERE mass='';

-- count of how Many values are null in fall column
SELECT id, name, nametype, recclass, fall
FROM meteorite_landings
WHERE fall IS NULL;

SELECT COUNT(*) AS missing_value FROM meteorite_landings
WHERE fall IS NULL;

-- count of how Many values are null in reclat, reclong, GeoLocation column
SELECT id, name, nametype, recclass, reclat, reclong, GeoLocation
FROM meteorite_landings
WHERE reclat=0 AND reclong=0 AND GeoLocation=0;

SELECT COUNT(*) AS missing_value FROM meteorite_landings
WHERE reclat=0 AND reclong=0 AND GeoLocation=0;

-- ALL THE YEARS IN THE DATASET
SELECT `year` FROM meteorite_landings
group by `year`
order by `year` desc;

-- DISTINCT VALUES FROM nametype column
SELECT DISTINCT nametype
FROM meteorite_landings;

-- count how many value are null/ 0  in reclat, reclong column
SELECT * FROM meteorite_landings
WHERE reclat=0 AND reclong=0
ORDER BY id;

SELECT COUNT(*) AS NULLVAL FROM meteorite_landings
WHERE reclat=0 AND reclong=0;





