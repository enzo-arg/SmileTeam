
/*
PROYECTO:
Sistema de Gestión para Clínica SmileTeam

DESCRIPCIÓN:
Carga de información inicial de catálogos.
*/

INSERT INTO sexo(nombre)
VALUES
('Masculino'),
('Femenino');

INSERT INTO rol(nombre)
VALUES
('Administrador'),
('Recepción'),
('Odontólogo'),
('Caja'),
('Farmacia');

INSERT INTO cargo(nombre)
VALUES
('Odontólogo'),
('Asistente Dental'),
('Recepcionista'),
('Administrador'),
('Contador'),
('Encargado de Farmacia');


INSERT INTO especialidad(nombre, descripcion)
VALUES
('Odontología General','Atención odontológica general'),
('Ortodoncia','Corrección de posición dental mediante aparatos'),
('Endodoncia','Tratamiento de conductos radiculares'),
('Periodoncia','Tratamiento de enfermedades de encías'),
('Cirugía Oral','Procedimientos quirúrgicos odontológicos'),
('Odontopediatría','Atención odontológica infantil'),
('Implantología','Colocación de implantes dentales');

INSERT INTO alergia(nombre, descripcion)
VALUES
('Látex','Reacción al material de guantes o productos con látex'),
('Penicilina','Alergia a antibióticos derivados de penicilina'),
('Amoxicilina','Reacción a antibiótico amoxicilina'),
('Anestésicos locales','Reacción a medicamentos anestésicos usados en procedimientos'),
('Lidocaína','Reacción específica al anestésico lidocaína'),
('AINEs','Reacción a antiinflamatorios no esteroideos'),
('Clorhexidina','Reacción a antiséptico utilizado en procedimientos dentales');

INSERT INTO estado_cita(nombre)
VALUES
('Programada'),
('Confirmada'),
('Atendida'),
('Cancelada'),
('No asistió');


INSERT INTO motivo_cita(nombre)
VALUES
('Primera consulta'),
('Control'),
('Emergencia'),
('Limpieza dental'),
('Extracción'),
('Ortodoncia'),
('Revisión');

INSERT INTO categoria_producto(nombre)
VALUES
('Medicamento'),
('Material Odontológico'),
('Instrumental'),
('Material de Limpieza'),
('Equipo Dental');

INSERT INTO metodo_pago(nombre)
VALUES

('Efectivo'),
('Tarjeta'),
('Transferencia Bancaria');

select * from metodo_pago