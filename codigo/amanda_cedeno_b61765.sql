USE practicaprogramadasistemas;
GO

-- Tabla de Territorio
CREATE TABLE Territorio(
-- Llave primaria
id_territorio INT NOT NULL CONSTRAINT id_ter PRIMARY KEY,
provincia VARCHAR(60) NOT NULL,
canton VARCHAR(60) NOT NULL,
distrito VARCHAR(60) NOT NULL
)

-- Tabla de Proveedor
CREATE TABLE Proveedor(
-- Llave primaria
cedula_proveedor INT NOT NULL CONSTRAINT id_prov PRIMARY KEY,
tipo_cedula VARCHAR(60) NOT NULL,
nombre_proveedor VARCHAR(60) NOT NULL,
correo_proveedor VARCHAR(60) NOT NULL,
num_proveedor VARCHAR(60) NOT NULL
)

-- Tabla intermedia de Proveedor Territorio
CREATE TABLE InterProveedorTerritorio (
-- Llave primaria
id_proveterritorio INT IDENTITY(1,1) CONSTRAINT id_provter PRIMARY KEY,
-- Llaves for�neas
id_territorio INT NOT NULL,
cedula_proveedor INT NOT NULL,
FOREIGN KEY (id_territorio) REFERENCES Territorio(id_territorio),
FOREIGN KEY (cedula_proveedor) REFERENCES Proveedor(cedula_proveedor)
)

-- Tabla de Categor�a
CREATE TABLE Categoria(
-- Llave primaria
num_categoria INT NOT NULL CONSTRAINT num_cat PRIMARY KEY,
nombre_categoria VARCHAR(60) NOT NULL
)

-- Tabla de Subcategor�a
CREATE TABLE Subcategoria(
-- Llave primaria
num_subcategoria INT NOT NULL CONSTRAINT num_subcat PRIMARY KEY,
num_categoria INT NOT NULL,
nombre_subcategoria VARCHAR(60) NOT NULL,
-- Llave for�nea
FOREIGN KEY (num_categoria) REFERENCES Categoria(num_categoria)
)

-- Tabla de Producto
CREATE TABLE Producto(
-- Llave primaria
id_univ_producto INT NOT NULL CONSTRAINT id_univ PRIMARY KEY,
nombre_producto VARCHAR(60) NOT NULL,
num_subcategoria INT NOT NULL,
precio_producto INT NOT NULL,
tamano VARCHAR(60) NOT NULL,
color VARCHAR(60) NOT NULL,
-- Llave for�nea
FOREIGN KEY (num_subcategoria) REFERENCES Subcategoria(num_subcategoria)
)

-- Tabla intermedia de Proveedor Producto
CREATE TABLE InterProveedorProdu (
-- Llave primaria
id_proveedorprodu INT IDENTITY(1,1) CONSTRAINT id_proveprodu PRIMARY KEY,
-- Llaves for�neas
id_univ_producto INT NOT NULL,
cedula_proveedor INT NOT NULL,
FOREIGN KEY (cedula_proveedor) REFERENCES Proveedor(cedula_proveedor),
FOREIGN KEY (id_univ_producto) REFERENCES Producto(id_univ_producto)
)

-- Tabla de Cliente
CREATE TABLE Cliente(
-- LLlave primaria
cedula_cliente bigINT NOT NULL CONSTRAINT ced_cli PRIMARY KEY,
tipo_cedula VARCHAR(60) NOT NULL,
nombre_cliente VARCHAR(60) NOT NULL,
correo_cliente VARCHAR(60) NOT NULL
)

-- Tabla intermedia de Cliente Territorio
CREATE TABLE InterClienteTerritorio (
-- Llave primaria
id_clienteterritorio INT IDENTITY(1,1) CONSTRAINT id_cliter PRIMARY KEY,
-- Llaves for�neas
id_territorio INT NOT NULL,
cedula_cliente bigINT NOT NULL,
FOREIGN KEY (id_territorio) REFERENCES Territorio(id_territorio),
FOREIGN KEY (cedula_cliente) REFERENCES Cliente(cedula_cliente)
)

