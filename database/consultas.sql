/*

PROYECTO:
Sistema de Gestión para Clínica SmileTeam

DESCRIPCIÓN:
Creación de tablas relacionadas con consultas
*/

CREATE TABLE consulta (
    id_consulta INT GENERATED ALWAYS AS IDENTITY,
    id_cita INT NOT NULL UNIQUE,
    peso DECIMAL(5,2),
    presion_sistolica INT 
        CHECK (presion_sistolica BETWEEN 70 AND 250),
    presion_diastolica INT
        CHECK (presion_diastolica BETWEEN 40 AND 150),
    temperatura DECIMAL(4,1)
        CHECK (temperatura BETWEEN 30 AND 45),
    diagnostico VARCHAR(500) NOT NULL,
    observaciones VARCHAR(500),
    CONSTRAINT pk_consulta
        PRIMARY KEY(id_consulta),
    CONSTRAINT fk_consulta_cita
        FOREIGN KEY(id_cita)
        REFERENCES cita(id_cita)
);

CREATE TABLE tratamiento (
    id_tratamiento INT GENERATED ALWAYS AS IDENTITY,
    nombre VARCHAR(60) NOT NULL UNIQUE,
    descripcion VARCHAR(300),
    precio DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_tratamiento
        PRIMARY KEY(id_tratamiento)
);

CREATE TABLE detalle_tratamiento (
    id_consulta INT NOT NULL,
    id_tratamiento INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_detalle_tratamiento
        PRIMARY KEY(id_consulta, id_tratamiento),
    CONSTRAINT fk_detalle_tratamiento_consulta
        FOREIGN KEY(id_consulta)
        REFERENCES consulta(id_consulta),
    CONSTRAINT fk_detalle_tratamiento_tratamiento
        FOREIGN KEY(id_tratamiento)
        REFERENCES tratamiento(id_tratamiento)
);

CREATE TABLE receta (
    id_receta INT GENERATED ALWAYS AS IDENTITY,
    id_consulta INT NOT NULL,
    indicaciones VARCHAR(500) NOT NULL,
    CONSTRAINT pk_receta
        PRIMARY KEY(id_receta),
    CONSTRAINT fk_receta_consulta
        FOREIGN KEY(id_consulta)
        REFERENCES consulta(id_consulta)
);

CREATE TABLE detalle_receta (
    id_receta INT NOT NULL,
    id_producto INT NOT NULL,
    dosis VARCHAR(50) NOT NULL,
    frecuencia VARCHAR(50) NOT NULL,
    dias INT NOT NULL,
    CONSTRAINT pk_detalle_receta
        PRIMARY KEY(id_receta, id_producto),
    CONSTRAINT fk_detalle_receta_receta
        FOREIGN KEY(id_receta)
        REFERENCES receta(id_receta),
    CONSTRAINT fk_detalle_receta_producto
        FOREIGN KEY(id_producto)
        REFERENCES producto(id_producto)
);