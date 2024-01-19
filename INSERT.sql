-- Active: 1705185829338@@127.0.0.1@3306@blockbuster
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
USE blockbuster;

-- -----------------------------------------------------
-- Insert blockbuster.socios
-- -----------------------------------------------------
INSERT INTO
    blockbuster.socios (
        `id`, `nombre`, `apellidos`, `direccion`, `telefono`, `correo`
    )
VALUES (
        NULL, 'Juan', 'Perez', 'Calle 123, Ciudad', '1234567890', 'Juanperezthegamer@gmail.com'
    ),
    (
        NULL, 'Maria', 'Rodriguez', 'Avenida XYZ, Pueblo', '9876543210', 'mariasailormoon@gmail.com'
    ),
    (
        NULL, 'Laura', 'Gomez', 'Calle 456, Ciudad', '3334445555', 'lauraswift@gmail.com'
    ),
    (
        NULL, 'Pedro', 'Martinez', 'Calle XYZ, Ciudad', '6667778888', 'pedrokamado@gmail.com'
    ),
    (
        NULL, 'Ana', 'Lopez', 'Avenida 789, Pueblo', '9990001111', 'anamonsterhigh@gmail.com'
    ),
    (
        NULL, 'Sofia', 'Torres', 'Calle 789, Ciudad', '1112223333', 'sofievalentinelizalde@gmail.com'
    ),
    (
        NULL, 'Alejandro', 'Ramirez', 'Avenida 456, Pueblo', '4445556666', 'alejandroramna@gmail.com'
    ),
    (
        NULL, 'Elena', 'Herrera', 'Calle ABC, Ciudad', '7778889999', 'elenathebarbershop@gmail.com'
    ),
    (
        NULL, 'Javier', 'Mendoza', 'Avenida 123, Pueblo', '2223334444', 'mendozajavier@gmail.com'
    );

-- -----------------------------------------------------
-- Insert blockbuster.directores
-- -----------------------------------------------------
INSERT INTO
    blockbuster.directores (`id`, `nombre`, `apellidos`)
VALUES (
        NULL, 'Guillermo', 'Valentino Sánchez'
    ),
    (
        NULL, 'Marta', 'Escobedo Gutiérrez'
    ),
    (
        NULL, 'Javier', 'Rodríguez Estrada'
    ),
    (NULL, 'Ana', 'Mota Morales'),
    (
        NULL, 'Carlos', 'Hernandez Fernández'
    ),
    (
        NULL, 'Laura', 'Aleman Martínez'
    ),
    (
        NULL, 'Alejandro', 'Renteria López'
    );

-- -----------------------------------------------------
-- Insert blockbuster.actores
-- -----------------------------------------------------
INSERT INTO
    blockbuster.actores (`id`, `nombre`, `apellidos`)
VALUES (NULL, 'Kenichi', 'Yamada'),
    (NULL, 'Mika', 'Nakamura'),
    (NULL, 'Takumi', 'Saito'),
    (NULL, 'Yūki', 'Kobayashi'),
    (NULL, 'Mio', 'Tanaka'),
    (NULL, 'Haruki', 'Ishikawa'),
    (NULL, 'Kana', 'Mori');

-- -----------------------------------------------------
-- Insert blockbuster.generos
-- -----------------------------------------------------
INSERT INTO
    blockbuster.generos (`id`, `nombre`, `descripcion`)
VALUES (
        NULL, 'Drama', 'este es un genero muy aclamado por la audencia'
    ),
    (
        NULL, 'Comedia', 'este es uno de los generos que te hara reir'
    ),
    (
        NULL, 'Acción', 'este es uno de los generos que te haran sentir mucha adrenalina'
    ),
    (
        NULL, 'Romance', 'este es uno de los generos que te haran creer en el amor'
    ),
    (
        NULL, 'Ciencia Ficción', 'este genero es algo lejano a la realidad'
    ),
    (
        NULL, 'Suspenso', 'este genero te dejara desear que pasara despues'
    ),
    (
        NULL, 'Aventura', 'este genero te hara sentirte muy aventurero'
    ),
    (
        NULL, 'Fantasía', 'este genero esta un poco lejas de la realidad'
    ),
    (
        NULL, 'Documental', 'este genero en la mayoria de ocasiones son realidad'
    ),
    (
        NULL, 'Animación', 'la animacion no es para ninos'
    );

