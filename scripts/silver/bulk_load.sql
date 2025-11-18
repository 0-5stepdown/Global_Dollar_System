/*
===============================================================================
Script: Load Silver Layer (Source -> Silver)
===============================================================================
Script Purpose:
    This script loads data into the 'silver' schema from external CSV files. 
    It performs the following actions:
    - Truncates the silver tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to silver tables.
===============================================================================
*/

-- Bulk insert into fred_savings_consolidated
TRUNCATE TABLE silver.fred_savings_consolidated;
BULK INSERT silver.fred_savings_consolidated
FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\silver_data\fred_savings_consolidated.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- Bulk insert into fred_treasuries_consolidated
TRUNCATE TABLE silver.fred_treasuries_consolidated;
BULK INSERT silver.fred_treasuries_consolidated
FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\silver_data\fred_treasuries_consolidated.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- Bulk insert into fred_yield_consolidated
TRUNCATE TABLE silver.fred_yield_consolidated;
BULK INSERT silver.fred_yield_consolidated
FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\silver_data\fred_yield_consolidated.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- Bulk insert into imf_bop
TRUNCATE TABLE silver.imf_bop;
BULK INSERT silver.imf_bop
FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\silver_data\imf_bop_clean.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- Bulk insert into imf_reserves
TRUNCATE TABLE silver.imf_reserves;
BULK INSERT silver.imf_reserves
FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\silver_data\imf_reserves_clean.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- Bulk insert into imf_trade_dollar_share
TRUNCATE TABLE silver.imf_trade_dollar_share;
BULK INSERT silver.imf_trade_dollar_share
FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\silver_data\imf_trade_dollar_share.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- Bulk insert into nea_gdp_sectors
TRUNCATE TABLE silver.nea_gdp_sectors;
BULK INSERT silver.nea_gdp_sectors
FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\silver_data\nea_gdp_sectors_clean.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- Bulk insert into wb_trade_values
TRUNCATE TABLE silver.wb_trade_values;
BULK INSERT silver.wb_trade_values
FROM 'C:\Users\eslee\OneDrive\Desktop\Data Science\portfolio\SQL\Data Cleaning\silver_data\wb_trade_values_clean.csv'
WITH (
    
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FORMAT = 'CSV',
    TABLOCK
);

SELECT *
FROM silver.wb_trade_values
