USE [GD2C2022]
GO

/**************************
DROP OBJETOS
***************************/

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Venta') and type = 'U')
begin
	ALTER TABLE [DATOSOS].Item_venta drop constraint FK_item_ven_venta_codigo;
	ALTER TABLE [DATOSOS].Descuentos_Venta drop constraint FK_desc_venta_codigo;
	ALTER TABLE [DATOSOS].Cupon_por_venta drop constraint FK_cuve_venta_codigo;
	ALTER TABLE [DATOSOS].Envio drop constraint FK_envio_venta_codigo;
	drop table [DATOSOS].Venta;
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Cliente') and type = 'U')
begin
	drop table [DATOSOS].Cliente
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Canal_Venta') and type = 'U')
begin
	drop table [DATOSOS].Canal_Venta
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Envio') and type = 'U')
begin
	drop table [DATOSOS].Envio
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Medio_Pago') and type = 'U')
begin
	ALTER TABLE [DATOSOS].Compra drop constraint FK_compra_medio_pago;
	drop table [DATOSOS].Medio_Pago;
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Direccion') and type = 'U')
begin
	drop table [DATOSOS].Direccion
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Codigo_Postal') and type = 'U')
begin
	ALTER TABLE [DATOSOS].Proveedor drop constraint FK_prov_codigo_postal;
	drop table [DATOSOS].Codigo_Postal;
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Localidad') and type = 'U')
begin
	ALTER TABLE [DATOSOS].Proveedor drop constraint FK_prov_localidad;
	drop table [DATOSOS].Localidad;
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Provincia') and type = 'U')
begin
	ALTER TABLE [DATOSOS].Proveedor drop constraint FK_prov_provincia;
	drop table [DATOSOS].Provincia;
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Descuentos_Venta') and type = 'U')
begin
	drop table [DATOSOS].Descuentos_Venta
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Tipo_Descuento') and type = 'U')
begin
	drop table [DATOSOS].Tipo_Descuento
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Cupon_por_venta') and type = 'U')
begin	
	drop table [DATOSOS].Cupon_por_venta
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Cupon') and type = 'U')
begin
	drop table [DATOSOS].Cupon
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Tipo_de_Cupon') and type = 'U')
begin
	drop table [DATOSOS].Tipo_de_Cupon
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Item_venta') and type = 'U')
begin
	drop table [DATOSOS].Item_venta
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Producto_Variante') and type = 'U')
begin
	ALTER TABLE [DATOSOS].Item_compra drop constraint FK_item_com_producto_codigo;
	drop table [DATOSOS].Producto_Variante;
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Tipo_Variante') and type = 'U')
begin
	drop table [DATOSOS].Tipo_Variante
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Producto') and type = 'U')
begin
	drop table [DATOSOS].Producto
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Material') and type = 'U')
begin
	drop table [DATOSOS].Material
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Marca') and type = 'U')
begin
	drop table [DATOSOS].Marca
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Categoria') and type = 'U')
begin
	drop table [DATOSOS].Categoria
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Item_compra') and type = 'U')
begin
	drop table [DATOSOS].Item_compra
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Descuentos_Compra') and type = 'U')
begin	
	drop table [DATOSOS].Descuentos_Compra
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Tipo_Descuento_Compra') and type = 'U')
begin	
	drop table [DATOSOS].Tipo_Descuento_Compra
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Compra') and type = 'U')
begin
	drop table [DATOSOS].Compra
end

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[DATOSOS].Proveedor') and type = 'U')
begin
	drop table [DATOSOS].Proveedor
end

/**************************
CREACION SCHEMA
***************************/

IF EXISTS (SELECT name FROM sys.schemas WHERE name = 'DATOSOS')
DROP SCHEMA DATOSOS
GO

if not exists (select * from sys.schemas where name ='DATOSOS')
begin
	exec('CREATE SCHEMA DATOSOS')
end
go


/**************************
CREACION DE TABLAS
***************************/

CREATE TABLE [DATOSOS].Venta (
    ven_codigo DECIMAL(19,0) NOT NULL,
    ven_fecha DATE NOT NULL,
    ven_cliente INT NOT NULL,
	ven_canal INT NOT NULL,    
	--ven_envio_codigo INT,
	ven_medio_pago INT NOT NULL,
	vent_total DECIMAL(18,2) NOT NULL,
    PRIMARY KEY (ven_codigo)
);

CREATE TABLE [DATOSOS].Cliente(
	clie_codigo INT IDENTITY(1,1),
	clie_nombre NVARCHAR(255) NOT NULL,
	clie_apellido NVARCHAR(255) NOT NULL,
	clie_dni DECIMAL(18,0) NOT NULL,
	clie_telefono DECIMAL(18,0) NOT NULL,
	clie_mail  NVARCHAR(255) NOT NULL,
	clie_fecha_nacimiento DATE NOT NULL,
	clie_direccion INT NOT NULL,
	PRIMARY KEY (clie_codigo)
);

CREATE TABLE [DATOSOS].Canal_Venta(
	canal_codigo INT IDENTITY(1,1),
	canal_nombre NVARCHAR(2255) NOT NULL,
	canal_costo DECIMAL(18,2) NOT NULL,
	PRIMARY KEY (canal_codigo)
);

CREATE TABLE [DATOSOS].Envio(
	envio_codigo INT IDENTITY(1,1),
	envio_nombre NVARCHAR(255) NOT NULL,
	envio_costo DECIMAL(18,2) NOT NULL,
	envio_codigo_postal DECIMAL(18,0) NOT NULL,
	envio_venta_codigo DECIMAL(19,0) NOT NULL,
	PRIMARY KEY (envio_codigo)
);

