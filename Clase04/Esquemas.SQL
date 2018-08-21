CREACION DE UN ESQUEMA
========================================
1.- Crear el Usuario
2.- Asignarle los privilegios necesarios
3.- Asignarle espacio
4.- El usuario debe crear sus objetos


APLICACION -->> GUARDAR DATOS (ESQUEMA)


OBJETOS DENTRO DE UN ESQUEMA
==============================
1.- Tablas: Columnas, tipos de datos, restricciones
2.- Indices
3.- Funciones
4.- Procedimientos
5.- Secuencias
6.- Paquetes
7.- Desencadenantes
8.- Tipos
9.- Vistas
10.- Sinonimos


EJEMPLO
====================

create user venta identified by admin;

--------------------------------------------------------------------
SQL> conn venta/admin
ERROR:
ORA-01045: user VENTA lacks CREATE SESSION privilege; logon denied
--------------------------------------------------------------------

grant connect to venta;

--------------------------------------------------------------------
SQL> conn venta/admin
Conectado.
SQL> show user
USER es "VENTA"
--------------------------------------------------------------------

grant resource to venta;


create table articulo(
  id_art number(8) not null,
  nombre varchar2(80) null,
  precio number(10,2) not null check (precio > 0.0),
  constraint pk_articulo primary key(id_Art)
);

insert into articulo values( 1, 'Art 01', 45.8);
insert into articulo values( 2, 'Art 02', 67.9);
insert into articulo values( 3, 'Art 03', 13.4);
commit;

create table venta(
  id_venta number(8) not null,
  id_art number(8) not null,
  precio number(10,2) not null check (precio > 0.0),
  cantidad number(5) not null check (cantidad > 0),
  importe number(10,2) not null check (importe > 0.0),
  constraint ck_venta_importe check( importe = (precio * cantidad) ),
  constraint pk_venta primary key( id_venta ),
  constraint fk_venta_articulo
    foreign key(id_art) references articulo
);

insert into venta values(100, 2, 45.8, 10, 458.0);









