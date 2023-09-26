drop database FARMACIA
CREATE DATABASE FARMACIA

use Farmacia
-- ----------------- Creaci?n tabla Pais ----------------------
CREATE TABLE Pais (
    ID_Pais INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Descripcion VARCHAR(45) NOT NULL
);

-- ----------------- Inserci?n de valores en la tabla Pais ----------------------
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
    ('A la par de la pulper?a los gemelos', '34.5678, -123.4567', 2),
    ('Frente a la iglesia San Juan', '56.7890, -45.6789', 3),
    ('Detr?s del parque central', '78.9012, -67.8901', 4),
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
    (2, 'Medico'),
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
    (1, 'Juan', 'Carlos', 'Perez', 'Garcia', 'M', '1990-05-15', 'juan@example.com', 99887766, 1),
    (2, 'Maria', 'Elena', 'Lopez', 'Rodroguez', 'F', '1985-11-20', 'maria@example.com', 98765432, 2),
    (3, 'Carlos', 'Andres', 'Martinez', 'Perez', 'M', '1995-03-10', 'carlos@example.com', 87654321, 3),
    (4, 'Ana', 'Isabel', 'Ramirez', 'Hernandez', 'F', '1982-07-08', 'ana@example.com', 76543210, 4),
    (5, 'Luis', 'Alberto', 'Gonzolez', 'Gomez', 'M', '1998-09-25', 'luis@example.com', 65432109, 5);


    -- ----------------- Creacion tabla Profesiones_Personas ----------------------
CREATE TABLE Profesiones_Personas (
    ID_Profesion INT PRIMARY KEY,
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
    ('usuario1', 'contraseña1', 'Lunes a Viernes', 35000, '2022-01-15', 1),
    ('usuario2', 'contraseña2', 'Lunes a Sabado', 42000, '2021-11-20', 2),
    ('usuario3', 'contraseña3', 'Martes a Sabado', 38000, '2022-03-10', 3),
    ('usuario4', 'contraseña4', 'Lunes a Viernes', 40000, '2020-04-05', 4),
    ('usuario5', 'contraseña5', 'Miercoles a Domingo', 46000, '2023-02-08', 5);

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
    ('2023-08-14', 18, 3, 'UVWXY12345', 320.00, 'Articulos varios');


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
    ('Pedido de articulos varios', '2023-08-14', 'Cliente E', 5, 5, 5),
    ('Pedido de productos', '2023-08-25', 'Cliente B', 1, 1, 1);

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
    ('Biomedica', 3),
    ('Pharmatech', 4),
    ('Diagnostico Molecular', 5);

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
    ('Drogueria Santa Maria', 3),
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

------- Creacion tabla Tipo_Medicamentos ----------------------
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
    -- ----------------- Creacion tabla Productos ----------------------
CREATE TABLE Productos_Detalles (
    ID_Producto INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, 
    ID_Orden_Pedidos INT,
    ID_Tipo_Medicamento INT,
    Cantidad INT,
    CONSTRAINT FK_ID_Orden_Pedidos FOREIGN KEY (ID_Orden_Pedidos) REFERENCES [dbo].[Orden_Pedidos] (ID_Orden_Pedidos),
    --CONSTRAINT FK_ID_Tipo_Medicamento_PD FOREIGN KEY (ID_Tipo_Medicamento) REFERENCES  [dbo].[Tipo_Medicamentos](ID_Tipo_Medicamento)
);

-- ----------------- Insercion de valores en la tabla Productos ----------------------
INSERT INTO Productos_Detalles ( ID_Orden_Pedidos, ID_Tipo_Medicamento, Cantidad)--la cantidad es de las vendidas
VALUES
    (1,1,5),
    (2,2,2),
    (3,3,4),
    (4,4,1),
    (5,5,3),
    (1,1,2)




    -- ----------------- Creacion tabla Productos_Droguerias ----------------------
CREATE TABLE Productos_Droguerias (
    ID_Producto_Drogueria INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    ID_Producto INT,
    ID_Drogueria INT,
    CONSTRAINT FK_ID_Droguerias_PD FOREIGN KEY (ID_Drogueria) REFERENCES Droguerias (ID_Drogueria),
    CONSTRAINT FK_ID_Productos_PD FOREIGN KEY (ID_Producto) REFERENCES Productos_Detalles (ID_Producto)
);

-- ----------------- Insercion de valores en la tabla Productos_Droguerias ----------------------
INSERT INTO Productos_Droguerias (ID_Producto, ID_Drogueria)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);


