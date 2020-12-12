--Se usa netbeans como cliente de base de datos.
--script que contiene la creación de la base de datos y la tabla.
drop database if exists negocio;

create database negocio;

use negocio;

create table articulos(
    id int auto_increment primary key,
    nombre varchar(20) not null,
    distribuidor enum('CapDistribuidor','MarquezDistribuidor','ArgentinaDistribuidor'),
    tipo enum('Bebida','Comestible','Lacteos','Limpieza'),
    precio double not null
);

select * from articulos;