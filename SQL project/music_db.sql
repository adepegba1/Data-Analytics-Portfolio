-- MUSIC STORE ANALYSIS
CREATE DATABASE music_db;
USE music_db;
-- Q1. Who is the senior most employee based on job title?
SELECT TOP 1 *
FROM employee
ORDER BY levels DESC;

-- Q2. Which countries have the most Invoices?
SELECT billing_country, COUNT(billing_country) TotalBilling
FROM invoice
GROUP BY billing_country
ORDER BY 2 DESC;

-- Q3. What are top 3 values of total invoice?
SELECT TOP 3 ROUND(total, 2) TotalInvoice
FROM invoice
ORDER BY 1 DESC;

-- Q4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
--     Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals.
SELECT TOP 1 billing_city, ROUND(SUM(total), 2) AS TotalInvoice
FROM invoice
GROUP BY billing_city
ORDER BY 2 DESC;

-- Q5. Who is the best customer? The customer who has spent the most money will be declared the best customer. 
--     Write a query that returns the person who has spent the most money.
SELECT TOP 1 customer.customer_id, ROUND(SUM(total), 2) TotalMoneySpent
FROM customer
INNER JOIN invoice
ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY 2 DESC;

-- Q6. Write a query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A 
SELECT DISTINCT email CustomerEmail, first_name, last_name
FROM customer
INNER JOIN invoice
ON customer.customer_id = invoice.customer_id
INNER JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (SELECT track_id
					FROM track
					INNER JOIN genre
					ON track.genre_id = genre.genre_id
					WHERE genre.name = 'Rock')
ORDER BY email;

-- Q7. Let's invite the artists who have written the most rock music in our dataset. 
--     Write a query that returns the Artist name and total track count of the top 10 rock bands.
SELECT artist.name ArtistName, COUNT(track.genre_id) AS TotalTrack
FROM track
INNER JOIN album
ON track.album_id = album.album_id
INNER JOIN artist
ON artist.artist_id = album.artist_id
INNER JOIN genre
ON track.genre_id = genre.genre_id
WHERE genre.name = 'Rock'
GROUP BY artist.name
ORDER BY 2 DESC;

-- Q8. Return all the track names that have a song length longer than the average song length. 
--     Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.
SELECT track.name TrackName, Milliseconds 
FROM track
WHERE milliseconds > (SELECT AVG(milliseconds) FROM track)
ORDER BY 2 DESC;

-- Q9. Find how much amount spent by each customer on artists. Write a query to return the customer name, artist name, and total spent.
SELECT customer.first_name, artist.name artistName, sum(total) AmountSpent
FROM invoice
INNER JOIN customer
ON customer.customer_id = invoice.customer_id
INNER JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
INNER JOIN track
ON track.track_id = invoice_line.track_id
INNER JOIN album
ON album.album_id = track.album_id
INNER JOIN artist
ON artist.artist_id = album.artist_id
GROUP BY customer.first_name, artist.name
ORDER BY 3 DESC;

-- Q10. We want to find out the most popular music Genre for each country. 
--      We determine the most popular genre as the genre with the highest amount of purchases. 
--      Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres.
SELECT  country, max(highestPurchase) AS max
FROM (  SELECT country, genre.name, count(invoice_line.quantity) as HighestPurchase
		FROM customer
		INNER JOIN invoice
		ON customer.customer_id = invoice.customer_id
		INNER JOIN invoice_line
		ON invoice_line.invoice_id = invoice.invoice_id
		INNER JOIN track
		ON track.track_id = invoice_line.track_id
		INNER JOIN genre
		ON genre.genre_id = track.genre_id
		GROUP BY country, genre.name
		)temp
GROUP BY country
ORDER BY 1

-- Q11. Write a query that determines the customer that has spent the most on music for each country. 
-- Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount.
SELECT country, first_name, last_name, total
FROM (  SELECT customer_id, SUM(total) as total
		FROM invoice
		GROUP BY customer_id)temp
INNER JOIN customer
ON temp.customer_id = customer.customer_id
ORDER BY 4 DESC;


-- Q12. Who are the most popular artists on purchase of song?
SELECT artist.name Artist_name, COUNT(track.track_id) AS Purchases
FROM artist
INNER JOIN album
ON artist.artist_id = album.artist_id
INNER JOIN track
ON track.album_id = album.album_id
INNER JOIN invoice_line
ON track.track_id = invoice_line.track_id
GROUP BY artist.name
ORDER BY 2 DESC;

-- Q13. Which is the most popular song on purchase?
SELECT track.name TrackName, COUNT(track.track_id) AS PopularSong
FROM track
INNER JOIN invoice_line
ON invoice_line.track_id = track.track_id
GROUP BY track.name
ORDER BY 2 DESC;

-- Q14. What are the average prices of different types of music?
SELECT genre.name GenreName, ROUND(avg(total), 2) AvgPrice
FROM invoice
INNER JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
INNER JOIN track ON track.track_id = invoice_line.track_id
INNER JOIN genre ON genre.genre_id = track.genre_id
GROUP BY genre.name
ORDER BY 2 DESC;

-- Q15. What are the most popular countries for music purchases?
SELECT customer.country, COUNT(invoice_line.quantity) AS purchases
FROM invoice_line 
JOIN invoice 
ON invoice.invoice_id = invoice_line.invoice_id
JOIN customer
ON customer.customer_id = invoice.customer_id
GROUP BY country
ORDER BY purchases DESC;