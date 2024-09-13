INSERT INTO taller VALUES
    ('El Banano', 'Calle 123, Ciudad X, Valencia', 12345, 10, 75),
    ('Ojo de la cara', 'Carrera 987, Ciudad P, Salamanca', 13579, 6, 55),
    ('Reparacione ehtrema', 'Carrera 654, Ciudad X, Cádiz', 45678, 7, 65),
    ('El Taller', 'Calle Central 012, Ciudad Z, Alicante', 01234, 13, 95),
    ('Los Vikingos', 'Avenida Norte 135, Ciudad Z, Toledo', 13579, 14, 100);
	
INSERT INTO almacen VALUES (100, 'Calle San Juan, 123, Madrid', 100);
INSERT INTO almacen VALUES (200, 'Avenida de la Constitución, 45, Barcelona', 150);
INSERT INTO almacen VALUES (300, 'Calle Mayor, 67, Valencia', 200);
INSERT INTO almacen VALUES (400, 'Plaza de España, 8, Sevilla', 80);
INSERT INTO almacen VALUES (500, 'Calle Gran Vía, 210, Bilbao', 120);

INSERT INTO ayudar VALUES
	('Ojo de la cara', 'El Banano', '2016-04-05'),
	('El Banano', 'Los Vikingos', '2019-02-14'),
	('Reparacione ehtrema', 'El Banano', '2022-11-23'),
	('El Taller', 'Los Vikingos', '2023-03-08'),
	('Los Vikingos', 'Ojo de la cara', '2024-05-12');

INSERT INTO mecanico VALUES 
	('12345678A', 'Juan', 'González', 5, 2500, 'El Banano', 'Mecánica de automóviles'),
	('23456789B', 'María', 'López', 3, 2000, 'El Banano', 'Chapa y pintura'),
	('34567890C', 'Pedro', 'Martínez', 8, 3500, 'El Banano', 'Electricidad del automóvil'),
	('45678901D', 'Ana', 'Sánchez', 2, 1800, 'El Banano', 'Mecánica de motocicletas'),
	('56789012E', 'Luis', 'Rodríguez', 6, 2800, 'El Banano', 'Reparación de sistemas de suspensión'),
	('67890123F', 'Laura', 'García', 4, 2200, 'El Banano', 'Diagnóstico electrónico'),
	('78901234G', 'Carlos', 'Pérez', 7, 3200, 'Reparacione ehtrema', 'Mecánica de automóviles'),
	('89012345H', 'Sofía', 'Fernández', 1, 1500, 'Reparacione ehtrema', 'Chapa y pintura'),
	('90123456I', 'David', 'Ruiz', 9, 3800, 'Reparacione ehtrema', 'Mecánica de vehículos pesados'),
	('01234567J', 'Elena', 'Díaz', 5, 2500, 'Los Vikingos', 'Mecánica de automóviles'),
	('12345098K', 'Pablo', 'Hernández', 3, 2000, 'Ojo de la cara', 'Chapa y pintura'),
	('23450987L', 'Carmen', 'Gómez', 8, 3500, 'Ojo de la cara', 'Reparación de sistemas de climatización'),
	('34509876M', 'Javier', 'Martín', 2, 1800, 'Ojo de la cara', 'Mecánica de automóviles'),
	('45098765N', 'Lucía', 'López', 6, 2800, 'Ojo de la cara', 'Chapa y pintura'),
	('50987654O', 'Marta', 'Rodríguez', 4, 2200, 'El Taller', 'Mecánica de automóviles'),
	('09876543P', 'Diego', 'García', 7, 3200, 'El Taller', 'Electricidad del automóvil'),
	('98765432Q', 'Paula', 'Pérez', 1, 1500, 'El Taller', 'Diagnóstico electrónico'),
	('87654321R', 'Jorge', 'Fernández', 9, 3800, 'Los Vikingos', 'Mecánica de automóviles'),
	('76543210S', 'Alba', 'Ruiz', 5, 2500, 'Los Vikingos', 'Chapa y pintura'),
	('65432109T', 'Manuel', 'Díaz', 3, 2000, 'Los Vikingos', 'Reparación de sistemas de dirección'),
	('54321098U', 'Rosa', 'Hernández', 8, 3500, 'Los Vikingos', 'Mecánica de automóviles');

	