-- -----------------------------------------------------
-- Insert blockbuster.peliculas
-- -----------------------------------------------------
INSERT INTO
    blockbuster.peliculas (
        `id`, `titulo`, `fecha_lanzamiento`, `genero_id`, `existencia`, `director_id`
    )
VALUES (
        NULL, 'Dungeons and dragons', '2022-01-01', 1, 50, 1
    ),
    (
        NULL, 'Toy Story', '2019-03-01', 2, 30, 2
    ),
    (
        NULL, 'John Wick', '2014-05-01', 3, 50, 3
    ),
    (
        NULL, 'Akira', '2022-08-12', 4, 30, 4
    ),
    (
        NULL, 'Saw', '2022-09-22', 5, 50, 5
    ),
    (
        NULL, 'Jack y Jill', '2022-10-15', 6, 30, 6
    ),
    (
        NULL, 'El Diario de Noah', '2022-11-14', 7, 50, 7
    ),
    (
        NULL, 'Zatura', '2022-12-18', 8, 30, 3
    ),
    (
        NULL, 'Toy Story 2', '2022-11-14', 9, 50, 7
    ),
    (
        NULL, 'Como Entrenar a tu Dragon', '2022-12-18', 10, 30, 3
    );

-- -----------------------------------------------------
-- Insert blockbuster.directores_favoritos
-- -----------------------------------------------------
INSERT INTO
    blockbuster.directores_favoritos (
        `id`, `socio_id`, `director_id`
    )
VALUES (NULL, 1, 7),
    (NULL, 2, 2),
    (NULL, 3, 3),
    (NULL, 4, 4),
    (NULL, 5, 5),
    (NULL, 6, 6),
    (NULL, 7, 7),
    (NULL, 8, 2),
    (NULL, 9, 7),
    (NULL, 7, 3),
    (NULL, 1, 2);

-- -----------------------------------------------------
-- Insert blockbuster.actores_favoritos
-- -----------------------------------------------------
INSERT INTO
    blockbuster.actores_favoritos (`id`, `socio_id`, `actor_id`)
VALUES (NULL, 1, 7),
    (NULL, 2, 2),
    (NULL, 3, 3),
    (NULL, 4, 4),
    (NULL, 5, 5),
    (NULL, 6, 6),
    (NULL, 7, 7),
    (NULL, 8, 2),
    (NULL, 9, 7),
    (NULL, 7, 3),
    (NULL, 1, 2);

-- -----------------------------------------------------
-- Insert blockbuster.generos_favoritos
-- -----------------------------------------------------
INSERT INTO
    blockbuster.generos_favoritos (`id`, `socio_id`, `genero_id`)
VALUES (NULL, 1, 1),
    (NULL, 2, 2),
    (NULL, 3, 3),
    (NULL, 4, 4),
    (NULL, 5, 5),
    (NULL, 6, 6),
    (NULL, 7, 7),
    (NULL, 8, 8),
    (NULL, 9, 9),
    (NULL, 7, 10),
    (NULL, 1, 2),
    (NULL, 8, 2),
    (NULL, 9, 2),
    (NULL, 7, 4),
    (NULL, 1, 4),
    (NULL, 6, 6);

-- -----------------------------------------------------
-- Insert blockbuster.directores_peliculas
-- -----------------------------------------------------
INSERT INTO
    blockbuster.directores_peliculas (
        `id`, `director_id`, `pelicula_id`
    )