SELECT * FROM [dbo].[Productos_Detalles]


    -- ----------------- Creacion tabla Medicamentos ----------------------
CREATE TABLE Medicamentos (
    ID_Medicamento INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Nombre_Medicamento VARCHAR(45),
    No_Lote VARCHAR(45),
    ID_Producto_TM INT,
    ID_Tipo_Medicamento INT,
    Img VARCHAR (50),
    Precio INT,
    Existencias INT,
    Fecha_Vencimiento DATE,
    Fecha_Laboracion DATE,
    CONSTRAINT FK_ID_Producto_TM FOREIGN KEY (ID_Producto_TM) REFERENCES [dbo].[Productos_Detalles](ID_Producto),
    CONSTRAINT FK_ID_Tipo_Medicamento FOREIGN KEY (ID_Tipo_Medicamento) REFERENCES Tipo_Medicamentos (ID_Tipo_Medicamento)
);

-- ----------------- Insercion de valores en la tabla Medicamento ----------------------
INSERT INTO Medicamentos (Nombre_Medicamento, No_Lote, ID_Producto_TM, ID_Tipo_Medicamento, Img,Precio,Existencias,Fecha_Laboracion,Fecha_Vencimiento)
VALUES
    ('FLVIDEFENAC 1.0G/100ML SOL. ANALGESICO', 'A12345', 1, 1, 'MA_1.jpg', 150, 100, '2023-07-15', '2023-12-31'),
    ('NODOR ICE GEL ANALGESICO 170G', 'A12345', 2, 1, 'MA_2.jpg', 200, 50, '2023-06-20', '2023-11-30'),
    ('ETORICOXIB FS 120 MG X 30 TABLETAS', 'AFR345', 3, 1, 'MA_3.jpg', 150, 75, '2023-06-20', '2023-10-15'),
    ('CALMOL (ACETAMINOFEN) GOTAS X 30 ML', 'O94345', 4, 1, 'MA_4.jpg', 250, 200, '2023-07-01', '2023-10-15'),
    ('CLINDAMICINA FS 300MG CAJA X 30 CÁPSULAS', 'A17444', 1, 1, 'MANT_6.jpg', 250, 30, '2023-05-10', '2023-09-30'),
    ('CIPROFLOXACINA FS 500 MG X 1 TABLETA', 'A1275I', 5, 2, 'MANT_5.jpg', 175.50, 100, '2023-04-25', '2023-08-15'),
    ('CLINDAMICINA FS 300MG CAJA X 30 CÁPSULAS', 'A17444', 2, 1, 'MANT_6.jpg', 250.90, 50, '2023-08-15', '2023-11-30'),
    ('CEFUROXIMA FS 500 MG CAJA X 60 TAB', 'S4RG545', 1, 2, 'MANT_7.jpg', 275.95, 75, '2023-04-25', '2023-08-15'),
    ('CEFIXIMA FS 400 MG X 6 TABLETAS', 'A12MOT', 1, 2, 'MANT_8.jpg', 175, 200, '2023-04-30', '2023-07-15'),
    ('AMPISINT 500 MG (AMPICILINA)X1 CAPGV', 'A12780', 5, 2, 'MANT_9.jpg', 150, 30, '2023-08-15', '2023-11-30'),
    ('MATROSULFA (TRIMETOPRIN SULFA)X 60MLGV', 'A15545', 4, 2, 'MANT_10.jpg', 150.75, 100, '2023-05-10', '2023-11-30'),
    ('DICLOFENACO DE POTASIO FS 50MG X 100 TAB', 'A1LO45', 2, 3, 'MANTFLA_11.jpg', 200, 150, '2023-08-15', '2023-12-31'),
    ('ETORICOXIB FS 120 MG X 30 TABLETAS', 'TF6345', 1, 3, 'MANTFLA_12.jpg', 100.75, 750, '2023-05-10', '2023-11-30'),
    ('AMOXICILINA (AMOXIFAR) 500 MG X 1 CAPS', 'A14645', 2, 3, 'MANTFLA_13.jpg', 175.05, 500, '2023-04-30', '2023-12-31'),
    ('DECALAN TROCIZCOS SOBRE X 4', 'A12345', 2, 3, 'MANTFLA_14.jpg', 175, 50, '2023-05-10', '2023-11-30'),
    ('IBUPROFENO FS 600MG X 1 TABLETA GV', 'A12ER45', 4, 3, 'MANTFLA_15.jpg', 125, 75, '2023-09-30', '2023-12-31'),
    ('HISTADRIL ALERGIAS JARABE X 120 ML', 'A12FN5', 5, 5, 'MANTALER_16.jpg', 250, 100, '2023-03-31', '2023-09-30'),
    ('LORATADINA FS 10 MG CAJA X 10 TABLETAS', 'A12YU5', 5, 5, 'MANTALER_17.jpg', 255.75, 35, '2023-07-15', '2023-12-31'),
    ('DESLORATADINA FS 5 MG CAJA X10 TAB', 'AT12045', 5, 5, 'MANTALER_18.jpg', 175, 40, '2023-06-20', '2023-11-30'),
    ('DESLORATADINA FS JARABE FRASCO X 60 ML', 'A13N45', 5, 5, 'MANTALER_19.jpg', 100.50, 100, '2023-07-01', '2023-10-15'),
    ('ALERGIL JBE. 120ML', 'A12345', 5, 5, 'MANTALER_20.jpg', 100.50, 40, '2023-05-10', '2023-09-30');

    -- ----------------- Creacion tabla Suplementos ----------------------