INSERT INTO cliente (dni, nombre, apellidos, direccion) VALUES 
	('47291836A', 'Juan', 'Martínez Pérez', 'Calle Mayor, 10, Madrid'),
	('58962741B', 'María', 'García López', 'Calle Real, 20, Barcelona'),
	('20384756C', 'Luis', 'Rodríguez Martín', 'Calle Gran Vía, 15, Valencia'),
	('71639285D', 'Ana', 'Fernández Gómez', 'Avenida Libertad, 5, Sevilla'),
	('93485726E', 'David', 'Sánchez Rodríguez', 'Paseo de la Estación, 8, Málaga'),
	('61520384F', 'Laura', 'Pérez González', 'Calle Mayor, 30, Alicante'),
	('82049563G', 'Carlos', 'Martín Sánchez', 'Avenida de la Constitución, 25, Zaragoza');
INSERT INTO coche VALUES
	('2468STU', 'Nissan', 'Xterra', '3.3L V6', 'Diésel', '82049563G'),
	('1357VWX', 'Buick', 'LeSabre', '3.8L V6', 'Gasolina', '93485726E'),
	('3579YZA', 'Toyota', 'Corolla', '1.8L I4', 'Gasolina', '71639285D'),
	('7890BCD', 'Honda', 'Accord', '2.4L I4', 'Gasolina', '58962741B'),
	('3579EFG', 'Mercedes-Benz', 'C-Class', '3.0L V6', 'Diésel', '93485726E'),
	('1234HIJ', 'Toyota', 'Corolla', '1.8L I4', 'Gasolina', '20384756C'),
	('7890KLM', 'Chrysler', '200', '2.4L I4', 'Diésel', '58962741B'),
	('4557NOP', 'Chevrolet', 'Corvette', '6.0L V8', 'Gasolina', '93485726E'),
	('9101VWX', 'Buick', 'LeSabre', '3.8L V6', 'Diésel', '20384756C'),
	('5678YZA', 'Toyota', 'Corolla', '1.8L I4', 'Diésel', '47291836A'),
	('1357NOP', 'Chevrolet', 'Corvette', '6.0L V8', 'Eléctrico', '47291836A'),
	('7890QRS', 'BMW', '3-Series', '3.0L I6', 'Eléctrico', '61520384F');
INSERT INTO cupon_descuento (codigo, porcentaje, descripcion) VALUES
    ('1B', 0.1, 'Cupón "1B" que ofrece un descuento del 10% en servicios de cambio de aceite y filtro como parte de la promoción de enero en nuestro taller mecánico.'),
    ('3F', 0.15, 'Cupón "3F" que otorga un descuento del 15% en la revisión y mantenimiento de frenos, válido para el Black Friday.'),
    ('4E', 0.2, 'Cupón "4E" que proporciona un descuento del 20% en la reparación de averías eléctricas para celebrar la Navidad.'),
    ('2C', 0.25, 'Cupón "2C" que brinda un descuento del 25% en la alineación y balanceo de neumáticos como parte de nuestra oferta especial de San Valentín.'),
    ('5A', 0.3, 'Cupón "5A" que ofrece un descuento del 30% en la mano de obra para la reparación de motor, como regalo para el Día del Padre.');
insert into coderror values 
	('P0934', 'Fallo en el sistema de encendido', 32, 'Motor'),
	('P1303', 'Problema en el sensor de oxígeno', 12, 'Escape'),
	('U2130', 'Fuga en el sistema de combustible', 81, 'Depósito de combustible'),
	('P0456', 'Fallo en el sistema de emisiones', 56, 'Escape'),
	('U0912', 'Problema en el circuito eléctrico', 109, 'Sistema eléctrico'),
	('P0710', 'Fallo en el sensor de velocidad', 70, 'Transmisión'),
	('U1776', 'Fallo en el sistema de dirección asistida', 88, 'Dirección');

INSERT INTO reparacion VALUES (1, 5, '2021-12-26', 0, 'El Banano', '2468STU', '3F', 'P0934');
INSERT INTO reparacion VALUES (2, 4, '2013-12-25', 0, 'Ojo de la cara', '1357VWX', null, 'P1303');
INSERT INTO reparacion VALUES (3, 3, '2015-09-24', 0, 'Reparacione ehtrema', '3579YZA',null, 'U2130');
INSERT INTO reparacion VALUES (4, 2, '2023-02-23', 0, 'El Taller', '7890BCD', null, 'P1303');
INSERT INTO reparacion VALUES (5, 1, '2022-03-22', 0, 'Los Vikingos', '3579EFG', '4E', 'P0934');
INSERT INTO reparacion VALUES (6, 6, '2023-01-21', 0, 'El Banano', '1234HIJ', '5A', 'P1303');
INSERT INTO reparacion VALUES (7, 5, '2021-01-20', 0, 'El Banano', '7890KLM', null, 'U2130');
INSERT INTO reparacion VALUES (8, 4, '2024-09-19', 0, 'Ojo de la cara', '4557NOP', null, 'P0934');
INSERT INTO reparacion VALUES (9, 3, '2018-11-18', 0, 'Reparacione ehtrema', '9101VWX', null, 'P1303');
INSERT INTO reparacion VALUES (10, 2, '20217-08-17', 0, 'El Taller', '5678YZA', '1B', 'P0710');
INSERT INTO reparacion VALUES (11, 1, '2016-07-16', 0, 'Los Vikingos', '1357NOP', null, 'U1776');
INSERT INTO reparacion VALUES (12, 6, '2017-10-15', 0, 'Reparacione ehtrema', '7890QRS', '4E', 'P0934');
INSERT INTO reparacion VALUES (13, 5, '2018-04-14', 0, 'El Banano', '2468STU', null, 'P1303');
INSERT INTO reparacion VALUES (14, 4, '2024-05-13', 0, 'El Banano', '1357VWX', null, 'P0934');
INSERT INTO reparacion VALUES (15, 3, '2015-12-12', 0, 'Ojo de la cara', '3579YZA', null, 'P1303');

INSERT INTO accidente (codigo, descripcion, nimplicados, coste, idreparacion)VALUES 
    ('A01', 'Colisión frontal', 2, 1800, 15),
    ('B82', 'Choque lateral', 1, 2000, 10),
    ('F35', 'Accidente de vuelco', 3, 1700, 12),
    ('G19', 'Accidente por alcance', 2, 2200, 15),
    ('C73', 'Accidente de tráfico', 4, 1600, 1),
    ('D50', 'Daño por vandalismo', 1, 1800, 5),
    ('E92', 'Accidente de estacionamiento', 2, 1900, 14);
	
INSERT INTO participar (dnimecanico, idreparacion, accidente) VALUES
	('34567890C', 13, 'A01'),
	('45678901D', 1, NULL),
	('56789012E', 1, NULL),
	('89012345H', 3, NULL),
	('90123456I', 3, 'E92'),
	('23450987L', 15, NULL),
	('34509876M', 8, 'D50'),
	('50987654O', 8, NULL),
	('09876543P', 4, NULL),
	('98765432Q', 10, NULL),
	('65432109T', 11, 'F35'),
	('54321098U', 11, 'G19'),
	('34567890C', 13, NULL),
	('45678901D', 6, 'C73'),
	('56789012E', 7, NULL),
	('89012345H', 9, NULL),
	('90123456I', 9, NULL),
	('23450987L', 15, 'B82'),
	('34509876M', 15, NULL),
	('50987654O', 10, NULL);
	
INSERT INTO vendedor VALUES ('V0010', 'Autopiezas García');
INSERT INTO vendedor VALUES ('V0020', 'Repuestos Martínez');
INSERT INTO vendedor VALUES ('V0030', 'Automóviles López');
INSERT INTO vendedor VALUES ('V0040', 'Piezas Rápidas Sánchez');
INSERT INTO vendedor VALUES ('V0050', 'Car Part Express');
INSERT INTO vendedor VALUES ('V0060', 'Accesorios Automotrices Soto');
INSERT INTO vendedor VALUES ('V0070', 'Recambios Velázquez');
INSERT INTO vendedor VALUES ('V0080', 'Auto Parts Torres');
INSERT INTO vendedor VALUES ('V0090', 'Repuestos González');
INSERT INTO vendedor VALUES ('V0100', 'Autopiezas Ruiz');

INSERT INTO tienda_online VALUES ('V0010', 'https://www.autopiezasgarcia.es');
INSERT INTO tienda_online VALUES ('V0020', 'https://www.repuestosmartinez.es');
INSERT INTO tienda_online VALUES ('V0030', 'https://www.automovileslopez.es');
INSERT INTO tienda_online VALUES ('V0040', 'https://www.piezasrapidassanchez.es');
INSERT INTO tienda_online VALUES ('V0050', 'https://www.carpartexpress.es');

INSERT INTO desguace VALUES ('V0060', 'Calle de la Estación, 45, Madrid');
INSERT INTO desguace VALUES ('V0070', 'Avenida del Parque, 32, Barcelona');
INSERT INTO desguace VALUES ('V0080', 'Plaza del Sol, 10, Valencia');
INSERT INTO desguace VALUES ('V0090', 'Calle Mayor, 7, Sevilla');
INSERT INTO desguace VALUES ('V0100', 'Paseo de la Alameda, 89, Bilbao');

