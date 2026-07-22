/*
PROYECTO:
Sistema de Gestión para Clínica SmileTeam

DESCRIPCIÓN:
Creación de los catálogos
===============================================================================
*/



CREATE TABLE sexo (

    id_sexo INT GENERATED ALWAYS AS IDENTITY,

    nombre VARCHAR(20) NOT NULL,

    CONSTRAINT pk_sexo
        PRIMARY KEY(id_sexo),

    CONSTRAINT uq_sexo_nombre
        UNIQUE(nombre)

);


CREATE TABLE rol (

    id_rol INT GENERATED ALWAYS AS IDENTITY,

    nombre VARCHAR(30) NOT NULL,

    CONSTRAINT pk_rol
        PRIMARY KEY(id_rol),

    CONSTRAINT uq_rol_nombre
        UNIQUE(nombre)

);

CREATE TABLE cargo (

    id_cargo INT GENERATED ALWAYS AS IDENTITY,

    nombre VARCHAR(40) NOT NULL,

    CONSTRAINT pk_cargo
        PRIMARY KEY(id_cargo),

    CONSTRAINT uq_cargo_nombre
        UNIQUE(nombre)

);


CREATE TABLE especialidad (

    id_especialidad INT GENERATED ALWAYS AS IDENTITY,

    nombre VARCHAR(50) NOT NULL,

    descripcion VARCHAR(200),

    CONSTRAINT pk_especialidad
        PRIMARY KEY(id_especialidad),

    CONSTRAINT uq_especialidad_nombre
        UNIQUE(nombre)

);


CREATE TABLE alergia (

    id_alergia INT GENERATED ALWAYS AS IDENTITY,

    nombre VARCHAR(50) NOT NULL,

    descripcion VARCHAR(200),

    CONSTRAINT pk_alergia
        PRIMARY KEY(id_alergia),

    CONSTRAINT uq_alergia_nombre
        UNIQUE(nombre)

);


CREATE TABLE estado_cita (

    id_estado_cita INT GENERATED ALWAYS AS IDENTITY,

    nombre VARCHAR(25) NOT NULL,

    CONSTRAINT pk_estado_cita
        PRIMARY KEY(id_estado_cita),

    CONSTRAINT uq_estado_cita_nombre
        UNIQUE(nombre)

);


CREATE TABLE motivo_cita (

    id_motivo_cita INT GENERATED ALWAYS AS IDENTITY,

    nombre VARCHAR(40) NOT NULL,

    CONSTRAINT pk_motivo_cita
        PRIMARY KEY(id_motivo_cita),

    CONSTRAINT uq_motivo_cita_nombre
        UNIQUE(nombre)

);


CREATE TABLE categoria_producto (

    id_categoria INT GENERATED ALWAYS AS IDENTITY,

    nombre VARCHAR(40) NOT NULL,

    CONSTRAINT pk_categoria_producto
        PRIMARY KEY(id_categoria),

    CONSTRAINT uq_categoria_producto_nombre
        UNIQUE(nombre)

);

CREATE TABLE metodo_pago (

    id_metodo_pago INT GENERATED ALWAYS AS IDENTITY,

    nombre VARCHAR(30) NOT NULL,

    CONSTRAINT pk_metodo_pago
        PRIMARY KEY(id_metodo_pago),

    CONSTRAINT uq_metodo_pago_nombre
        UNIQUE(nombre)

);