CREATE TABLE Suplementos (
    ID_Suplemento INT PRIMARY KEY IDENTITY(1, 1) NOT NULL, -- ID autoincrementable
    Descripcion VARCHAR(45),
    ID_Producto INT,
    ID_Tipo_Medicamento INT,
    Img VARCHAR (50),
    Precio INT,
    Existencias INT,
    Fecha_Vencimiento DATE,
    Fecha_Laboracion DATE,
    CONSTRAINT FK_ID_Productos_Suplementos FOREIGN KEY (ID_Producto) REFERENCES Productos_Detalles (ID_Producto),
    CONSTRAINT FK_ID_Tipo_Medicamento_DS FOREIGN KEY (ID_Tipo_Medicamento) REFERENCES Tipo_Medicamentos (ID_Tipo_Medicamento)
);
ALTER TABLE Suplementos
ALTER COLUMN Descripcion VARCHAR(100);
-- ----------------- Insercion de valores en la tabla Suplementos ----------------------
INSERT INTO Suplementos (Descripcion, ID_Producto,ID_Tipo_Medicamento, Img, Fecha_Laboracion, Fecha_Vencimiento, Existencias, Precio)
VALUES
    ('21st Century Suplemento de calcio, 600 mg 400 unidades', 1,3, 'S_1.jpg', '2023-07-15', '2023-12-31', 300,150),
    ('FERROMAX B,12 10ML AMPBEB X15', 2,3 ,'S_2.png', '2023-06-20', '2023-11-30', 200,250.25),
    ('suplemento-nutricional-l-vitamin-way D', 3,3, 'S_3.webp', '2023-06-20', '2023-10-15', 250,100),
    ('Kirkland Omega-3 Aceite de pescado 1000 mg 300 cápsulas', 4,3, 'S_4.jpg', '2023-07-01', '2023-10-15', 180,150),
    ('multivitaminicop', 5,3, 'S_5.png', '2023-05-10', '2023-09-30', 400,85.55),
    ('TERAMIN MULTI (VITAMINAS) CAJA X 30', 3,3, 'S_6.jpg', '2023-04-25', '2023-08-15', 150,100.50),
    ('ACFOL PRENATAL FCO X 30 TABS PROMO 1+1', 5,3, 'S_7.jpg', '2023-08-15', '2023-11-30', 250,175.5),
    ('FITAMIN CABELLO UÑAS Y PIEL X 60', 4,3, 'S_8.jpg', '2023-04-25', '2023-08-15', 300,250.50),
    ('SUKROL JBE MANZANA 240 ML', 2,3, 'S_9.jpg', '2023-04-30', '2023-07-15', 100,75.50),
    ('SUKROL NIÑOS CEREZA 120 ML', 5,3, 'S_10.jpg', '2023-08-15', '2023-11-30', 120,75.50),
    ('VITASYM VITAMINA E 400 UI X 60 CAPS', 5,3, 'S_11.jpg', '2023-05-10', '2023-11-30', 80,100),
    ('FITAMIN ACTIFIT PROTEINA VAINILLA 2LBS', 5,3, 'S_12.jpg', '2023-05-10', '2023-09-30', 200,150),
    ('FITAMIN MELATONINA+MAGNESIO 240 ML', 3,3, 'S_13.jpg', '2023-08-15', '2023-12-31', 150,185.50),
    ('ALBENDAFAR CAJA X 2 TAB', 1,3, 'S_14.jpg','2023-07-01', '2023-10-15', 50,180.90),
    ('TERAMIN ZINC 50 MG CAJA X 50 TABLETAS', 1,3, 'S_15.jpg', '2023-05-10', '2023-09-30', 100,175),
    ('102 Plus, Suplemento Dietario 102 Plus Vitaminas y Minerales x 60 comprimidos', 3,3, 'S_16.jpg', '2023-09-30', '2023-12-31', 180,200),
    ('LASANTE VIT C MANDA 500MG SOB X12', 5,3, 'S_18.jpg', '2023-03-31', '2023-09-30', 120,195),
    ('HADASSA VITAMINA C 30ML(ND)', 4,3, 'S_18.jpg', '2023-06-20', '2023-11-30', 90,66),
    ('BABARIA VITAMINA C SERUM 30ML', 3, 3,'S_19.jpg', '2023-07-01', '2023-10-15', 70,50.65),
    ('LACABINE AMPOLLAS VITAMINA C CAJAX10 2ML', 2,3, 'S_20.jpg', '2023-05-10', '2023-11-30', 150,50.66);


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
    CONSTRAINT FK_ID_Productos_RP FOREIGN KEY (ID_Producto) REFERENCES Productos_Detalles (ID_Producto),
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
    CONSTRAINT FK_ID_Producto_F_ADM_P FOREIGN KEY (ID_Producto) REFERENCES Productos_Detalles (ID_Producto),
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

