/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse,
	dropping existing views to start fresh.

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- Create U.S. consolidated savings view with annual net savings added

IF OBJECT_ID('gold.fred_savings_consolidated_usa', 'V') IS NOT NULL
    DROP VIEW gold.fred_savings_consolidated_usa;
GO

CREATE VIEW gold.fred_savings_consolidated_usa AS

    SELECT
        year,
        'United States' AS country,
        'USA' AS country_code,
        source,
        value_usd
    FROM 
        silver.fred_savings_consolidated

    UNION

    SELECT
        year,
        'United States' AS country,
        'USA' AS country_code,
        'Net' AS source,
        SUM(value_usd) AS value_usd
    FROM 
        silver.fred_savings_consolidated
    GROUP BY 
        year;
GO

-- Create U.S. consolidated treasuries view with domestic source added

IF OBJECT_ID ('gold.fred_treasuries_consolidated_usa', 'V') IS NOT NULL
    DROP VIEW gold.fred_treasuries_consolidated_usa
GO

CREATE VIEW gold.fred_treasuries_consolidated_usa AS

    SELECT
        year,
        'United States' AS country,
        'USA' AS country_code,
        source,
        value_usd
    FROM
        silver.fred_treasuries_consolidated
    WHERE
        year >= '1970-01-01'

    UNION

    SELECT
        year,
        'United States' AS country,
        'USA' AS country_code,
        'Domestic' AS source,
        SUM(CASE WHEN source = 'All' THEN value_usd ELSE 0 END) 
            - SUM(CASE WHEN source = 'Foreign' THEN value_usd ELSE 0 END) AS value_usd
    FROM
        silver.fred_treasuries_consolidated
    WHERE
        year >= '1970-01-01'
    GROUP BY
        year;
GO

-- Create world consolidated 10y yield view

IF OBJECT_ID ('gold.fred_yield_consolidated_world', 'V') IS NOT NULL
    DROP VIEW gold.fred_yield_consolidated_world;
GO
    
CREATE VIEW gold.fred_yield_consolidated_world AS

    SELECT
        *
    FROM
        silver.fred_yield_consolidated;
GO

-- Create U.S. balance of payments view

IF OBJECT_ID ('gold.imf_bop_usa', 'V') IS NOT NULL
    DROP VIEW gold.imf_bop_usa;
GO
    
CREATE VIEW gold.imf_bop_usa AS

    SELECT
        year,
        country,
        'USA' AS country_code,
        bop_account,
        value_usd
    FROM
        silver.imf_bop;
GO

-- Create world reserve currencies view with each currency's share of annual total reserves

IF OBJECT_ID ('gold.imf_reserves_world', 'V') IS NOT NULL
    DROP VIEW gold.imf_reserves_world;
GO
    
CREATE VIEW gold.imf_reserves_world AS

    SELECT
        *,
        value_usd / SUM(value_usd) OVER (PARTITION BY year) AS pct_yr_total
    FROM
        silver.imf_reserves;
GO

-- Create world trade view with the dollar's share of country trade invoicing

IF OBJECT_ID ('gold.imf_wb_trade_dollar_invoice', 'V') IS NOT NULL
    DROP VIEW gold.imf_wb_trade_dollar_invoice;
GO
    
CREATE VIEW gold.imf_wb_trade_dollar_invoice AS

    SELECT
        t1.year,
        t1.country,
        t1.country_code,
        t1.flow,
        t2.value_usd,
        t1.pct_usd AS pct_usd_invoice,
        t2.value_usd * t1.pct_usd AS usd_invoice
    FROM    
        silver.imf_trade_dollar_share AS t1
    INNER JOIN
        silver.wb_trade_values AS t2
        ON
            t1.year = t2.year AND
            t1.country = t2.country AND
            t1.flow = t2.flow;
GO

-- Create world trade view with the dollar's share of world trade invoicing by year

IF OBJECT_ID ('gold.imf_wb_trade_dollar_share', 'V') IS NOT NULL
    DROP VIEW gold.imf_wb_trade_dollar_share;
GO
    
CREATE VIEW gold.imf_wb_trade_dollar_share AS

    SELECT
	    year,
	    flow,
	    COUNT(country) AS num_countries,
	    SUM(value_usd) AS total_usd,
	    SUM(usd_invoice) AS usd_share,
	    SUM(usd_invoice) / SUM(value_usd) AS pct_usd_share
    FROM
	    gold.imf_wb_trade_dollar_invoice
    GROUP BY
	    year,
	    flow
GO

-- Create U.S. GDP by sector view

IF OBJECT_ID ('gold.nea_gdp_sectors_usa', 'V') IS NOT NULL
    DROP VIEW gold.nea_gdp_sectors_usa;
GO
    
CREATE VIEW gold.nea_gdp_sectors_usa AS

    SELECT
        year,
        'United States' AS country,
        'USA' AS country_code,
        sector,
        value_usd
    FROM 
        silver.nea_gdp_sectors;
GO
