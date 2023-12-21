-- Covid 19 Data Exploration 

-- Creating a database and using it
CREATE DATABASE covid_19;
USE covid_19;

-- 1. What is the total_cases in each country
SELECT location Country, sum(new_cases) AS total_cases
FROM CovidDeaths
GROUP BY location
ORDER BY location asc, total_cases DESC;

-- 2. which date did canada has the highest death
SELECT TOP 1 location Country, date, new_deaths
FROM CovidDeaths
WHERE location = 'canada'
ORDER BY 3 DESC;

-- 3. Retrieve the highest new_cases_smoothed order by each country
SELECT location Country, MAX(new_cases_smoothed) AS max_new_cases_smoothed
FROM CovidDeaths
GROUP BY location
ORDER BY 2 DESC;

-- 4. Which continent and country has the highest male_smokers
SELECT TOP 1continent, location country, max(male_smokers) as highest_male_smokers
FROM CovidDeaths
GROUP BY continent, location
ORDER BY 3 desc;

-- 5. Which countries has the lowest gdp_per_capita in Africa  continent
SELECT location Country, min(gdp_per_capita) as lowest_gdp_per_capital
FROM CovidDeaths
WHERE continent = 'africa'
GROUP BY location
ORDER BY 2;

-- 6. What is the total_cases in each year
SELECT year(date) as Year, sum(new_cases) as Total_case
FROM CovidDeaths
GROUP BY year(date);

-- 7. When is the new_case in Nigeria
SELECT TOP 1 date, new_cases, location Country
FROM CovidDeaths
WHERE location = 'Nigeria'
ORDER BY date;

-- 8. How many people have been fully_vaccinated in Asia continent
SELECT continent, sum(people_fully_vaccinated) AS total_people_vaccinated
FROM CovidDeaths
WHERE continent = 'asia'
GROUP BY continent; 

-- 9. Show continent with the highest number of death
SELECT continent, max(total_deaths) AS Highest_number_deaths
FROM CovidDeaths
GROUP BY continent 
ORDER BY 2 desc;

-- 10. How many countries are in the dataset
SELECT COUNT(DISTINCT location) as total_country
FROM CovidDeaths;

-- 11. How many countries are in each continent
SELECT continent, count(distinct location) AS numbers_of_countries
FROM CovidDeaths
GROUP BY continent
ORDER BY numbers_of_countries;

-- 12. Retrieve highest new cases in each country
SELECT location Country, max(new_cases) Highest_New_cases
FROM CovidDeaths
GROUP BY location
ORDER BY 2 DESC;

-- 13. Average number of deaths per day in each location
SELECT location Country, ROUND(AVG(new_deaths), 2) Average_Death_per_Day
FROM CovidDeaths
GROUP BY location
ORDER BY 2 DESC;

-- 14. Average of cases divided by the number of population of each country
SELECT location Country, cases * 100.0 / population AS Percentage_population
FROM(	SELECT location, population, AVG(total_cases) cases
		FROM  CovidDeaths
		GROUP BY location, population
		HAVING AVG(total_cases) > 0
	)temp
ORDER BY 2 DESC;

-- 15. Considering the highest value of total cases, which countries have the highest rate of infection in relation to population
SELECT  location Country, population, maximum,
		maximum * 100.0 / population AS Highest_rate_infection
FROM(	SELECT location, population, MAX(total_cases) maximum
		FROM CovidDeaths
		GROUP BY location, population
		HAVING MAX(total_cases) > 0
	)temp
ORDER BY 4 DESC;

-- 16. Countries with the highest number of deaths
SELECT location Country, MAX(total_deaths) Max_number_deaths
FROM CovidDeaths
GROUP BY location
ORDER BY 2 DESC;
