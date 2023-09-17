# SQL_Data_Cleaning-Portfolio_Project

Project where I used SQL queries and operations intended to clean and prepare data within a database referred to as "NashvilleHousing." Below is an overview of the key steps and tasks performed in this code:

1. Data Upload Validation:
The initial step involves selecting all records from the "NashvilleHousing" table, for data validation purposes after an initial data upload.

2.Standardize Date Format:
This section focuses on the "SaleDate" column, aiming to standardize its date format.
It first selects the "SaleDate" and its converted form using the CONVERT function.
It then updates the "SaleDate" column in the table to reflect the standardized date format.
Lastly, it checks the results of the date format conversion.

3.Populate Property Address Data:
This part of the code is dedicated to dealing with missing "PropertyAddress" values.
It identifies rows where "PropertyAddress" is NULL.
It supplements the NULL values by copying corresponding values from rows with the same "ParcelID" using a SQL JOIN operation.

4. Breaking Out the Addresses into Individual Columns (Address, City, State):
Here, the code splits the "PropertyAddress" column into separate columns for address and city using the SUBSTRING function.
New columns, "PropertySplitAddress" and "PropertySplitCity," are created to store the separated address components.
A similar process is applied to the "OwnerAddress" column, breaking it into separate columns for address, city, and state using the PARSENAME function.

5.Change Y and N to YES and NO in 'Sold as Vacant' Field:
This section aims to standardize the values in the "SoldAsVacant" column.
It selects distinct values from the column and then replaces 'Y' with 'Yes' and 'N' with 'No' using a CASE statement.
The "SoldAsVacant" column is updated with these standardized values.

6.Remove Duplicates:
This part involves identifying and deleting duplicate records based on specific columns such as "ParcelID," "PropertyAddress," "SalePrice," "SaleDate," and "LegalReference."
The code uses a common table expression (CTE) to number rows and subsequently deletes duplicates, keeping only one instance of each.
Delete Unused Columns:

7.The final section of the code removes certain columns from the "NashvilleHousing" table to presumably streamline and clean the dataset.

Overall, this code provides a structured approach to data cleaning and transformation tasks in SQL, focusing on issues like missing values, date format standardization, splitting address information, standardizing categorical values, and removing duplicate records. It can be used as a guide for cleaning and preparing the "NashvilleHousing" dataset for further analysis.
