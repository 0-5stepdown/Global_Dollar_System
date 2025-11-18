/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:

This script creates tables in the 'silver' schema, dropping existing tables if they already exist.
Run this script to re-define the DDL structure of 'silver' tables.
===============================================================================
*/

-- Create U.S. consolidated savings table

IF OBJECT_ID ('silver.fred_savings_consolidated', 'U') IS NOT NULL
	DROP TABLE silver.fred_savings_consolidated;

CREATE TABLE silver.fred_savings_consolidated (
	year DATE, 	
	source NVARCHAR(20),
	value_usd FLOAT
);

-- Create U.S. consolidated treasuries table

IF OBJECT_ID ('silver.fred_treasuries_consolidated', 'U') IS NOT NULL
	DROP TABLE silver.fred_treasuries_consolidated;

CREATE TABLE silver.fred_treasuries_consolidated (
	year DATE,
	source NVARCHAR (20),
	value_usd FLOAT
);

-- Create country consolidated 10y yield table

IF OBJECT_ID ('silver.fred_yield_consolidated', 'U') IS NOT NULL
	DROP TABLE silver.fred_yield_consolidated;

CREATE TABLE silver.fred_yield_consolidated (
	year DATE,
	country NVARCHAR(100),
	ten_year_yield FLOAT
);

-- Create clean balance of payments table

IF OBJECT_ID ('silver.imf_bop', 'U') IS NOT NULL
	DROP TABLE silver.imf_bop;

CREATE TABLE silver.imf_bop (
	year DATE,
	country NVARCHAR(100),
	bop_account NVARCHAR(50),
	value_usd FLOAT
);

-- Create foreign exchange reserves table

IF OBJECT_ID ('silver.imf_reserves', 'U') IS NOT NULL
	DROP TABLE silver.imf_reserves;

CREATE TABLE silver.imf_reserves (
	year DATE,
	country NVARCHAR(100),
	currency NVARCHAR(100),
	value_usd FLOAT
);

-- Create dollar share of trade table

IF OBJECT_ID ('silver.imf_trade_dollar_share', 'U') IS NOT NULL
	DROP TABLE silver.imf_trade_dollar_share;

CREATE TABLE silver.imf_trade_dollar_share (
	year DATE,
	country NVARCHAR(100),
	country_code NVARCHAR(3),
	flow NVARCHAR(10),
	pct_usd FLOAT
);

-- Create GDP by sector table

IF OBJECT_ID ('silver.nea_gdp_sectors', 'U') IS NOT NULL
	DROP TABLE silver.nea_gdp_sectors;

CREATE TABLE silver.nea_gdp_sectors (
	year DATE,
	sector NVARCHAR(50),
	value_usd FLOAT
);

-- Create trade value table

IF OBJECT_ID ('silver.wb_trade_values', 'U') IS NOT NULL
	DROP TABLE silver.wb_trade_values;

CREATE TABLE silver.wb_trade_values (
	year DATE,
	country NVARCHAR(100),
	country_code NVARCHAR(3),
	flow NVARCHAR(10),
	value_usd FLOAT
);
