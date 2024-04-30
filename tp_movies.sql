#Ejercitación consultas - Bases de datos
SELECT * FROM movies_db.movies;
use movies_db;

#Mostrar todos los registros de la tabla de movies.
select * from movies;

#Mostrar el nombre, apellido y rating de todos los actores.
select first_name, last_name, rating 
from actors;

#Mostrar el título de todas las series.
select title 
from series;

#Mostrar el título, rating y duración de la tabla movies.
select title, rating, length 
FROM movies;

#WHERE Y ORDER BY
#Mostrar el nombre y apellido de los actores cuyo rating sea mayor a 7,5.
SELECT first_name, last_name, rating
FROM ACTORS
WHERE rating > 7.5;

#Mostrar el título de las películas, el rating y los premios de las películas con un rating mayor a 7,5 y con más de dos premios.
SELECT title, rating, awards, rating
FROM movies
WHERE rating > 7.5 AND awards > 2;

#Mostrar el título de las películas y el rating ordenadas por rating en forma ascendente.
SELECT title, rating
FROM movies
ORDER BY rating;

#Mostrar actores cuyo rating se encuentre entre 4.0 y 10.0.
SELECT first_name, last_name, RATING
FROM actors
WHERE RATING BETWEEN 4.0 AND 10.0;

#Muestra los títulos y las fechas de lanzamiento de las películas cuya duración sea más de 150 minuto
SELECT title, release_date, length 
FROM movies 
WHERE length > 150;

#BETWEEN y LIKE
#Mostrar el título y rating de todas las películas cuyo título incluya Toy Story.
SELECT title, rating 
FROM movies 
WHERE title 
LIKE 'toy story%';
    
#Mostrar a todos los actores cuyos nombres empiecen con Sam.
SELECT first_name, last_name 
FROM actors 
WHERE first_name 
LIKE 'Sam%';

#Muestra los nombres y apellidos de los actores ordenados por su rating de forma descendente.
select first_name, last_name, rating 
from actors 
order by rating;

#Muestra los títulos y las fechas de lanzamiento de las películas ordenadas por su rating de forma descendente.
select title, release_date, rating 
from movies 
order by rating DESC;

#Muestra los nombres y apellidos de los actores cuyos nombres contienen la letra "a".
SELECT first_name, last_name 
FROM actors 
WHERE first_name LIKE '%A%';

#Mostrar el título de las películas que salieron entre el ‘2004-01-01’ y ‘2008-12-31’.
SELECT title, release_date 
FROM movies 
WHERE release_date BETWEEN '2004-01-01' AND '2008-12-31'