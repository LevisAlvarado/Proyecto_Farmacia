drop database FARMACIA3

CREATE DATABASE FARMACIA3

use Farmacia3
-- ----------------- Creaci�n tabla Pais ----------------------
CREATE TABLE Pais (
    ID_Pais INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Descripcion VARCHAR(45) NOT NULL
);

-- ----------------- Inserci�n de valores en la tabla Pais ----------------------
INSERT INTO Pais (Descripcion)
VALUES 
('Honduras'), ('El Salvador'), ('Nicaragua'), ('Panama'), ('Guatemala');

-- ----------------- Creacion tabla Departamentos ----------------------
CREATE TABLE Departamentos (
    ID_Departamento INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    ID_Pais INT,
    Descripcion VARCHAR(45) NOT NULL,
    CONSTRAINT FK_ID_Pais FOREIGN KEY (ID_Pais) REFERENCES Pais (ID_Pais)
);

-- ----------------- Insercion de valores en la tabla Departamentos ----------------------
INSERT INTO Departamentos (ID_Pais, Descripcion) VALUES 
    (1, 'Francisco Morazan'), 
    (1, 'Olancho'), 
    (1, 'Atlantida'), 
    (1, 'Choluteca'), 
    (1, 'Comayagua');


	-- ----------------- Creacion tabla Municipios ----------------------
CREATE TABLE Municipios (
    ID_Municipio INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Descripcion VARCHAR(45) NOT NULL,
    Ciudad VARCHAR(1) NOT NULL,
    ID_Departamento INT,
    CONSTRAINT FK_ID_Departamento FOREIGN KEY (ID_Departamento) REFERENCES Departamentos (ID_Departamento)
);

INSERT INTO Municipios (Descripcion, Ciudad, ID_Departamento)
VALUES
    ('Tegucigalpa', 'S', 1),
    ('Juticalpa', 'S', 2),
    ('La Ceiba', 'S', 3),
    ('Choluteca', 'N', 4),
    ('Comayagua', 'S', 5);

	-- ----------------- Creacion tabla Colonias ----------------------
CREATE TABLE Colonias (
    ID_Colonia INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Descripcion VARCHAR(45),
    ID_Municipio INT,
    CONSTRAINT FK_ID_Municipio FOREIGN KEY (ID_Municipio) REFERENCES Municipios (ID_Municipio)
);

-- ----------------- Insercion de valores en la tabla Colonias ----------------------
INSERT INTO Colonias (Descripcion, ID_Municipio)
VALUES
    ('La Kennedy', 1),
    ('Los Angeles', 2),
    ('1 de Mayo', 3),
    ('San Luis Anach', 4),
    ('Los Almendros', 5);


    -- ----------------- Creacion tabla Direccion ----------------------
CREATE TABLE Direcciones (
    ID_Direccion INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Descripcion VARCHAR(45),
    GPS VARCHAR(45),
    ID_Colonia INT,
    CONSTRAINT FK_ID_Colonia FOREIGN KEY (ID_Colonia) REFERENCES Colonias (ID_Colonia)
);

-- ----------------- Insercion de valores en la tabla Direccion ----------------------
INSERT INTO Direcciones (Descripcion, GPS, ID_Colonia)
VALUES
    ('Cerca del punto de taxis', '12.3456, -78.9012', 1),
    ('A la par de la pulper�a los gemelos', '34.5678, -123.4567', 2),
    ('Frente a la iglesia San Juan', '56.7890, -45.6789', 3),
    ('Detr�s del parque central', '78.9012, -67.8901', 4),
    ('Junto al mercado municipal', '90.1234, -12.3456', 5);


-- ----------------- Creacion tabla Profesiones ----------------------
CREATE TABLE Profesiones (
    ID_Profesion INT PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(45) NOT NULL
);

-- ----------------- Insercion de valores en la tabla Profesiones ----------------------
INSERT INTO Profesiones (ID_Profesion, Descripcion)
VALUES
    (1, 'Ingeniero'),
    (2, 'M�dico'),
    (3, 'Abogado'),
    (4, 'Profesor'),
    (5, 'Arquitecto');