CREATE TABLE [DATOSOS].Medio_Pago(
	med_codigo INT IDENTITY(1,1),
	med_nombre NVARCHAR(255) NOT NULL,
	med_costo DECIMAL(18,2) NOT NULL,
	--med_desc_porcentaje DECIMAL(18,2) NOT NULL,
	PRIMARY KEY (med_codigo)
);

CREATE TABLE [DATOSOS].Direccion(
	dir_codigo INT IDENTITY(1,1),
	dir_calle NVARCHAR(255) NOT NULL,
	dir_localidad INT NOT NULL,
	dir_codigo_postal DECIMAL(18,0) NOT NULL,
	dir_provincia INT NOT NULL,
	PRIMARY KEY (dir_codigo)
);

CREATE TABLE [DATOSOS].Codigo_Postal(
	cp_codigo DECIMAL(18,0) NOT NULL,
	cp_provincia INT NOT NULL,
	PRIMARY KEY (cp_codigo)
);

CREATE TABLE [DATOSOS].Localidad(
	loc_codigo  INT IDENTITY(1,1),
	loc_nombre NVARCHAR(255) NOT NULL,
	loc_provincia INT NOT NULL,   
	PRIMARY KEY (loc_codigo)
);

CREATE TABLE [DATOSOS].Provincia(
	prov_codigo INT IDENTITY(1,1),
	prov_nombre NVARCHAR(255) NOT NULL,
	PRIMARY KEY (prov_codigo)
);

CREATE TABLE [DATOSOS].Descuentos_Venta(
	desc_venta_codigo DECIMAL(19,0) NOT NULL,
	desc_codigo INT IDENTITY(1,1),
	desc_tipo_codigo INT NOT NULL,
	desc_valor DECIMAL(18,2) NOT NULL,
	PRIMARY KEY (desc_venta_codigo, desc_codigo)
);

CREATE TABLE [DATOSOS].Tipo_Descuento(
	tipo_desc_codigo INT IDENTITY(1,1),
	tipo_desc_concepto NVARCHAR(255) NOT NULL,
	PRIMARY KEY (tipo_desc_codigo)
);

CREATE TABLE [DATOSOS].Cupon_por_venta(
	cuve_venta_codigo DECIMAL(19,0) NOT NULL,
	cuve_cupon_codigo NVARCHAR(255) NOT NULL,
	cuve_codigo INT IDENTITY(1,1),
	cuve_importe DECIMAL(18,2) NOT NULL,
	PRIMARY KEY (cuve_venta_codigo, cuve_cupon_codigo, cuve_codigo)
);

CREATE TABLE [DATOSOS].Cupon(
	cupon_codigo NVARCHAR(255) NOT NULL,
	cupon_tipo INT NOT NULL,
	cupon_desde DATE NOT NULL,
	cupon_hasta DATE NOT NULL,
	cupon_valor DECIMAL(18,2) NOT NULL,
	PRIMARY KEY (cupon_codigo)
);

CREATE TABLE [DATOSOS].Tipo_de_Cupon(
	tipocupon_codigo INT IDENTITY(1,1),
	tipocupon_nombre NVARCHAR(50) NOT NULL,
	PRIMARY KEY (tipocupon_codigo)
);

CREATE TABLE [DATOSOS].Item_venta(
	item_ven_venta_codigo DECIMAL(19,0) NOT NULL,
	item_ven_prodvariante_codigo NVARCHAR(50) NOT NULL,
	item_ven_cantidad DECIMAL(18,0) NOT NULL,
	item_ven_precio_unitario DECIMAL(18,2) NOT NULL,	
	item_ven_precio_total DECIMAL(18,2) NOT NULL,
	PRIMARY KEY (item_ven_venta_codigo, item_ven_prodvariante_codigo)
);

CREATE TABLE [DATOSOS].Producto_Variante(
	prodvar_variante_codigo NVARCHAR(50) NOT NULL,
	prodvar_producto NVARCHAR(50) NOT NULL,
	prodvar_variante INT NOT NULL,
	prodvar_precio DECIMAL(18,2) NOT NULL,	
	prodvar_stock DECIMAL(18,0) NOT NULL,
	PRIMARY KEY (prodvar_variante_codigo)
);

CREATE TABLE [DATOSOS].Tipo_Variante(
	var_codigo INT IDENTITY(1,1),
	var_tipo NVARCHAR(50) NOT NULL,
	var_descripcion NVARCHAR(50) NOT NULL,
	PRIMARY KEY (var_codigo)
);

CREATE TABLE [DATOSOS].Producto(
	prod_codigo NVARCHAR(50) NOT NULL,
	prod_marca INT NOT NULL,
	prod_nombre  NVARCHAR(50) NOT NULL,
	prod_descripcion  NVARCHAR(50) NOT NULL,
	prod_categoria INT NOT NULL,
	prod_material INT NOT NULL,
	PRIMARY KEY (prod_codigo)
);

CREATE TABLE [DATOSOS].Material(
	material_codigo INT IDENTITY(1,1),
	material_nombre NVARCHAR(50) NOT NULL,
	PRIMARY KEY (material_codigo)
);

CREATE TABLE [DATOSOS].Marca(
	marca_codigo INT IDENTITY(1,1),
	marca_nombre NVARCHAR(255) NOT NULL,
	PRIMARY KEY (marca_codigo)
);

