-- 1. List all artists for each record label sorted by artist name.
SELECT record_label.name AS record_name, artist.name AS artist_name
FROM record_label
INNER JOIN artist
ON record_label.id = artist.record_label_id
ORDER BY artist.name; 

-- 2. Which record labels have no artists?
SELECT record_label.name
FROM record_label
LEFT JOIN artist
ON record_label.id = artist.record_label_id
WHERE artist.name IS NULL;

-- 3. List the number of songs per artist in descending order
SELECT artist.name AS artist_name, COUNT(song.album_id) AS numberOfSongs
FROM album
INNER JOIN artist
ON artist.id = album.artist_id
INNER JOIN song
ON song.album_id = album.id
GROUP BY artist.name
ORDER BY count(*) DESC;

-- 4. Which artist or artists have recorded the most number of songs?
SELECT artist.name AS artist_name, COUNT(song.album_id) AS numberOfSongs
FROM album
INNER JOIN artist
ON artist.id = album.artist_id
INNER JOIN song
ON song.album_id = album.id
GROUP BY artist.name
ORDER BY count(*) DESC
LIMIT 1;

-- 5. Which artist or artists have recorded the least number of songs?
SELECT artist.name AS artist_name, COUNT(song.album_id) AS numberOfSongs
FROM album
INNER JOIN artist
ON artist.id = album.artist_id
INNER JOIN song
ON song.album_id = album.id
GROUP BY artist.name
HAVING count(*) = (SELECT MIN(numberOfSongs)
					FROM (SELECT artist.name AS artist_name, COUNT(song.album_id) AS numberOfSongs FROM album
							INNER JOIN artist
							ON artist.id = album.artist_id
							INNER JOIN song
							ON song.album_id = album.id
							GROUP BY artist.name)
					temp);
-- 6. How many artists have recorded the least number of songs?
-- Hint: we can wrap the results of query 5. with another select to give us total artist count.
SELECT COUNT(numberOfSongs) AS 'Number of Artists Having Recorded the Least Number of Songs'
FROM(
		SELECT artist.name AS artist_name, COUNT(song.album_id) AS numberOfSongs
		FROM album
		INNER JOIN artist
		ON artist.id = album.artist_id
		INNER JOIN song
		ON song.album_id = album.id
		GROUP BY artist.name
		HAVING count(*) = 
						(SELECT MIN(numberOfSongs)
						FROM (SELECT artist.name AS artist_name, COUNT(song.album_id) AS numberOfSongs FROM album
						INNER JOIN artist
						ON artist.id = album.artist_id
						INNER JOIN song
						ON song.album_id = album.id
						GROUP BY artist.name)
						temp)
		)
temp1;
-- 7. which artists have recorded songs longer than 5 minutes, and how many songs was that?
SELECT artist_name, COUNT(artist_name) AS 'Number of Songs greater than 5 minutes'
FROM 	(
		SELECT  artist.name AS artist_name, duration
		FROM album
		INNER JOIN artist
		ON album.artist_id = artist.id
		INNER JOIN song
		ON song.album_id = album.id
		WHERE duration > 5.0
		)
        temp
GROUP BY temp.artist_name;

-- 8. for each artist and album how many songs were less than 5 minutes long?
SELECT  artist.name AS artist_name, album.name AS album,
		COUNT(song.album_id) AS 'Number of Songs less than 5 minutes'
FROM album
INNER JOIN artist
ON album.artist_id = artist.id
INNER JOIN song
ON song.album_id = album.id
WHERE duration < 5.0
GROUP BY artist.name, album.name;
-- 9. in which year or years were the most songs recorded?
SELECT year, COUNT(year) 'Number of Song Recorded'
FROM album
INNER JOIN song
ON song.album_id = album.id
GROUP BY year
ORDER BY COUNT(year) DESC
LIMIT 1;
-- 10. list the artist, song and year of the top 5 longest recorded songs
SELECT artist.name AS artist_name, song.name AS song_name, album.name AS album_name, album.year, duration
FROM song
INNER JOIN album
ON song.album_id = album.id
INNER JOIN artist
ON artist.id = album.artist_id
ORDER BY duration DESC
LIMIT 5;