-- Tabla de Factura
CREATE TABLE Factura(
-- Llave primaria
num_factura INT NOT NULL CONSTRAINT num_fac PRIMARY KEY,
cedula_cliente bigINT NOT NULL,
cantidad_unidades INT NOT NULL,
porc_desc DECIMAL(4,4),
porc_impuestos DECIMAL(4,4) NOT NULL,
precio_total INT NOT NULL,
fecha DATE,
-- Llave for�nea
FOREIGN KEY (cedula_cliente) REFERENCES Cliente(cedula_cliente)
)

-- Tabla intermedia de Producto Factura
CREATE TABLE InterProductoFactura (
-- Llave primaria
id_produfactura INT IDENTITY(1,1) CONSTRAINT id_prodfac PRIMARY KEY,
-- Llaves for�neas
num_factura INT NOT NULL,
id_univ_producto INT NOT NULL,
FOREIGN KEY (num_factura) REFERENCES Factura(num_factura),
FOREIGN KEY (id_univ_producto) REFERENCES Producto(id_univ_producto)
)

-- Insertar valores en la tabla de Categor�a
INSERT INTO Categoria (num_categoria, nombre_categoria)
VALUES
    (1, 'Labios'),
    (2, 'Ojos'),
    (3, 'Rostro'),
    (4, 'Cabello'),
    (5, 'Skincare');

-- Insertar valores en la tabla de Subcategor�a
INSERT INTO Subcategoria (num_subcategoria, num_categoria, nombre_subcategoria)
VALUES
    (1, 1, 'Tintas Labiales'),
    (2, 1, 'Labiales L�quidos'),
    (3, 1, 'B�lsamos Labiales'),
    (4, 2, 'M�scaras de Pesta�as'),
    (5, 2, 'Eyeliners L�quidos'),
    (6, 2, 'Sombras de Ojos'),
    (7, 3, 'Polvos Compactos y Base'),
    (8, 3, 'Bronceadores'),
    (9, 3, 'Iluminadores'),
    (10, 4, 'Tratamientos Capilares y Champ�'),
    (11, 4, 'Sprays para Peinar'),
    (12, 4, 'Aceites para Cabello'),
    (13, 5, 'Mascarillas Faciales'),
    (14, 5, 'Serums y Limpiadores Faciales'),
    (15, 5, 'Protector Solar Facial');