CREATE TABLE [DATOSOS].Categoria(
	cat_codigo INT IDENTITY(1,1),
	cat_nombre NVARCHAR(255) NOT NULL,
	PRIMARY KEY (cat_codigo)
);

CREATE TABLE [DATOSOS].Compra (
    compra_codigo DECIMAL(19,0) NOT NULL,
    compra_fecha DATE NOT NULL,
    compra_medio_pago INT NOT NULL,
	compra_proveedor_cuit NVARCHAR(50) NOT NULL,
	compra_total DECIMAL(18,2) NOT NULL,
	compra_proveedor_razon NVARCHAR(50) NOT NULL,
    PRIMARY KEY (compra_codigo)
);

CREATE TABLE [DATOSOS].Item_compra (
    item_com_compra_codigo DECIMAL(19,0) NOT NULL,
    item_com_producto_codigo NVARCHAR(50) NOT NULL,
	item_com_cantidad DECIMAL(18,0) NOT NULL,
	item_com_precio_unitario DECIMAL(18,2) NOT NULL,
	item_com_precio_total DECIMAL(18,2) NOT NULL,
    PRIMARY KEY (item_com_compra_codigo, item_com_producto_codigo)
);

CREATE TABLE [DATOSOS].Proveedor (
    prov_razon_social NVARCHAR(50) NOT NULL,
    prov_cuit NVARCHAR(50) NOT NULL,
    prov_domicilio NVARCHAR(50) NOT NULL,
	prov_mail NVARCHAR(50) NOT NULL,
	prov_codigo_postal DECIMAL(18,0) NOT NULL,
	prov_localidad INT NOT NULL,
	prov_provincia INT NOT NULL,
    PRIMARY KEY (prov_razon_social, prov_cuit),
	UNIQUE(prov_razon_social, prov_cuit)
);

CREATE TABLE [DATOSOS].Descuentos_Compra(
	desc_compra_id DECIMAL(19,0) NOT NULL,
	desc_compra_codigo DECIMAL(19,0) NOT NULL,
	desc_compra_valor DECIMAL(18,2) NOT NULL,
	desc_tipo_descuento INT NOT NULL,
	PRIMARY KEY (desc_compra_id, desc_compra_codigo)
);

CREATE TABLE [DATOSOS].Tipo_Descuento_Compra(
	tipo_desc_compra_codigo  INT IDENTITY(1,1),
	tipo_desc_compra_nombre NVARCHAR(50) NOT NULL,
	PRIMARY KEY (tipo_desc_compra_codigo)
);

/**************************
 CONSTRAINTS TABLAS -> FK 
***************************/

/*--  Venta  --*/

ALTER TABLE [DATOSOS].Venta 
ADD CONSTRAINT FK_ven_cliente
FOREIGN KEY (ven_cliente) REFERENCES [DATOSOS].Cliente

ALTER TABLE [DATOSOS].Venta 
ADD CONSTRAINT FK_ven_canal
FOREIGN KEY (ven_canal) REFERENCES [DATOSOS].Canal_Venta

--ALTER TABLE [DATOSOS].Venta 
--ADD CONSTRAINT FK_ven_envio_codigo
--FOREIGN KEY (ven_envio_codigo) REFERENCES [DATOSOS].Envio

ALTER TABLE [DATOSOS].Venta 
ADD CONSTRAINT FK_ven_medio_pago
FOREIGN KEY (ven_medio_pago) REFERENCES [DATOSOS].Medio_Pago

/*--  Envio  --*/

ALTER TABLE [DATOSOS].Envio 
ADD CONSTRAINT FK_envio_codigo_postal
FOREIGN KEY (envio_codigo_postal) REFERENCES [DATOSOS].Codigo_Postal

ALTER TABLE [DATOSOS].Envio 
ADD CONSTRAINT FK_envio_venta_codigo
FOREIGN KEY (envio_venta_codigo) REFERENCES [DATOSOS].Venta

/*--  Descuentos_Venta  --*/

ALTER TABLE [DATOSOS].Descuentos_Venta 
ADD CONSTRAINT FK_desc_venta_codigo
FOREIGN KEY (desc_venta_codigo) REFERENCES [DATOSOS].Venta

ALTER TABLE [DATOSOS].Descuentos_Venta 
ADD CONSTRAINT FK_desc_tipo_codigo
FOREIGN KEY (desc_tipo_codigo) REFERENCES [DATOSOS].Tipo_Descuento

/*--  Cupon_por_venta  --*/

ALTER TABLE [DATOSOS].Cupon_por_venta 
ADD CONSTRAINT FK_cuve_venta_codigo
FOREIGN KEY (cuve_venta_codigo) REFERENCES [DATOSOS].Venta

ALTER TABLE [DATOSOS].Cupon_por_venta 
ADD CONSTRAINT FK_cuve_cupon_codigo
FOREIGN KEY (cuve_cupon_codigo) REFERENCES [DATOSOS].Cupon

/*--  Cupon  --*/

ALTER TABLE [DATOSOS].Cupon 
ADD CONSTRAINT FK_cupon_tipo
FOREIGN KEY (cupon_tipo) REFERENCES [DATOSOS].Tipo_de_Cupon

/*--  Codigo_Postal  --*/

ALTER TABLE [DATOSOS].Codigo_Postal 
ADD CONSTRAINT FK_cp_provincia
FOREIGN KEY (cp_provincia) REFERENCES [DATOSOS].Provincia

/*--  Direccion  --*/