-- ----------------- Creacion tabla Personas ----------------------
CREATE TABLE Personas (
    ID_Persona INT PRIMARY KEY NOT NULL,
    P_Nombre VARCHAR(45),
    S_Nombre VARCHAR(45),
    P_Apellido VARCHAR(45),
    S_Apellido VARCHAR(45),
    Genero VARCHAR(1),
    Fecha_Nacimiento DATE,
    Correo VARCHAR(45),
    Celular INT,
    ID_Direccion INT,
    CONSTRAINT FK_ID_Direccion FOREIGN KEY (ID_Direccion) REFERENCES Direcciones (ID_Direccion)
);

-- CREATE CLUSTERED INDEX IX_Persona_id_Persona ON PERSONA (id_Persona) --
CREATE NONCLUSTERED INDEX IX_Persona_Correo ON PERSONAS (Correo);
CREATE NONCLUSTERED INDEX IX_Persona_Fecha_Nacimiento ON PERSONAS (Fecha_Nacimiento);

-- ----------------- Insercion de valores en la tabla Personas ----------------------
INSERT INTO Personas (ID_Persona, P_Nombre, S_Nombre, P_Apellido, S_Apellido, Genero, Fecha_Nacimiento, Correo, Celular, ID_Direccion)
VALUES
    (1, 'Juan', 'Carlos', 'P�rez', 'Garc�a', 'M', '1990-05-15', 'juan@example.com', 99887766, 1),
    (2, 'Mar�a', 'Elena', 'L�pez', 'Rodr�guez', 'F', '1985-11-20', 'maria@example.com', 98765432, 2),
    (3, 'Carlos', 'Andr�s', 'Mart�nez', 'P�rez', 'M', '1995-03-10', 'carlos@example.com', 87654321, 3),
    (4, 'Ana', 'Isabel', 'Ram�rez', 'Hern�ndez', 'F', '1982-07-08', 'ana@example.com', 76543210, 4),
    (5, 'Luis', 'Alberto', 'Gonz�lez', 'G�mez', 'M', '1998-09-25', 'luis@example.com', 65432109, 5);


	-- ----------------- Creacion tabla Profesiones_Personas ----------------------
CREATE TABLE Profesiones_Personas (
    ID_Profesion INT PRIMARY KEY,
    --ID_Profesion INT,
    ID_Persona INT,
    CONSTRAINT FK_ID_Profesion FOREIGN KEY (ID_Profesion) REFERENCES Profesiones (ID_Profesion),
    CONSTRAINT FK_ID_Persona FOREIGN KEY (ID_Persona) REFERENCES Personas (ID_Persona)
);

INSERT INTO Profesiones_Personas (ID_Profesion, ID_Persona) 
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);


	-- ----------------- Creacion tabla Tipo_Clientes ----------------------
CREATE TABLE Tipo_Clientes (
    ID_Tipo_Cliente INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Descripcion VARCHAR(45)
);

-- ----------------- Insercion de valores en la tabla Tipo_Clientes ----------------------
INSERT INTO Tipo_Clientes (Descripcion)
VALUES
    ('Cliente Regular'),
    ('Cliente VIP'),
    ('Cliente Corporativo'),
    ('Cliente Nuevo'),
    ('Cliente Tercera Edad');


	-- ----------------- Creacion tabla Beneficios ----------------------
CREATE TABLE Beneficios (
    ID_Beneficio INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Descripcion VARCHAR(45),
    Fecha_Vigencia DATE
);

-- ----------------- Insercion de valores en la tabla Beneficios ----------------------
INSERT INTO Beneficios (Descripcion, Fecha_Vigencia)
VALUES
    ('Descuento del 10% en compras', '2023-12-31'),
    ('Acceso exclusivo a eventos', '2023-11-15'),
    ('Envio gratuito a domicilio', '2023-10-30'),
    ('Asesoria personalizada', '2023-09-20'),
    ('Regalo sorpresa en la primera compra', '2023-08-10');

	-- ----------------- Creacion tabla Beneficios_TipoClientes ----------------------
CREATE TABLE Beneficios_TipoClientes (
    ID_tcBeneficios INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    ID_Tipo_Cliente INT,
    ID_Beneficio INT,
    CONSTRAINT FK_ID_Tipo_Cliente FOREIGN KEY (ID_Tipo_Cliente) REFERENCES Tipo_Clientes (ID_Tipo_Cliente),
    CONSTRAINT FK_ID_Beneficio FOREIGN KEY (ID_Beneficio) REFERENCES Beneficios (ID_Beneficio)
);

