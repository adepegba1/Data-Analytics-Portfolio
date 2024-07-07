CREATE DATABASE Cereals;
USE cereals;
-- Reading the database to understand it 
SELECT *
FROM cereal;
-- DATA MANIPULATION
-- Changing all the columns header to uppercase and adding the units of measurement
ALTER TABLE cereal
RENAME COLUMN protein TO protein_g,
RENAME COLUMN fat TO fat_g,
RENAME COLUMN sodium TO sodium_mg,
RENAME COLUMN fiber TO fiber_g,
RENAME COLUMN carbo TO carbo_g,
RENAME COLUMN sugars TO sugars_g,
RENAME COLUMN potass TO potass_mg,
RENAME COLUMN weight TO weight_oz,
RENAME COLUMN cups TO cups_c;

-- Giving the full name of the mfr A- American Home Food Products, G-General Mills, K-Kelloggs, N-Nabisco, P-Post, 
-- Q-Quaker Oats, R-Ralston Purina. NEED TO OFF THE SAFE UPDATE MODE IN SQL EDITOR
UPDATE cereal
SET mfr = 'American Home Food Products'
WHERE mfr = 'A';

UPDATE cereal
SET mfr = 'General Mills'
WHERE mfr = 'G';

UPDATE cereal
SET mfr = 'Kelloggs'
WHERE mfr = 'K';

UPDATE cereal
SET mfr = 'Nabisco'
WHERE mfr = 'N';

UPDATE cereal
SET mfr = 'Post'
WHERE mfr = 'P';

UPDATE cereal
SET mfr = 'Quaker Oats'
WHERE mfr = 'Q';

UPDATE cereal
SET mfr = 'Ralston Purina'
WHERE mfr = 'R';

-- Renaming the type C-Cold, H-Hot
UPDATE cereal
SET type = 'Cold'
WHERE type = 'C';

UPDATE cereal
SET type = 'Hot'
WHERE type = 'H';

-- Renaming the shelf 1- 1st Floor, 2- 2nd Floor, 3- 3rd Floor. First Change the data type to Text
ALTER TABLE cereal
CHANGE COLUMN shelf shelf TEXT NOT NULL;

UPDATE cereal
SET shelf = '1st Floor'
WHERE shelf = '1';

UPDATE cereal
SET shelf = '2nd Floor'
WHERE shelf = 2;

UPDATE cereal
SET shelf = '3rd Floor'
WHERE shelf = 3;

-- Adding percentage sign to the Vitamins. Changeing the datatype first.
ALTER TABLE cereal
CHANGE COLUMN vitamins vitamins TEXT;
UPDATE cereal
SET vitamins = '0%'
WHERE vitamins = 0;

UPDATE cereal
SET vitamins = '25%'
WHERE vitamins = 25;

UPDATE cereal
SET vitamins = '100%'
WHERE vitamins = 100;

-- DATA ANALYSIS
-- 1. What are the top 5 cereals with the highest calorie count?
SELECT name
FROM cereal
ORDER BY calories DESC
LIMIT 5;

-- 2. Which manufacturer has the most cold cereals?
SELECT mfr, COUNT(name) 'Most Cold Cereals'
FROM cereal
WHERE type = 'cold'
GROUP BY mfr
ORDER BY count(name) DESC
LIMIT 1;

-- 3. What is the average protein content of hot cereals?
SELECT type, AVG(protein_g) 'Average of protein'
FROM cereal
WHERE type = 'hot'
GROUP BY type;

-- 4. List all cereals with less than 10g of fat per serving.
SELECT name
FROM cereal
WHERE fat_g < 10;

-- 5. What is the total sodium content of all cereals from a specific manufacturer?
SELECT mfr, SUM(sodium_mg) 'Sum of Sodium by Manufacturer' 
FROM cereal
GROUP BY mfr
ORDER BY SUM(sodium_mg) DESC;

-- 6. What is the average weight (in ounces) of all cereals on shelf display 1st Floor?
SELECT AVG(weight_oz) 'Average weight in 1st floor'
FROM cereal
WHERE shelf ='1st floor';

-- 7. List all cereals with a rating above 80%.
SELECT name, rating
FROM cereal
WHERE rating > 80;

