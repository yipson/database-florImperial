CREATE TABLE cliente2 (
	cod_cliente int IDENTITY(1,1) not null,
	dni varchar(20) not null,
	apellido varchar(30) not null,
	nombre varchar(30) not null,
	direccion varchar(80) not null,
	telefono varchar(20) not null,
	CONSTRAINT PK_cliente PRIMARY KEY (cod_cliente)
);


CREATE TABLE factura (
	id_factura int IDENTITY(1,1) not null,
	fecha_factura date not null,
	cod_cliente int not null,
	id_reparacion int not null,
	CONSTRAINT PK_factura PRIMARY KEY (id_factura)
);


CREATE TABLE vehiculo (
	id_vehiculo int IDENTITY(1,1) not null,
	matricula varchar(12) not null,
	marca varchar(20) not null,
	modelo varchar(20) not null,
	color varchar(15) not null,
	fecha_matricula date not null,
	cod_cliente int not null,
	CONSTRAINT PK_vehiculo PRIMARY KEY (id_vehiculo)
);


CREATE TABLE reparacion (
	id_reparacion int IDENTITY(1,1) not null,
	id_vehiculo int not null,
	fecha_entrada date not null,
	kilometraje float not null,
	averia varchar(255) not null,
	fecha_salida date not null,
	reparado bit not null,
	observaciones varchar(255) not null
	CONSTRAINT PK_reparacion PRIMARY KEY (id_reparacion)
);



CREATE TABLE interviene (
	cod_empleado int not null,
	id_reparacion int not null,
	horas float,
	CONSTRAINT PK_interviene PRIMARY KEY (cod_empleado,id_reparacion)
);


CREATE TABLE incluye (
	id_recambio int not null,
	id_reparacion int not null,
	unidades int not null
	CONSTRAINT PK_incluye PRIMARY KEY (id_recambio,id_reparacion)
);


CREATE TABLE realiza (
	id_reparacion int not null,
	id_actuacion int not null,
	horas float,
	CONSTRAINT PK_realiza PRIMARY KEY (id_reparacion,id_actuacion)
);


CREATE TABLE empleado1 (
	cod_empleado int IDENTITY(1,1) not null,
	dni varchar(20) not null,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	direccion varchar(80) not null,
	fecha_ingreso date not null,
	categoria varchar(20) not null
	CONSTRAINT PK_empleado PRIMARY KEY (cod_empleado)
);


CREATE TABLE recambios (
	id_recambio int IDENTITY(1,1) not null,
	descripcion varchar(50) not null,
	unidad_base int not null,
	stock int not null,
	precio_referenica money not null,
	CONSTRAINT PK_recambios PRIMARY KEY (id_recambio)
);


CREATE TABLE actuacion (
	id_actuacion int IDENTITY(1,1) not null,
	referencia varchar(15) not null,
	descripcion varchar(50) not null,
	tiempo_estimado int not null,
	importe money not null,
);