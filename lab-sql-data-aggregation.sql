USE sakila;
SELECT 
    MAX(length) AS max_duration,
    MIN(length) AS min_duration
FROM film;

SELECT 
    CONCAT(
        FLOOR(AVG(length) / 60), ' hours ',
        ROUND(AVG(length) % 60), ' minutes'
    ) AS avg_duration
FROM film;

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS number_of_operating_days
FROM rental;

SELECT *,
    MONTH(rental_date) AS rental_month,
    DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

SELECT *,
    CASE 
        WHEN DAYOFWEEK(rental_date) IN (1,7) THEN 'weekend'
        ELSE 'workday'
    END AS DAY_TYPE
FROM rental
LIMIT 20;

SELECT title,
    IFNULL(CONVERT(rental_duration, CHAR), 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;

SELECT COUNT(*) AS total_films_released
FROM film;

SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating;

SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating
ORDER BY number_of_films DESC;

SELECT 
    rating, 
    ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

SELECT 
    rating, 
    ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
HAVING mean_duration > 120;