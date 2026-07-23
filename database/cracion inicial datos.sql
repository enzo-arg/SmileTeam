--DATOS INICIALES PERSONAS, TRATAMIENTOS FACTURAS ETC.
--TRATAMIENTOS Y PRODUCTOS

INSERT INTO tratamiento (nombre, descripcion, precio) VALUES
('Limpieza Profiláctica', 'Limpieza dental profunda y eliminación de sarro', 500.00),
('Obturación Resina', 'Relleno de resina fotocurable para caries', 800.00),
('Extracción Simple', 'Extracción de pieza dental sin cirugía', 600.00);

INSERT INTO producto (id_categoria, nombre, descripcion, unidad_medida, stock_actual, stock_minimo, precio, requiere_receta) VALUES
(1, 'Amoxicilina 500mg', 'Caja de 20 cápsulas', 'Caja', 50, 10, 150.00, TRUE),
(1, 'Ibuprofeno 400mg', 'Caja de 10 tabletas', 'Caja', 100, 20, 80.00, FALSE),
(2, 'Resina A2', 'Tubo de resina dental', 'Unidad', 15, 3, 450.00, FALSE);


-- PERSONAS (Empleados, Pacientes y Contacto)
-- Persona 1: Un Odontólogo
-- Persona 2: Un Recepcionista / Admin
-- Persona 3: Un Paciente
INSERT INTO persona (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, identidad, fecha_nacimiento, direccion, id_sexo) VALUES
('Carlos', 'Alberto', 'Mendoza', 'Gómez', '0801198801234', '1988-05-12', 'Col. Palmira, Tegucigalpa', 1),
('Ana', 'María', 'López', 'Reyes', '0801199505678', '1995-09-20', 'Col. Miraflores, Tegucigalpa', 2),
('Juan', 'Pedro', 'Martínez', 'Cruz', '0801200009988', '2000-01-15', 'Col. Kennedy, Tegucigalpa', 1);


INSERT INTO telefono (id_persona, telefono) VALUES
(1, '99112233'),
(2, '98223344'),
(3, '97334455');

INSERT INTO correo (id_persona, correo) VALUES
(1, 'carlos.mendoza@smileteam.com'),
(2, 'ana.lopez@smileteam.com'),
(3, 'juan.martinez@email.com');

-- 3. USUARIOS

INSERT INTO usuario (id_persona, usuario, contraseña, cambiar_contraseña, estado, id_rol) VALUES
(1, 'cmendoza', 'hash_password_segura_1', FALSE, TRUE, 3), -- Odontólogo
(2, 'alopez', 'hash_password_segura_2', FALSE, TRUE, 2);   -- Recepción


-- 4. EMPLEADOS Y ESPECIALIDADES

INSERT INTO empleado (id_persona, id_cargo, numero_colegiacion, fecha_contratacion, salario) VALUES
(1, 1, 'COP-2015-089', '2020-01-15', 25000.00), -- Odontólogo
(2, 3, NULL, '2022-03-01', 12000.00);            -- Recepcionista

INSERT INTO empleado_especialidad (id_empleado, id_especialidad) VALUES
(1, 1), -- Odontología General
(1, 3); -- Endodoncia

--PACIENTES Y ALERGIAS

INSERT INTO paciente (id_persona, fecha_registro, tipo_sangre) VALUES
(3, '2026-02-10', 'O+');

INSERT INTO paciente_alergia (id_paciente, id_alergia) VALUES
(1, 2); -- Alergia a la Penicilina


-- CITAS Y CONSULTAS

INSERT INTO cita (id_paciente, id_empleado, id_motivo_cita, id_estado_cita, fecha, hora, observaciones) VALUES
(1, 1, 1, 3, '2026-02-15', '09:00:00', 'Primera revisión del paciente.');

INSERT INTO consulta (id_cita, peso, presion_sistolica, presion_diastolica, temperatura, diagnostico, observaciones) VALUES
(1, 72.50, 120, 80, 36.6, 'Caries leve en pieza 16 y acumulación de sarro.', 'Se realiza limpieza profiláctica y se agenda resina.');

INSERT INTO detalle_tratamiento (id_consulta, id_tratamiento, cantidad, precio) VALUES
(1, 1, 1, 500.00); -- Limpieza Profiláctica


-- RECETA Y DETALLE

INSERT INTO receta (id_consulta, indicaciones) VALUES
(1, 'Tomar 1 tableta cada 8 horas en caso de dolor o inflamación.');

INSERT INTO detalle_receta (id_receta, id_producto, dosis, frecuencia, dias) VALUES
(1, 2, '400mg', 'Cada 8 horas', 3);


-- FACTURA Y PAGO

INSERT INTO factura (id_paciente, numero_factura, cai, fecha, subtotal, impuesto, descuento, total) VALUES
(1, '000-001-01-00000001', 'A1B2C3D4-E5F6-7890-ABCD-1234567890EF', '2026-02-15', 500.00, 75.00, 0.00, 575.00);

INSERT INTO detalle_factura (id_factura, descripcion, cantidad, precio_unitario, subtotal) VALUES
(1, 'Limpieza Profiláctica', 1, 500.00, 500.00);

INSERT INTO pago (id_factura, id_metodo_pago, monto, fecha) VALUES
(1, 1, 575.00, '2026-02-15'); -- Pago en efectivo