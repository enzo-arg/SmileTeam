/*
PROYECTO:
Sistema de Gestión para Clínica SmileTeam

DESCRIPCIÓN:
Creación de tablas relacionadas con inventario y farmacia
*/

CREATE TABLE producto (
    id_producto INT GENERATED ALWAYS AS IDENTITY,
    id_categoria INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(250),
    unidad_medida VARCHAR(30) NOT NULL,
    stock_actual INT NOT NULL DEFAULT 0,
    stock_minimo INT NOT NULL DEFAULT 0,
    precio DECIMAL(10,2) NOT NULL,
    requiere_receta BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT pk_producto
        PRIMARY KEY(id_producto),
    CONSTRAINT fk_producto_categoria
        FOREIGN KEY(id_categoria)
        REFERENCES categoria_producto(id_categoria)
);

CREATE TABLE movimiento_inventario (
    id_movimiento INT GENERATED ALWAYS AS IDENTITY,
    id_producto INT NOT NULL,
    id_empleado INT NOT NULL,
    tipo_movimiento CHAR(1) NOT NULL,
    cantidad INT NOT NULL,
    fecha DATE NOT NULL,
    observacion VARCHAR(250),
    CONSTRAINT pk_movimiento_inventario
        PRIMARY KEY(id_movimiento),
    CONSTRAINT fk_movimiento_producto
        FOREIGN KEY(id_producto)
        REFERENCES producto(id_producto),
    CONSTRAINT fk_movimiento_empleado
        FOREIGN KEY(id_empleado)
        REFERENCES empleado(id_empleado),
    CONSTRAINT chk_tipo_movimiento
        CHECK(tipo_movimiento IN ('E','S'))
);