-- ----------------- Insercion de valores en la tabla Beneficios_TipoClientes ----------------------
INSERT INTO Beneficios_TipoClientes (ID_Tipo_Cliente, ID_Beneficio)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);


	-- ----------------- Creacion tabla Clientes ----------------------
CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    ID_Persona INT,
    ID_Tipo_Cliente INT,
    Fecha_Ingreso DATE,
    CONSTRAINT FK_ID_Personas FOREIGN KEY (ID_Persona) REFERENCES Personas (ID_Persona),
    CONSTRAINT FK_ID_Tipo_Client FOREIGN KEY (ID_Tipo_Cliente) REFERENCES Tipo_Clientes (ID_Tipo_Cliente)
);

-- ----------------- Insercion de valores en la tabla Clientes ----------------------
INSERT INTO Clientes (ID_Persona, ID_Tipo_Cliente, Fecha_Ingreso)
VALUES
    (1, 1, '2023-01-15'),
    (2, 2, '2023-02-20'),
    (3, 3, '2023-03-10'),
    (4, 4, '2023-04-05'),
    (5, 5, '2023-05-08');


	-- ----------------- Creacion tabla Empleados ----------------------
CREATE TABLE Empleados (
    ID_Empleado INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Usuario VARCHAR(45),
    Password VARCHAR(45),
    Jornada_Laboral VARCHAR(45),
    Salario INT,
    Fecha_Ingreso DATE,
    ID_Persona INT,
    CONSTRAINT FK_ID_Person FOREIGN KEY (ID_Persona) REFERENCES Personas (ID_Persona)
);

-- ----------------- Insercion de valores en la tabla Empleados ----------------------
INSERT INTO Empleados (Usuario, Password, Jornada_Laboral, Salario, Fecha_Ingreso, ID_Persona)
VALUES
    ('usuario1', 'contrase�a1', 'Lunes a Viernes', 35000, '2022-01-15', 1),
    ('usuario2', 'contrase�a2', 'Lunes a S�bado', 42000, '2021-11-20', 2),
    ('usuario3', 'contrase�a3', 'Martes a S�bado', 38000, '2022-03-10', 3),
    ('usuario4', 'contrase�a4', 'Lunes a Viernes', 40000, '2020-04-05', 4),
    ('usuario5', 'contrase�a5', 'Mi�rcoles a Domingo', 46000, '2023-02-08', 5);

	-- ----------------- Creacion tabla Tipo_Empleado ----------------------
CREATE TABLE Tipo_Empleados(
    ID_Tipo_Empleado INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, 
    Tipo VARCHAR(40),
    ID_Empleado INT,
    CONSTRAINT FK_ID_Empleado FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado)
);

-- ----------------- Insercion de valores en la tabla Tipo_Empleado ----------------------
INSERT INTO Tipo_Empleados (Tipo, ID_Empleado)
VALUES
    ('Administrativo', 1),
    ('Mantenimiento', 2),
    ('Gerente', 3),
    ('Administrativo', 4),
    ('Mantenimiento', 5);

	-- ----------------- Creacion tabla Facturas ----------------------
CREATE TABLE Facturas (
    ID_Factura INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Fecha_Emision DATE,
    Impuesto INT,
    Descuento INT,
    CAI VARCHAR(20),
    Total FLOAT,
    Descripcion VARCHAR(40)
);

-- ----------------- Insercion de valores en la tablaFacturas ----------------------
INSERT INTO Facturas (Fecha_Emision, Impuesto, Descuento, CAI, Total, Descripcion)
VALUES
    ('2023-08-10', 15, 5, 'ABCDE12345', 150.50, 'Venta de productos'),
    ('2023-08-11', 10, 0, 'FGHIJ67890', 75.00, 'Servicio de consulta'),
    ('2023-08-12', 20, 8, 'KLMNO12345', 220.75, 'Compra de medicamentos'),
    ('2023-08-13', 5, 2, 'PQRST67890', 45.25, 'Pago de servicios'),
    ('2023-08-14', 18, 3, 'UVWXY12345', 320.00, 'Art�culos varios');


	-- ----------------- Creacion tabla Orden_Pedidos ----------------------