ALTER TABLE [DATOSOS].Direccion 
ADD CONSTRAINT FK_dir_localidad
FOREIGN KEY (dir_localidad) REFERENCES [DATOSOS].Localidad

ALTER TABLE [DATOSOS].Direccion 
ADD CONSTRAINT FK_dir_codigo_postal
FOREIGN KEY (dir_codigo_postal) REFERENCES [DATOSOS].Codigo_Postal

ALTER TABLE [DATOSOS].Direccion 
ADD CONSTRAINT FK_dir_provincia
FOREIGN KEY (dir_provincia) REFERENCES [DATOSOS].Provincia

/*--  Localidad  --*/

ALTER TABLE [DATOSOS].Localidad 
ADD CONSTRAINT FK_loc_provincia   
FOREIGN KEY (loc_provincia   ) REFERENCES [DATOSOS].Provincia

/*--  Item_venta  --*/

ALTER TABLE [DATOSOS].Item_venta 
ADD CONSTRAINT FK_item_ven_venta_codigo
FOREIGN KEY (item_ven_venta_codigo) REFERENCES [DATOSOS].Venta

ALTER TABLE [DATOSOS].Item_venta 
ADD CONSTRAINT FK_item_ven_prodvariante_codigo
FOREIGN KEY (item_ven_prodvariante_codigo) REFERENCES [DATOSOS].Producto_Variante

/*--  Producto_Variante  --*/

ALTER TABLE [DATOSOS].Producto_Variante 
ADD CONSTRAINT FK_prodvar_producto
FOREIGN KEY (prodvar_producto) REFERENCES [DATOSOS].Producto

ALTER TABLE [DATOSOS].Producto_Variante 
ADD CONSTRAINT FK_prodvar_variante
FOREIGN KEY (prodvar_variante) REFERENCES [DATOSOS].Tipo_Variante

/*--  Producto  --*/

ALTER TABLE [DATOSOS].Producto
ADD CONSTRAINT FK_prod_marca
FOREIGN KEY (prod_marca) REFERENCES [DATOSOS].Marca

ALTER TABLE [DATOSOS].Producto
ADD CONSTRAINT FK_prod_categoria
FOREIGN KEY (prod_categoria) REFERENCES [DATOSOS].Categoria

ALTER TABLE [DATOSOS].Producto
ADD CONSTRAINT FK_prod_material
FOREIGN KEY (prod_material) REFERENCES [DATOSOS].Material

/*--  Item_compra  --*/

ALTER TABLE [DATOSOS].Item_compra
ADD CONSTRAINT FK_item_com_compra_codigo
FOREIGN KEY (item_com_compra_codigo) REFERENCES [DATOSOS].Compra

ALTER TABLE [DATOSOS].Item_compra
ADD CONSTRAINT FK_item_com_producto_codigo
FOREIGN KEY (item_com_producto_codigo) REFERENCES [DATOSOS].Producto_Variante

/*--  Compra  --*/

ALTER TABLE [DATOSOS].Compra
ADD CONSTRAINT FK_compra_medio_pago
FOREIGN KEY (compra_medio_pago) REFERENCES [DATOSOS].Medio_Pago

ALTER TABLE [DATOSOS].Compra
  ADD constraint FK_compra_proveedor_razon
  FOREIGN KEY (compra_proveedor_razon, compra_proveedor_cuit)
  REFERENCES [DATOSOS].Proveedor(prov_razon_social, prov_cuit);

/*--  Descuentos_Compra  --*/

ALTER TABLE [DATOSOS].Descuentos_Compra
ADD CONSTRAINT FK_desc_compra_id
FOREIGN KEY (desc_compra_id) REFERENCES [DATOSOS].Compra

ALTER TABLE [DATOSOS].Descuentos_Compra
ADD CONSTRAINT FK_desc_tipo_descuento
FOREIGN KEY (desc_tipo_descuento) REFERENCES [DATOSOS].Tipo_Descuento_Compra

/*--  Proveedor  --*/

ALTER TABLE [DATOSOS].Proveedor
ADD CONSTRAINT FK_prov_codigo_postal
FOREIGN KEY (prov_codigo_postal) REFERENCES [DATOSOS].Codigo_Postal

ALTER TABLE [DATOSOS].Proveedor
ADD CONSTRAINT FK_prov_localidad
FOREIGN KEY (prov_localidad) REFERENCES [DATOSOS].Localidad

ALTER TABLE [DATOSOS].Proveedor
ADD CONSTRAINT FK_prov_provincia
FOREIGN KEY (prov_provincia) REFERENCES [DATOSOS].Provincia

/**************************
DROP SP
***************************/

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_provincia')
	DROP PROCEDURE migrar_provincia
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_codigo_postal')
	DROP PROCEDURE migrar_codigo_postal
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_localidad')
	DROP PROCEDURE migrar_localidad
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_direccion')
	DROP PROCEDURE migrar_direccion
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_cliente')
	DROP PROCEDURE migrar_cliente
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_canal_venta')
	DROP PROCEDURE migrar_canal_venta
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tipo_descuento')
	DROP PROCEDURE migrar_tipo_descuento
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tipo_de_cupon')
	DROP PROCEDURE migrar_tipo_de_cupon
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_cupon')
	DROP PROCEDURE migrar_cupon
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_medio_de_pago')
	DROP PROCEDURE migrar_medio_de_pago
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_venta')
	DROP PROCEDURE migrar_venta
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_envio')
	DROP PROCEDURE migrar_envio
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_descuento_venta')
	DROP PROCEDURE migrar_descuento_venta
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_Cupon_por_venta')
	DROP PROCEDURE migrar_Cupon_por_venta
