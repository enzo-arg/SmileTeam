/*
PROYECTO:
Sistema de Gestión para Clínica SmileTeam

DESCRIPCIÓN:
Creación de tablas relacionadas con la información de personas.

*/



CREATE TABLE persona (
    id_persona INT GENERATED ALWAYS AS IDENTITY,
    primer_nombre VARCHAR(30) NOT NULL,
    segundo_nombre VARCHAR(30),
    primer_apellido VARCHAR(30) NOT NULL,
    segundo_apellido VARCHAR(30),
    identidad CHAR(15) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(300) NOT NULL,
    id_sexo INT NOT NULL,
    CONSTRAINT pk_persona
        PRIMARY KEY(id_persona),
    CONSTRAINT fk_persona_sexo
        FOREIGN KEY(id_sexo)
        REFERENCES sexo(id_sexo)

);



CREATE TABLE telefono (
    id_telefono INT GENERATED ALWAYS AS IDENTITY,
    id_persona INT NOT NULL,
    telefono CHAR(8) NOT NULL,
    CONSTRAINT pk_telefono
        PRIMARY KEY(id_telefono),
    CONSTRAINT fk_telefono_persona
        FOREIGN KEY(id_persona)
        REFERENCES persona(id_persona),
    UNIQUE(id_persona, telefono)
);


CREATE TABLE correo (
    id_correo INT GENERATED ALWAYS AS IDENTITY,
    id_persona INT NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT pk_correo
        PRIMARY KEY(id_correo),
    CONSTRAINT fk_correo_persona
        FOREIGN KEY(id_persona)
        REFERENCES persona(id_persona)

);