CREATE TABLE Orden_Pedidos (
    ID_Orden_Pedidos INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Descripcion VARCHAR(45),
    Fecha DATE,
    Cliente VARCHAR(45),
    ID_Empleado INT,
    ID_Clientes INT,
    ID_Factura INT,
    CONSTRAINT FK_OP_ID_Clientes FOREIGN KEY (ID_Clientes) REFERENCES Clientes (ID_Cliente),
    CONSTRAINT FK_OP_ID_Empleado FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado),
    CONSTRAINT FK_ID_Factura FOREIGN KEY (ID_Factura) REFERENCES Facturas (ID_Factura)
);

-- ----------------- Insercion de valores en la tabla Orden_Pedidos ----------------------
INSERT INTO Orden_Pedidos (Descripcion, Fecha, Cliente, ID_Empleado, ID_Clientes, ID_Factura)
VALUES
    ('Pedido de productos', '2023-08-10', 'Cliente A', 1, 1, 1),
    ('Solicitud de servicio', '2023-08-11', 'Cliente B', 2, 2, 2),
    ('Compra de medicamentos', '2023-08-12', 'Cliente C', 3, 3, 3),
    ('Pago de servicios', '2023-08-13', 'Cliente D', 4, 4, 4),
    ('Pedido de art�culos varios', '2023-08-14', 'Cliente E', 5, 5, 5);

	-- ----------------- Creacion tabla Laboratorios ----------------------
CREATE TABLE Laboratorios (
    ID_Laboratorio INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Descripcion VARCHAR(45),
    ID_Direccion INT,
    CONSTRAINT FK_ID_Direccion_Laboratorio FOREIGN KEY (ID_Direccion) REFERENCES Direcciones (ID_Direccion)
);

-- ----------------- Insercion de valores en la tabla Laboratorios ----------------------
INSERT INTO Laboratorios (Descripcion, ID_Direccion)
VALUES
    ('Labcorp', 1),
    ('Labin', 2),
    ('Biom�dica', 3),
    ('Pharmatech', 4),
    ('Diagn�stico Molecular', 5);

	-- ----------------- Creacion tabla Droguerias ----------------------
CREATE TABLE Droguerias (
    ID_Drogueria INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Descripcion VARCHAR(45),
    ID_Direccion INT,
    CONSTRAINT FK_ID_Direccion_Drogueria FOREIGN KEY (ID_Direccion) REFERENCES Direcciones (ID_Direccion)
);

-- ----------------- Insercion de valores en la tabla Droguerias ----------------------
INSERT INTO Droguerias (Descripcion, ID_Direccion)
VALUES
    ('Drogueria San Juan', 1),
    ('Farmacia La Esperanza', 2),
    ('Drogueria Santa Mar�a', 3),
    ('Farmacia El Sol', 4),
    ('Drogueria El Faro', 5);


	-- ----------------- Creacion tabla Laboratorios_Droguerias ----------------------
CREATE TABLE Laboratorios_Droguerias (
    ID_Laboratorio_Drogueria INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    ID_Laboratorio INT,
    ID_Drogueria INT,
    CONSTRAINT FK_ID_Laboratorio_LD FOREIGN KEY (ID_Laboratorio) REFERENCES Laboratorios (ID_Laboratorio),
    CONSTRAINT FK_ID_Drogueria_LD FOREIGN KEY (ID_Drogueria) REFERENCES Droguerias (ID_Drogueria)
);

-- ----------------- Insercion de valores en la tabla Laboratorios_Droguerias ----------------------
INSERT INTO Laboratorios_Droguerias (ID_Laboratorio, ID_Drogueria)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);


	-- ----------------- Creacion tabla Productos ----------------------
CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Descripcion VARCHAR(45),
    Nombre_Producto VARCHAR(45),
    Fecha_Vencimiento DATE,
    Fecha_Laboracion DATE,
    Prohibiciones VARCHAR(45),
    Existencias INT,
    ID_Drogueria INT,
    CONSTRAINT FK_ID_Drogueria_Producto FOREIGN KEY (ID_Drogueria) REFERENCES Droguerias (ID_Drogueria)
);

