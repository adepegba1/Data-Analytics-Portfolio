-- drop database if exists nollywood_db;
create database nollywood_db;
use nollywood_db;
-- WHICH YEAR PRODUCE HIGHEST NUMBER OF MUSIC
SELECT year, COUNT(year) numbers
FROM nollywood
WHERE genre LIKE '%music%'
GROUP BY year 
ORDER BY numbers DESC
LIMIT 1;

-- WHICH MOVIES HAVE THE RATING ABOVE 7.5
SELECT *
FROM nollywood
WHERE rating > 7.5
ORDER BY rating;

-- WHICH MOVIES DOES NOT HAVE RATING APART FROM MUSIC GENRE
SELECT *
FROM nollywood
WHERE genre NOT LIKE '%music%' AND rating = 0
ORDER BY title;

-- WHICH MUSIC HAVE RATING
SELECT *
FROM nollywood
WHERE genre LIKE '%music%' AND rating > 0;

-- WHAT ARE THE MOVIES THAT FUNKE AKINDELE IS PART OF THE DIRECTORS
SELECT *
FROM nollywood
WHERE director LIKE '%Funke Akindele%';

-- WHICH MOVIES DID KUNLE AFOLAYAN DIRECT?
SELECT *
FROM nollywood
WHERE director = 'Kunle Afolayan';

-- WHICH DIRECTOR DIRECT THE HIGHEST NUMBER OF DRAMA
SELECT director, COUNT(genre) Numbers
FROM nollywood
WHERE genre LIKE '%drama%'
GROUP BY director
ORDER BY numbers DESC, director;

-- KATE HENSHAW AS A STAR APPEAR IN WHICH MOVIES
SELECT *
FROM nollywood
WHERE stars LIKE '%Kate Henshaw%';

-- WHICH DIRECTOR DIRECT MOST OF DAVIDO MUSIC (DAVIDO IN STAR)
SELECT director, COUNT(director) Numbers
FROM nollywood
WHERE genre LIKE '%music%' AND stars LIKE '%Davido%'
GROUP BY director
ORDER BY numbers DESC;

-- WHICH YEAR HAVE THE HIGHEST NUMBER OF PRODUCTION
SELECT year, COUNT(year) Total_number
FROM nollywood
GROUP BY year
ORDER BY Total_number DESC;

-- WHICH MOVIES HAVE PART 4
SELECT title 
FROM nollywood
WHERE title LIKE '%4';

-- LIST THE MOVIES THAT DESMOND ELLIOT AS A STAR APPEAR AND HAS 7.5 RATING ABOVE
SELECT *
FROM nollywood
WHERE stars LIKE '%Desmond Elliot%' AND rating > 7.5;