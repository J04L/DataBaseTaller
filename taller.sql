create table taller(
	nombre varchar(20) primary key,
	direccion varchar(90),
	cp numeric(5),
	ntrabajadores numeric(2),
	mediareparaciones numeric(3),
	check (direccion ilike '%,%,%')
);
create table almacen (
    id numeric(3) primary key,
    direccion varchar(90) ,
    capacidad numeric(5),
	check (direccion ilike '%,%,%')
);
create table tener_almacen(
	idalmacen numeric(3) primary key,
	taller varchar (20) unique,
	foreign key (idalmacen) references almacen (id) on delete cascade on update cascade,
	foreign key (taller) references taller (nombre) on delete cascade on update cascade
);
create table ayudar(
	emisor varchar(20),
	receptor varchar(20),
	fecha date,
	constraint PK_ayudar primary key (emisor, receptor, fecha),
	foreign key (emisor) references taller (nombre) on delete cascade on update cascade,
	foreign key (receptor) references taller (nombre) on delete cascade on update cascade
);
create table mecanico(
	dni varchar(9) primary key,
	nombre varchar(20) ,
    apellido varchar(40) ,
    anostrabajados numeric(2),
    salario numeric(4),
    taller varchar(20),
    especialidad varchar(50),

    foreign key (taller) references Taller(nombre) on delete cascade on update cascade,
	check (dni ~ '^[0-9]{8}[A-Z]$')
);
create table cliente(
    dni varchar(9) primary key,
    nombre varchar(20) ,
    apellidos varchar(40) ,
    direccion varchar(90),
	check (dni ~ '[0-9]{8}[A-Z]$'),
	check (direccion ilike '%,%,%')
);
create table coche(
    matricula varchar(7) unique,
    marca varchar(20) ,
    modelo varchar(20) ,
    motor varchar(100) ,
    combustible varchar(20),
    titular varchar(9) ,
	check(matricula ~ '[0-9]{4}[A-Z]{3}'),
    foreign key (titular) references cliente(dni) on delete cascade on update cascade
);
create table cupon_descuento(
    codigo varchar(2) primary key,
    porcentaje numeric(4,2),
    descripcion text,
	check (codigo ~ '^[0-9][A-F]')
);
create table coderror(
    codigo varchar(5) primary key,
    descripcion text,
    costeHora numeric(3),
    zona varchar(40) 
);
create table reparacion(
    id numeric(5) primary key,
    duracion numeric(2),
    fecha date,
	precio numeric(6,2),
	taller varchar(20),
    coche varchar (17),
	cupon varchar(2),
	coderror varchar(5),
	foreign key (taller) references taller(nombre) on delete cascade on update cascade,
    foreign key (coche) references coche (matricula) on delete cascade on update cascade,
	foreign key (cupon) references cupon_descuento(codigo) on delete cascade on update cascade,
	foreign key (coderror) references coderror(codigo) on delete cascade on update cascade
);
create table accidente(
    codigo varchar(3) primary key,
    descripcion text,
    nimplicados numeric(2),
    coste numeric(6),
    idreparacion numeric(5),
    foreign key (idreparacion) references reparacion (id) on delete cascade on update cascade,
	check (codigo ~ '^[A-Z][0-9]{2}')
);
create table participar(
	dnimecanico varchar(9),
	idreparacion numeric(5),
	accidente varchar (3),
    constraint PK_participar primary key (dnimecanico, idreparacion),
	foreign key (dnimecanico) references mecanico (dni) on delete cascade on update cascade,
	foreign key (idreparacion) references reparacion (id) on delete cascade on update cascade,
	foreign key (accidente) references accidente(codigo) on delete cascade on update cascade
);
create table vendedor(
    id varchar(5) primary key,
    nombre varchar(50) 
);
create table desguace(
    id varchar(5) primary key,
    direccion varchar(90) ,
    foreign key (id) references vendedor (id) on delete cascade on update cascade,
	check (direccion ilike '%,%,%')
);
create table tienda_online(
    id varchar(5) primary key,
    web varchar(255),
    foreign key (id) references vendedor (id) on delete cascade on update cascade,
	check (web ~'https://.+\.[a-zA-Z]{1,3}$')
);
create table pieza(
    codigo varchar(5) primary key,
    nombre varchar(40),
    marca varchar(20),
    modelo varchar(20),
    fecha date,
    precio numeric(6,2),
	idreparacion numeric(5),
    dniCliente varchar(9),
    idVendedor varchar(5),
    idAlmacen numeric(3),
    foreign key (dniCliente) references cliente(dni) on delete cascade on update cascade,
    foreign key (idVendedor) references vendedor(id) on delete cascade on update cascade,
    foreign key (idAlmacen) references almacen (id) on delete cascade on update cascade,
	foreign key (idreparacion) references reparacion(id) on delete cascade on update cascade
);
create table dar_pieza(
    emisor varchar(20),
    receptor varchar(20),
	fecha date,
    codPieza varchar (5),
    constraint PK_darPieza primary key (emisor, receptor, fecha, codPieza),
    foreign key (emisor, receptor, fecha) references ayudar(emisor, receptor, fecha) on delete cascade on update cascade,
    foreign key (codPieza) references pieza (codigo) on delete cascade on update cascade
);