VALUES (NULL, 1, 1),
    (NULL, 2, 2),
    (NULL, 3, 3),
    (NULL, 4, 4),
    (NULL, 5, 5),
    (NULL, 6, 6),
    (NULL, 7, 7),
    (NULL, 1, 8),
    (NULL, 2, 9),
    (NULL, 3, 10);
-- -----------------------------------------------------
-- Insert blockbuster.actores_peliculas
-- -----------------------------------------------------
INSERT INTO
    blockbuster.actores_peliculas (
        `id`, `actor_id`, `pelicula_id`
    )
VALUES (NULL, 1, 1),
    (NULL, 2, 2),
    (NULL, 3, 3),
    (NULL, 4, 4),
    (NULL, 5, 5),
    (NULL, 6, 6),
    (NULL, 7, 7),
    (NULL, 1, 8),
    (NULL, 2, 9),
    (NULL, 3, 10);

-- -----------------------------------------------------
-- Insert blockbuster.prestamos
-- -----------------------------------------------------
INSERT INTO
    blockbuster.prestamos (
        `id`, `fecha_prestamo`, `socio_id`, `status`
    )
VALUES (
        NULL, '2024-01-16 12:30:00', 1, true
    ),
    (
        NULL, '2024-01-16 14:30:00', 2, true
    ),
    (
        NULL, '2024-01-14 16:30:00', 3, true
    ),
    (
        NULL, '2024-01-14 08:30:00', 4, true
    ),
    (
        NULL, '2024-01-15 09:30:00', 5, true
    ),
    (
        NULL, '2024-01-12 10:30:00', 6, true
    ),
    (
        NULL, '2024-01-13 11:30:00', 7, true
    ),
    (
        NULL, '2024-01-10 13:30:00', 8, true
    ),
    (
        NULL, '2024-01-09 15:30:00', 9, true
    ),
    (
        NULL, '2024-01-09 16:30:00', 9, true
    ),
    (
        NULL, '2024-01-09 16:30:00', 1, true
    ),
    (
        NULL, '2024-01-10 16:30:00', 2, true
    );

-- -----------------------------------------------------
-- Insert blockbuster.prestamos_peliculas
-- -----------------------------------------------------
INSERT INTO
    blockbuster.prestamos_peliculas (
        `id`, `prestamo_id`, `pelicula_id`, `cantidad`, `status`
    )
VALUES (NULL, 1, 1, 1, true),
    (NULL, 2, 2, 2, true),
    (NULL, 3, 3, 3, true),
    (NULL, 4, 4, 4, true),
    (NULL, 5, 5, 5, true),
    (NULL, 6, 6, 6, true),
    (NULL, 7, 7, 7, true),
    (NULL, 8, 8, 2, true),
    (NULL, 9, 9, 3, true),
    (NULL, 10, 10, 1, true),
    (NULL, 1, 1, 2, true),
    (NULL, 2, 2, 4, true);

-- -----------------------------------------------------
-- Insert blockbuster.prestamos_finalizados
-- -----------------------------------------------------
INSERT INTO
    blockbuster.prestamos_finalizados (
        `id`, `fecha_entrega`, `prestamo_id`
    )
VALUES (
        NULL, '2024-01-23 12:30:00', 1
    ),
    (
        NULL, '2024-01-23 14:30:00', 2
    ),
    (
        NULL, '2024-01-14 16:30:00', 3
    ),
    (
        NULL, '2024-01-21 16:30:00', 4
    ),
    (
        NULL, '2024-01-22 09:30:00', 5
    ),
    (
        NULL, '2024-01-19 10:30:00', 6
    ),
    (
        NULL, '2024-01-20 11:30:00', 7
    ),
    (
        NULL, '2024-01-17 13:30:00', 8
    ),
    (
        NULL, '2024-01-16 15:30:00', 9
    ),
    (
        NULL, '2024-01-16 16:30:00', 10
    ),
    (
        NULL, '2024-01-16 16:30:00', 1
    ),
    (
        NULL, '2024-01-17 16:30:00', 2
    );

SET SQL_MODE = @OLD_SQL_MODE;

SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;