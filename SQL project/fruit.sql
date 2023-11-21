USE fruit_db;
-- Import the fruit data and answer the following questions:
	-- 1. Which fruit are fresh or Juice
    SELECT *
    FROM fruit
    WHERE form = 'fresh' OR form = 'Juice';
	-- 2. which fruit yield more than 0.50 and CupEquivalentSize is above 5
    SELECT *
    FROM fruit 
    WHERE yield > 0.50 AND CupEquivalentSize > 5;
	-- 3. what fruit are fluid ounces in CupEquivalentUnit
    SELECT *
    FROM fruit
    WHERE CupEquivalentUnit = 'fluid ounces';
	-- 4. which fruit has the highest CupEquivalentPrice 
    SELECT *
    FROM fruit 
    ORDER BY CupEquivalentPrice DESC;
	-- 5. what is the retailprice of 'Raspberries' form of fresh,  'Peaches' form of frozen and 'Dates' form of dried
    SELECT fruit, form, retailprice
    FROM fruit 
    WHERE (fruit = 'Raspberries' AND form = 'fresh')
    OR (fruit = 'peaches' AND form = 'frozen')
    OR (fruit = 'dates' AND form = 'dried');
	-- 6. what fruit is 'dried' in form and less than 5 in retailprice
    SELECT *
    FROM fruit 
    WHERE form = 'dried' AND retailprice < 5;