GO


IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_material')
	DROP PROCEDURE migrar_material
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_marca')
	DROP PROCEDURE migrar_marca
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_categoria')
	DROP PROCEDURE migrar_categoria
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tipo_variante')
	DROP PROCEDURE migrar_tipo_variante
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tipo_descuento_compra')
	DROP PROCEDURE migrar_tipo_descuento_compra
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_proveedor')
	DROP PROCEDURE migrar_proveedor
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_producto')
	DROP PROCEDURE migrar_producto
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_producto_variante')
	DROP PROCEDURE migrar_producto_variante
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_item_venta')
	DROP PROCEDURE migrar_item_venta
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_compra')
	DROP PROCEDURE migrar_compra
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_descuento_compra')
	DROP PROCEDURE migrar_descuento_compra
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_item_compra')
	DROP PROCEDURE migrar_item_compra
GO

/**************************
CREATE SP
***************************/

CREATE PROCEDURE migrar_provincia
AS
  BEGIN
	PRINT 'Migrando Provincia'
    INSERT INTO [DATOSOS].Provincia (prov_nombre)
		SELECT DISTINCT CLIENTE_PROVINCIA
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE CLIENTE_PROVINCIA IS NOT NULL
		UNION
		SELECT DISTINCT PROVEEDOR_PROVINCIA
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE PROVEEDOR_PROVINCIA IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_codigo_postal
AS
  BEGIN
	PRINT 'Migrando Codigo Postal'
    INSERT INTO [DATOSOS].Codigo_Postal (cp_codigo, cp_provincia)
			select CLIENTE_CODIGO_POSTAL,
				prov_codigo
			from 
				(select DISTINCT CLIENTE_CODIGO_POSTAL,
					CLIENTE_PROVINCIA
					FROM [GD2C2022].[gd_esquema].[Maestra]
					where CLIENTE_CODIGO_POSTAL is not null
				union
				select DISTINCT PROVEEDOR_CODIGO_POSTAL,
					PROVEEDOR_PROVINCIA
					FROM [GD2C2022].[gd_esquema].[Maestra]
					where PROVEEDOR_CODIGO_POSTAL is not null) as T
			join [DATOSOS].Provincia on T.CLIENTE_PROVINCIA = prov_nombre
  END
GO

CREATE PROCEDURE migrar_localidad
AS
  BEGIN
	PRINT 'Migrando Localidad'
    INSERT INTO [DATOSOS].Localidad (loc_nombre, loc_provincia)
		select CLIENTE_LOCALIDAD,
			prov_codigo
		from 
			(select  CLIENTE_LOCALIDAD,
				CLIENTE_PROVINCIA
				FROM [GD2C2022].[gd_esquema].[Maestra]
				where CLIENTE_LOCALIDAD is not null
			union
			select  PROVEEDOR_LOCALIDAD,
				PROVEEDOR_PROVINCIA
				FROM [GD2C2022].[gd_esquema].[Maestra]
				where PROVEEDOR_LOCALIDAD is not null) as T
		join [DATOSOS].Provincia on T.CLIENTE_PROVINCIA = prov_nombre
  END
GO

CREATE PROCEDURE migrar_direccion
AS
  BEGIN
	PRINT 'Migrando Direccion'
    INSERT INTO [DATOSOS].Direccion (dir_calle, dir_localidad, dir_codigo_postal, dir_provincia)
		SELECT DISTINCT CLIENTE_DIRECCION, loc_codigo, CLIENTE_CODIGO_POSTAL, prov_codigo
		FROM [GD2C2022].gd_esquema.Maestra
		join [DATOSOS].Provincia on CLIENTE_PROVINCIA = prov_nombre
		join [DATOSOS].Localidad on CLIENTE_LOCALIDAD = loc_nombre and loc_provincia = prov_codigo
		WHERE CLIENTE_DIRECCION IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_cliente
AS
  BEGIN
	PRINT 'Migrando Cliente'
    INSERT INTO [DATOSOS].Cliente (clie_nombre, clie_apellido, clie_dni, clie_telefono, clie_mail, clie_fecha_nacimiento, clie_direccion)
		--WHERE CLIENTE_DNI = 21631290
		select CLIENTE_NOMBRE,
			CLIENTE_APELLIDO,
			CLIENTE_DNI,
			CLIENTE_TELEFONO,
			CLIENTE_MAIL,
			CLIENTE_FECHA_NAC,
			dir_codigo
		from [GD2C2022].[gd_esquema].[Maestra]
		join [DATOSOS].Direccion on dir_codigo_postal = CLIENTE_CODIGO_POSTAL
								 AND dir_calle = CLIENTE_DIRECCION
		where CLIENTE_NOMBRE is not null
		group by CLIENTE_DNI, CLIENTE_NOMBRE, CLIENTE_APELLIDO, CLIENTE_TELEFONO, CLIENTE_MAIL, CLIENTE_FECHA_NAC, dir_codigo
  END
GO

