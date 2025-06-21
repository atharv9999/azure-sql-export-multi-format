# azure-sql-export-multi-format
# Azure SQL to ADLS Gen2 File Conversion Pipeline

## 📘 Project Title:
**Automated Data Export from Azure SQL Database to ADLS Gen2 in CSV, Parquet, and Avro Formats**

## 🧩 Objective
This project focuses on data integration and pipeline automation using **Azure Databricks** and **Azure Data Factory (ADF)**. It extracts data from **Azure SQL Database** and stores it into **Azure Data Lake Storage Gen2** in multiple formats (CSV, Parquet, and Avro), suitable for downstream analytics or archiving. The process is fully automated and scheduled using ADF triggers.

---

## 🚀 Technologies Used
- **Azure SQL Database**
- **Azure Data Factory**
- **Azure Databricks (PySpark)**
- **Azure Data Lake Storage Gen2 (ADLS Gen2)**
- **Spark SQL**
- **ADF Trigger Scheduler**

---

## 🛠️ Architecture Overview

Azure SQL DB\n
    ↓ (JDBC)\n
Databricks Notebook\n
    ↓\n
Writes CSV, Parquet, Avro
    ↓
ADLS Gen2 Storage
    ↓
Scheduled via ADF Trigger

## 🗃️ Source Data
The source consists of relational tables from Azure SQL Database.
In this project, the Sales table was used as an example.
Table schema is given in 'Schema Creation.sql' file. Tables are populated in another project of ETL using ADLC, Databricks, ADF.

## 📂 Destination Structure (ADLS Gen2)
/rawfiles/
    /csvfiles/
        Sales.csv
    /parquetfiles/
        Sales.parquet
    /avrofiles/
        Sales.avro

## 🔁 Workflow Steps
1. Connect to Azure SQL DB from Databricks
JDBC connection is configured with SQL Server credentials.

2. Read Data from Azure SQL Table
Spark reads data using .read.jdbc(...).

3. Write CSV as a Single File
The data is written in CSV format to ADLS Gen2 using .coalesce(1) and renamed to Sales.csv.

4. Convert CSV to Parquet and Avro
Spark reads the CSV again and writes both Parquet and Avro formats as single files.

Temporary folders are created for both, and the part files are renamed to Sales.parquet and Sales.avro.

5. Clean-up
All temporary folders are deleted after final file renaming.

6. Schedule Pipeline
The Databricks notebook is scheduled via Azure Data Factory (ADF) using a time-based trigger (e.g., daily).

## ⏰ Automation via ADF
ADF Linked Service connects to Azure Databricks using a personal access token.
Pipeline Activity runs the notebook located in the Databricks workspace.
Trigger schedules the execution on a desired frequency (e.g., daily at 00:00).

## 📌 Key Features
✅ End-to-end automation using Databricks & ADF

✅ Export in three formats: CSV, Parquet, and Avro

✅ Single file output (not partitioned)

✅ Secure OAuth-based ADLS Gen2 access

✅ Reusable and parameterizable pipeline logic

## 📈 Future Improvements
Parameterize notebook to process multiple tables in a loop

Add email/Teams alerts using Logic Apps

Integrate with Power BI or Microsoft Fabric for real-time reporting

Implement data validation and logging layer

## 🧑‍💻 Author
Atharv Sunil Kulkarni
