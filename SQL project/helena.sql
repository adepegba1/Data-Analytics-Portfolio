use helena_db;
-- IMPORT THE TABLE AND ANSWER THE FOLLOWING QUESTIONS

-- retrieve the average price for each brand name
select brand_name, avg(price) as average_price
from HELENA
group by brand_name;

-- how many males and female do we have on the table
select gender, count(gender)
from HELENA
group by gender;

-- retrieve the product brand name less than the average price
select brand_name, price
from HELENA
where price < (select avg(price) from HELENA);

-- what brand name occur most in the table and how many times
select brand_name, count(brand_name)
from HELENA
group by brand_name
order by count(brand_name) desc;

-- retrieve the brand names of product, qantity of product and age of customer between30 and 50
select *
from HELENA
where age between 30 and 50;