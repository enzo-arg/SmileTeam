/*
PROYECTO:
Sistema de Gestión para Clínica SmileTea

DESCRIPCIÓN:
Creación de tablas de usuarios y roles

*/


CREATE TABLE rol (
    id_rol INT GENERATED ALWAYS AS IDENTITY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    CONSTRAINT pk_rol
        PRIMARY KEY(id_rol)
);



CREATE TABLE usuario (
    id_usuario INT GENERATED ALWAYS AS IDENTITY,
    id_persona INT NOT NULL UNIQUE,
    usuario VARCHAR(30) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL,
    cambiar_contraseña BOOLEAN DEFAULT TRUE,
    estado BOOLEAN DEFAULT TRUE,
    id_rol INT NOT NULL,

    CONSTRAINT pk_usuario
        PRIMARY KEY(id_usuario),
    CONSTRAINT fk_usuario_persona
        FOREIGN KEY(id_persona)
        REFERENCES persona(id_persona),
    CONSTRAINT fk_usuario_rol
        FOREIGN KEY(id_rol)
        REFERENCES rol(id_rol)
);