-- ----------------- Insercion de valores en la tabla Productos ----------------------
INSERT INTO Productos (Descripcion, Nombre_Producto, Fecha_Vencimiento, Fecha_Laboracion, Prohibiciones, Existencias, ID_Drogueria)
VALUES
    ('Analg�sico', 'Paracetamol', '2023-12-31', '2023-07-15', 'No usar en caso de alergia', 100, 1),
    ('Antibi�tico', 'Amoxicilina', '2023-11-30', '2023-06-20', 'Solo con prescripci�n m�dica', 50, 2),
    ('Antiinflamatorio', 'Ibuprofeno', '2023-10-15', '2023-07-01', 'No exceder la dosis recomendada', 75, 3),
    ('Vitamina', 'Vitamina C', '2023-09-30', '2023-05-10', 'No sustituye una dieta balanceada', 200, 4),
    ('Antial�rgico', 'Loratadina', '2023-08-15', '2023-04-25', 'Consultar con el m�dico', 30, 5);


	-- ----------------- Creacion tabla Productos_Droguerias ----------------------
CREATE TABLE Productos_Droguerias (
    ID_Producto_Drogueria INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    ID_Producto INT,
    ID_Drogueria INT,
    CONSTRAINT FK_ID_Droguerias_PD FOREIGN KEY (ID_Drogueria) REFERENCES Droguerias (ID_Drogueria),
    CONSTRAINT FK_ID_Productos_PD FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);

-- ----------------- Insercion de valores en la tabla Productos_Droguerias ----------------------
INSERT INTO Productos_Droguerias (ID_Producto, ID_Drogueria)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);



	-- ----------------- Creacion tabla Productos_OrdenPedidos ----------------------
CREATE TABLE Productos_OrdenPedidos (
    ID_Productos_OrdenPedidos INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    ID_Producto INT,
    ID_Orden_Pedidos INT,
    CONSTRAINT FK_ID_Orden_Pedidos FOREIGN KEY (ID_Orden_Pedidos) REFERENCES Orden_Pedidos (ID_Orden_Pedidos),
    CONSTRAINT FK_ID_Producto FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);


-- ----------------- Insercion de valores en la tabla Productos_OrdenPedidos ----------------------
INSERT INTO Productos_OrdenPedidos (ID_Producto, ID_Orden_Pedidos)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

	-- ----------------- Creacion tabla Tipo_Medicamentos ----------------------
CREATE TABLE Tipo_Medicamentos (
    ID_Tipo_Medicamento INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Descripcion VARCHAR(45)
);

-- ----------------- Insercion de valores en la tabla Tipo_Medicamentos ----------------------
INSERT INTO Tipo_Medicamentos (Descripcion)
VALUES
    ('Analgesico'),
    ('Antibiotico'),
    ('Antiinflamatorio'),
    ('Vitamina'),
    ('Antialergico');

	-- ----------------- Creacion tabla Medicamento ----------------------
CREATE TABLE Medicamentos (
    ID_Medicamento INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Nombre_Medicamento VARCHAR(45),
    No_Lote VARCHAR(45),
    ID_Producto INT,
    ID_Tipo_Medicamento INT,
	img VARCHAR (50),
    CONSTRAINT FK_ID_Producto_Medicamento FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto),
    CONSTRAINT FK_ID_Tipo_Medicamento FOREIGN KEY (ID_Tipo_Medicamento) REFERENCES Tipo_Medicamentos (ID_Tipo_Medicamento)
);

-- ----------------- Insercion de valores en la tabla Medicamento ----------------------
INSERT INTO Medicamentos (Nombre_Medicamento, No_Lote, ID_Producto, ID_Tipo_Medicamento)
VALUES
    ('Paracetamol', 'A12345', 1, 1),
    ('Amoxicilina', 'B67890', 2, 2),
    ('Ibuprofeno', 'C54321', 3, 3),
    ('Vitamina C', 'D98765', 4, 4),
    ('Loratadina', 'E24680', 5, 5);


	-- ----------------- Creacion tabla Suplementos ----------------------
CREATE TABLE Suplementos (
    ID_Suplemento INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Descripcion VARCHAR(45),
    ID_Producto INT,
	img VARCHAR (50),
    CONSTRAINT FK_ID_Productos_Suplementos FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);

-- ----------------- Insercion de valores en la tabla Suplementos ----------------------
INSERT INTO Suplementos (Descripcion, ID_Producto)
VALUES
    ('Calcio y Vitamina D', 1),
    ('Hierro y Acido Filico', 2),
    ('Omega-3', 3),
    ('Proteina en Polvo', 4),
    ('Multivitaminico', 5);


	-- ----------------- Creacion tabla Restricciones ----------------------
