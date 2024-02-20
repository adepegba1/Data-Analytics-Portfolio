-- Solve the below SQL problems using the Famous Paintings & Museum dataset:
CREATE DATABASE museum;
USE museum;

-- 1) Fetch all the paintings which are not displayed on any museums?
SELECT W.work_id, W.name, W.artist_id, W.style
FROM work W
LEFT JOIN museum M
ON W.museum_id = M.museum_id
WHERE W.museum_id IS NULL;

-- 2) Are there museuems without any paintings?
SELECT M.museum_id, M.name, address, city, state, country, work_id
FROM museum M
LEFT JOIN work W
ON M.museum_id = W.museum_id
WHERE W.museum_id IS NULL;

-- 3) How many paintings have an asking price of more than their regular price? 
SELECT COUNT(sale_price)
FROM product_size
WHERE sale_price > regular_price;

-- 4) Identify the paintings whose asking price is less than 50% of its regular price
SELECT p.work_id, name
FROM product_size p
JOIN work w
ON w.work_id = p.work_id
WHERE sale_price < (0.5 * regular_price);

-- 5) Which canva size costs the most?
SELECT *
FROM canvas_size c
JOIN product_size s
ON c.size_id = s.size_id
WHERE sale_price = (SELECT MAX(sale_price) FROM product_size) OR
	  regular_price = (SELECT MAX(regular_price) FROM product_size);

-- 6) Delete duplicate records from work, product_size, subject and image_link tables

-- DUPLICATE RECORDS DELETE FROM WORK
DELETE FROM work WHERE work_id IN (
									SELECT work_id FROM 
														(SELECT *, ROW_NUMBER() OVER(PARTITION BY work_id ORDER BY work_id) AS row_num FROM work)temp
									WHERE row_num > 1);

-- DUPLICATE RECORDS DELETE FROM PRODUCT_SIZE
-- In this process, i copy the duplicate work_id into a new table
			SELECT work_id, size_id, sale_price, regular_price INTO product_size1 FROM 
			(SELECT *, ROW_NUMBER() OVER(PARTITION BY work_id ORDER BY work_id) AS row_num FROM product_size)temp
			WHERE row_num < 2;
-- Delete the old table
			DROP TABLE product_size;
-- Rename the new table
			sp_rename 'product_size1', 'product_size';

-- DUPLICATE RECORDS DELETE FROM SUBJECT
DELETE FROM subject WHERE work_id IN (
									SELECT work_id FROM 
														(SELECT *, ROW_NUMBER() OVER(PARTITION BY work_id ORDER BY work_id) AS row_num FROM subject)temp
									WHERE row_num > 1);

-- DUPLICATE RECORDS DELETE FROM IMAGE_LINK
DELETE FROM image_link WHERE work_id IN (
									SELECT work_id FROM 
														(SELECT *, ROW_NUMBER() OVER(PARTITION BY work_id ORDER BY work_id) AS row_num FROM image_link)temp
									WHERE row_num > 1);

-- 7) Identify the museums with invalid city information in the given dataset
SELECT *
FROM museum
WHERE city LIKE '%[0-9]';

-- 8) Museum_Hours table has 1 invalid entry. Identify it and remove it.
-- checking 'thusday' to 'thursday'
update museum_hours
set day = 'Thursday'
where day = 'Thusday';

SELECT * FROM museum_hours 
WHERE museum_id NOT IN (SELECT MIN(museum_id)
						FROM museum_hours
						GROUP BY museum_id, day);
SELECT * FROM museum_hours;

-- 9) Fetch the top 10 most famous painting subject
SELECT TOP 10 subject, COUNT(subject) Famous
FROM subject
GROUP BY subject
ORDER BY famous DESC;

-- 10) Identify the museums which are open on both Sunday and Monday. Display museum name, city.
SELECT name, city
FROM museum m
INNER JOIN museum_hours mh
ON m.museum_id = mh.museum_id
where day='Sunday'
	and exists (select 1 from museum_hours mh2 
				where mh2.museum_id=mh.museum_id 
			    and mh2.day='Monday');

