-- Flipkart Mobiles Dataset
-- This dataset containing specs of various Mobile brands in India has been scraped from an ecommerce website 'Flipkart'. 
-- This dataset has 3114 samples with 8 attributes. There are some missing values as well.
CREATE DATABASE flipkart;
USE flipkart;

-- Attributes-

-- Brand- Name of the Mobile Manufacturer
-- Model- Model number of the Mobile Phone
-- Color- Color of the model.
-- Memory - RAM of the model (4GB,6GB,8GB, etc.)
-- Storage- ROM of the model (32GB,64GB,128GB,256GB, etc.)
-- Rating- Rating of the model based on reviews (out of 5). Missing or Null values indicate there are no ratings present for the model.
-- Selling Price- Selling Price/Discounted Price of the model in INR when this data was scraped. Ideally price indicates the 
-- discounted price of the model
-- Original Price- Actual price of the model in INR. Missing values or null values would indicate that the product is 
-- being sold at the actual price available in the 'Price' column.
-- Inspiration-
-- You can use this dataset to answer some interesting questions like-

-- Brand with most product offerings for the Indian Market
SELECT Brand, count(model) AS MostProducts
FROM mobiles
GROUP BY brand
ORDER BY 2 DESC;

-- Brand catering to all different segments (low range 0-50,000, mid range50,000- 100,000, premium above 100,000 - *an additional data column would be required to sort 
-- the data in the above segments using the selling price order by brand)
CREATE VIEW segment AS
SELECT *, 
CASE 
	WHEN sellingprice > 0 AND sellingprice <= 50000 THEN 'Low Range'
    WHEN sellingprice > 50000 AND sellingprice < 100000 THEN 'Mid Range'
    ELSE 'premium'
END AS segments
FROM mobiles
ORDER BY brand;

    
-- Most common specs offered by various brands (eg. if 4 GB memory and 64GB storage models are more commonly offered by all brands)
SELECT brand, Memory, Storage
FROM(
		SELECT *, row_number() over(partition by brand order by most_common_specs DESC) tops
		FROM  (
				SELECT brand, memory, storage, count(memory) Most_common_specs
				FROM mobiles
				GROUP BY brand, memory, storage
			  )temp
		)temp1
WHERE tops = 1;

-- Compare premium offerings by top brands
SELECT brand, segments, COUNT(segments) TotalPhones
FROM segment
WHERE segments = 'premium'
GROUP BY brand, segments;

-- Most commonly offered colors by all Brands
SELECT color, COUNT(color) Total_color_brand
FROM mobiles
GROUP BY color
ORDER BY 2 DESC;

-- Compare Two Brands based on specs
SELECT *
FROM mobiles
WHERE Memory = '6 GB' AND Storage = '128 GB' AND Rating = 4.6;


-- Are higher rated mobiles always premium or expensive?
SELECT *
FROM segment
WHERE rating = (SELECT MAX(rating) FROM mobiles);

-- Which phone has the highest memory and storage
SELECT *
FROM mobiles
WHERE memory LIKE '12%' AND Storage LIKE '%TB';

-- Which product has discount(originalprice - sellingprice) of product above 0
SELECT *, (originalprice - sellingprice) Discount
FROM mobiles
WHERE (originalprice - sellingprice) > 0
ORDER BY discount DESC; 

-- Does a brand have better than 4 ratings for all its products?