-- 11. Number of albums recorded for each year
SELECT year, COUNT(year) AS 'Number of Album Recorded'
FROM album
GROUP BY year; 

-- 12. What is the max number of recorded albums across all the years?
-- Hint:  using the above sql as a temp table
SELECT MAX(NumberOfYear) 'Max Number of Albums Recorded per year for all Years'
FROM (	
		SELECT year, COUNT(year) As NumberOfYear
		FROM album
		GROUP BY year)temp;
    
-- 13. In which year (or years) were the most (max) number of albums recorded, and how many were recorded?
-- Hint: using the above sql as a sub-select
SELECT year, COUNT(year) AS 'Number of Album Recorded'
FROM album
GROUP BY year
HAVING  COUNT(year) =  ( SELECT MAX(NumberOfYear) 
						FROM (	
								SELECT year, COUNT(year) As NumberOfYear
								FROM album
								GROUP BY year
							)temp);

-- 14. total duration of all songs recorded by each artist in descending order
SELECT artist.name AS artist_name, ROUND(SUM(duration), 2) AS 'Total Duration of All Songs'
FROM artist
INNER JOIN album
ON artist.id = album.artist_id
INNER JOIN song
ON song.album_id = album.id
GROUP BY artist.name
ORDER BY SUM(duration) DESC;

-- 15. for which artist and album are there no songs less than 5 minutes long?
SELECT artist.name AS artist_name, album.name AS album_name
FROM artist
LEFT JOIN album
ON artist.id = album.artist_id
LEFT JOIN song
ON song.album_id = album.id AND song.duration < 5
WHERE song.name IS NULL;

-- 16. Display a table of all artists, albums, songs and song duration 
--     all ordered in ascending order by artist, album and song
SELECT artist.name AS artist_name, album.name AS album_name, song.name AS song_name, duration
FROM artist
INNER JOIN album
ON artist.id = album.artist_id
INNER JOIN song
ON album.id = song.album_id
ORDER BY 1,2,3;
  
-- 17. List the top 3 artists with the longest average song duration, in descending with longest average first.
SELECT artist.name AS artist_name, ROUND(AVG(duration), 3) AS 'Longest Average Song Duration'
FROM artist
INNER JOIN album
ON artist.id = album.artist_id
INNER JOIN song
ON album.id = song.album_id
GROUP BY artist.name
ORDER BY AVG(duration) DESC
LIMIT 3;

-- 18. Total album length for all songs on the Beatles Sgt. Pepper's album - in minutes and seconds.
SELECT  artist.name AS artist_name, album.name AS album_name, -- SUM(duration) AS 
		floor(sum(duration)) AS "Minutes",
		round(mod(sum(duration), 1)*60) AS "Seconds"
FROM artist
INNER JOIN album
ON artist.id = album.artist_id
INNER JOIN song
ON album.id = song.album_id
GROUP BY artist.name, album.name
HAVING artist.name = 'the Beatles' AND  album.name LIKE 'Sgt. Pepper\'s%';

-- 19. Which artists did not release an album during the decades of the 1980's and the 1990's?
SELECT DISTINCT artist.name AS artist_name
FROM artist
LEFT  JOIN album
ON artist.id = album.artist_id AND year BETWEEN 1980 AND 1990
WHERE year IS NULL
ORDER BY artist.name;

-- 20. Which artists did release an album during the decades of the 1980's and the 1990's? 
SELECT DISTINCT artist.name AS artist_name
FROM artist
LEFT  JOIN album
ON artist.id = album.artist_id AND year BETWEEN 1980 AND 1990
WHERE year is NOT NULL
ORDER BY artist.name;