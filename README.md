# SQL_Data_Cleaning-Portfolio_Project

## Overview
This project focuses on cleaning and transforming data using SQL queries. It demonstrates various data cleaning and transformation techniques applied to a dataset of Nashville housing records.

## Dataset
Dataset Source: Kaggle -
https://www.kaggle.com/datasets/tmthyjames/nashville-housing-data <br>
The dataset consists of Nasvhille housing market. 

## Data Upload Validation
The initial step involves selecting all records from the "NashvilleHousing" table, for data validation purposes after an initial data upload.

## Data Cleaning Steps
#### 1. Standardize Date Format:
- Date formats are standardized to ensure consistency in the dataset. Previous date format included time e.g. '00:00:00 2013-04-09' converted to '2013-04-09'
#### 2. Populate Property Address Data:
- Missing property addresses are supplemented using corresponding values from rows with the same ParcelID. After analysing the dataset, I concluded that rows with the same ParcelID have also the same addres, which allowed me to supplement the dataset.
#### 3. Breaking Out Addresses:
- Property and owner addresses are split into separate columns for address, city, and state, making the data more structured. Splited columns are easier to effectively analyse. 
#### 4. Change 'Y' and 'N' to 'Yes' and 'No':
- The 'Sold as Vacant' field is cleaned by replacing 'Y' and 'N' with 'Yes' and 'No' for clarity.
#### 5. Remove Duplicates:
- Duplicate records are identified and removed based on specific columns, ensuring data accuracy.
#### 6. Delete Unused Columns:
- Columns like OwnerAddress, TaxDistrict, PropertyAddress, and SaleDate that are no longer needed are removed to streamline the dataset.

  ![image](https://github.com/Mazur-Piotr/SQL_Data_Cleaning-Portfolio_Project/assets/138219323/793eafa0-7fa7-4700-9cb1-6ab0f4162326)


## Usage
This code provides a structured approach to data cleaning and transformation tasks in SQL, focusing on issues like missing values, date format standardization, splitting address information, standardizing categorical values, and removing duplicate records. It can be used as a guide for cleaning and preparing the "NashvilleHousing" dataset for further analysis.