-- 8. Which cereal has the highest vitamin content (100% of the daily value)?
SELECT name
FROM cereal
WHERE vitamins = '100%';

-- 9. What is the total carbohydrate content of all cold cereals?
SELECT type, SUM(carbo_g) 'Total carbohydrate'
FROM cereal
GROUP BY type
HAVING type = 'cold';

-- 10. Find the cereal with the lowest sodium content per serving.
SELECT name, sodium_mg
FROM cereal
WHERE sodium_mg = (SELECT MIN(sodium_mg) FROM cereal);

-- 11. What is the average potassium content of all cereals from a specific manufacturer?
SELECT mfr, ROUND(AVG(potass_mg),2) 'Average Potassium'
FROM cereal
GROUP BY mfr
ORDER BY 2 DESC;

-- 12. List all cereals with a specific type (hot or cold) and the manufacturer.
SELECT name,mfr
FROM cereal
WHERE type = 'hot'
ORDER BY mfr;

-- 13. What is the total number of cups per serving for all cereals on shelf display 2nd floor?
SELECT shelf, SUM(cups_c) 'Number of cups'
FROM cereal
GROUP BY shelf
HAVING shelf = '2nd floor';

-- 14. How many unique name are in the dataset
SELECT COUNT(DISTINCT name) 'unique name'
FROM cereal;

-- 15. Which product have the lowest rating and what the sugar volume
SELECT name, rating, sugars_g
FROM cereal
WHERE rating = (SELECT MIN(rating) FROM cereal);

-- 16. Retrieve all the information about the highest food weight
SELECT *
FROM cereal
WHERE weight_oz = (SELECT MAX(weight_oz) FROM cereal);

-- 17. Which cereal have the high sugar and what is the rating
SELECT name, sugars_g, rating
FROM cereal
WHERE sugars_g = (SELECT MAX(sugars_g) FROM cereal);

-- 18. Find the cereal with the highest protein content per serving to help manage blood sugar levels and the serving type
SELECT name, protein_g, type
FROM cereal
WHERE protein_g = (SELECT MAX(protein_g) FROM cereal) AND type = 'cold';

-- 19. How many cereal did each mfr produce order by the type
SELECT mfr, COUNT(*) '# of cereals produce'
FROM cereal
GROUP BY mfr
ORDER BY 2 DESC;

-- 20. Which cereals can a diabetes patient eat that does not have more than 4grams of sugar
SELECT name, type, sugars_g
FROM cereal
WHERE sugars_g < 4
ORDER BY sugars_g;

-- 21. Which cereals have less than 30g of carbohydrates per serving?
SELECT name, carbo_g
FROM cereal
WHERE carbo_g < 30;

-- 22. What are the top 5 cereals with the lowest sugar content per serving?
SELECT name, sugars_g
FROM cereal
ORDER BY sugars_g 
LIMIT 5;

-- 23. Find all cereals with a high fiber content (more than 5g per serving) to help manage blood sugar levels.
SELECT name, fiber_g
FROM cereal
WHERE fiber_g > 5;

-- 24. Which cereals have a low calorie count (less than 150 per serving) and low sugar content?
SELECT name, calories, sugars_g
FROM cereal
WHERE calories < 150 AND sugars_g <=0;

-- 25. What is the average carbohydrate content of all cold cereals?
SELECT type, AVG(carbo_g) 'Average of Carbohydrate Content'
FROM cereal
GROUP BY type
HAVING type = 'cold';

-- 26. List all cereals with a low sodium content (less than 50mg per serving) and low sugar content.
SELECT name, sodium_mg, sugars_g
FROM cereal
WHERE sodium_mg < 50 AND sugars_g <= 0;


-- 27. Which cereals have a low fat content (less than 2g per serving) and low sugar content?
SELECT name, fat_g, sugars_g
FROM cereal
WHERE fat_g < 2 AND sugars_g <= 0;

-- 28. Which cereals have a high fiber content and low sugar content per serving?
SELECT name, sugars_g, fiber_g
FROM cereal
WHERE sugars_g <= 0 AND fiber_g = (SELECT MAX(fiber_g) FROM cereal);

-- 29. List all cereals with a rating above 80% and low sugar content per serving.
SELECT name, rating, sugars_g
FROM cereal
WHERE rating > 80 AND sugars_g <= 0;