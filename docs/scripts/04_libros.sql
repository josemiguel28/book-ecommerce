CREATE TABLE
    `libros` (
                   `libroId` int(11) NOT NULL AUTO_INCREMENT,
                   `libroNombre` varchar(255) NOT NULL,
                    `libroAutor` varchar(255) NOT NULL,
                   `libroDescripcion` text NOT NULL,
                   `libroPrecio` decimal(10, 2) NOT NULL,
                   `libroImgUrl` varchar(255) NOT NULL,
                   `libroStock` int(11) NOT NULL DEFAULT 0,
                   `libroStatus` char(3) NOT NULL,
                   `categoriaId` int NOT NULL,
                   PRIMARY KEY (`libroId`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

ALTER TABLE `libros`
ADD FOREIGN KEY (`categoriaId`) REFERENCES `categorias`(`categoria_id`);