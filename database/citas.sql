/*
PROYECTO:
Sistema de Gestión para Clínica Odontológica

DESCRIPCIÓN:
Creación de tablas relacionadas con la agendar citas
*/

CREATE TABLE cita (
    id_cita INT GENERATED ALWAYS AS IDENTITY,
    id_paciente INT NOT NULL,
    id_empleado INT NOT NULL,
    id_motivo_cita INT NOT NULL,
    id_estado_cita INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    observaciones VARCHAR(250),
    CONSTRAINT pk_cita
        PRIMARY KEY(id_cita),
    CONSTRAINT fk_cita_paciente
        FOREIGN KEY(id_paciente)
        REFERENCES paciente(id_paciente),
    CONSTRAINT fk_cita_empleado
        FOREIGN KEY(id_empleado)
        REFERENCES empleado(id_empleado),
    CONSTRAINT fk_cita_motivo
        FOREIGN KEY(id_motivo_cita)
        REFERENCES motivo_cita(id_motivo_cita),
    CONSTRAINT fk_cita_estado
        FOREIGN KEY(id_estado_cita)
        REFERENCES estado_cita(id_estado_cita)
);