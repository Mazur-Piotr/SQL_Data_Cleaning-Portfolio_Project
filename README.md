# SQL_Data_Cleaning-Portfolio_Project

## Overview
This project focuses on cleaning and transforming data using SQL queries. It demonstrates various data cleaning and transformation techniques applied to a dataset of Nashville housing records.

### Data Upload Validation:
The initial step involves selecting all records from the "NashvilleHousing" table, for data validation purposes after an initial data upload.

### Data Cleaning Steps
### 1. Standardize Date Format
Date formats are standardized to ensure consistency in the dataset.
### 2. Populate Property Address Data
Missing property addresses are supplemented using corresponding values from rows with the same ParcelID.
### 3. Breaking Out Addresses
Property and owner addresses are split into separate columns for address, city, and state, making the data more structured.
### 4. Change 'Y' and 'N' to 'Yes' and 'No'
The 'Sold as Vacant' field is cleaned by replacing 'Y' and 'N' with 'Yes' and 'No' for clarity.
### 5. Remove Duplicates
Duplicate records are identified and removed based on specific columns, ensuring data accuracy.
### 6. Delete Unused Columns
Columns like OwnerAddress, TaxDistrict, PropertyAddress, and SaleDate that are no longer needed are removed to streamline the dataset.

## Usage
This code provides a structured approach to data cleaning and transformation tasks in SQL, focusing on issues like missing values, date format standardization, splitting address information, standardizing categorical values, and removing duplicate records. It can be used as a guide for cleaning and preparing the "NashvilleHousing" dataset for further analysis.











This project provides a clear example of SQL data cleaning techniques that can be applied to similar datasets. It serves as a reference for data cleaning and preparation in SQL.