-- Insertar valores en la tabla de Territorio
INSERT INTO Territorio (id_territorio, provincia, canton, distrito)
VALUES
    (1, 'San Jos�', 'San Jos�', 'Carmen'),
    (2, 'San Jos�', 'San Jos�', 'Merced'),
    (3, 'San Jos�', 'San Jos�', 'Hospital'),
    (4, 'San Jos�', 'Escaz�', 'Escaz� Centro'),
    (5, 'San Jos�', 'Escaz�', 'San Rafael'),
    (6, 'San Jos�', 'Escaz�', 'San Antonio'),
    (7, 'San Jos�', 'Desamparados', 'Desamparados Centro'),
    (8, 'San Jos�', 'Desamparados', 'San Miguel'),
    (9, 'San Jos�', 'Desamparados', 'San Juan de Dios'),
    (10, 'Alajuela', 'Alajuela', 'Alajuela Centro'),
    (11, 'Alajuela', 'Alajuela', 'San Jos�'),
    (12, 'Alajuela', 'Alajuela', 'La Gu�cima'),
    (13, 'Alajuela', 'San Ram�n', 'San Ram�n Centro'),
    (14, 'Alajuela', 'San Ram�n', 'Piedades'),
    (15, 'Alajuela', 'San Ram�n', 'La Fortuna'),
    (16, 'Heredia', 'Heredia', 'Heredia Centro'),
    (17, 'Heredia', 'Heredia', 'Mercedes'),
    (18, 'Heredia', 'Heredia', 'San Francisco'),
    (19, 'Heredia', 'Barva', 'Barva Centro'),
    (20, 'Heredia', 'Barva', 'San Pedro'),
    (21, 'Heredia', 'Barva', 'San Pablo'),
    (22, 'Cartago', 'Cartago', 'Cartago Centro'),
    (23, 'Cartago', 'Cartago', 'Oriental'),
    (24, 'Cartago', 'Cartago', 'Occidental'),
    (25, 'Cartago', 'Para�so', 'Para�so Centro'),
    (26, 'Cartago', 'Para�so', 'Santiago'),
    (27, 'Cartago', 'Para�so', 'Orosi'),
    (28, 'Guanacaste', 'Liberia', 'Liberia Centro'),
    (29, 'Guanacaste', 'Liberia', 'Ca�as Dulces'),
    (30, 'Guanacaste', 'Liberia', 'Mayorga'),
    (31, 'Guanacaste', 'Santa Cruz', 'Santa Cruz Centro'),
    (32, 'Guanacaste', 'Santa Cruz', 'Bols�n'),
    (33, 'Guanacaste', 'Santa Cruz', 'Veintisiete de Abril'),
    (34, 'Puntarenas', 'Puntarenas', 'Puntarenas Centro'),
    (35, 'Puntarenas', 'Puntarenas', 'Pitahaya'),
    (36, 'Puntarenas', 'Puntarenas', 'Manzanillo'),
    (37, 'Puntarenas', 'Esparza', 'Esparza Centro'),
    (38, 'Puntarenas', 'Esparza', 'El Roble'),
    (39, 'Puntarenas', 'Esparza', 'San Juan Grande'),
    (40, 'Puntarenas', 'Buenos Aires', 'Buenos Aires Centro'),
    (41, 'Puntarenas', 'Buenos Aires', 'Volc�n'),
    (42, 'Puntarenas', 'Buenos Aires', 'Potrero Grande'),
    (43, 'Lim�n', 'Lim�n', 'Lim�n Centro'),
    (44, 'Lim�n', 'Lim�n', 'Matina'),
    (45, 'Lim�n', 'Lim�n', 'Cahuita');

-- Insertar valores en la tabla de Proveedor
INSERT INTO Proveedor (cedula_proveedor, tipo_cedula, nombre_proveedor, correo_proveedor, num_proveedor)
VALUES
    (123456789, 'F�sica', 'Juan P�rez', 'juanperez@gmail.com', '87654321'),
    (987654321, 'Jur�dica', 'Marta S.A.', 'marta@hotmail.com', '76543210'),
    (234567890, 'F�sica', 'Pedro Garc�a', 'pedrogarcia@outlook.com', '65432109'),
    (345678901, 'Jur�dica', 'Laura Empresas', 'laura@yahoo.com', '54321098'),
    (456789012, 'F�sica', 'Ana L�pez', 'analopez@gmail.com', '43210987'),
    (567890123, 'Jur�dica', 'Carlos Comercial', 'carlos@hotmail.com', '32109876'),
    (678901234, 'F�sica', 'Sof�a Rodr�guez', 'sofiarodriguez@yahoo.com', '98765432'),
    (789012345, 'Jur�dica', 'Empresa XYZ', 'empresaXYZ@gmail.com', '87654321'),
    (890123456, 'F�sica', 'Luis Gonz�lez', 'luisgonzalez@hotmail.com', '76543210'),
    (901234567, 'Jur�dica', 'Comercial ABC', 'comercialabc@yahoo.com', '65432109'),
    (012345678, 'F�sica', 'Mar�a Mart�nez', 'mariamartinez@gmail.com', '54321098');

-- Insertar valores en la tabla intermedia de Proveedor Territorio
INSERT INTO InterProveedorTerritorio(cedula_proveedor, id_territorio) 
VALUES 
	(123456789, 1),
    (987654321, 15),
    (234567890, 27),
    (345678901, 13),
    (456789012, 8),
    (567890123, 3),
    (678901234, 8),
    (789012345, 4),
    (890123456, 31),
    (901234567, 23),
    (012345678, 17),
	(012345678, 2);

