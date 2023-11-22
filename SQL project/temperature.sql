use temperature;
select *
from temperatures;
-- which city has the highest temperature
select city, max(value)
from temperatures
group by city;
-- Display the average temperature by city ordered by temperature descending
select city, avg(value) as average_temperature
from temperatures
group by city
order by average_temperature desc;
-- Display the top 3 cities temperature during July and August ordered by temperature descending
select city, avg(value) as average_temperature
from temperatures
where month between 7 and 8
group by city
order by avg(value) desc
limit 3;
-- Display the max temeprature of each state ordered by state name
select state, max(value)
from temperatures
group by state
order by state;