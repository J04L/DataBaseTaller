--reparaciones más caras de 700
select id, precion from reparacin
where precio > 700;

--piezas guardadas en almacenes
select codigo from piezas
where idalmace is not null

--coches eléctricos
select matricula, marca, modelo from coche
where lower(combustible) = 'eléctrico'

--coches que tengan un motor en forma de v con 6 o 8 cilindros
select matricula, marca, motor from coche
where lower(motor) ~ '.+v[86]$'

--accidentes más caros
select codigo from accidente
where coste > 1800

--el cupon 5A tiene que ser valer un 50%
--select * from cupon_descuento;
update cupon_descuento
set porcentaje = 50, descripcion = 'Cupón "5M" que ofrece un descuento del 50% en la mano de obra para la reparación de motor, como regalo para el Día del Padre.'
where codigo = '5A'

--todos los mencanicos participantes en el reparacion 1 tuvienron el accidente G19
--select * from participar;
update participar
set accidente = 'G19'
where idreparacin = 1

--eliminar el accidente A01
--select * from accidente
delete from accidente
where codigo = 'A01'

--elimina los clientes los cuales su nombre empiece por a
--select * from cliente
delete from cliente
where lower(nombre) ilike 'a%'

--los nombre de los clientes que han pagado más de 850 por reparar su coche
select distinct nombre, apellidos from cliente c, reparacion r, coche ch
where titular = dni and
coche = matricula and
precio > 850

--nombre y apellicos y accidente de los mecanicos que han participado en un accidente y que su taller sea el banano
select dni, nombre, apellido, accidente from participar, mecanico
where dnimecanico = dni and
accidente is not null and
lower(taller) = 'el banano'

--suma del precio de todas las piezas utilizadas para cada reparacion de un coche diesel
select idreparacion, sum(p.precio)
from pieza p, coche c, reparacion r
where p.idreparacion = r.id and
r.coche = c.matricula and
lower(combustible) = 'diésel'
group by idreparacion

--muestrael id, precio, cupon y el precio sin el porcentaje de descuento para las reparaciones que tienen descuento
select id, precio, (precio+(precio*porcentaje)) original, cupon 
from reparacion, cupon_descuento
where cupon = codigo

--muestra la cantidad de clientes que ha habido desde el 2019 hasta ahora de las reparaciones que han utilizado piezas compradas online
select count(*) from reparacion
where fecha >= '2020-01-01' and
id in (select idreparacion from pieza
        where idVendedor is not null
        and idVendedor in (select id from tienda_online))

--muestra cual fue el tayer con mayor cantidad de clientes
select taller, count(*) from reparacion
group by taller 
having count(*) = (select max(alta)
                    from (select count(*) alta
                            from reparacion
                            group by taller)) 

