select * from top_english.movies;
-- Retrieve the lastest movies from the dataset order by movie_rating descending
SELECT *
FROM movies
ORDER BY 3 DESC, 4 DESC;

-- Retrieve movies that start with letter 'BA' or 'THE'
SELECT *
FROM movies
WHERE movie_name LIKE 'BA%' OR movie_name LIKE 'THE%'
ORDER BY movie_name;

-- Which movies has the highest rating order by movies_year
SELECT *
FROM movies
ORDER BY movie_rating DESC, movie_year DESC;

-- Retrieve movies with user_votes with thousands order by movie_id
SELECT *
FROM movies
WHERE user_votes LIKE '%K'
ORDER BY 1;

-- Retrieve movies that has 'RE' in the movie name
SELECT *
FROM movies
WHERE movie_name LIKE '%RE%'
ORDER BY movie_name;

-- How many movies are in the dataset
SELECT COUNT(*) AS Total_movies
FROM movies;
