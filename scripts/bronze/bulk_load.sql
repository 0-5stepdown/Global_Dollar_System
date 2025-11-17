/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.bulk_load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.bulk_load_bronze AS
BEGIN
    -- Bulk insert into fred_savings_private
    TRUNCATE TABLE bronze.fred_savings_private;
    BULK INSERT bronze.fred_savings_private
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_private_savings.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_savings_public
    TRUNCATE TABLE bronze.fred_savings_public;
    BULK INSERT bronze.fred_savings_public
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_gov_budget.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_treasuries_foreign
    TRUNCATE TABLE bronze.fred_treasuries_foreign;
    BULK INSERT bronze.fred_treasuries_foreign
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_foreign_treasuries.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_treasuries_total
    TRUNCATE TABLE bronze.fred_treasuries_total;
    BULK INSERT bronze.fred_treasuries_total
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_total_treasuries.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_yield_france
    TRUNCATE TABLE bronze.fred_yield_france;
    BULK INSERT bronze.fred_yield_france
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_france_yield.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_yield_germany
    TRUNCATE TABLE bronze.fred_yield_germany;
    BULK INSERT bronze.fred_yield_germany
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_germany_yield.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_yield_india
    TRUNCATE TABLE bronze.fred_yield_india;
    BULK INSERT bronze.fred_yield_india
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_india_yield.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_yield_japan
    TRUNCATE TABLE bronze.fred_yield_japan;
    BULK INSERT bronze.fred_yield_japan
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_japan_yield.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_yield_russia
    TRUNCATE TABLE bronze.fred_yield_russia;
    BULK INSERT bronze.fred_yield_russia
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_russia_yield.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_yield_spain
    TRUNCATE TABLE bronze.fred_yield_spain;
    BULK INSERT bronze.fred_yield_spain
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_spain_yield.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_yield_uk
    TRUNCATE TABLE bronze.fred_yield_uk;
    BULK INSERT bronze.fred_yield_uk
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_uk_yield.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into fred_yield_usa
    TRUNCATE TABLE bronze.fred_yield_usa;
    BULK INSERT bronze.fred_yield_usa
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\fred_usa_yield.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into imf_bop
    TRUNCATE TABLE bronze.imf_bop;
    BULK INSERT bronze.imf_bop
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\imf_bop.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into imf_reserves
    TRUNCATE TABLE bronze.imf_reserves;
    BULK INSERT bronze.imf_reserves
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\imf_reserves.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into imf_trade_invoice_currencies
    TRUNCATE TABLE bronze.imf_trade_invoice_currencies;
    BULK INSERT bronze.imf_trade_invoice_currencies
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\imf_trade_invoice_currencies.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    -- Bulk insert into nea_gdp_sectors
    TRUNCATE TABLE bronze.nea_gdp_sectors;
    BULK INSERT bronze.nea_gdp_sectors
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\nea_gdp_sectors_clean.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TEXTQUALIFIER = '""', 
        TABLOCK
    );

    -- Bulk insert into wb_trade_values
    TRUNCATE TABLE bronze.wb_trade_values;
    BULK INSERT bronze.wb_trade_values
    FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\wb_trade_values.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

END;