CREATE PROCEDURE migrar_canal_venta
AS
  BEGIN
	PRINT 'Migrando Canal Venta'
    INSERT INTO [DATOSOS].Canal_Venta (canal_nombre, canal_costo)
		SELECT DISTINCT VENTA_CANAL, VENTA_CANAL_COSTO
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE VENTA_CANAL IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_tipo_descuento
AS
  BEGIN
	PRINT 'Migrando Tipo de Descuento'
    INSERT INTO [DATOSOS].Tipo_Descuento (tipo_desc_concepto)
		SELECT DISTINCT VENTA_DESCUENTO_CONCEPTO
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE VENTA_DESCUENTO_CONCEPTO IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_tipo_de_cupon
AS
  BEGIN
	PRINT 'Migrando Tipo de Cupon'
    INSERT INTO [DATOSOS].Tipo_de_cupon (tipocupon_nombre)
		SELECT DISTINCT VENTA_CUPON_TIPO
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE VENTA_CUPON_TIPO IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_cupon
AS
  BEGIN
	PRINT 'Migrando Cupon'
    INSERT INTO [DATOSOS].Cupon (cupon_codigo, cupon_tipo, cupon_desde, cupon_hasta, cupon_valor)
		SELECT DISTINCT VENTA_CUPON_CODIGO, tipocupon_codigo, VENTA_CUPON_FECHA_DESDE, VENTA_CUPON_FECHA_HASTA, VENTA_CUPON_VALOR
		FROM [GD2C2022].gd_esquema.Maestra 
		JOIN [DATOSOS].Tipo_de_Cupon on VENTA_CUPON_TIPO = tipocupon_nombre
		WHERE VENTA_CUPON_TIPO IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_medio_de_pago
AS
  BEGIN
	PRINT 'Migrando Medio de Pago'
    INSERT INTO [DATOSOS].Medio_Pago (med_nombre, med_costo)
		SELECT DISTINCT VENTA_MEDIO_PAGO, VENTA_MEDIO_PAGO_COSTO
		FROM [GD2C2022].gd_esquema.Maestra 
		WHERE VENTA_MEDIO_PAGO IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_venta
AS
  BEGIN
	PRINT 'Migrando Venta'
    INSERT INTO [DATOSOS].Venta (ven_codigo, ven_fecha, ven_cliente, ven_canal, ven_medio_pago, vent_total)
		SELECT DISTINCT VENTA_CODIGO, VENTA_FECHA, clie_codigo, canal_codigo, med_codigo, VENTA_TOTAL
		FROM [GD2C2022].gd_esquema.Maestra 
		join [DATOSOS].Cliente on CLIENTE_DNI = clie_dni and CLIENTE_NOMBRE = clie_nombre and CLIENTE_APELLIDO = clie_apellido
		join [DATOSOS].Canal_Venta on VENTA_CANAL = canal_nombre
		join [DATOSOS].Medio_Pago on VENTA_MEDIO_PAGO = med_nombre
		WHERE VENTA_CODIGO IS NOT NULL
  END
GO


CREATE PROCEDURE migrar_envio
AS
  BEGIN
	PRINT 'Migrando Envio'
    INSERT INTO [DATOSOS].Envio (envio_nombre, envio_costo, envio_codigo_postal, envio_venta_codigo)
		SELECT DISTINCT VENTA_MEDIO_ENVIO, VENTA_ENVIO_PRECIO, CLIENTE_CODIGO_POSTAL, VENTA_CODIGO
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE VENTA_MEDIO_ENVIO IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_descuento_venta
AS
  BEGIN
	PRINT 'Migrando Descuento por Venta'
    INSERT INTO [DATOSOS].Descuentos_Venta (desc_venta_codigo, desc_tipo_codigo, desc_valor)
		SELECT distinct VENTA_CODIGO, tipo_desc_codigo, VENTA_DESCUENTO_IMPORTE
		FROM [GD2C2022].gd_esquema.Maestra
		JOIN [DATOSOS].Tipo_Descuento on VENTA_DESCUENTO_CONCEPTO = tipo_desc_concepto
		WHERE VENTA_CODIGO IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_Cupon_por_venta
AS
  BEGIN
	PRINT 'Migrando Cupon por Venta'
    INSERT INTO [DATOSOS].Cupon_por_venta (cuve_venta_codigo, cuve_cupon_codigo, cuve_importe)
		SELECT distinct VENTA_CODIGO, VENTA_CUPON_CODIGO, VENTA_CUPON_IMPORTE
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE VENTA_CODIGO IS NOT NULL and VENTA_CUPON_CODIGO is not null
  END
GO

CREATE PROCEDURE migrar_material
AS
  BEGIN
	PRINT 'Migrando Material'
    INSERT INTO [DATOSOS].Material (material_nombre)
		SELECT DISTINCT PRODUCTO_MATERIAL
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE PRODUCTO_MATERIAL IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_marca
AS
  BEGIN
	PRINT 'Migrando Marca'
    INSERT INTO [DATOSOS].Marca (marca_nombre)
		SELECT DISTINCT PRODUCTO_MARCA
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE PRODUCTO_MARCA IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_categoria
AS
  BEGIN
	PRINT 'Migrando Categoria'
    INSERT INTO [DATOSOS].Categoria (cat_nombre)
		SELECT DISTINCT PRODUCTO_CATEGORIA
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE PRODUCTO_CATEGORIA IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_tipo_variante
AS
  BEGIN
	PRINT 'Migrando Tipo de Variante'
    INSERT INTO [DATOSOS].Tipo_Variante (var_tipo, var_descripcion)
		SELECT DISTINCT PRODUCTO_TIPO_VARIANTE, PRODUCTO_VARIANTE
		FROM [GD2C2022].gd_esquema.Maestra
		WHERE PRODUCTO_TIPO_VARIANTE IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_tipo_descuento_compra
AS
  BEGIN
	PRINT 'Migrando Tipo de Descuento Compra'
    INSERT INTO [DATOSOS].Tipo_Descuento_Compra VALUES ('Porcentaje');
	INSERT INTO [DATOSOS].Tipo_Descuento_Compra VALUES ('Monto Fijo');
  END
