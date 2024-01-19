-- Active: 1705185829338@@127.0.0.1@3306@blockbuster
USE blockbuster;

-- 1. Mostrar los datos de los socios
SELECT * FROM socios;

-- 2. Mostrar los datos de los socios y su directores favoritos
SELECT *
FROM
    socios
    INNER JOIN directores_favoritos ON directores_favoritos.socio_id = socios.id
    JOIN directores ON directores_favoritos.director_id = directores.id;

-- 3. Mostrar los datos de los socios y sus generos favoritos
SELECT *
FROM
    socios
    JOIN generos_favoritos ON generos_favoritos.socio_id = socios.id
    JOIN generos ON generos.id = generos_favoritos.genero_id;

-- 4. Mostrar los datos de los socios y sus actores favoritos
SELECT *
FROM
    socios
    JOIN actores_favoritos ON actores_favoritos.socio_id = socios.id
    JOIN actores ON actores.id = actores_favoritos.actor_id;

-- 5. Mostrar cuales son los 3 generos mas rentados por los socios
SELECT generos.id, generos.nombre, COUNT(generos.id) AS veces_rentada
FROM
    generos
    JOIN generos_favoritos ON generos_favoritos.genero_id = generos.id
    JOIN socios ON socios.id = generos_favoritos.socio_id
GROUP BY
    generos.id,
    generos.nombre
ORDER BY COUNT(generos.id) DESC
LIMIT 3;

-- 6. Mostrar cuales son los 3 directores favoritos por todos los socios
SELECT directores.id, directores.nombre, COUNT(directores.id) AS veces_elegido
FROM
    directores
    JOIN directores_favoritos ON directores_favoritos.director_id = directores.id
    JOIN socios ON socios.id = directores_favoritos.socio_id
GROUP BY
    directores.id,
    directores.nombre
ORDER BY COUNT(directores.id) DESC
LIMIT 3;

-- 7. Mostrar cual es el dia en el que se rentan mas peliculas
SELECT dayname(prestamos.fecha_prestamo) AS dia, COUNT(*) AS cantidad_renta
FROM prestamos
GROUP BY
    dia
ORDER BY cantidad_renta DESC
LIMIT 1;

-- 8. Mostrar el dia que menos rentan el dia de la semana
SELECT dayname(prestamos.fecha_prestamo) AS dia, COUNT(*) AS cantidad_renta
FROM prestamos
GROUP BY
    dia
ORDER BY cantidad_renta ASC
LIMIT 1;

-- 9. Mostrar cuantas peliculas estan rentadas el dia de hoy
SELECT COUNT(*) AS cantidad_peliculas_rentadas
FROM
    prestamos
    LEFT JOIN prestamos_finalizados ON prestamos.id = prestamos_finalizados.prestamo_id
WHERE
    prestamos_finalizados.prestamo_id IS NULL
    AND DATE(prestamos.fecha_prestamo) = CURDATE();

-- 10. Mostrar las peliculas que estan disponibles el dia de hoy
SELECT peliculas.id, peliculas.titulo, peliculas.existencia
FROM peliculas
WHERE
    peliculas.existencia != 0;