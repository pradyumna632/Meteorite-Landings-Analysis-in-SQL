-- How many meteorite fall and found
SELECT fall, COUNT(*) AS No_of_meteorite FROM meteorite_landings
GROUP BY fall;

-- What is the most common classification of meteorites?
SELECT recclass, COUNT(*) AS COUNT_OF_CLASS FROM meteorite_landings
GROUP BY recclass
ORDER BY COUNT_OF_CLASS DESC
LIMIT 10;

-- What is the average mass of meteorites in the dataset?
SELECT ROUND(AVG(mass),2) AS AVERAGE_MASS FROM meteorite_landings;

-- What is the most recent year in which a meteorite was discovered in the dataset?
SELECT max(`year`) as recent_year
FROM meteorite_landings
WHERE `year` <= YEAR(curdate());

-- What is the total number of meteorite landings in the dataset?
SELECT COUNT(*) AS total_meteorite_landings
FROM meteorite_landings;

-- What is the average mass of meteorites in each country, and which country has the highest average mass?
SELECT GeoLocation, round(AVG(mass),2) AS AVERAGE_MASS FROM meteorite_landings
group by GeoLocation
order by AVERAGE_MASS desc
limit 1;

-- Which meteorite classifications have the highest and lowest average masses?
SELECT recclass, AVG(mass) AS average_mass
FROM meteorite_landings
GROUP BY recclass
HAVING average_mass IS NOT NULL AND average_mass > 0
ORDER BY average_mass ASC;

-- How many meteorite landings have occurred in each year, and is there a trend over time?
SELECT `year`, COUNT(*) AS meteorite_landings FROM meteorite_landings
WHERE `year` BETWEEN 1990 AND 2013
GROUP BY `year`
ORDER BY `year` DESC;

-- Discoveries of Meteorite Landings per year from 1900-2013
SELECT `year`, COUNT(*) AS LandingsPerYear 
FROM meteorite_landings
WHERE `year` BETWEEN 1990 AND 2013
GROUP BY `year`
ORDER BY `year` DESC;

-- Discoveries of Meteorite Landings per decade from 1900-2013
SELECT
  CAST(FLOOR(YEAR / 10) * 10 AS CHAR(4)) AS decade,
  COUNT(*) AS num_landings
FROM meteorite_landings
WHERE YEAR >= 1900 AND YEAR <= 2013
GROUP BY decade
ORDER BY decade DESC;

-- Meteorites seen falling per year 1900-2013
SELECT `year`, COUNT(*) AS LandingsPerYear 
FROM meteorite_landings
WHERE `year` BETWEEN 1990 AND 2013 AND fall = 'fell'
GROUP BY `year`
ORDER BY `year` DESC;

-- Meteorites seen falling per decade 1900-2013
SELECT
  CAST(FLOOR(YEAR / 10) * 10 AS CHAR(4)) AS decade,
  COUNT(*) AS no_of_fell
FROM meteorite_landings
WHERE YEAR >= 1900 AND YEAR <= 2013 AND fall = 'fell'
GROUP BY decade
ORDER BY decade DESC;

-- Which meteorites were found in the same location as a famous meteorite, named "Abee"?
SELECT name, reclat, reclong FROM meteorite_landings
WHERE name='Abee';

SELECT name, reclat, reclong FROM meteorite_landings
WHERE reclat = 54.21667 AND reclong = -113;

-- Which meteorites have a mass greater than the average mass of meteorites found in the same year?
SELECT name, mass, `year` 
FROM meteorite_landings
WHERE mass > (SELECT AVG(mass) AS AVG_MASS FROM meteorite_landings) AND `year` BETWEEN 1990 AND 2013
ORDER BY `year` DESC;

-- Which meteorites have the same name as their corresponding meteorite falls?
SELECT name, id 
FROM meteorite_landings 
WHERE name = `name` AND name LIKE CONCAT(`name`, '%');

-- Which meteorites have a mass greater than 10,000 grams, and were discovered in a year with more than 100 meteorite landings?
SELECT name, mass, `year`
FROM meteorite_landings
WHERE mass > 10000 AND `year` IN (SELECT `year` FROM meteorite_landings GROUP BY `year` HAVING COUNT(*) > 100)
ORDER BY `year` DESC;