select * from Medicamentos,Tipo_Medicamentos,Suplementos, Productos_Detalles

select * from Medicamentos
select * from Tipo_Medicamentos
select * from Suplementos
select * from Productos_Detalles

-- Crear Procedimientos almacenados

-- Crear un inicio de sesión publico:
USE master;
CREATE LOGIN asd WITH PASSWORD = 'asd';
-- Crear un usuario en la base de datos:
USE FARMACIA;
CREATE USER [nombre_usuario] FOR LOGIN [nombre_usuario];
-- Asignar permisos de solo lectura:
USE FARMACIA;
GRANT SELECT TO asd;

-- Crear un inicio de sesión publico:
USE master;
CREATE LOGIN abcd WITH PASSWORD = 'abcd';
-- Crear un usuario en la base de datos:
USE FARMACIA;
CREATE USER abcd FOR LOGIN abcd;
-- Asignar permisos de solo lectura:
USE FARMACIA;
GRANT SELECT TO abcd;



-- Crear un inicio de sesión admin
USE master;
CREATE LOGIN cusadmin WITH PASSWORD = 'cusadmin';
-- Crear un usuario en la base de datos:
USE FARMACIA;
CREATE USER cusadmin FOR LOGIN cusadmin;
-- Asignar permisos de solo lectura:
USE FARMACIA;
ALTER SERVER ROLE sysadmin ADD MEMBER cusadmin;


-- Crear un inicio de sesión admin
USE master;
CREATE LOGIN admin WITH PASSWORD = 'adminpassword';
-- Crear un usuario en la base de datos:
USE FARMACIA;
CREATE USER admin FOR LOGIN admin;
-- Asignar permisos de solo lectura:
USE FARMACIA;
ALTER SERVER ROLE admin ADD MEMBER admin;

