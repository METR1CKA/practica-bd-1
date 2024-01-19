-- Active: 1705185829338@@127.0.0.1@3306@blockbuster
USE blockbuster;

-- 1. Mostrar los datos de los socios
SELECT * FROM socios;

-- 2. Mostrar los datos de los socios y su directores favoritos
SELECT *
FROM
    socios AS s
    INNER JOIN directores_favoritos AS df ON df.socio_id = s.id
    JOIN directores AS d ON df.director_id = d.id;

-- 3. Mostrar los datos de los socios y sus generos favoritos
SELECT *
FROM
    socios AS s
    JOIN generos_favoritos AS gf ON gf.socio_id = s.id
    JOIN generos AS g ON g.id = gf.genero_id;

-- 4. Mostrar los datos de los socios y sus actores favoritos
SELECT *
FROM
    socios AS s
    JOIN actores_favoritos AS af ON af.socio_id = s.id
    JOIN actores AS a ON a.id = af.actor_id;

-- 5. Mostrar cuales son los 3 generos mas rentados por los socios
SELECT g.id, g.nombre, COUNT(g.id) AS veces_rentada
FROM
    generos AS g
    JOIN generos_favoritos AS gf ON gf.genero_id = g.id
    JOIN socios AS s ON s.id = gf.socio_id
GROUP BY
    g.id,
    g.nombre
ORDER BY COUNT(g.id) DESC
LIMIT 3;

-- 6. Mostrar cuales son los 3 directores favoritos por todos los socios
SELECT d.id, d.nombre, COUNT(d.id) AS veces_elegido
FROM
    directores AS d
    JOIN directores_favoritos AS df ON df.director_id = d.id
    JOIN socios AS s ON s.id = df.socio_id
GROUP BY
    d.id,
    d.nombre
ORDER BY COUNT(d.id) DESC
LIMIT 3;

-- 7. Mostrar cual es el dia en el que se rentan mas peliculas
SELECT dayname(p.fecha_prestamo) AS dia, COUNT(*) AS cantidad_renta
FROM prestamos AS p
GROUP BY
    dia
ORDER BY cantidad_renta DESC
LIMIT 1;

-- 8. Mostrar el dia que menos rentan el dia de la semana
SELECT dayname(p.fecha_prestamo) AS dia, COUNT(*) AS cantidad_renta
FROM prestamos AS p
GROUP BY
    dia
ORDER BY cantidad_renta ASC
LIMIT 1;

-- 9. Mostrar cuantas peliculas estan rentadas el dia de hoy
SELECT COUNT(*) AS cantidad_peliculas_rentadas
FROM
    prestamos AS p
    LEFT JOIN prestamos_finalizados AS pf ON p.id = pf.prestamo_id
WHERE
    pf.prestamo_id IS NULL
    AND DATE(p.fecha_prestamo) = CURDATE();

-- 10. Mostrar las peliculas que estan disponibles el dia de hoy
SELECT p.id, p.titulo, p.existencia - IFNULL(
        (
            SELECT SUM(pp.cantidad)
            FROM blockbuster.prestamos_peliculas pp
                JOIN blockbuster.prestamos pr ON pp.prestamo_id = pr.id
            WHERE
                pp.pelicula_id = p.id
                AND DATE(pr.fecha_prestamo) = CURDATE()
        ), 0
    ) AS disponibles
FROM blockbuster.peliculas p
HAVING
    disponibles > 0;

-- 11. Mostrar la cantidad de peliculas que se rentaron cada dia de la semana
SELECT
    CASE DAYOFWEEK(pr.fecha_prestamo)
        WHEN 1 THEN 'Domingo'
        WHEN 2 THEN 'Lunes'
        WHEN 3 THEN 'Martes'
        WHEN 4 THEN 'Miércoles'
        WHEN 5 THEN 'Jueves'
        WHEN 6 THEN 'Viernes'
        WHEN 7 THEN 'Sábado'
    END AS dia_semana,
    COUNT(pp.pelicula_id) AS cantidad_peliculas
FROM blockbuster.prestamos AS pr
    JOIN blockbuster.prestamos_peliculas AS pp ON pr.id = pp.prestamo_id
GROUP BY
    DAYOFWEEK(pr.fecha_prestamo);