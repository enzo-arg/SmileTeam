/*
PROYECTO:
Sistema de Gestión para Clínica SmileTeam

DESCRIPCIÓN:
Creación de tablas relacionadas con facturación
*/

CREATE TABLE factura (
    id_factura INT GENERATED ALWAYS AS IDENTITY,
    id_paciente INT NOT NULL,
    numero_factura VARCHAR(20) NOT NULL UNIQUE,
    cai CHAR(37) NOT NULL,
    fecha DATE NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    impuesto DECIMAL(10,2) NOT NULL DEFAULT 0,
    descuento DECIMAL(10,2) NOT NULL DEFAULT 0,
    total DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_factura
        PRIMARY KEY(id_factura),
    CONSTRAINT fk_factura_paciente
        FOREIGN KEY(id_paciente)
        REFERENCES paciente(id_paciente)
);

CREATE TABLE detalle_factura (
    id_detalle INT GENERATED ALWAYS AS IDENTITY,
    id_factura INT NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_detalle_factura
        PRIMARY KEY(id_detalle),
    CONSTRAINT fk_detalle_factura_factura
        FOREIGN KEY(id_factura)
        REFERENCES factura(id_factura)
);

CREATE TABLE pago (
    id_pago INT GENERATED ALWAYS AS IDENTITY,
    id_factura INT NOT NULL,
    id_metodo_pago INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT pk_pago
        PRIMARY KEY(id_pago),
    CONSTRAINT fk_pago_factura
        FOREIGN KEY(id_factura)
        REFERENCES factura(id_factura),
    CONSTRAINT fk_pago_metodo
        FOREIGN KEY(id_metodo_pago)
        REFERENCES metodo_pago(id_metodo_pago)
);