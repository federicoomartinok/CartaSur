CREATE DATABASE CartaSurDb;
GO
CREATE TABLE CLIENTES (
    Dni_cliente VARCHAR(8) PRIMARY KEY,
    Nombre_cliente VARCHAR(100),
    Direccion_envio_cliente VARCHAR(100)
);

CREATE TABLE EMPLEADOS (
    Id_empleado INT PRIMARY KEY IDENTITY,
    Nombre_empleado VARCHAR(100)
);

CREATE TABLE SUCURSALES (
    Id_sucursal INT PRIMARY KEY IDENTITY,
    Nombre_sucursal VARCHAR(100),
    Direccion_sucursal VARCHAR(100)
);

CREATE TABLE PRODUCTOS (
    Id_producto INT PRIMARY KEY IDENTITY,
    Nombre_producto VARCHAR(100)
);

CREATE TABLE VENTAS (
    Id_venta INT PRIMARY KEY,
    Fecha_venta DATETIME,
    Dni_cliente VARCHAR(8) FOREIGN KEY REFERENCES CLIENTES(Dni_cliente),
    Id_empleado INT FOREIGN KEY REFERENCES EMPLEADOS(Id_empleado),
    Id_sucursal INT FOREIGN KEY REFERENCES SUCURSALES(Id_sucursal),
    Importe_total DECIMAL(10, 2)
);

CREATE TABLE VENTAS_DETALLE (
    Id_venta INT FOREIGN KEY REFERENCES VENTAS(Id_venta),
    Id_producto INT FOREIGN KEY REFERENCES PRODUCTOS(Id_producto),
    Cantidad INT,
    PRIMARY KEY (Id_venta, Id_producto)
);


INSERT INTO CLIENTES (Dni_cliente, Nombre_cliente, Direccion_envio_cliente)
VALUES 
('12345678', 'Federico Martin', 'Tempereley 123'),
('87654321', 'Carlos Perez', 'Avellaneda 456'),
('56789012', 'Maria Lopez', 'Lanus 789');


INSERT INTO EMPLEADOS (Nombre_empleado)
VALUES 
('Juan Gomez'),
('Ana Torres'),
('Laura Rodriguez');


INSERT INTO SUCURSALES (Nombre_sucursal, Direccion_sucursal)
VALUES 
('Sucursal Centro', 'Calle Falsa 123'),
('Sucursal Norte', 'Av. Libertad 456'),
('Sucursal Sur', 'Calle Siempreviva 789');


INSERT INTO PRODUCTOS (Nombre_producto)
VALUES 
('Televisor'),
('Impresora'),
('Monitor');


INSERT INTO VENTAS (Id_venta, Fecha_venta, Dni_cliente, Id_empleado, Id_sucursal, Importe_total)
VALUES 
(1, '2024-10-23', '12345678', 1, 1, 50000),
(2, '2024-10-23', '87654321', 2, 2, 75000),
(3, '2024-10-22', '56789012', 3, 3, 30000);


INSERT INTO VENTAS_DETALLE (Id_venta, Id_producto, Cantidad)
VALUES 
(1, 1, 2),
(1, 2, 1),
(2, 1, 1),
(2, 3, 3),
(3, 2, 2);

SELECT TOP 1 Fecha_venta
FROM VENTAS
GROUP BY 
Fecha_venta
ORDER BY 
COUNT(*) DESC

SELECT TOP 1 Fecha_venta, COUNT(*) AS Cantidad_ventas
FROM VENTAS
GROUP BY Fecha_venta
ORDER BY Cantidad_ventas DESC;