-- Insertar valores en la tabla de Producto
INSERT INTO Producto (id_univ_producto, nombre_producto, num_subcategoria, precio_producto, tamano, color)
VALUES
    (1, 'Tinta labios Rojo', 1, 15000, '5g', 'Rojo'),
    (2, 'Sombra de Ojos Brillante', 6, 12000, '3g', 'Dorado'),
    (3, 'Base de Maquillaje Mate', 7, 20000, '30ml', 'Beige'),
    (4, 'Champ� Revitalizante', 10, 18000, '250ml', 'Transparente'),
    (5, 'Limpiador Facial Suave', 14, 9000, '150ml', 'Azul'),
    (6, 'Delineador de Ojos Negro', 5, 8000, '1.2g', 'Negro'),
    (7, 'Polvo Compacto Transl�cido', 7, 16000, '10g', 'Transl�cido'),
    (8, 'Labial Rosa', 2, 14000, '5g', 'Rosa'),
    (9, 'Sombra de Ojos Mate', 6, 11000, '3g', 'Marr�n'),
    (10, 'Base de Maquillaje Hidratante', 7, 22000, '30ml', 'Marfil'),
    (11, 'Champ� Nutritivo', 10, 19000, '250ml', 'Naranja'),
    (12, 'Limpiador Facial Exfoliante', 14, 9500, '150ml', 'Verde'),
    (13, 'Delineador de Ojos Azul', 5, 8500, '1.2g', 'Azul Brillante'),
    (14, 'Polvo Compacto Mate', 7, 16500, '10g', 'Piel Clara'),
    (15, 'Labial Mate', 2, 15500, '5g', 'Magenta'),
    (16, 'Sombra de Ojos Ahumada', 6, 11800, '3g', 'Gris Oscuro'),
    (17, 'Base de Maquillaje Iluminadora', 7, 21000, '30ml', 'Dorado'),
    (18, 'Champ� Reparador', 10, 17500, '250ml', 'P�rpura'),
    (19, 'Limpiador Facial Suave', 14, 9000, '150ml', 'Azul'),
    (20, 'Delineador de Ojos Caf�', 5, 8100, '1.2g', 'Caf� Oscuro'),
    (21, 'Polvo Compacto Transl�cido', 7, 16000, '10g', 'Transl�cido'),
    (22, 'B�lsamo de Miel', 3, 14500, '5g', 'Nude'),
    (23, 'Sombra de Ojos Brillante', 6, 12000, '3g', 'Plateado'),
    (24, 'Base de Maquillaje Antiedad', 7, 23000, '30ml', 'Beige'),
    (25, 'Champ� Voluminizador', 10, 18500, '250ml', 'Rosa'),
    (26, 'Limpiador Facial Purificante', 14, 9700, '150ml', 'Blanco'),
    (27, 'Delineador de Ojos Verde', 5, 8200, '1.2g', 'Verde Oscuro'),
    (28, 'Polvo Compacto Mate', 7, 16500, '10g', 'Piel Media'),
    (29, 'Labial Rojo Oscuro', 2, 16000, '5g', 'Rojo Oscuro'),
    (30, 'Sombra de Ojos Met�lica', 6, 12500, '3g', 'Oro Rosa');
	
-- Insertar valores en la tabla intermedia de Proveedor Producto
INSERT INTO InterProveedorProdu(cedula_proveedor, id_univ_producto)
VALUES
	(123456789, 1),
	(123456789, 2),
	(123456789, 3),
	(123456789, 4),
	(123456789, 5),
	(123456789, 6),
	(123456789, 7),
	(123456789, 8),
	(123456789, 9),
	(123456789, 10),
    (987654321, 11),
    (234567890, 12),
    (345678901, 13),
    (456789012, 14),
    (567890123, 15),
    (678901234, 16),
    (789012345, 17),
    (890123456, 18),
    (901234567, 19),
    (012345678, 20),
	(012345678, 21),
	(012345678, 22),
	(012345678, 23),
	(012345678, 24),
	(012345678, 25),
	(012345678, 26),
	(012345678, 27),
	(012345678, 28),
	(012345678, 29),
	(012345678, 30),
	(789012345, 18),
	(789012345, 19),
	(789012345, 20);

