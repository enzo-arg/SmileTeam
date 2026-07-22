/*
PROYECTO:
Sistema de Gestión para Clínica SmileTea

DESCRIPCIÓN:
Creación de tablas relacionadas con empleados

*/


CREATE TABLE cargo (
    id_cargo INT GENERATED ALWAYS AS IDENTITY,
    nombre VARCHAR(40) NOT NULL UNIQUE,
    CONSTRAINT pk_cargo
        PRIMARY KEY(id_cargo)
);

CREATE TABLE empleado (
    id_empleado INT GENERATED ALWAYS AS IDENTITY,
    id_persona INT NOT NULL UNIQUE,
    id_cargo INT NOT NULL,
    numero_colegiacion VARCHAR(20),
    fecha_contratacion DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_empleado
        PRIMARY KEY(id_empleado),
    CONSTRAINT fk_empleado_persona
        FOREIGN KEY(id_persona)
        REFERENCES persona(id_persona),
    CONSTRAINT fk_empleado_cargo
        FOREIGN KEY(id_cargo)
        REFERENCES cargo(id_cargo)
);

CREATE TABLE empleado_especialidad (
    id_empleado INT NOT NULL,
    id_especialidad INT NOT NULL,
    CONSTRAINT pk_empleado_especialidad
        PRIMARY KEY(id_empleado, id_especialidad),
    CONSTRAINT fk_empleado_especialidad_empleado
        FOREIGN KEY(id_empleado)
        REFERENCES empleado(id_empleado),
    CONSTRAINT fk_empleado_especialidad_especialidad
        FOREIGN KEY(id_especialidad)
        REFERENCES especialidad(id_especialidad)
);