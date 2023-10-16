-- Add your SQL here
SELECT Movie_ID, Movie_Title, Rating
FROM (
    SELECT id as Movie_ID, name as Movie_Title, imdb_rating as Rating,
           ROW_NUMBER() OVER (ORDER BY imdb_rating DESC) as rn
    FROM movies
    WHERE genre = 'Horror' AND release_year <= 1985
) ranked
WHERE rn <= 3;
