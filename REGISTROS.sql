ALTER TABLE Suplementos
ADD img VARCHAR (50);
-- ----------------- Insercion de valores en la tabla Suplementos ----------------------
INSERT INTO Suplementos (Descripcion, ID_Producto, Img)
VALUES
    ('21st Century Suplemento de calcio, 600 mg 400 unidades', 1,'S_1.jpg'),
    ('FERROMAX B,12 10ML AMPBEB X15', 2,'S_2.png'),
    ('suplemento-nutricional-l-vitamin-way D', 3,'S_3.webp'),
    ('Kirkland Omega-3 Aceite de pescado 1000 mg 300 cápsulas', 4,'S_4.jpg'),
    ('multivitaminicop', 5,'S_5.png'),
	('TERAMIN MULTI (VITAMINAS) CAJA X 30', 6,'S_6.jpg'),
	 ('ACFOL PRENATAL FCO X 30 TABS PROMO 1+1', 7,'S_7.jpg'),
	 ('FITAMIN CABELLO UÑAS Y PIEL X 60', 8,'S_8.jpg'),
	 ('SUKROL JBE MANZANA 240 ML', 9,'S_9.jpg'),
	 ('SUKROL NIÑOS CEREZA 120 ML', 10,'S_10.jpg'),
	 ('VITASYM VITAMINA E 400 UI X 60 CAPS', 11,'S_11.jpg'),
	  ('FITAMIN ACTIFIT PROTEINA VAINILLA 2LBS', 12,'S_12.jpg'),
	   ('FITAMIN MELATONINA+MAGNESIO 240 ML', 13,'S_13.jpg'),
	    ('ALBENDAFAR CAJA X 2 TAB', 14,'S_14.jpg'),
		('TERAMIN ZINC 50 MG CAJA X 50 TABLETAS', 15,'S_15.jpg'),
		('102 Plus
Suplemento Dietario 102 Plus Vitaminas y Minerales x 60 comprimidos', 16,'S_16.jpg'),
		('LASANTE VIT C MANDA 500MG SOB X12', 17,'S_18.jpg'),
		('HADASSA VITAMINA C 30ML(ND)', 18,'S_18.jpg'),
		('BABARIA VITAMINA C SERUM 30ML', 19,'S_19.jpg'),
		('LACABINE AMPOLLAS VITAMINA C CAJAX10 2ML', 20,'S_20.jpg');


ALTER TABLE Medicamento
ADD img VARCHAR (50);

-- ----------------- Insercion de valores en la tabla Medicamento ----------------------
INSERT INTO Medicamento (Nombre_Medicamento, No_Lote, ID_Producto, ID_Tipo_Medicamento, Img)
VALUES
    ('FLVIDEFENAC 1.0G/100ML SOL. ANALGESICO', 'A12345', 1, 1,'MA_1.jpg'),
	('NODOR ICE GEL ANALGESICO 170G', 'A12345', 2, 1,'MA_2.jpg'),
	('ETORICOXIB FS 120 MG X 30 TABLETAS', 'AFR345', 3, 1,'MA_3.jpg'),
	('CALMOL (ACETAMINOFEN) GOTAS X 30 ML', 'O94345', 4, 1,'MA_4.jpg'),
	('CIPROFLOXACINA FS 500 MG X 1 TABLE', 'A1275I', 5, 2,'MANT_5.jpg'),
	('CLINDAMICINA FS 300MG CAJA X 30 CÁPSULAS', 'A17444', 2, 1,'MANT_6.jpg'),
	('CEFUROXIMA FS 500 MG CAJA X 60 TAB', 'S4RG545', 7, 2,'MANT_7.jpg'),
	('CEFIXIMA FS 400 MG X 6 TABLETAS', 'A12MOT', 8, 2,'MANT_8.jpg'),
	('AMPISINT 500 MG (AMPICILINA)X1 CAPGV', 'A12780', 9, 2,'MANT_9.jpg'),
	('MATROSULFA (TRIMETOPRIN SULFA)X 60MLGV', 'A15545', 12, 2,'MANT_10.jpg'),
	('DICLOFENACO DE POTASIO FS 50MG X 100 TAB', 'A1LO45', 11, 3,'MANTFLA_11.jpg'),
	('ETORICOXIB FS 120 MG X 30 TABLETAS', 'TF6345', 12, 3,'MANTFLA_12.jpg'),
	('AMOXICILINA (AMOXIFAR) 500 MG X 1 CAPS', 'A14645', 13, 3,'MANTFLA_13.jpg'),
	('DECALAN TROCIZCOS SOBRE X 4', 'A12345', 14, 3,'MANTFLA_14.jpg'),
	('IBUPROFENO FS 600MG X 1 TABLETA GV', 'A12ER45', 15, 3,'MANTFLA_15.jpg'),
	('HISTADRIL ALERGIAS JARABE X 120 ML', 'A12FN5', 16, 5,'MANTALER_16.jpg'),
	('LORATADINA FS 10 MG CAJA X 10 TABLETAS', 'A12YU5', 17, 5,'MANTALER_17.jpg'),
	('DESLORATADINA FS 5 MG CAJA X10 TAB', 'AT12045', 18, 5,'MANTALER_18.jpg'),
	('DESLORATADINA FS JARABE FRASCO X 60 ML', 'A13N45', 19, 5,'MANTALER_19.jpg'),
	('ALERGIL JBE. 120ML', 'A12345', 20, 5,'MANTALER_20.jpg');
