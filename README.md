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
The table below shows which data sources the raw data reports came from:

![Data Source](diagrams/data_source.png)

# Raw data

The table below maps the raw data reports to their file names:

![File Name Mapping](diagrams/file_name_map.png)

The CSV files can be found in the repo folder below:

[raw_datasets](https://github.com/0-5stepdown/Global_Dollar_System/tree/main/raw_datasets)

# Data Warehouse

The diagram below describes how the raw data was stored and transformed at each layer within the medallion architecture of the SQL data warehouse:



# Memo

View the Quarto document containing the memo at the Github page below:

https://0-5stepdown.github.io/Global_Dollar_System/

View the Jupyter notebook outlining the code used to generate the Quarto document in the repo folder below:


