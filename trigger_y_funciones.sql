create or replace function precioReparacion returns trigger as $$
declare
    precioReparacion reparacion.precio%type := (select precio from reparacion where id = new.idreparacion;
	cuponReparacion cupon_descuento.porcentaje%type := (select porcentaje 
													    from cupon_descuenton c, reparacion r
													    where id = new.idreparacion and 
													    r.cupon = c.codigo);
	precioOriginalReparacion reparacion.precio%type := (precioReparacion + (precioReparacio*cuponReparacion)) + new.precio;
	precioFinal reparacion.precio%type := precioOriginalReparacion - (precioOriginalReparacion*cuponReparacion);
begin
	update reparacion
	set precio := precioFinal;
	where id = new.idreparacion;
end;
$$ language plpgsql;

create trigger actualizarPrecioPorPieza 
after insert or update on pieza 
for each row
execute procedure precioReparacion();
--trigguer que determina el precio de cada reparacion después de ser insertar un pieza que se haya utilizado

create or replace function setPrecioInicialReparacion() returns trigger as $$
declare
	duracionReparacion reparacion.duracion%type := (select duracion from reparacion where id = new.id);
	precioHoraError codError.costeHora%type := (select costehora from coderror c, reparacion r 
												where r.id = new.id and c.codigo = r.codError);
	porcentajeCuponDescuento cupon_descuento.porcentaje%type :=(select porcentaje 
															   from cupon_descuenton c, reparacion r
															   where r.id = new.id and 
															   r.cupon = c.codigo);
	precioSinDescuento numeric(6,2);
	precioFinal numeric(6,2);
begin
	precioSinDescuento := duracionReparacion*precioHora;
	precioFinal := precioSinDescuento - (preciSinDescuento*porcentajeCuponDescuento);
	update reparacion
	set precio = preciofinal
	where id = new.id;
end;
$$ language plpgsql;
												
create or replace trigger setPrecioInicialReparacionTrigg
after insert or update on reparacion
for each row
execute function setPrecioInicialReparacion();
--trigger para establecer el precio incial de la reparacion insertada teniendo en cuenta la duraion y el coste del error
												
create or replace function actualizarPrecioReparacionSegunCosteDelError() returns trigger as $$
declare
	idReparacionAActualizar reparacion.id%type;
	duracionReparacion reparacion.duracion%type;
	precioSinDescuento numeric(6,2);
	precioFinal numeric(6,2);
	porcentajeCuponDescuento cupon_descuento.porcentaje%type;
	reparacionesAActualizarCur cursor for (select id, duracion, porcentaje from reparacion r, cupond_descuento c 
										   where codError = old.codigo and
										   r.cupon = c.codigo);
begin
	loop
		fetch reparacionesAActualizarCur into idReparacionAActualizar, duracionReparacion, porcentajeCuponDescuento;
		exit when not found;
		precioSinDescuento := duracionReparacion*new.costehora;
		precioFinal := precioSinDescuento - (preciSinDescuento*porcentajeCuponDescuento);
		update reparacion
		set precio = precioFinal
		where id = idReparacionAActualizar;
	end loop;
end;
$$ language plpgsql;
												
create or replace trigger actualizarPrecioReparacionSegunCosteDelErrorTrigg
after update on codError
for each row
execute function actualizarPrecioReparacionSegunCosteDelError();
--trigger para actualizar le precio cuando se actualice el precio hora un error
												
create or replace function participaEnLaReparacionDelTallerCorrecto() returns trigger as $$
declare
	nombreMecanico mecanico.nombre%type = (select nombre from mecanico where dni = new.dniMecanico);
	tallerMecanico mecanico.taller%type = (select taller from mecanico where dni = new.dniMecanico);
	tallerReparacion reparacion.taller%type = (select taller from reparacion where id = new.idReparacion);
	idDeReparacion reparacion.id%type = (select id from reparacion where id = new.idReparacion);
begin
	if (tallerMecanico <> tallerReparacion) then
		raise exception 'El mecánico % no pertenece al taller(%) que ha hecho la reparacion %', nombreMecanico, tallerReparacion, idDeReparacion;
	end if;
	return new;
end;
$$ language plpgsql;

create or replace trigger comprobarParticipacionConReparacion before insert, update
on participar
for each row
execute procedure participaEnLaReparacionDelTallerCorrecto();
--trigger que controla que en la tabla participar, el taller del mecánico sea el mismo taller que el del areparacion

create or replace function noMasDeUnVendedor() returns trigger as $$
declare
	proveedorCliente int :=  (select count(*) 
							 from pieza 
							 where codigo = new.codigo and 
							 dniCliente is not null);
	proveedorTienda int := (select count(*) 
							 from pieza 
							 where codigo = new.codigo and 
							 idVendedor is not null);
	porveedorAlmacen int := (select count(*) 
							 from pieza 
							 where codigo = new.codigo and 
							 idAlmacen is not null); 
	codigoPieza pieza.codigo%type := select codigo from pieza where codigo = new.codigo;
	cantidadProveedores int := proveedorCliente + proveedorTienda + proveedorAlmacen
begin
	if cantidadProveedores > 1 then
		raise exception 'Error en la pieza %, no puede tener más de un proveedor', codigoPieza;
	elseif cantidadProveedores = 0 then
		raise exception 'Error en la piza %, tiene que tener almenos un proveedor', codigoPieza;
	
	return new;
end;
$$ language plpgsql;

create or replace trigger cantidadProveedores before insert or update
on pieza
for each row
execute procedure noMasDeUnVendedor();
--trigger que controla que una pieza no pueda adquirida por más de un proveedor(cliente, almacén, vendedor(desguace, tiendaonline))

create or replace view tallerMasTrabajador as
select taller, sum(precio) dinero_gando from reparacion
	group by taller
	having sum(precio) = (select max(sumaPrecio) 
						 from (select taller, sum(precio) sumaPrecio 
							   from reparacion
							   group by taller));
					
select * from tallerMasTrabajador
--vista que muestra el taller que más dinero ha generado

create or replace function mostrarPiezasUsadasEnLaReparacion(idRep reparacion.id%type) 
returns table(codPieza pieza.codigo%type, precioPieza pieza.precio%type) as $$
begin
	return query select codigo, precio from pieza where idReparacion = idRep;
end;
$$ language plpgsql;
select mostrarPiezasUsadasEnLaReparacion(14)
--funcion que devuelve las piezas usadas de la reparaión introducida

create or replace function mostrarInfoPiezaPorNombre(nombrePieza varchar(50)) returns text as $$
declare 
	codPieza varchar(50);
	marcaPieza varchar(50);
	matriculaCoche varchar(50);
	marcaCoche varchar(50);
	modeloCoche varchar(50);
	precioPieza pieza.precio%type;
	ProveedorPieza varchar(100);
	fechaUso date;
	Proveedor varchar(100);
	curPiezas cursor for (select p.codigo, p.marca marca_pieza, c.matricula, c.marca marcha_coche, c.modelo modelo_coche, r.fecha, p.precio
						  from pieza p, coche c, reparacion r
						  where p.idreparacion = r.id and
						  c.matricula = r.coche and
						  p.nombre = nombrePieza);
	textAppend text := '';
	
begin
	if exists (select nombre from pieza where nombre = nombrePieza) then
		open curPiezas;
		loop
			fetch curPiezas into codPieza, marcaPieza, matriculaCoche, marcaCoche, modeloCoche, fechaUso, precioPieza;
			exit when not found;
				textAppend := 
				textAppend
				||'PIEZA: '|| E'\n'
				||'Codigo: ' ||codPieza|| E'\n'
				||'Nombre: ' ||nombrePieza||E'\n'
				||'Marca: ' || marcaPieza||E'\n'
				||'Proveedor: ' || obtenerProveedorPieza(codPieza)||E'\n'
				||'     COCHE REPARADO: ' ||E'\n'
				||'     Matricula: ' || matriculaCoche||E'\n'
				||'     Marca: ' || marcaCoche||E'\n'
				||'     Modelo: ' ||  modeloCoche|| E'\n'
				||'Fecha: ' ||fechaUso||  E'\n'
				||'Precio: ' ||  precioPieza || '€'
				|| E'\n'|| E'\n';
		end loop;
	else return exception 'No se ha encontrado esa pieza en la base de datos';
	end if;
	raise info '%',textAppend;
	return textAppend;
end;
$$ language plpgsql;
select mostrarInfoPiezaPorNombre('Sonda lambda')
--funcion que muestra información básica de las piezas con el nombre introducido

select * from pieza
create or replace function obtenerProveedorPieza(codPieza pieza.codigo%type) returns varchar(100) as $$
declare 
	dniDeCliente pieza.dniCliente%type;
	idDeVendedor pieza.idVendedor%type;
	idDeAlmacen pieza.idalmacen%type;
begin
	if exists (	select codigo from pieza where codigo = codPieza) then
	select dnicliente into dniDeCliente from pieza where codigo = codpieza;
	select idVendedor into idDeVendedor from pieza where codigo = codPieza;
	select idAlmacen into idDeAlmacen from pieza where codigo = codPieza;
	
		if dniDeCliente is not null then
			return 'Cliente --> ' || dniDeCliente;
		elseif idDeVendedor is not null then
			if exists (select * from Tienda_online where id = idDeVendedor) then return 'Vendedor (Tienda online) --> '|| idDeVendedor;
			else return 'Vendedor (Desguace) --> ' || idDeVendedor;
			end if;
		else return 'Almacen --> ' || idDeAlmacen;
		end if;
		
	else raise exception 'No se ha encontrado la pieza con código %', codPieza;
	end if;
end;
$$ language plpgsql;
select obtenerProveedorPieza('0012C')
--función que devuelve el proveedor de la pieza introduciendo su código

select * from tener_almacen