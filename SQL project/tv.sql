USE TV_DB;

-- retrieve the list of all shows cointained in tv_shows that have at least one genre linked sorted in ascending order by title, genre_id
-- each records should display tv_shows.title, tv_show_genres.genre_id.
select title, genre_id
from tv_shows
join tv_show_genres
on tv_show_genres.show_id = tv_shows.id
order by title, genre_id;

-- list all shows contained in the database sorted in ascending order by title, genre_id including shows that dont have genre
-- each records should display tv_shows.title, tv_show_genres.genre_id.
select title, genre_id
from tv_shows
left join tv_show_genres
on tv_show_genres.show_id = tv_shows.id
order by title, genre_id;

-- list all shows contained in the database without a genre linked sorted in ascending order by title, genre_id
-- each records should display tv_shows.title, tv_show_genres.genre_id.
select title, genre_id
from tv_shows
left join tv_show_genres
on tv_show_genres.show_id = tv_shows.id
where genre_id is null
order by title, genre_id;

-- list all genres from the database and displays the number of shows linked to each sorted in descending order by number of shows
-- each records should display genre, number_of_shows.
select tv_genres.name as genre, count(tv_show_genres.genre_id) as number_of_shows
from tv_genres
join tv_show_genres
on tv_show_genres.genre_id = tv_genres.id
group by tv_genres.name
order by number_of_shows desc;

-- list all genres of the show 'dexter' sorted in ascending order by the genre name
-- each records should display tv_genres.name
select tv_genres.name
from tv_shows
join tv_show_genres
on tv_shows.id = tv_show_genres.show_id
join tv_genres
on tv_show_genres.genre_id = tv_genres.id
where title = 'dexter';

-- list all comedy shows in the database sorted in ascending order by show title
-- each records should display tv_shows.title
select title
from tv_shows
join tv_show_genres
on tv_shows.id = tv_show_genres.show_id
join tv_genres
on tv_show_genres.genre_id = tv_genres.id
where name = 'comedy'
order by title;

-- list all shows and all genres linked to that show from the database sorted in ascending order by show title and genre name
-- each records should display tv_shows.title, tv_show_genres.name.
-- if a shows doesnt have genre, display null in the genre column
select title, name 
from tv_shows
left join tv_show_genres
on tv_shows.id = tv_show_genres.show_id
left join tv_genres
on tv_show_genres.genre_id = tv_genres.id
order by title, name;

										-- Advanced Questions
-- list all genres not linked to the show dexter sorted in ascending order by the genre name
-- each records should display tv_genres.name
select distinct tv_genres.name
from tv_genres
join tv_show_genres
on tv_genres.id = tv_show_genres.genre_id
join tv_shows
on tv_show_genres.show_id = tv_shows.id
where tv_genres.name not in(select tv_genres.name
							from tv_shows
							join tv_show_genres
							on tv_shows.id = tv_show_genres.show_id
							join tv_genres
							on tv_show_genres.genre_id = tv_genres.id
							where title = 'dexter')
order by tv_genres.name;

-- list all shows without comedy genre in the database sorted in ascending order by the show title
-- each records should display tv_shows.title
select distinct title
from tv_shows
left join tv_show_genres
on tv_shows.id = tv_show_genres.genre_id
left join tv_genres
on tv_genres.id = tv_show_genres.genre_id
where title not in (select title
					from tv_shows
                    join tv_show_genres
                    on tv_show_genres.show_id = tv_shows.id
                    join tv_genres
                    on tv_genres.id = tv_show_genres.genre_id
                    where tv_genres.name = 'comedy')
order by title;

-- list all shows from by their rating sorted in descending order by the rating
-- each records should display tv_shows.title, rating
select title, sum(rate) as rating
from tv_shows
join tv_show_ratings
on tv_shows.id = tv_show_ratings.show_id
group by title
order by rating desc;

-- list all genres in the database by their rating sorted in descending order by their rating
-- each records should display tv_genres.name, rating
select name, sum(rate) as rating
from tv_genres
join tv_show_genres
on tv_genres.id =tv_show_genres.genre_id
join tv_show_ratings
on tv_show_ratings.show_id = tv_show_genres.show_id
group by name
order by rating desc;