GO

CREATE PROCEDURE migrar_proveedor
AS
  BEGIN
	PRINT 'Migrando Proveedor'
    INSERT INTO [DATOSOS].Proveedor (prov_razon_social, prov_cuit, prov_domicilio, prov_mail, prov_codigo_postal, prov_localidad, prov_provincia)
		SELECT DISTINCT PROVEEDOR_RAZON_SOCIAL, PROVEEDOR_CUIT, PROVEEDOR_DOMICILIO, PROVEEDOR_MAIL, PROVEEDOR_CODIGO_POSTAL, loc_codigo, prov_codigo
		FROM [GD2C2022].gd_esquema.Maestra
			join [DATOSOS].Provincia on PROVEEDOR_PROVINCIA = prov_nombre
			join [DATOSOS].Localidad on PROVEEDOR_LOCALIDAD = loc_nombre and loc_provincia = prov_codigo
		WHERE PROVEEDOR_RAZON_SOCIAL IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_compra
AS
  BEGIN
	PRINT 'Migrando compra'
	INSERT INTO [DATOSOS].Compra (compra_codigo, compra_fecha, compra_medio_pago, compra_proveedor_cuit, compra_total, compra_proveedor_razon)
		SELECT DISTINCT COMPRA_NUMERO, COMPRA_FECHA, med_codigo, prov_cuit, COMPRA_TOTAL, prov_razon_social
		FROM [GD2C2022].gd_esquema.Maestra 
		join [DATOSOS].Proveedor on PROVEEDOR_RAZON_SOCIAL = prov_razon_social and PROVEEDOR_CUIT = prov_cuit
		join [DATOSOS].Medio_Pago on COMPRA_MEDIO_PAGO = med_nombre
		WHERE COMPRA_NUMERO IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_descuento_compra
AS
  BEGIN
	PRINT 'Migrando Descuento compra'
    INSERT INTO [DATOSOS].Descuentos_Compra (desc_compra_id,desc_compra_codigo, desc_compra_valor, desc_tipo_descuento)
		SELECT distinct 
			COMPRA_NUMERO, 
			DESCUENTO_COMPRA_CODIGO, 
			DESCUENTO_COMPRA_VALOR, 
			tipo_desc_compra_codigo
		FROM [GD2C2022].gd_esquema.Maestra, [DATOSOS].Tipo_Descuento_Compra 
		WHERE 
			COMPRA_NUMERO IS NOT NULL AND 
			DESCUENTO_COMPRA_VALOR IS NOT NULL AND 
			tipo_desc_compra_nombre = 'Porcentaje'
  END
GO

CREATE PROCEDURE migrar_producto
AS
  BEGIN
	PRINT 'Migrando Producto'
    INSERT INTO [DATOSOS].Producto (prod_codigo, prod_marca, prod_nombre, prod_descripcion, prod_categoria, prod_material)
		SELECT DISTINCT 
			PRODUCTO_CODIGO,
			marca_codigo,
			PRODUCTO_NOMBRE,
			PRODUCTO_DESCRIPCION,
			cat_codigo,
			material_codigo
		FROM [GD2C2022].gd_esquema.Maestra 
		join [DATOSOS].Marca on marca_nombre = PRODUCTO_MARCA
		join [DATOSOS].Categoria on cat_nombre = PRODUCTO_CATEGORIA
		join [DATOSOS].Material on material_nombre = PRODUCTO_MATERIAL
		WHERE PRODUCTO_CODIGO IS NOT NULL
  END
GO

CREATE PROCEDURE migrar_producto_variante
AS
  BEGIN
	PRINT 'Migrando Producto Variante'
    INSERT INTO [DATOSOS].Producto_Variante (prodvar_variante_codigo, prodvar_producto, prodvar_variante, prodvar_precio, prodvar_stock)
		SELECT DISTINCT 
			PRODUCTO_VARIANTE_CODIGO,
			PRODUCTO_CODIGO,
			var_codigo,
			MAX(VENTA_PRODUCTO_PRECIO),
			(SELECT sum([COMPRA_PRODUCTO_CANTIDAD]) - sum([VENTA_PRODUCTO_CANTIDAD])
			FROM [GD2C2022].[gd_esquema].[Maestra]
			where PRODUCTO_CODIGO = M.PRODUCTO_CODIGO
			group by [PRODUCTO_VARIANTE_CODIGO])
		FROM [GD2C2022].gd_esquema.Maestra M
			join [DATOSOS].Tipo_Variante on var_tipo = PRODUCTO_TIPO_VARIANTE and var_descripcion = PRODUCTO_VARIANTE
		WHERE PRODUCTO_CODIGO IS NOT NULL and VENTA_PRODUCTO_PRECIO is not null
		GROUP BY PRODUCTO_VARIANTE_CODIGO, PRODUCTO_CODIGO,var_codigo
  END
GO

