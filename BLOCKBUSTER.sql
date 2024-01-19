-- Active: 1705185829338@@127.0.0.1@3306@blockbuster
-- MySQL Workbench Forward Engineering

DROP SCHEMA IF EXISTS `blockbuster`;

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;

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
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, nombre VARCHAR(40) NOT NULL, apellidos VARCHAR(50) NULL, direccion TEXT NOT NULL, telefono VARCHAR(15) NOT NULL, correo VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.directores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.directores (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, nombre VARCHAR(40) NOT NULL, apellidos VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.actores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.actores (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, nombre VARCHAR(40) NOT NULL, apellidos VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.generos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.generos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, nombre VARCHAR(50) NOT NULL, descripcion TEXT NOT NULL
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.peliculas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, titulo VARCHAR(45) NOT NULL, fecha_lanzamiento DATETIME NOT NULL, genero_id INT NOT NULL, existencia INT NOT NULL, director_id INT NOT NULL, CONSTRAINT fk_peliculas_genero FOREIGN KEY (genero_id) REFERENCES blockbuster.generos (id) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT fk_peliculas_director FOREIGN KEY (director_id) REFERENCES blockbuster.directores (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.directores_favoritos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.directores_favoritos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, socio_id INT NOT NULL, director_id INT NOT NULL, CONSTRAINT fk_directores_favoritos_socio FOREIGN KEY (socio_id) REFERENCES blockbuster.socios (id) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT fk_directores_favoritos_director FOREIGN KEY (director_id) REFERENCES blockbuster.directores (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.actores_favoritos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.actores_favoritos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, socio_id INT NOT NULL, actor_id INT NOT NULL, CONSTRAINT fk_actores_favoritos_socio FOREIGN KEY (socio_id) REFERENCES socios (id) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT fk_actores_favoritos_actor FOREIGN KEY (actor_id) REFERENCES actores (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.generos_favoritos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.generos_favoritos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, socio_id INT NOT NULL, genero_id INT NOT NULL, CONSTRAINT fk_generos_favoritos_socio FOREIGN KEY (socio_id) REFERENCES socios (id) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT fk_generos_favoritos_genero FOREIGN KEY (genero_id) REFERENCES generos (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.directores_peliculas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.directores_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, director_id INT NOT NULL, pelicula_id INT NOT NULL, CONSTRAINT fk_directores_peliculas_director FOREIGN KEY (director_id) REFERENCES directores (id) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT fk_directores_peliculas_pelicula FOREIGN KEY (pelicula_id) REFERENCES peliculas (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.actores_peliculas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.actores_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, actor_id INT NOT NULL, pelicula_id INT NOT NULL, CONSTRAINT fk_actores_peliculas_actor FOREIGN KEY (actor_id) REFERENCES blockbuster.actores (id) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT fk_actores_peliculas_pelicula FOREIGN KEY (pelicula_id) REFERENCES blockbuster.peliculas (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.prestamos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, fecha_prestamo DATETIME NOT NULL, socio_id INT NOT NULL, status BOOLEAN NOT NULL, CONSTRAINT fk_prestamos_socio FOREIGN KEY (socio_id) REFERENCES blockbuster.socios (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.prestamos_peliculas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.prestamos_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, prestamo_id INT NOT NULL, pelicula_id INT NOT NULL, cantidad INT NOT NULL, status BOOLEAN NOT NULL, CONSTRAINT fk_prestamos_peliculas_prestamo FOREIGN KEY (prestamo_id) REFERENCES blockbuster.prestamos (id) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT fk_prestamos_peliculas_pelicula FOREIGN KEY (pelicula_id) REFERENCES blockbuster.peliculas (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table blockbuster.pretamos_finalizados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS blockbuster.prestamos_finalizados (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, fecha_entrega DATETIME NOT NULL, prestamo_id INT NOT NULL, CONSTRAINT fk_pretamos_finalizados_prestamo FOREIGN KEY (prestamo_id) REFERENCES blockbuster.prestamos (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

SET SQL_MODE = @OLD_SQL_MODE;

SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;