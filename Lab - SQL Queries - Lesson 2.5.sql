USE sakila;

-- Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name LIKE '%Scarlett%';

-- How many physical copies of movies are available for rent in the store's inventory? 
-- How many unique movie titles are available?
SELECT COUNT(inventory_id) FROM sakila.inventory;
-- Answer: It´s there 4,581
SELECT COUNT(DISTINCT title) FROM sakila.film;
-- Answer: 1,000 unique titles availables.

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT min(length) as min_duration, max(length) as max_duration
FROM sakila.film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT 
    AVG(length / 60) AS 'Promedio en Horas',
    AVG(length % 60) AS 'Promedio en Minutos'
FROM sakila.film;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;

-- How many days was the company operating? Assume the last rental date was their closing date.
SELECT 
MIN(rental_date) AS 'First day rental' ,
MAX(rental_date) AS 'Last day rental', 
DATEDIFF(MAX(rental_date), MIN(rental_date)) AS 'Operations days'
FROM sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20 results.

SELECT *,
    MONTHNAME(rental_date) AS 'month',
    DAYNAME(rental_date) AS 'weekday'
FROM sakila.rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
    DAYNAME(rental_date) AS 'weekday',
    CASE
        WHEN DAYNAME(rental_date) = 'Monday' THEN 'Workday'
        WHEN DAYNAME(rental_date) = 'Tuesday' THEN 'Workday'
        WHEN DAYNAME(rental_date) = 'Wednesday' THEN 'Workday'
        WHEN DAYNAME(rental_date) = 'Thursday' THEN 'Workday'
        ELSE 'Weekend'
    END AS 'day_type'
FROM sakila.rental;
 
 -- Get release years.
 SELECT release_year FROM sakila.film;
 
 -- Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE title LIKE '%APOLLO';

-- Get 10 the longest films.
SELECT title, MAX(length)
FROM sakila.film
GROUP BY title
ORDER BY MAX(length) DESC
LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT COUNT('Behind the Scenes' IN ('special_features')) FROM sakila.film;
