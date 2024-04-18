CREATE TABLE
    `carretilla` (
        `usercod` BIGINT(10) NOT NULL,
        `libroId` int NOT NULL,
        `crrctd` INT(5) NOT NULL,
        `crrprc` DECIMAL(12, 2) NOT NULL,
        `crrfching` DATETIME NOT NULL,
        PRIMARY KEY (`usercod`, `libroId`),
        INDEX `librotId_idx` (`libroId` ASC),
        CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`libroId`) REFERENCES `libros` (`libroId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE TABLE
    `carretillaanon` (
        `anoncod` varchar(128) NOT NULL,
        `libroId` int NOT NULL,
        `crrctd` int(5) NOT NULL,
        `crrprc` decimal(12, 2) NOT NULL,
        `crrfching` datetime NOT NULL,
        PRIMARY KEY (`anoncod`, `libroId`),
        KEY `libroId_idx` (`libroId`),
        CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`libroId`) REFERENCES `libros` (`libroId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );