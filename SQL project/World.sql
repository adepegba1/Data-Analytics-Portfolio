-- USING THE WORLD DATABASE, ANSWER THE FOLLOWING QUESTIONS
USE world;

-- How many District did each Country have
SELECT country.name CountryName, city.countrycode, COUNT(city.CountryCode) AS 'NumbersOfDistrict'
FROM country
INNER JOIN city
ON city.CountryCode = country.code
GROUP BY country.name, country.code
ORDER BY 3 DESC;

-- How many Country are in each Continent
SELECT Continent, COUNT(country.name) AS TotalNumberofCountry
FROM country
GROUP BY Continent WITH ROLLUP
ORDER BY 1 DESC; 

-- How many country did they speak English has offical language
SELECT Language, IsOfficial, COUNT(countrycode) 'NumberofCountry'
FROM countrylanguage
GROUP BY language, isofficial
HAVING language = 'English' AND isofficial = 'T';

-- What is the total population in each country
SELECT country.name CountryName, population
FROM country
ORDER BY 1;

-- What is the total population in each country by district
SELECT CountryCode, country.name CountryName, SUM(city.population) As districtPopulation
FROM city
INNER JOIN country
ON country.code = city.countrycode
GROUP BY CountryCode, country.name
ORDER BY 2;

-- List the independent year of all Africa country
SELECT Name countryName, IndepYear
FROM country
WHERE Continent = 'Africa'
ORDER BY 1;

-- List the name of Head of State in all West Africa country
SELECT Region, name CountryName, HeadOfState
FROM country
WHERE region = 'Western Africa' AND Continent = 'Africa'
ORDER BY 2;

-- Which country has the highest population
SELECT name CountryName, Population
FROM country
ORDER BY population DESC;

-- List the names of all the language in the dataset
SELECT DISTINCT language
FROM countrylanguage;

-- Which Country has the highest surface area
SELECT name CountryName, SurfaceArea
FROM country
ORDER BY 2 DESC;

-- Which country practice 'Monarchy' mode of government
SELECT Name CountryName, GovernmentForm
FROM country
WHERE GovernmentForm = 'Monarchy'
ORDER BY 1;

-- Which country didnt have independent year
SELECT name CountryName, IndepYear
FROM country
WHERE IndepYear IS NULL
ORDER BY 1;

-- List the country that speak 'Spanish' that isnt the official language
SELECT name CountryName, Language, IsOfficial
FROM countrylanguage
INNER JOIN country
ON country.code = countrylanguage.CountryCode
WHERE language = 'Spanish' AND isofficial = 'F'
ORDER BY 1;

-- What is the official language in each country
SELECT name CountryName, Language, IsOfficial
FROM countrylanguage
INNER JOIN country
ON country.code = countrylanguage.CountryCode
WHERE Isofficial = 'T'
ORDER BY 1;