ALTER TABLE factura
ADD CONSTRAINT FK_cliente2_factura
FOREIGN KEY (cod_cliente) REFERENCES cliente2(cod_cliente);

ALTER TABLE vehiculo
ADD CONSTRAINT FK_cliente2_vehiculo
FOREIGN KEY (cod_cliente) REFERENCES cliente2(cod_cliente);

ALTER TABLE factura
ADD CONSTRAINT FK_reparacion_factura
FOREIGN KEY (id_reparacion) REFERENCES reparacion(id_reparacion);

ALTER TABLE reparacion
ADD CONSTRAINT FK_vehiculo_reparacion
FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo);

ALTER TABLE interviene
ADD CONSTRAINT FK_reparacion_interviene
FOREIGN KEY (id_reparacion) REFERENCES reparacion(id_reparacion);

ALTER TABLE incluye
ADD CONSTRAINT FK_reparacion_incluye
FOREIGN KEY (id_reparacion) REFERENCES reparacion(id_reparacion);

ALTER TABLE realiza
ADD CONSTRAINT FK_reparacion_realiza
FOREIGN KEY (id_reparacion) REFERENCES reparacion(id_reparacion);

ALTER TABLE interviene
ADD CONSTRAINT FK_empleado1_interviene
FOREIGN KEY (cod_empleado) REFERENCES empleado1(cod_empleado);

ALTER TABLE incluye
ADD CONSTRAINT FK_recambio_incluye
FOREIGN KEY (id_recambio) REFERENCES recambio(id_recambio);

ALTER TABLE realiza
ADD CONSTRAINT FK_actuacion_realiza
FOREIGN KEY (id_actuacion) REFERENCES actuacion(id_actuacion);