-- Insertar valores en la tabla de Cliente
INSERT INTO Cliente (cedula_cliente, tipo_cedula, nombre_cliente, correo_cliente)
VALUES
    (789012341, 'F�sica', 'Carlos M�ndez', 'carlos@gmail.com'),
    (8901234562, 'Jur�dica', 'Glamour Beauty Store', 'info@glamourbeauty.com'),
    (901234563, 'F�sica', 'Laura S�nchez', 'laura@hotmail.com'),
    (123456781, 'F�sica', 'Pedro L�pez', 'pedro@yahoo.com'),
    (234567890, 'F�sica', 'Isabel Castro', 'isabel@gmail.com'),
    (3456789013, 'Jur�dica', 'Belleza Total CR', 'ventas@bellezatotalcr.com'),
    (456789017, 'F�sica', 'Fernanda Jim�nez', 'fernanda@outlook.com'),
    (567890121, 'F�sica', 'Jos� Ram�rez', 'jose@gmail.com'),
    (6789012342, 'Jur�dica', 'Cosmetic World', 'contacto@cosmeticworld.com'),
    (789012348, 'F�sica', 'Marta P�rez', 'marta@hotmail.com'),
    (890123450, 'F�sica', 'Luisa Morales', 'luisa@yahoo.com'),
    (9012345674, 'Jur�dica', 'Beauty Trends CR', 'info@beautytrends.com'),
    (123456796, 'F�sica', 'David Gonz�lez', 'david@gmail.com'),
    (234567892, 'F�sica', 'Gabriela Herrera', 'gabriela@outlook.com'),
    (3456789011, 'Jur�dica', 'Elegance Beauty Supply', 'ventas@elegancebeauty.com'),
    (456789011, 'F�sica', 'Javier Torres', 'javier@yahoo.com'),
    (567890123, 'F�sica', 'Andrea Fern�ndez', 'andrea@hotmail.com'),
    (6789012347, 'Jur�dica', 'Belleza Latina CR', 'contacto@bellezalatina.com'),
    (789012347, 'F�sica', 'Ra�l Mora', 'raul@gmail.com'),
    (890123457, 'F�sica', 'Silvia Rodr�guez', 'silvia@yahoo.com'),
    (9012345678, 'Jur�dica', 'Glow Beauty Store', 'info@glowbeauty.com'),
    (123456778, 'F�sica', 'Elena P�rez', 'elena@hotmail.com'),
    (234567800, 'F�sica', 'Antonio L�pez', 'antonio@gmail.com'),
    (3456789017, 'Jur�dica', 'Beauty Empire CR', 'ventas@beautyempire.com'),
    (456789013, 'F�sica', 'Carmen Soto', 'carmen@outlook.com'),
    (567890125, 'F�sica', 'Roberto Ram�rez', 'roberto@gmail.com'),
    (6789012346, 'Jur�dica', 'CosmeticosOnline CR', 'contacto@cosmeticosonline.com'),
    (789012342, 'F�sica', 'Ana Mar�a Gonz�lez', 'anamaria@yahoo.com'),
    (890123454, 'F�sica', 'Carlos Rodr�guez', 'carlos@hotmail.com'),
    (9012345689, 'Jur�dica', 'Beauty Haven CR', 'info@beautyhaven.com');

-- Insertar valores en la tabla de Cliente Territorio
INSERT INTO InterClienteTerritorio(cedula_cliente, id_territorio)
VALUES
    (789012341, 2),
    (8901234562, 7),
    (901234563, 14),
    (123456781, 14),
    (234567890, 22),
    (3456789013, 34),
    (456789017, 40),
    (567890121, 8),
    (6789012342, 7),
    (789012348, 2),
    (890123450, 5),
    (9012345674, 10),
    (123456796, 24),
    (234567892, 33),
    (3456789011, 11),
    (456789011, 19),
    (567890123, 22),
    (6789012347, 15),
    (789012347, 35),
    (890123457, 18),
    (9012345678, 2),
    (123456778, 3),
    (234567800, 4),
    (3456789017, 5),
    (456789013, 17),
    (567890125, 18),
    (6789012346, 19),
    (789012342, 20),
    (890123454, 21),
    (9012345689, 22),
	(9012345689, 21);

