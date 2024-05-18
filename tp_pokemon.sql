#Where
#Mostrar el nombre, peso y altura de los pokémon cuyo peso sea mayor a 150. 

use pokemondb;
select nombre, peso, altura
from pokemon
where peso > 150;

/*
Tablas: pokemon. 
Campos: nombre, peso, altura. 
Muestra los nombres y potencias de los movimientos que tienen una precisión mayor 90. 
Tablas: movimiento Campos: m.nombre, potencia
*/

select nombre, potencia, precision_mov
from movimiento
where precision_mov > 90;

/*
Operadores & joins
Mostrar tipo, nombre y potencia de los movimientos que tienen una potencia mayor igual que 120.
Tablas: movimiento, tipo
Campos: t.nombre, m.nombre, m.potencia
*/

SELECT t.nombre as tipo, m.nombre as movimiento, m.potencia
FROM movimiento as m
join tipo as t
on m.id_tipo = t.id_tipo
WHERE potencia >= 120;

/*
Muestra los nombres movimientos y el tipo junto con sus tipos 
de ataque correspondientes de aquellos cuya potencia sea igual a 0.
Tablas: tipo, tipo_ataque, movimiento
Campos: t.nombre ta.tipo m.potencia
*/

select m.nombre as movimiento, t.nombre as tipo, ta.tipo as tipo_ataque, m.potencia as potencia
FROM tipo as t
inner join tipo_ataque as ta
on t.id_tipo_ataque = ta.id_tipo_ataque
inner JOIN movimiento as m
on t.id_tipo = m.id_tipo
where potencia = 0;

/*
Order by
Muestra los nombres y números de Pokédex de los primeros 10 Pokémon en orden alfabético.
Tablas: pokemon
Campos: numero_pokedex, nombre
*/

SELECT numero_pokedex, nombre 
FROM pokemon
ORDER BY nombre
LIMIT 10;

/*Muestra los nombres y alturas de los Pokémon de tipo "Eléctrico", ordenados por altura de forma descendente.
Tablas: pokemon, pokemon_tipo, tipo
Campos: nombre, altura
*/

SELECT p.nombre, p.altura, t.nombre as nombre_tipo
from pokemon as p
INNER JOIN pokemon_tipo as pt
on p.numero_pokedex = pt.numero_pokedex
inner JOIN tipo as t
on pt.id_tipo = t.id_tipo
WHERE t.nombre = 'Electrico'
ORDER BY altura desc
;

/*
Funciones de agregación
¿Cuál es la suma total de los valores de "Defensa" en todas las estadísticas base?
Tablas: estadisticas_base
Campos: defensa
*/
SELECT sum(defensa) as total_defensa 
FROM estadisticas_base
;

/*
¿Cuántos Pokémon tienen el tipo "Fuego"?
	Tablas: pokemon_tipo, tipo
Campos: *
*/

SELECT t.nombre as tipo, COUNT(*) as cant_pok
FROM tipo as t
INNER JOIN pokemon_tipo as pt
on t.id_tipo = pt.id_tipo
WHERE t.nombre = 'Fuego'
GROUP BY t.nombre;

/*
Funciones de alteración
Muestra los nombres de los movimientos de tipo de ataque "Especial" 
con una potencia superior a 10 y una descripción que contenga al menos 20 caracteres.
Tablas: movimiento, tipo_ataque
Campos: nombre, potencia, tipo, descripcion
*/

SELECT m.nombre as movimiento,
m.potencia, m.descripcion, ta.tipo as tipo_ataque  
from movimiento as m
INNER JOIN tipo as t
on m.id_tipo = t.id_tipo
INNER join tipo_ataque as ta
on t.id_tipo_ataque = ta.id_tipo_ataque
where ta.tipo = 'Especial'
and potencia > 10
and length(m.descripcion) > 20;

/*
Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon 
de cada tipo que tienen una velocidad promedio superior a 80. 
Solo incluye tipos que tienen al menos 3 Pokémon con esas características.
Tablas: tipo, pokemon_tipo, estadisticas_base
Campos: t.nombre, *
*/

/*
Group by
Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo.
Tablas: pokemon_tipo, tipo
Campos: nombre, numero_pokedex
*/
#use pokemondb;
SELECT nombre as tipo, count(*) AS CANTIDAD
FROM tipo AS t
INNER JOIN pokemon_tipo as pt
on t.id_tipo = pt.id_tipo
GROUP BY tipo;

/*Muestra los nombres de los tipos de Pokémon junto con el promedio de peso de los Pokémon de cada tipo. 
Ordena los resultados de manera descendente según el promedio de peso.
Tablas: pokemon, pokemon_tipo, tipo
Campos: t.nombre, p.peso
*/
SELECT t.nombre as tipo, avg(peso) as peso
FROM tipo AS t
INNER JOIN pokemon_tipo as pt
on t.id_tipo = pt.id_tipo
INNER JOIN pokemon as p
on pt.numero_pokedex = p.numero_pokedex
group BY tipo
order by peso desc;

/*
Having
Muestra los nombres de los Pokémon que tienen más de un tipo.
Tablas: pokemon, pokemon_tipo
Campos: nombre
*/

SELECT nombre as pokemon
FROM pokemon AS P
INNER JOIN pokemon_tipo as pt
ON p.numero_pokedex = pt.numero_pokedex
GROUP BY pokemon
HAVING count(id_tipo) > 1;

/*
Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo que tienen un peso promedio mayor a 10.
Tablas: pokemon, pokemon_tipo, tipo
Campos: nombre, numero_pokedex
*/
SELECT t.nombre as tipo, count(*) as total_pokemon, avg(peso) as promedio_peso
from tipo as t
inner join pokemon_tipo as pt
on t.id_tipo = pt.id_tipo
INNER join pokemon as p
on p.numero_pokedex = pt.numero_pokedex
group by tipo
HAVING promedio_peso > 50;

#Registro
/*
Muestra el nombre de cada Pokémon junto con su tipo, velocidad base y puntos de salud (PS) base. Ordena los resultados por la velocidad base de forma descendente.
	Tablas: pokemon, estadisticas_base, pokemon_tipo, tipo
Campos: p.nombre, t.nombre, eb.velocidad, eb.ps
*/

select p.nombre as pokemon, t.nombre as tipo, eb.velocidad as velocidad, eb.ps as ps
from pokemon as p
INNER join pokemon_tipo as pt
on p.numero_pokedex = pt.numero_pokedex
INNER JOIN tipo as t
on t.id_tipo = pt.id_tipo
INNER join estadisticas_base as eb
on eb.numero_pokedex = pt.numero_pokedex
ORDER BY velocidad desc;