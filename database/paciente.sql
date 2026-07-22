/*

PROYECTO:
Sistema de Gestión para Clínica SmileTeam

DESCRIPCIÓN:
Creación de tablas relacionadas con pacientes.
*/

CREATE TABLE paciente (
    id_paciente INT GENERATED ALWAYS AS IDENTITY,
    id_persona INT NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL,
    tipo_sangre CHAR(3),
    CONSTRAINT pk_paciente
        PRIMARY KEY(id_paciente),
    CONSTRAINT fk_paciente_persona
        FOREIGN KEY(id_persona)
        REFERENCES persona(id_persona)

);

CREATE TABLE alergia (
    id_alergia INT GENERATED ALWAYS AS IDENTITY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(200),
    CONSTRAINT pk_alergia
        PRIMARY KEY(id_alergia)
);

CREATE TABLE paciente_alergia (
    id_paciente INT NOT NULL,
    id_alergia INT NOT NULL,
    CONSTRAINT pk_paciente_alergia
        PRIMARY KEY(id_paciente, id_alergia),
    CONSTRAINT fk_paciente_alergia_paciente
        FOREIGN KEY(id_paciente)
        REFERENCES paciente(id_paciente),
    CONSTRAINT fk_paciente_alergia_alergia
        FOREIGN KEY(id_alergia)
        REFERENCES alergia(id_alergia)
);