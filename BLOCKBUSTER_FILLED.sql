-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
UNIQUE_CHECKS = 0;

SET
    @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;

SET
    @OLD_SQL_MODE = @@SQL_MODE,
    SQL_MODE = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS blockbuster DEFAULT CHARACTER SET utf8;

USE blockbuster;

-- -----------------------------------------------------
-- Table blockbuster.socios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.socios (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellidos VARCHAR(50) NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    correo VARCHAR(50) NOT NULL
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla Socios
INSERT INTO `blockbuster`.`socios` (`id`, `nombre`,`apellidos`, `direccion`, `telefono`,`correo`) 
VALUES 
(1, 'Juan','Perez', 'Calle 123, Ciudad', '1234567890','Juanperezthegamer@gmail.com'),
(2, 'Maria' ,'Rodriguez', 'Avenida XYZ, Pueblo', '9876543210','mariasailormoon@gmail.com'),
(3, 'Laura' ,'Gomez', 'Calle 456, Ciudad', '3334445555','lauraswift@gmail.com'),
(4, 'Pedro' ,'Martinez', 'Calle XYZ, Ciudad', '6667778888','pedrokamado@gmail.com'),
(5, 'Ana' ,'Lopez', 'Avenida 789, Pueblo', '9990001111','anamonsterhigh@gmail.com'),
(6, 'Sofia', 'Torres', 'Calle 789, Ciudad', '1112223333','sofievalentinelizalde@gmail.com'),
(7, 'Alejandro', 'Ramirez', 'Avenida 456, Pueblo', '4445556666','alejandroramna@gmail.com'),
(8, 'Elena','Herrera', 'Calle ABC, Ciudad', '7778889999','elenathebarbershop@gmail.com'),
(9, 'Javier','Mendoza', 'Avenida 123, Pueblo', '2223334444','mendozajavier@gmail.com');

-- -----------------------------------------------------
-- Table blockbuster.directores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.directores (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellidos VARCHAR(50) NOT NULL
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla Directores
INSERT INTO `blockbuster`.`directores` (`id`, `nombre`,`apellidos`) 
VALUES 
(1,'Guillermo','Valentino Sánchez'),
(2,'Marta','Escobedo Gutiérrez'),
(3,'Javier','Rodríguez Estrada'),
(4,'Ana','Mota Morales'),
(5,'Carlos','Hernandez Fernández'),
(6,'Laura','Aleman Martínez'),
(7,'Alejandro','Renteria López');

-- -----------------------------------------------------
-- Table blockbuster.actores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.actores (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellidos VARCHAR(50) NOT NULL
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla Actores
INSERT INTO `blockbuster`.`actores` (`id`, `nombre`,`apellidos`) 
VALUES 
(1,'Kenichi', 'Yamada'),
(2,'Mika', 'Nakamura'),
(3,'Takumi', 'Saito'),
(4,'Yūki', 'Kobayashi'),
(5,'Mio', 'Tanaka'),
(6,'Haruki','Ishikawa'),
(7,'Kana', 'Mori');

-- -----------------------------------------------------
-- Table blockbuster.generos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.generos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla Generos
INSERT INTO `blockbuster`.`generos` (`id`, `nombre`,`descripcion`) 
VALUES 
(1, 'Drama','este es un genero muy aclamado por la audencia'),
(2, 'Comedia','este es uno de los generos que te hara reir'),
(3, 'Acción','este es uno de los generos que te haran sentir mucha adrenalina'),
(4, 'Romance','este es uno de los generos que te haran creer en el amor'),
(5, 'Ciencia Ficción','este genero es algo lejano a la realidad'),
(6, 'Suspenso','este genero te dejara desear que pasara despues'),
(7, 'Aventura','este genero te hara sentirte muy aventurero'),
(8, 'Fantasía','este genero esta un poco lejas de la realidad'),
(9, 'Documental','este genero en la mayoria de ocasiones son realidad'),
(10, 'Animación','la animacion no es para ninos');

-- -----------------------------------------------------
-- Table blockbuster.peliculas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titulo VARCHAR(45) NOT NULL,
    fecha_lanzamiento DATETIME NOT NULL,
    genero_id INT NOT NULL,
    existencia INT NOT NULL,
    director_id INT NOT NULL,
    CONSTRAINT fk_peliculas_genero FOREIGN KEY (genero_id)
      REFERENCES blockbuster.generos (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_peliculas_director FOREIGN KEY (director_id)
      REFERENCES blockbuster.directores (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla Peliculas
INSERT INTO `blockbuster`.`peliculas` (`id`, `titulo`, `fecha_lanzamiento`, `genero_id`, `existencia`, `director_id`) 
VALUES 
(1, 'Dungeons and dragons', '2022-01-01', 1, 50, 1),
(2, 'Toy Story', '2019-03-01', 2, 30, 2),
(3, 'John Wick', '2014-05-01', 3, 50, 3),
(4, 'Akira', '2022-08-12', 4, 30, 4),
(5, 'Saw', '2022-09-22', 5, 50, 5),
(6, 'Jack y Jill', '2022-10-15', 6, 30, 6),
(7, 'El Diario de Noah', '2022-11-14', 7, 50, 7),
(8, 'Zatura', '2022-12-18', 8, 30, 3),
(9, 'Toy Story 2', '2022-11-14', 9, 50, 7),
(10, 'Como Entrenar a tu Dragon', '2022-12-18', 10, 30, 3);

-- -----------------------------------------------------
-- Table blockbuster.directores_favoritos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.directores_favoritos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    socio_id INT NOT NULL,
    director_id INT NOT NULL,
    CONSTRAINT fk_directores_favoritos_socio FOREIGN KEY (socio_id)
      REFERENCES blockbuster.socios (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_directores_favoritos_director FOREIGN KEY (director_id)
      REFERENCES blockbuster.directores (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla directores_favoritos
INSERT INTO `blockbuster`.`directores_favoritos` (`id`, `socio_id`,`director_id`) 
VALUES 
(1,1, 7),
(2,2, 2),
(3,3, 3),
(4,4, 4),
(5,5, 5),
(6,6,6),
(7,7, 7),
(8,8,2),
(9,9,7),
(10,7,3),
(11,1,2);

-- -----------------------------------------------------
-- Table blockbuster.actores_favoritos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.actores_favoritos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    socio_id INT NOT NULL,
    actor_id INT NOT NULL,
    CONSTRAINT fk_actores_favoritos_socio FOREIGN KEY (socio_id)
      REFERENCES socios (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_actores_favoritos_actor FOREIGN KEY (actor_id)
      REFERENCES actores (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla actores_favoritos
INSERT INTO `blockbuster`.`actores_favoritos` (`id`, `socio_id`,`actor_id`) 
VALUES 
(1,1, 7),
(2,2, 2),
(3,3, 3),
(4,4, 4),
(5,5, 5),
(6,6,6),
(7,7, 7),
(8,8,2),
(9,9,7),
(10,7,3),
(11,1,2);

-- -----------------------------------------------------
-- Table blockbuster.generos_favoritos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.generos_favoritos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    socio_id INT NOT NULL,
    genero_id INT NOT NULL,
    CONSTRAINT fk_generos_favoritos_socio FOREIGN KEY (socio_id)
      REFERENCES socios (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_generos_favoritos_genero FOREIGN KEY (genero_id)
      REFERENCES generos (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla generos_favoritos
INSERT INTO `blockbuster`.`generos_favoritos` (`id`, `socio_id`,`genero_id`) 
VALUES 
(1,1, 1),
(2,2, 2),
(3,3, 3),
(4,4, 4),
(5,5, 5),
(6,6,6),
(7,7, 7),
(8,8,8),
(9,9,9),
(10,7,10),
(11,1,2),
(12,8,2),
(13,9,2),
(14,7,4),
(15,1,4),
(16,6,6);

-- -----------------------------------------------------
-- Table blockbuster.directores_peliculas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.directores_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    director_id INT NOT NULL,
    pelicula_id INT NOT NULL,
    CONSTRAINT fk_directores_peliculas_director FOREIGN KEY (director_id)
      REFERENCES directores (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_directores_peliculas_pelicula FOREIGN KEY (pelicula_id)
      REFERENCES peliculas (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla actores_favoritos
INSERT INTO `blockbuster`.`directores_peliculas` (`id`, `director_id`,`pelicula_id`) 
VALUES 
(1,1, 1),
(2,2, 2),
(3,3, 3),
(4,4, 4),
(5,5, 5),
(6,6,6),
(7,7, 7),
(8,1,8),
(9,2,9),
(10,3,10);
-- -----------------------------------------------------
-- Table blockbuster.actores_peliculas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.actores_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    actor_id INT NOT NULL,
    pelicula_id INT NOT NULL,
    CONSTRAINT fk_actores_peliculas_actor FOREIGN KEY (actor_id)
      REFERENCES blockbuster.actores (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_actores_peliculas_pelicula FOREIGN KEY (pelicula_id)
      REFERENCES blockbuster.peliculas (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla actores_favoritos
INSERT INTO `blockbuster`.`actores_peliculas` (`id`, `actor_id`,`pelicula_id`) 
VALUES 
(1,1, 1),
(2,2, 2),
(3,3, 3),
(4,4, 4),
(5,5, 5),
(6,6,6),
(7,7, 7),
(8,1,8),
(9,2,9),
(10,3,10);

-- -----------------------------------------------------
-- Table blockbuster.prestamos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    fecha_prestamo DATETIME NOT NULL,
    socio_id INT NOT NULL,
    status BOOLEAN NOT NULL,
    CONSTRAINT fk_prestamos_socio FOREIGN KEY (socio_id)
      REFERENCES blockbuster.socios (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla actores_favoritos
INSERT INTO `blockbuster`.`prestamos` (`id`, `fecha_prestamo`,`socio_id`,`status`) 
VALUES 
(1,'2024-01-16 12:30:00',1,true),
(2,'2024-01-16 14:30:00',2,true),
(3,'2024-01-14 16:30:00',3,true),
(4,'2024-01-14 08:30:00',4,true),
(5,'2024-01-15 09:30:00',5,true),
(6,'2024-01-12 10:30:00',6,true),
(7,'2024-01-13 11:30:00',7,true),
(8,'2024-01-10 13:30:00',8,true),
(9,'2024-01-09 15:30:00',9,true),
(10,'2024-01-09 16:30:00',10,true),
(11,'2024-01-09 16:30:00',1,true),
(12,'2024-01-10 16:30:00',2,true);

-- -----------------------------------------------------
-- Table blockbuster.prestamos_peliculas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.prestamos_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    prestamo_id INT NOT NULL,
    pelicula_id INT NOT NULL,
    cantidad INT NOT NULL,
    status BOOLEAN NOT NULL,
    CONSTRAINT fk_prestamos_peliculas_prestamo FOREIGN KEY (prestamo_id)
      REFERENCES blockbuster.prestamos (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_prestamos_peliculas_pelicula FOREIGN KEY (pelicula_id)
      REFERENCES blockbuster.peliculas (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla actores_favoritos
INSERT INTO `blockbuster`.`prestamos_peliculas` (`id`, `prestamo_id`,`pelicula_id`,`cantidad`,`status`) 
VALUES 
(1,1,1,1,true),
(2,2,2,2,true),
(3,3,3,3,true),
(4,4,4,4,true),
(5,5,5,5,true),
(6,6,6,6,true),
(7,7,7,7,true),
(8,8,8,2,true),
(9,9,9,3,true),
(10,10,10,1,true),
(11,1,1,2,true),
(12,2,2,4,true);


-- -----------------------------------------------------
-- Table blockbuster.pretamos_finalizados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.prestamos_finalizados (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    fecha_entrega DATETIME NOT NULL,
    prestamo_id INT NOT NULL,
    CONSTRAINT fk_pretamos_finalizados_prestamo FOREIGN KEY (prestamo_id)
      REFERENCES blockbuster.prestamos (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
-- Insertar datos de ejemplo en la tabla actores_favoritos
INSERT INTO `blockbuster`.`prestamos_finalizados` (`id`, `fecha_entrega`,`prestamo_id`) 
VALUES 
(1,'2024-01-23 12:30:00',1),
(2,'2024-01-23 14:30:00',2),
(3,'2024-01-14 16:30:00',3),
(4,'2024-01-21 16:30:00',4),
(5,'2024-01-22 09:30:00',5),
(6,'2024-01-19 10:30:00',6),
(7,'2024-01-20 11:30:00',7),
(8,'2024-01-17 13:30:00',8),
(9,'2024-01-16 15:30:00',9),
(10,'2024-01-16 16:30:00',10),
(11,'2024-01-16 16:30:00',1),
(12,'2024-01-17 16:30:00',2);


SET SQL_MODE = @OLD_SQL_MODE;

SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;