INSERT INTO pieza VALUES 
	('0001A', 'Bobina de encendido', 'Bosch', 'XYZ123', '2023-05-15', 50, 1, null, null, 100),
	('0001B', 'Sonda lambda', 'Denso', 'ABC456', '2018-08-20', 80, 1, null, null, 100),
	('0001C', 'Pistón', 'Mahle', 'DEF789', '2016-10-10', 150, 2, null, null, 100),
	('0002A', 'Bomba de gasolina', 'Delphi', 'LMN456', '2017-07-25', 300, 2, null, null, 200),
	('0002B', 'Cigüeñal', 'Federal-Mogul', 'OPQ789', '2019-12-01', 200, 2, null, null, 200),
	('0002C', 'Parachoques delantero', 'Valeo', 'RST012', '2022-02-28', 400, 2, null, null, 200),
	('0003A', 'Junta de culata', 'Elring', 'UVW345', '2015-09-10', 30, 2, null, null, 200),
	('0003B', 'Parabrisas', 'Pilkington', 'XYZ678', '2020-04-05', 250, 3, null, null, 300),
	('0003C', 'Rueda', 'Continental', 'ABC901', '2018-11-11', 80, 3, null, null, 300),
	('0004A', 'Sensor de temperatura', 'Bosch', 'DEF234', '2017-03-17', 70, 3, null, null, 300),
	('0004B', 'Bobina de encendido', 'Denso', 'GHI567', '2019-06-20', 120, 4, null, null, 400),
	('0004C', 'Sonda lambda', 'Bosch', 'JKL890', '2021-08-30', 90, 4, null, null, 400),
	('0005A', 'Pistón', 'Mahle', 'MNO123', '2016-02-14', 180, 5, null, null, 400),
	('0005B', 'Bomba de gasolina', 'Delphi', 'PQR456', '2018-05-01', 320, 6, null, null, 400),
	('0005C', 'Cigüeñal', 'Federal-Mogul', 'STU789', '2020-09-02', 220, 7, null, null, 400),
	('0006A', 'Parachoques delantero', 'Valeo', 'VWX012', '2017-11-30', 450, 7, null, null, 400),
	('0006B', 'Junta de culata', 'Elring', 'YZA345', '2019-04-22', 35, 8, null, null, 500),
	('0006C', 'Parabrisas', 'Pilkington', 'BCD678', '2022-06-18', 270, 8, null, null, 500),
	('0007A', 'Rueda', 'Continental', 'EFG901', '2016-08-05', 100, 4, null, null, 500),
	('0007B', 'Sensor de temperatura', 'Bosch', 'HIJ234', '2020-01-10', 80, 8, null, null, 500),
	('0007C', 'Bobina de encendido', 'Denso', 'KLM567', '2018-03-22', 130, 9, null, null, 500),
	('0008A', 'Sonda lambda', 'Bosch', 'NOP890', '2017-02-09', 100, 9, null, null, 500),
	('0008B', 'Pistón', 'Mahle', 'QRS123', '2019-05-15', 200, 9, null, null, 500),
	--almacen

	('0008C', 'Bomba de gasolina', 'Delphi', 'TUV456', '2021-07-01', 350, 10, null, 'V0010', null),
	('0009A', 'Cigüeñal', 'Federal-Mogul', 'WXY789', '2016-11-11', 230, 10, null, 'V0010', null),
	('0009B', 'Parachoques delantero', 'Valeo', 'ZAB012', '2018-04-02', 500, 10, null, 'V0010', null),
	('0009C', 'Junta de culata', 'Elring', 'CDE345', '2020-09-28', 40, 11, null, 'V0010', null),
	('0010A', 'Parabrisas', 'Pilkington', 'FGH678', '2017-06-15', 300, 11, null, 'V0010', null),
	('0010B', 'Rueda', 'Continental', 'IJK901', '2019-01-20', 120, 12, null, 'V0020', null),
	('0010C', 'Sensor de temperatura', 'Bosch', 'LMN234', '2021-04-11', 90, 12, null, 'V0020', null),
	('0011A', 'Bobina de encendido', 'Denso', 'OPQ567', '2016-12-08', 140, 10, null, 'V0030', null),
	('0011B', 'Sonda lambda', 'Bosch', 'RST890', '2018-02-03', 110, 13, null, 'V0040', null),
	('0011C', 'Pistón', 'Mahle', 'UVW123', '2020-08-19', 220, 3, null, 'V0050', null),
	('0012A', 'Bomba de gasolina', 'Delphi', 'XYZ456', '2017-10-25', 380, 13, null, 'V0050', null),
	('0012B', 'Cigüeñal', 'Federal-Mogul', 'ABC789', '2019-03-30', 250, 13, null, 'V0060', null),
	('0012C', 'Parachoques delantero', 'Valeo', 'DEF012', '2021-05-28', 550, 14, null, 'V0070', null),
	('0013A', 'Junta de culata', 'Elring', 'GHI345', '2016-07-10', 50, 15, null, 'V0070', null),
	('0013B', 'Parabrisas', 'Pilkington', 'JKL678', '2018-12-15', 320, 15, null, 'V0070', null),
	('0013C', 'Rueda', 'Continental', 'MNO901', '2020-02-01', 150, 15, null, 'V0080', null),
	('0014A', 'Sensor de temperatura', 'Bosch', 'PQR234', '2017-04-20', 60, 4, null, 'V0090', null),
	('0014B', 'Bobina de encendido', 'Denso', 'STU567', '2019-09-03', 160, 4, null, 'V0090', null),
	--vendedor
	('0014C', 'Sonda lambda', 'Bosch', 'VWX890', '2021-10-10', 120, 6, '47291836A', null, null),
	('0015A', 'Pistón', 'Mahle', 'YZA123', '2015-11-11', 200, 8, '93485726E', null, null),
	('0015B', 'Bomba de gasolina', 'Delphi', 'BCD456', '2018-01-05', 400, 1, '61520384F', null, null),
	('0015C', 'Cigüeñal', 'Federal-Mogul', 'EFG789', '2020-06-30', 280, 2, '82049563G', null, null);

update reparacion rep
set precio = (select sum(precio) from pieza
			  group by idreparacion
			  having idreparacion = rep.id) 
			  + duracion * 
			  (select costehora 
			  from coderror c, reparacion r
			  where r.coderror = c.codigo and r.id = rep.id)
where id = rep.id;

update reparacion rep
set precio = precio - (precio * (select porcentaje from cupon_descuento where rep.cupon = codigo))

select * from reparacion;
