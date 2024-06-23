CREATE DATABASE Cereals;
USE cereals;
-- Reading the database to understand it 
SELECT *
FROM cereal;
-- DATA MANIPULATION
-- Changing all the columns header to uppercase and adding the units of measurement
ALTER TABLE cereal
RENAME COLUMN name TO NAME,
RENAME COLUMN mfr TO MFR,
RENAME COLUMN type TO TYPE,
RENAME COLUMN calories TO CALORIES,
RENAME COLUMN protein TO PROTEIN_g,
RENAME COLUMN fat TO FAT_g,
RENAME COLUMN sodium TO SODIUM_mg,
RENAME COLUMN fiber TO FIBER_g,
RENAME COLUMN carbo TO CARBO_g,
RENAME COLUMN sugars TO SUGARS_g,
RENAME COLUMN potass TO POTASS_mg,
RENAME COLUMN vitamins TO VITAMINS,
RENAME COLUMN shelf TO SHELF,
RENAME COLUMN weight TO WEIGHT_oz,
RENAME COLUMN cups TO CUPS_c,
RENAME COLUMN rating TO RATING;

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
CHANGE COLUMN SHELF SHELF TEXT NOT NULL;
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
CHANGE COLUMN VITAMINS VITAMINS TEXT;
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
SELECT *
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
SELECT *
FROM cereal
WHERE fat_g < 10;

-- 5. Which cereal has the highest fiber content per serving?
SELECT *
FROM cereal
ORDER BY fiber_g DESC
LIMIT 1;

-- 6. What is the total sodium content of all cereals from a specific manufacturer?
SELECT mfr, SUM(sodium_mg) 'Sum of Sodium by Manufacturer' 
FROM cereal
GROUP BY mfr
ORDER BY SUM(sodium_mg) DESC;

-- 7. Find the cereal with the highest sugar content per serving.
SELECT *
FROM cereal
WHERE sugars_g = (SELECT MAX(sugars_g) FROM cereal);

-- 8. What is the average weight (in ounces) of all cereals on shelf display 1st Floor?
SELECT AVG(weight_oz) 'Average weight in 1st floor'
FROM cereal
WHERE shelf ='1st floor';

-- 9. List all cereals with a rating above 80%.
SELECT *
FROM cereal
WHERE rating > 80;

-- 10. Which cereal has the highest vitamin content (100% of the daily value)?
SELECT *
FROM cereal
WHERE vitamins = '100%';

-- 11. What is the total carbohydrate content of all cold cereals?
SELECT type, SUM(carbo_g) 'Total carbohydrate'
FROM cereal
GROUP BY type
HAVING type = 'cold';

-- 12. Find the cereal with the lowest sodium content per serving.
SELECT *
FROM cereal
WHERE sodium_mg = (SELECT MIN(sodium_mg) FROM cereal);

-- 13. What is the average potassium content of all cereals from a specific manufacturer?
SELECT mfr, ROUND(AVG(potass_mg),2) 'Average Potassium'
FROM cereal
GROUP BY mfr
ORDER BY 2 DESC;

-- 14. List all cereals with a specific type (hot or cold) and a specific manufacturer.
SELECT *
FROM cereal
WHERE type = 'hot'
ORDER BY mfr;

-- 15. What is the total number of cups per serving for all cereals on shelf display 2nd floor?
SELECT shelf, SUM(cups_c) 'Number of cups'
FROM cereal
GROUP BY shelf
HAVING shelf = '2nd floor';

-- 16. How many unique name are in the dataset
SELECT COUNT(DISTINCT name)
FROM cereal;

-- 17. Which product have the lowest rating and what the sugar volume
SELECT *
FROM cereal
WHERE rating = (SELECT MIN(rating) FROM cereal);

-- 18. Retrieve all the information about the highest food weight
SELECT *
FROM cereal
WHERE weight_oz = (SELECT MAX(weight_oz) FROM cereal);

-- 19. Which cereal have the high sugar and what is the rating
SELECT *
FROM cereal
WHERE sugars_g = (SELECT MAX(sugars_g) FROM cereal);

-- 20. Which cereal is served cold and has high protein
SELECT *
FROM cereal
WHERE protein_g = (SELECT MAX(protein_g) FROM cereal) AND type = 'cold';

-- 21. How many cereal did each mfr produce order by the type
SELECT mfr, COUNT(*) '# of cereals produce'
FROM cereal
GROUP BY mfr
ORDER BY 2 DESC;
-- 22. Which cereals can a diabetes patient eat that does not have more than 4grams of sugar
SELECT *
FROM cereal
WHERE sugars_g < 4
ORDER BY sugars_g;

-- ANALYSIS FOR DIABETES PATIENT
-- 1. Which cereals have less than 30g of carbohydrates per serving?
SELECT *
FROM cereal
WHERE carbo_g < 30;

-- 2. What are the top 5 cereals with the lowest sugar content per serving?
SELECT *
FROM cereal
ORDER BY sugars_g 
LIMIT 5;

-- 3. Find all cereals with a high fiber content (more than 5g per serving) to help manage blood sugar levels.
SELECT *
FROM cereal
WHERE fiber_g > 5;

-- 4. Which cereals have a low calorie count (less than 150 per serving) and low sugar content?
SELECT *
FROM cereal
WHERE calories < 150 AND sugars_g <=0;

-- 5. What is the average carbohydrate content of all cold cereals?
SELECT type, AVG(carbo_g) 'Average of Carbohydrate Content'
FROM cereal
GROUP BY type
HAVING type = 'cold';

-- 6. List all cereals with a low sodium content (less than 50mg per serving) and low sugar content.
SELECT *
FROM cereal
WHERE sodium_mg < 50 AND sugars_g <= 0;

-- 7. Find the cereal with the highest protein content per serving to help manage blood sugar levels.
SELECT *
FROM cereal
WHERE protein_g = (SELECT MAX(protein_g) FROM cereal);

-- 8. Which cereals have a low fat content (less than 2g per serving) and low sugar content?
SELECT *
FROM cereal
WHERE fat_g < 2 AND sugars_g <= 0;

-- 9. Which cereals have a high fiber content and low sugar content per serving?
SELECT *
FROM cereal
WHERE sugars_g <= 0 AND fiber_g = (SELECT MAX(fiber_g) FROM cereal);

-- 10. List all cereals with a rating above 80% and low sugar content per serving.
SELECT *
FROM cereal
WHERE rating > 80 AND sugars_g <= 0;