CREATE TABLE Restricciones (
    ID_Restricciones INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Descripcion VARCHAR(45)
);

-- ----------------- Insercion de valores en la tabla Restricciones ----------------------
INSERT INTO Restricciones (Descripcion)
VALUES
    ('Alergia a la lactosa'),
    ('Hipertension'),
    ('Diabetes'),
    ('Alergia al gluten'),
    ('Intolerancia a la cafeina');


	-- ----------------- Creacion tabla Restriccion_Productos ----------------------
CREATE TABLE Restriccion_Productos (
    ID_Restricciones_Producto INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    ID_Restricciones INT,
    ID_Producto INT,
    CONSTRAINT FK_ID_Productos_RP FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto),
    CONSTRAINT FK_ID_Restricciones_RP FOREIGN KEY (ID_Restricciones) REFERENCES Restricciones (ID_Restricciones)
);

-- ----------------- Insercion de valores en la tabla Restriccion_Productos ----------------------
INSERT INTO Restriccion_Productos (ID_Restricciones, ID_Producto)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

	-- ----------------- Creacion tabla Forma_Administraciones ----------------------
CREATE TABLE Forma_Administraciones (
    ID_Forma_Administracion INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Descripcion VARCHAR(45),
    Formas_Administracion VARCHAR(45)
);

-- ----------------- Insercion de valores en la tabla Forma_Administraciones ----------------------
INSERT INTO Forma_Administraciones (Descripcion, Formas_Administracion)
VALUES
    ('Tableta', 'Oral'),
    ('Capsula', 'Oral'),
    ('Jarabe', 'Oral'),
    ('Inyeccion', 'Intramuscular'),
    ('Parche', 'Transdermico');


-- ----------------- Creacion tabla Formas_Adm_Productos ----------------------
CREATE TABLE Formas_Adm_Productos (
    ID_Formas_AdmProducto INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    ID_Producto INT,
    ID_Forma_Administracion INT,
    CONSTRAINT FK_ID_Producto_F_ADM_P FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto),
    CONSTRAINT FK_ID_Forma_Administracion FOREIGN KEY (ID_Forma_Administracion) REFERENCES Forma_Administraciones (ID_Forma_Administracion)
);

-- ----------------- Insercion de valores en la tabla Formas_Adm_Productos ----------------------
INSERT INTO Formas_Adm_Productos (ID_Producto, ID_Forma_Administracion)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

	-- ----------------- Creacion tabla Factura_Productos ----------------------
CREATE TABLE Factura_Productos (
    ID_Factura_Producto INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    ID_Factura INT,
    ID_Producto INT,
    CONSTRAINT FK_ID_Factura_FP FOREIGN KEY (ID_Factura) REFERENCES Facturas (ID_Factura),
    CONSTRAINT FK_ID_Productos_FP FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);

-- ----------------- Insercion de valores en la tabla Factura_Productos ----------------------
INSERT INTO Factura_Productos (ID_Factura, ID_Producto)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);


	-- ----------------- Creacion tabla Formas_Pagos ----------------------
CREATE TABLE Formas_Pagos (
    ID_Formas_Pago INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Descripcion VARCHAR(45)
);

-- ----------------- Insercion de valores en la tabla Formas_Pagos ----------------------
INSERT INTO Formas_Pagos (Descripcion)
VALUES
    ('Efectivo'),
    ('Tarjeta de Credito'),
    ('Tarjeta de Debito'),
    ('Transferencia Bancaria'),
    ('Cheque');

	-- ----------------- Creacion tabla Factura_FormaPagos ----------------------
CREATE TABLE Factura_FormaPagos (
    ID_Factura_FormaPago INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    ID_Factura INT,
    ID_Formas_Pago INT,
    CONSTRAINT FK_ID_Factura_FF FOREIGN KEY (ID_Factura) REFERENCES Facturas (ID_Factura),
    CONSTRAINT FK_ID_Formas_Pago_FF FOREIGN KEY (ID_Formas_Pago) REFERENCES Formas_Pagos (ID_Formas_Pago)
);

-- ----------------- Insercion de valores en la tabla Factura_FormaPagos ----------------------
INSERT INTO Factura_FormaPagos (ID_Factura, ID_Formas_Pago)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);







	-- user cliente, user
	-- asd cliente, asd

	-- admin admin, adminpassword
	

































