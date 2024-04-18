create table `categorias`
(
    `categoria_id` int not null primary key auto_increment,
    `categoria_nombre` varchar(128) not null,
    `create_time` datetime default current_timestamp,
    `update_time` datetime default current_timestamp
);