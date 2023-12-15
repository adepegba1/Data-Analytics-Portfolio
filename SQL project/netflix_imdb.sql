-- NETFLIX DATASET
USE netflix_imdb;
-- What were the top 10 movies according to IMDB score?
SELECT TOP 10 [title], [imdb_score]
FROM titles
WHERE type = 'movie'
ORDER BY imdb_score DESC;

-- What were the top 10 shows according to IMDB score? 
SELECT TOP 10 [title], [imdb_score]
FROM titles
WHERE type = 'show'
ORDER BY imdb_score DESC;

-- What were the bottom 10 movies according to IMDB score? 
SELECT TOP 10 [title], [imdb_score]
FROM titles
WHERE type = 'movie' AND imdb_score IS NOT NULL
ORDER BY imdb_score;

-- What were the bottom 10 shows according to IMDB score?
SELECT TOP 10 [title], [imdb_score]
FROM titles
WHERE type = 'show' AND imdb_score IS NOT NULL
ORDER BY imdb_score;

-- What were the average IMDB and TMDB scores for shows and movies? 
SELECT  lower(type) AS ContentType, ROUND(avg(imdb_score), 2) AS average_imdb_score,
		ROUND(avg(tmdb_score), 2) AS average_tmdb_score
FROM titles
GROUP BY type;

-- Count of movies and shows in each decade
SELECT lower(type) AS ContentType, release_year/10*10 AS decade, count(type) AS TotalEachDecade
FROM titles
GROUP BY type, release_year/10*10
ORDER BY 2;

-- What were the average IMDB and TMDB scores for each production country?
SELECT  production_countries, ROUND(avg(imdb_score), 2) AS average_imdb_score,
		ROUND(avg(tmdb_score), 2) AS average_tmdb_score
FROM titles
GROUP BY production_countries;

-- What were the average IMDB and TMDB scores for each age certification for shows and movies?
SELECT  lower(type) AS ContentType, age_certification, ROUND(avg(imdb_score), 2) AS average_imdb_score,
		ROUND(avg(tmdb_score), 2) AS average_tmdb_score
FROM titles
GROUP BY type, age_certification;

-- What were the 5 most common age certifications for movies?
SELECT TOP 5 age_certification, COUNT(age_certification) AS MostCommonAge
FROM titles
WHERE type = 'movie' AND age_certification != 'NULL'
GROUP BY age_certification
ORDER BY 2 DESC;

-- Who were the top 20 actors that appeared the most in movies/shows? 
SELECT  TOP 20 name AS Actor, COUNT(name) AS ApearedMost
FROM credits
WHERE role = 'actor'
GROUP BY name
ORDER BY 2 DESC;

-- Who were the top 20 directors that directed the most movies/shows? 
SELECT  TOP 20 name AS Director, COUNT(name) AS DirectedMost
FROM credits
WHERE role = 'director'
GROUP BY name
ORDER BY 2 DESC;

-- Calculating the average runtime of movies and TV shows separately
SELECT lower(type) AS ContentType, ROUND(AVG(runtime),2) AS AverageRuntime
FROM titles
GROUP BY type;


-- Finding the titles and  directors of movies released on or after 2010
SELECT title, lower(role) AS Role, release_year
FROM titles
INNER JOIN credits
ON titles.id = credits.id
WHERE type = 'movie' AND release_year >= 2010 AND role = 'director'
ORDER BY 3;

-- Which shows on Netflix have the most seasons?
SELECT  title, SUM(seasons) AS MostSeason
FROM titles
WHERE type = 'show'
GROUP BY title
ORDER BY 2 DESC;

-- Which genres had the most movies? 
SELECT DISTINCT Genres, COUNT(genres) AS MostGenres
FROM titles
WHERE type = 'Movie'
GROUP BY genres
ORDER BY 2 DESC;

-- Which genres had the most shows? 
SELECT DISTINCT Genres, COUNT(genres) AS MostGenres
FROM titles
WHERE type = 'show'
GROUP BY genres
ORDER BY 2 DESC;

-- Titles and Directors of movies with high IMDB scores (>7.5) and high TMDB popularity scores (>80) 
SELECT title, lower(role) Role 
FROM titles
INNER JOIN credits
ON titles.id = credits.id
WHERE   role = 'Director' AND
		imdb_score > 7.5 AND 
		tmdb_popularity > 80 AND
		type = 'movie'
ORDER BY imdb_score DESC, tmdb_popularity DESC;

-- What were the total number of titles for each year?
SELECT Release_year, COUNT(release_year) AS NumberOfTitles
FROM titles
GROUP BY release_year
ORDER BY 1;

-- Actors who have starred in the most highly rated movies or shows
SELECT name Actor, COUNT(*) MostHighlyRated
FROM titles
INNER JOIN credits
ON titles.id = credits.id
WHERE   role = 'actor' AND
		imdb_score > 8 AND tmdb_score > 8
GROUP BY name
ORDER BY 2 DESC;

-- Which actors/actresses played the same character in multiple movies or TV shows? 
SELECT name ActorsOrActresses, character, COUNT(character) AS SameCharacter
FROM credits
WHERE role = 'actor' or role = 'actress'
GROUP BY name, character
ORDER BY 3 DESC;

-- What were the top 3 most common genres?
SELECT TOP 3 Genres, COUNT(genres) AS MostCommon
FROM titles
GROUP BY genres
ORDER BY 2 DESC;

-- Average IMDB score for leading actors/actresses in movies or shows 
SELECT name Actor, lower(role) Role, ROUND(AVG(imdb_score), 2) AS AvgLeadingActor
FROM titles
INNER JOIN credits
ON credits.id = titles.id
WHERE role = 'actor'
GROUP BY role, name
ORDER BY 3 DESC;
