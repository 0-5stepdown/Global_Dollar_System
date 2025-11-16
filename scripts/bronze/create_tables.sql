/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:

This script creates tables in the 'bronze' schema, dropping existing tables if they already exist.
Run this script to re-define the DDL structure of 'bronze' tables.
===============================================================================
*/

-- Create trade invoice by currency  table

IF OBJECT_ID ('bronze.imf_trade_invoice_currencies', 'U') IS NOT NULL
	DROP TABLE bronze.imf_trade_invoice_currencies;

CREATE TABLE bronze.imf_trade_invoice_currencies (
	country VARCHAR(100),
	ISO3C VARCHAR(3),
	imfcode BIGINT,
	year INT,
	flow VARCHAR(10),
	USD FLOAT,
	EUR FLOAT,
	Home FLOAT,
	Other FLOAT,
	Unclassified FLOAT,
	Other_Excl_USDEUR FLOAT
);

-- Create trade value table

IF OBJECT_ID ('bronze.wb_trade_values', 'U') IS NOT NULL
	DROP TABLE bronze.wb_trade_values;

CREATE TABLE bronze.wb_trade_values (
	[Series Name] VARCHAR(100),
	[Series Code] VARCHAR(50),	
	[Country Name] VARCHAR(100),	
	[Country Code] VARCHAR(3),	
	[Time] INT,	
	[Time Code] VARCHAR(10),	
	[Value] VARCHAR(100)
);

-- Create balance of payments table

IF OBJECT_ID ('bronze.imf_bop', 'U') IS NOT NULL
	DROP TABLE bronze.imf_bop;

CREATE TABLE bronze.imf_bop (
	COUNTRY VARCHAR(100),	
	INDICATOR VARCHAR(100),	
	UNIT VARCHAR(50),	
	FREQUENCY VARCHAR(50),	
	TIME_PERIOD FLOAT,	
	OBS_VALUE FLOAT
);

-- Create foreign exchange reserves table

IF OBJECT_ID ('bronze.imf_reserves', 'U') IS NOT NULL
	DROP TABLE bronze.imf_reserves;

CREATE TABLE bronze.imf_reserves (
	COUNTRY VARCHAR(100),	
	INDICATOR VARCHAR(100),
	FXR_CURRENCY VARCHAR(100),
	TYPE_OF_TRANSFORMATION VARCHAR(50),
	TIME_PERIOD INT,	
	OBS_VALUE FLOAT
);

-- Create U.S. treasuries (foreign) table

IF OBJECT_ID ('bronze.fred_treasuries_foreign', 'U') IS NOT NULL
	DROP TABLE bronze.fred_treasuries_foreign;

CREATE TABLE bronze.fred_treasuries_foreign (
	observation_date VARCHAR(20), 	
	FDHBFIN FLOAT
);

-- Create U.S. treasuries (all) table

IF OBJECT_ID ('bronze.fred_treasuries_total', 'U') IS NOT NULL
	DROP TABLE bronze.fred_treasuries_total;

CREATE TABLE bronze.fred_treasuries_total (
	observation_date VARCHAR(20), 	
	GFDEBTN FLOAT
);

-- Create U.S. private savings table

IF OBJECT_ID ('bronze.fred_savings_private', 'U') IS NOT NULL
	DROP TABLE bronze.fred_savings_private;

CREATE TABLE bronze.fred_savings_private (
	observation_date VARCHAR(20), 	
	W201RC1A027NBEA FLOAT
);

-- Create U.S. government budget balance table

IF OBJECT_ID ('bronze.fred_savings_public', 'U') IS NOT NULL
	DROP TABLE bronze.fred_savings_public;

CREATE TABLE bronze.fred_savings_public (
	observation_date VARCHAR(20), 	
	A922RC1A027NBEA FLOAT
);

-- Create U.S. 10y yield table

IF OBJECT_ID ('bronze.fred_yield_usa', 'U') IS NOT NULL
	DROP TABLE bronze.fred_yield_usa;

CREATE TABLE bronze.fred_yield_usa (
	observation_date VARCHAR(20), 	
	IRLTLT01USA156N FLOAT
);

-- Create Germany 10y yield table

IF OBJECT_ID ('bronze.fred_yield_germany', 'U') IS NOT NULL
	DROP TABLE bronze.fred_yield_germany;

CREATE TABLE bronze.fred_yield_germany (
	observation_date VARCHAR(20), 	
	IRLTLT01DEA156N FLOAT
);

-- Create Japan 10y yield table

IF OBJECT_ID ('bronze.fred_yield_japan', 'U') IS NOT NULL
	DROP TABLE bronze.fred_yield_japan;

CREATE TABLE bronze.fred_yield_japan (
	observation_date VARCHAR(20), 	
	IRLTLT01JPA156N FLOAT
);

-- Create India 10y yield table

IF OBJECT_ID ('bronze.fred_yield_india', 'U') IS NOT NULL
	DROP TABLE bronze.fred_yield_india;

CREATE TABLE bronze.fred_yield_india (
	observation_date VARCHAR(20), 	
	INDIRLTLT01STQ FLOAT
);

-- Create UK 10y yield table

IF OBJECT_ID ('bronze.fred_yield_uk', 'U') IS NOT NULL
	DROP TABLE bronze.fred_yield_uk;

CREATE TABLE bronze.fred_yield_uk (
	observation_date VARCHAR(20), 	
	IRLTLT01GBA156N FLOAT
);

-- Create France 10y yield table

IF OBJECT_ID ('bronze.fred_yield_france', 'U') IS NOT NULL
	DROP TABLE bronze.fred_yield_france;

CREATE TABLE bronze.fred_yield_france (
	observation_date VARCHAR(20), 	
	IRLTLT01FRA156N FLOAT
);

-- Create Russia 10y yield table

IF OBJECT_ID ('bronze.fred_yield_russia', 'U') IS NOT NULL
	DROP TABLE bronze.fred_yield_russia;

CREATE TABLE bronze.fred_yield_russia (
	observation_date VARCHAR(20), 	
	IRLTLT01ESA156N FLOAT
);

-- Create Spain 10y yield table

IF OBJECT_ID ('bronze.fred_yield_spain', 'U') IS NOT NULL
	DROP TABLE bronze.fred_yield_spain;

CREATE TABLE bronze.fred_yield_spain (
	observation_date VARCHAR(20), 	
	IRLTLT01ESA156N FLOAT
);

-- Create GDP by sector table

IF OBJECT_ID ('bronze.nea_gdp_sectors', 'U') IS NOT NULL
	DROP TABLE bronze.nea_gdp_sectors;

CREATE TABLE bronze.nea_gdp_sectors (
	sector VARCHAR(100),
	year VARCHAR(4),
	value_usd FLOAT
);