CREATE PROCEDURE migrar_item_venta
AS
  BEGIN
	PRINT 'Migrando Item Venta'
    INSERT INTO [DATOSOS].Item_Venta (item_ven_venta_codigo, item_ven_prodvariante_codigo, item_ven_cantidad, item_ven_precio_unitario, item_ven_precio_total)
		SELECT 
			ven_codigo,
			prodvar_variante_codigo,
			SUM(VENTA_PRODUCTO_CANTIDAD),
			VENTA_PRODUCTO_PRECIO,
			SUM(VENTA_PRODUCTO_CANTIDAD) * VENTA_PRODUCTO_PRECIO						
		FROM [GD2C2022].gd_esquema.Maestra 
			join [DATOSOS].Venta on ven_codigo = VENTA_CODIGO
			join [DATOSOS].Producto_Variante on prodvar_variante_codigo =  PRODUCTO_VARIANTE_CODIGO
		WHERE PRODUCTO_VARIANTE_CODIGO IS NOT NULL
		GROUP BY ven_codigo,prodvar_variante_codigo,VENTA_PRODUCTO_PRECIO
		order by ven_codigo
  END
GO

CREATE PROCEDURE migrar_item_compra
AS
  BEGIN
	PRINT 'Migrando Item Compra'
    INSERT INTO [DATOSOS].Item_compra (item_com_compra_codigo, item_com_producto_codigo, item_com_cantidad, item_com_precio_unitario, item_com_precio_total)
		SELECT 
			COMPRA_NUMERO,
			prodvar_variante_codigo,
			sum(COMPRA_PRODUCTO_CANTIDAD),
			COMPRA_PRODUCTO_PRECIO, 
			(SUM(COMPRA_PRODUCTO_CANTIDAD) * COMPRA_PRODUCTO_PRECIO)
		FROM [GD2C2022].gd_esquema.Maestra
			join [DATOSOS].Producto_Variante on PRODUCTO_VARIANTE_CODIGO = prodvar_variante_codigo
		WHERE COMPRA_NUMERO IS NOT NULL AND [PRODUCTO_VARIANTE_CODIGO] IS NOT NULL 
		GROUP BY COMPRA_NUMERO, prodvar_variante_codigo, COMPRA_PRODUCTO_PRECIO
  END
GO

/**************************
EXECUTE SP 
***************************/

BEGIN TRANSACTION
	BEGIN TRY
		EXECUTE migrar_provincia
		EXECUTE migrar_codigo_postal
		EXECUTE migrar_localidad
		EXECUTE migrar_direccion
		EXECUTE migrar_cliente
		EXECUTE migrar_canal_venta
		EXECUTE migrar_tipo_descuento
		EXECUTE migrar_tipo_de_cupon
		EXECUTE migrar_cupon
		EXECUTE migrar_medio_de_pago
		EXECUTE migrar_venta
		EXECUTE migrar_envio
		EXECUTE migrar_descuento_venta
		EXECUTE migrar_Cupon_por_venta
		EXECUTE migrar_material
		EXECUTE migrar_marca
		EXECUTE migrar_categoria
		EXECUTE migrar_tipo_variante
		EXECUTE migrar_tipo_descuento_compra
		EXECUTE migrar_proveedor
		EXECUTE migrar_compra
		EXECUTE migrar_descuento_compra
		EXECUTE migrar_producto
		EXECUTE migrar_producto_variante
		EXECUTE migrar_item_venta
		EXECUTE migrar_item_compra

	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW 50001, 'Se produjo un error al migrar las tablas',1;
	END CATCH
	IF EXISTS (SELECT 1 FROM [DATOSOS].Provincia) and
		EXISTS (SELECT 1 FROM [DATOSOS].Codigo_Postal) and
		EXISTS (SELECT 1 FROM [DATOSOS].Localidad) and
		EXISTS (SELECT 1 FROM [DATOSOS].Direccion) and
		EXISTS (SELECT 1 FROM [DATOSOS].Cliente) and
		EXISTS (SELECT 1 FROM [DATOSOS].Canal_Venta) and
		EXISTS (SELECT 1 FROM [DATOSOS].Tipo_Descuento) and
		EXISTS (SELECT 1 FROM [DATOSOS].Tipo_de_Cupon) and 
		EXISTS (SELECT 1 FROM [DATOSOS].Cupon) and
		EXISTS (SELECT 1 FROM [DATOSOS].Medio_Pago) and
		EXISTS (SELECT 1 FROM [DATOSOS].Venta) and
		EXISTS (SELECT 1 FROM [DATOSOS].Envio) and
		EXISTS (SELECT 1 FROM [DATOSOS].Descuentos_Venta) and 
		EXISTS (SELECT 1 FROM [DATOSOS].Cupon_por_venta) and
		EXISTS (SELECT 1 FROM [DATOSOS].Material) and
		EXISTS (SELECT 1 FROM [DATOSOS].Marca) and
		EXISTS (SELECT 1 FROM [DATOSOS].Categoria) and
		EXISTS (SELECT 1 FROM [DATOSOS].Tipo_Variante) and
		EXISTS (SELECT 1 FROM [DATOSOS].Tipo_descuento_compra) and
		EXISTS (SELECT 1 FROM [DATOSOS].Proveedor) and
		EXISTS (SELECT 1 FROM [DATOSOS].Compra) and
		EXISTS (SELECT 1 FROM [DATOSOS].Descuentos_Compra) and 
		EXISTS (SELECT 1 FROM [DATOSOS].Producto) and
		EXISTS (SELECT 1 FROM [DATOSOS].Producto_Variante) and
		EXISTS (SELECT 1 FROM [DATOSOS].Item_Venta) and
		EXISTS (SELECT 1 FROM [DATOSOS].Item_compra)

	BEGIN
		PRINT '';
		PRINT 'Migracion Terminada Correctamente!!';
		COMMIT TRANSACTION;
	END
	ELSE
	BEGIN
		ROLLBACK TRANSACTION;
		PRINT '';
		THROW 50002, 'No se pudieron migrar los datos',1;
	END