-- 11) How many museums are open every single day?
SELECT COUNT(museum_id) Total
FROM (
		SELECT museum_id, COUNT(museum_id) Days
		FROM museum_hours
		GROUP BY museum_id
		HAVING COUNT(museum_id) = 7
	 )temp;

-- 12) Which are the top 5 most popular museum? (Popularity is defined based on most number of paintings in a museum)
SELECT TOP 5 m.name, COUNT(w.museum_id) Popular
FROM museum m
INNER JOIN work w
ON m.museum_id = w.museum_id
GROUP BY M.name
ORDER BY Popular DESC;

-- 13) Who are the top 5 most popular artist? (Popularity is defined based on most number of paintings done by an artist)
SELECT TOP 5 full_name, COUNT(museum_id) popular
FROM artist
INNER JOIN work
ON artist.artist_id = work.artist_id
GROUP BY full_name
ORDER BY popular DESC;

-- 14) Display the 3 least popular canva sizes
SELECT TOP 3 *
FROM canvas_size
INNER JOIN product_size 
ON product_size.size_id = canvas_size.size_id
ORDER BY sale_price, regular_price;

-- 15) Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?
SELECT name, state, DATEDIFF("HOUR", open_time, close_time) hours, day
FROM museum M
INNER JOIN museum_hours MH
ON M.museum_id = MH.museum_id;


-- 16) Which museum has the most number of most popular painting style?
SELECT m.name, COUNT(w.museum_id) popular
FROM museum m
INNER JOIN work w
ON w.museum_id = m.museum_id
GROUP BY m.name
ORDER BY popular DESC;

-- 17) Identify the artists whose paintings are displayed in multiple countries
SELECT full_name
FROM artist a
INNER JOIN work w
ON a.artist_id = w.artist_id
INNER JOIN museum m
ON m.museum_id = w.museum_id
WHERE country  ( SELECT artist_id, COUNT(artist_id) total
					FROM work
					GROUP BY artist_id
				);
-- 18) Display the country and the city with most number of museums. Output 2 seperate columns to mention the city and country. If there are multiple value, seperate them with comma.
SELECT  TOP 5 country, city, COUNT(city) 'Number of Museum'
FROM museum
GROUP BY country, city
ORDER BY 3 DESC;

-- 19) Identify the artist and the museum where the most expensive and least expensive painting is placed. Display the artist name, sale_price, painting name, museum name, museum city and canvas label
SELECT a.full_name 'Artist Name', p.sale_price, w.name 'Work Name', m.name 'Museum Name', m.city 'Museum City', c.label
FROM museum M
INNER JOIN  work W
ON m.museum_id = w.museum_id
INNER JOIN product_size P
ON w.work_id = p.work_id
INNER JOIN canvas_size C
ON c.size_id = p.size_id
INNER JOIN artist A
ON a.artist_id = w.artist_id
WHERE sale_price = (SELECT MIN(sale_price) FROM product_size) OR
		sale_price = (SELECT MAX(sale_price) FROM product_size);

-- 20) Which country has the 5th highest number of paintings?
SELECT TOP 5 country, COUNT(w.museum_id) 'Number of Paintings'
FROM museum m
INNER JOIN work W
ON w.museum_id = m.museum_id
GROUP  BY country
ORDER BY 2 DESC;

-- 21) Which are the 3 most popular and 3 least popular painting styles?
	with cte as
	(select style, count(*) as cnt
		, rank() over(order by count(*) desc) rnk
		, count(1) over() as no_of_records
		from work
		where style is not null
		group by style)
	select style
	, case when rnk <=3 then 'Most Popular' else 'Least Popular' end as remarks 
	from cte
	where rnk <=3
	or rnk > no_of_records - 3;

-- 22) Which artist has the most number of Portraits paintings outside USA?. Display artist name, number of paintings and the artist nationality.
select full_name as artist_name, nationality, no_of_paintings
	from (
		select a.full_name, a.nationality
		,count(1) as no_of_paintings
		,rank() over(order by count(1) desc) as rnk
		from work w
		join artist a on a.artist_id=w.artist_id
		join subject s on s.work_id=w.work_id
		join museum m on m.museum_id=w.museum_id
		where s.subject='Portraits'
		and m.country != 'USA'
		group by a.full_name, a.nationality) x
	where rnk=1;