-- Insertar valores en la tabla de Factura
INSERT INTO Factura(num_factura, cedula_cliente, cantidad_unidades, porc_desc, porc_impuestos, precio_total, fecha)
VALUES
    (1, 789012341, 6, 0.05, 0.13, 113400, '2023-09-01'),
    (2, 789012341, 3, 0.03, 0.13, 39600, '2023-09-02'),
    (3, 789012341, 5, 0.02, 0.13, 10545, '2023-09-03'),
    (4, 789012341, 1, 0.04, 0.13, 19620, '2023-09-04'),
    (5, 3456789013, 1, 0.01, 0.13, 14355, '2023-09-05'),
    (6, 3456789013, 1, 0.05, 0.13, 34020, '2023-09-06'),
    (7, 3456789013, 1, 0.03, 0.13, 15450, '2023-06-07'),
    (8, 890123454, 1, 0.02, 0.13, 45090, '2023-06-08'),
    (9, 890123454, 1, 0.01, 0.13, 8118, '2023-01-09'),
    (10, 456789013, 1, 0.04, 0.13, 18720, '2023-01-10'),
    (11, 456789013, 1, 0.01, 0.13, 15345, '2023-01-11'),
    (12, 234567800, 1, 0.05, 0.13, 30450, '2023-02-12'),
    (13, 234567800, 1, 0.02, 0.13, 22540, '2023-02-13'),
    (14, 567890123, 1, 0.03, 0.13, 6880, '2023-02-14'),
    (15, 890123457, 1, 0.04, 0.13, 9560, '2023-09-15'),
    (16, 234567892, 1, 0.01, 0.13, 15840, '2023-09-16'),
    (17, 234567892, 1, 0.03, 0.13, 23280, '2023-03-17'),
    (18, 567890123, 1, 0.02, 0.13, 20580, '2023-03-18'),
    (19, 3456789011, 1, 0.05, 0.13, 36125, '2023-03-19'),
    (20, 3456789011, 1, 0.04, 0.13, 37440, '2023-03-20'),
    (21, 890123450, 1, 0.01, 0.13, 8375, '2023-04-21'),
    (22, 890123450, 1, 0.03, 0.13, 30015, '2023-04-22'),
    (23, 890123450, 1, 0.02, 0.13, 11760, '2023-04-23'),
    (24, 123456781, 1, 0.05, 0.13, 8312, '2023-04-24'),
    (25, 456789011, 1, 0.04, 0.13, 18720, '2023-05-25'),
    (26, 456789011, 4, 0.02, 0.13, 9506, '2023-09-26'),
    (27, 567890125, 1, 0.01, 0.13, 14850, '2023-05-27'),
    (28, 567890125, 1, 0.03, 0.13, 12085, '2023-06-28'),
    (29, 567890125, 1, 0.01, 0.13, 9603, '2023-07-29'),
    (30, 789012341, 5, 0.05, 0.13, 131945, '2023-04-30');

-- Insertar valores en la tabla intermedia de Producto Factura
INSERT INTO InterProductoFactura(num_factura, id_univ_producto)
VALUES
	(1, 1),
	(1, 20),
	(1, 13),
	(1, 7),
	(1, 10),
	(1, 2),
    (2, 1),
	(2, 10),
	(2, 20),
    (3, 3),
	(3, 12),
	(3, 20),
	(3, 25),
	(3, 30),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
	(26, 1),
	(26, 10),
	(26, 15),
    (27, 29),
    (28, 28),
    (29, 29),
    (30, 3),
	(30, 10),
	(30, 25),
	(30, 22),
	(30, 2)