# Project Overview
Public policy discussions regarding the effects of protectionist measures are receiving the spotlight once again as the Trump administration wages a second round of trade wars in 2025. Despite political claims to the contrary, this project presents a short memo with supporting data visualizations to argue that the U.S. is unlikely to succeed in reversing its trade and fiscal deficits and reindustrializing its economy as long as it remains committed to preserving the dollar's reserve currency status in the global dollar system. 

To enable the data analysis necessary for generating the memo, the project involved:

1. Identifying data sources
2. Inspecting and extracting raw data
3. Building a SQL data warehouse utilizing a medallion architecture to store and transform the raw data
4. Querying the transformed data using SQL
5. Converting SQL tables into dataframes using Pandas
6. Generating data visualizations using Matplotlib and Seaborn
7. Creating the memo using Quarto

# Data Sources
The table below summarizes which data sources the raw data reports came from:

![Data Source](diagrams/data_source.png)

To access the original data sources, find the relevant link(s) in the list below:

* **BEA**
  * [U.S. value added by industry](https://apps.bea.gov/iTable/?reqid=1603&step=2&Categories=GDPxInd&isURI=1&_gl=1*1p8txdt*_ga*MTIzMjIwNTY4Ni4xNzYyMzU1OTUz*_ga_J4698JNNFT*czE3NjMxMzg3MTEkbzkkZzEkdDE3NjMxMzg3NDckajI0JGwwJGgw#eyJhcHBpZCI6MTYwMywic3RlcHMiOlsxLDIsNF0sImRhdGEiOltbImNhdGVnb3JpZXMiLCJHRFB4SW5kIl0sWyJUYWJsZV9MaXN0IiwiVFZBMTA1Il1dfQ==)

* **FRED**
  * [U.S. private sector net savings](https://fred.stlouisfed.org/series/W201RC1A027NBEA)
  * [U.S. government net savings](https://fred.stlouisfed.org/series/A922RC1A027NBEA)
  * [U.S. federal debt held by foreign and international investors](https://fred.stlouisfed.org/series/FDHBFIN)
  * [U.S. total federal debt](https://fred.stlouisfed.org/series/GFDEBTN)
  * [10-year government bond yields for multiple countries](https://fred.stlouisfed.org/searchresults/?st=Interest%20Rates%3A%20Long-Term%20Government%20Bond%20Yields%3A%2010-Year)
 
* **IMF**
  * [U.S. balance of payments](https://data.imf.org/en/datasets/IMF.RES:WEO)
  * [Currency composition of official foreign exchange reserves](https://data.imf.org/en/datasets/IMF.STA:COFER)
  * [Patterns of invoicing currency in global trade](https://data.mendeley.com/datasets/6z6w78968m/1)
 
* **WB**
  * [World trade values](https://databank.worldbank.org/source/world-development-indicators?Series=SE.XPD.CTOT.ZS)    

# Raw data

The table below maps the raw data reports to their file names:

![File Name Mapping](diagrams/file_name_map.png)

The CSV files can be found in the repo folder below:

[raw_datasets](https://github.com/0-5stepdown/Global_Dollar_System/tree/main/raw_datasets)

# Data Warehouse

The diagram below provides a high-level overview of how the raw data was stored and transformed at each layer within the medallion architecture of the SQL data warehouse:

![Medallion Architecture](diagrams/medallion.png)

The code that was used to create the SQL data warehouse and wrangle the data can be found in the repo folder below:

[scripts](https://github.com/0-5stepdown/Global_Dollar_System/tree/main/scripts)

# Data Analysis and Visualization

The code that was used to conduct data analysis and generate data visualizations can be found in the repo folder below:

[code](https://github.com/0-5stepdown/Global_Dollar_System/tree/main/code)

# Memo

The memo is presented as a Quarto document hosted in HTML format at the GitHub page linked below:

[Global Dollar Sytem Memo](https://0-5stepdown.github.io/Global_Dollar_System/)

# Credit

The medallion architecture for the SQL data warehouse was inspired by instruction from Baraa Khatib Salkini at Data with Baraa. Access his GitHub repo at the link below:

[Data With Baraa - SQL Data Warehouse Project](https://github.com/DataWithBaraa/sql-data-warehouse-project)
