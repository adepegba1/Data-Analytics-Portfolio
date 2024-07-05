/* Hotel Reservation Analysis with SQL
In this Project, you will use SQL to answer the questions related to dataset. This will help you to develop 
your data analysis skills in a practical context. 
Overview:
The hotel industry relies on data to make informed decisions and provide a better guest experience. In 
this internship, you will work with a hotel reservation dataset to gain insights into guest preferences, 
booking trends, and other key factors that impact the hotel's operations. You will use SQL to query and 
analyze the data, as well as answer specific questions about the dataset. 
Dataset Details:
The dataset includes the following columns: 
* Booking_ID: A unique identifier for each hotel reservation.
* no_of_adults: The number of adults in the reservation. 
* no_of_children: The number of children in the reservation.
* no_of_weekend_nights: The number of nights in the reservation that fall on 
weekends. 
* no_of_week_nights: The number of nights in the reservation that fall on 
weekdays. 
* type_of_meal_plan: The meal plan chosen by the guests. 
* room_type_reserved: The type of room reserved by the guests.
* lead_time: The number of days between booking and arrival.
* arrival_date: The date of arrival. 
* market_segment_type: The market segment to which the reservation 
belongs. 
* avg_price_per_room: The average price per room in the reservation. 
* booking_status: The status of the booking. 
What you have to do?
You are tasked with analyzing this hotel reservation dataset using SQL. Here are 15 questions for which 
you will write SQL queries to gain insights:*/ 
CREATE DATABASE Hotel_Reservation;
USE Hotel_Reservation;
 
-- 1. What is the total number of reservations in the dataset? 
SELECT COUNT(*) 'Total Number of Reservation'
FROM reservation;

-- 2. Which meal plan is the most popular among guests? 
SELECT type_of_meal_plan, COUNT(type_of_meal_plan) 'Popular Meal'
FROM reservation
GROUP BY type_of_meal_plan
ORDER BY 2 DESC
LIMIT 1;

-- 3. What is the average price per room for reservations involving children? 
SELECT ROUND(AVG(avg_price_per_room),2) 'Average price per room for reservations involving children'
FROM reservation
WHERE no_of_children > 0;

-- 4. How many reservations were made for the year 2017 (replace XX with the desired year)? 
SELECT COUNT(*) 'Reservations made in the year 2017'
FROM reservation
WHERE arrival_date LIKE '2017%';

-- 5. What is the most commonly booked room type? 
SELECT room_type_reserved, COUNT(room_type_reserved) 'Most commonly booked room type'
FROM reservation
GROUP BY room_type_reserved
ORDER BY 2 DESC
LIMIT 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) 'Reservations on weekend'
FROM reservation
WHERE no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations? 
SELECT DISTINCT(lead_time)
FROM reservation
WHERE lead_time = (SELECT MIN(lead_time) FROM reservation) OR
	  lead_time = (SELECT MAX(lead_time) FROM reservation);

-- 8. What is the most common market segment type for reservations? 
SELECT market_segment_type, COUNT(market_segment_type) 'Most common market segment type'
FROM reservation
GROUP BY market_segment_type
ORDER BY 2 DESC
LIMIT 1;

-- 9. How many reservations have a booking status of "Confirmed"?
SELECT booking_status, COUNT(booking_status) 'Total Number'
FROM reservation
GROUP BY booking_status
HAVING booking_status = 'Not_Canceled';
 
-- 10. What is the total number of adults and children across all reservations? 
SELECT SUM(no_of_adults) 'Number of Adults', SUM(no_of_children) 'Number of Children'
FROM reservation;

-- 11. What is the average number of weekend nights for reservations involving children? 
SELECT AVG(no_of_weekend_nights)
FROM reservation
WHERE no_of_children > 0 AND no_of_weekend_nights > 0;

-- 12. How many reservations were made in each month of the year?
SELECT year(arrival_date) 'Years' , monthname(arrival_date) 'Months', COUNT(*) 'Number of Reservation made'
FROM reservation
GROUP BY arrival_date
ORDER BY years;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT room_type_reserved, AVG(no_of_weekend_nights + no_of_week_nights) 'Average Number of Night'
FROM reservation
GROUP BY room_type_reserved;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved, ROUND(AVG(avg_price_per_room),2) 'Most Common Room Type Involoving children'
FROM reservation
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY 2 DESC
LIMIT 1;

-- 15. Find the market segment type that generates the highest average price per room.
SELECT market_segment_type, ROUND(AVG(avg_price_per_room),2) 'Highest average price per room'
FROM reservation
GROUP BY market_segment_type
ORDER BY 2 DESC
LIMIT 1;
