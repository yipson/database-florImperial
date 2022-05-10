/* 1. Pasadas las fiestas de diciembre, Vehículos la Floresta quiere enviar campañas de mercadeo a
sus clientes, para ello quiere seleccionar a aquellos a los que no se les ha emitido ninguna factura
desde el 7 de enero de 2010. Obtenga el listado con nombres, apellidos y dirección de esos
clientes. */

SELECT
	concat(nombre,' ',apellido) as Clientes,direccion as 'Dirección'
FROM 
	cliente2 c
INNER JOIN 
    factura f
    ON c.cod_cliente = f.cod_cliente
WHERE 
	fecha_factura >'2010/01/07'



/* 2. El Gerente general quiere conocer los apellidos y el nombre del empleado que más horas ha
trabajado. Los apellidos y el nombre deben mostrarse separados por un espacio con el nombre
de campo “Apellidos y Nombre”, las horas totales trabajadas, con el nombre Horas Totales
Trabajadas y un campo adicional, de estas mismas horas, pero convertidas a minutos. */

SELECT TOP 1
	concat(e.apellido,' ',e.nombre) as 'Empleados',
	SUM(i.horas) as 'Horas Total de Trabajo',
	SUM(i.horas*60) as 'Minutos de Trabajo'
FROM
	empleado1 e
INNER JOIN
	interviene i
	ON e.cod_empleado = i.cod_empleado
GROUP BY
	e.apellido,e.nombre
ORDER BY
	[Horas Total de Trabajo] DESC



/* 3. ¿Cuál es el monto (importe) facturado por Vehículos la Floresta?, tenga en cuenta:
a. Todas las facturas registradas
b. Importe total de recambios: Precio de Referencia * Unidades
c. Importe total de actuaciones: Horas * 50
d. Utilizar alias para los encabezados de las columnas
e. Utilizar JOIN, ¿Qué tipo de JOIN?, debe ser definido por usted. */


/* 4. Obtener un listado con el número de reparaciones en las que ha intervenido cada uno de los
empleados. El listado debe mostrar:
a. Numero de reparaciones, apellidos y el nombre de la persona que hizo la reparación
b. Numero de reparaciones, debe ser listado en forma descendente. */


/* 5. Los socios de Vehículos la Floresta pretenden dar un servicio cada vez más rápido a sus clientes,
para ello han previsto que las reparaciones se realicen en un plazo máximo de 2 días, la empresa quiere 
conocer las reparaciones que han superado ese plazo y los empleados que la han
realizado. Esta consulta debe contener, nombre de los empleados, fecha de entrada, fecha de
salida y fecha de salida prevista que debe ser máximo en dos días seguido a la fecha de entrada.
Combinar utilizando JOIN, ¿Qué tipo de JOIN?, debe ser definido por usted. */

SELECT 
	E.nombre 'Nombre',
	R.fecha_entrada 'Fecha Entrada',
	R.fecha_salida 'Fecha Salida',
	DATEADD(DAY,2,R.fecha_entrada) 'Fecha Salida Prevista'
FROM 
	reparacion R
INNER JOIN
	interviene I 
    ON R.id_reparacion = I.id_reparacion
INNER JOIN
	empleado1 E 
    ON I.cod_empleado = E.cod_empleado



/* 6. La administración quiere comprobar que los empleados que no han intervenido en labores de
reparación son únicamente los que se encargan de labores administrativas, realice una consulta
que retorne los nombres y categorías de los empleados que no han intervenido en ninguna
reparación. */

SELECT 
	E.cod_empleado,
	E.nombre 'Nombre',
	E.categoria 'Categoria'
FROM 
	empleado1 E
WHERE 
	E.cod_empleado NOT IN (
		SELECT I.cod_empleado
		FROM interviene I)



/* 7. Vehículos la Floresta está interesado en conocer cuáles son los 5 vehículos con más kilometraje
que ha visitado el taller, es necesario mostrar Kilometraje, marca, modelo, color y matricula,
ordenado de forma descendente. */

SELECT TOP 5
	R.kilometraje 'Kilometraje',
	V.marca 'Marca',
	V.modelo 'Modelo',
	V.color 'Color',
	V.matricula 'matricula'
FROM 
	vehiculo V
INNER JOIN 
	reparacion R
	ON V.id_vehiculo = R.id_vehiculo
ORDER BY
	[Kilometraje] DESC



/* 8. En Vehículos la Floresta se está pensando en hacer más rentable la gestión de los recambios, se
pretende optimizar el stock, para ello, se solicita un listado con la siguiente información:
a. idRecambio, Descripción, UnidadBase y stock de los artículos que superen el stock
considerado como optimo según los siguientes criterios:

i. Los artículos cuya unidad base se mide en unidades se considera stock optimo
hasta 10 artículos.

ii. Los artículos cuya unidad base no sea unidad, se considera stock optimo hasta
4 artículos. */


/* 9. Con relación a las actuaciones, se considera importante saber cuántas reparaciones se realizan
de importe mayor a la media, Usar AVG y JOIN, ¿Qué tipo de JOIN?, debe ser definido por usted. */


/* 10. Obtener un listado que nos informe el número de facturas que hemos emitido a cada cliente, utilizar
JOIN, ¿Qué tipo de JOIN?, debe ser definido por usted. */