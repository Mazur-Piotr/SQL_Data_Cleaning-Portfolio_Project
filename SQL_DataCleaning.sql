-- DATA UPLOAD VALIDATION

SELECT *
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

-- STANDARIZE DATE FORMAT

-- Generate the Expected Output

SELECT SaleDate, CONVERT(Date,SaleDate)
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

-- Setting the Correct Format

UPDATE [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
SET SaleDate = CONVERT(Date,SaleDate)

-- Data Output Check

SELECT SaleDateConverted, CONVERT(Date,SaleDate)
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

-- POPULATE PROPERTY ADDRESS DATA

-- Address Data Overview

SELECT *
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

SELECT *
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
WHERE PropertyAddress is NULL

-- Realization That ParcelID = ParcelID than PropertyAddress = PropertyAddress
-- Supplementation NULL Values With Corresponding Values From the Rows With the Same ParcelID

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing AS a 
JOIN [PortfolioProject - Data Cleaning].dbo.NashvilleHousing AS b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS NULL

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing AS a 
JOIN [PortfolioProject - Data Cleaning].dbo.NashvilleHousing AS b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS NULL


-- BREAKING OUT THE ADDRESSES INTO INDIVIDUAL COLUMNS (ADRESS, CITY, STATE)

-- Breaking PropertyAddress Into Separate Columns Using SUBSTRING

SELECT PropertyAddress
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) AS Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress)) AS Address
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

-- Creating New Columns with Separated Adress

ALTER TABLE NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

UPDATE NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)

ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255);

UPDATE NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress))

-- Breaking OwnerAdress Into Separate Columns Using PARSENAME

SELECT OwnerAddress
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

-- Checking the Output of the Querry
SELECT
PARSENAME(Replace(OwnerAddress, ',', '.') ,3)
,PARSENAME(Replace(OwnerAddress, ',', '.') ,2)
,PARSENAME(Replace(OwnerAddress, ',', '.') ,1)
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

-- Breaking OwnerAdress Into 3 Columns: Address, City and State

ALTER TABLE [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

UPDATE [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
SET OwnerSplitAddress = PARSENAME(Replace(OwnerAddress, ',', '.') ,3)

ALTER TABLE [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

UPDATE [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
SET OwnerSplitCity = PARSENAME(Replace(OwnerAddress, ',', '.') ,2)

ALTER TABLE [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
Add OwnerSplitState Nvarchar(255);

UPDATE [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
SET OwnerSplitState = PARSENAME(Replace(OwnerAddress, ',', '.') ,1)

SELECT *
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

-- CHANGE Y AND N TO YES AND NO IN 'Sold as Vacant' field

SELECT Distinct(SoldAsVacant), Count(SoldAsVacant)
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY 2

SELECT SoldAsVacant 
, CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	   WHEN SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant  
	   END
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

UPDATE [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	   WHEN SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant  
	   END

-- REMOVE DUPLICATES 
-- Checking the Number of Duplicates in the Tabel

WITH RowNumCTE AS(
SELECT *,
 ROW_NUMBER() OVER (
 PARTITION BY ParcelID, 
			  PropertyAddress, 
			  SalePrice, 
			  SaleDate, 
			  LegalReference
			  ORDER BY 
			      UniqueID
				  ) as row_num

FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
)
SELECT *
FROM RowNumCTE
WHERE row_num > 1
ORDER BY PropertyAddress

-- Deleting Duplicates 

WITH RowNumCTE AS(
SELECT *,
 ROW_NUMBER() OVER (
 PARTITION BY ParcelID, 
			  PropertyAddress, 
			  SalePrice, 
			  SaleDate, 
			  LegalReference
			  ORDER BY 
			      UniqueID
				  ) as row_num

FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
)
DELETE
FROM RowNumCTE
WHERE row_num > 1

-- DELETE UNUSED COLUMNS

SELECT *
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing

ALTER TABLE [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
DROP COLUMN SaleDate

SELECT *
FROM [PortfolioProject - Data Cleaning].dbo.NashvilleHousing
