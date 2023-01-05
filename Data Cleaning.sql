/*
Cleaning Data in SQL Queries
*/


Select *
From PortfolioProjectPractice..NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format

Select SaleDate, CONVERT(date,SaleDate)
From PortfolioProjectPractice..NashvilleHousing

Update NashvilleHousing
Set SaleDate = CONVERT(date,SaleDate)

-- If it doesn't Update properly

Alter Table NashvilleHousing
Add SaleDateConverted DATE;

Update NashvilleHousing
Set SaleDateConverted = CONVERT(date,SaleDate)

Select* from NashvilleHousing

 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

Select * From NashvilleHousing
where PropertyAddress is NULL
order  by ParcelID

Select *
From PortfolioProjectPractice..NashvilleHousing a
JOIN PortfolioProjectPractice..NashvilleHousing b
On a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

Update a 
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From PortfolioProjectPractice..NashvilleHousing a
JOIN PortfolioProjectPractice..NashvilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

Select * FROm NashvilleHousing
where PropertyAddress is NULL

--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)

Select PropertyAddress
From PortfolioProjectPractice..NashvilleHousing

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) -1) as Address
,SUBSTRING(PropertyAddress,CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) as City
From PortfolioProjectPractice..NashvilleHousing

ALTER TABLE NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

Update NashvilleHousing
Set PropertySplitAddress = SUBSTRING(PropertyAddress, 1 , CHARINDEX(',',PropertyAddress) -1)

ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255);

Update NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) +1 , LEN(PropertyAddress))

Select * From NashvilleHousing


Select OwnerAddress
From PortfolioProjectPractice..NashvilleHousing

Select
PARSENAME(REPLACE(OwnerAddress, ',','.'),3),
PARSENAME(REPLACE(OwnerAddress, ',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),1)
From PortfolioProjectPractice..NashvilleHousing

ALTER TABLE NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

UPDATE NashvilleHousing
Set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',','.'),3)

ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

UPDATE NashvilleHousing
Set OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',','.'),2)

ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

UPDATE NashvilleHousing
Set OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',','.'),1)

Select *From PortfolioProjectPractice..NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field

Select DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
From PortfolioProjectPractice..NashvilleHousing
Group By SoldAsVacant
order by 2

Select SoldAsVacant ,
CASE When SoldAsVacant = 'Y' THEN 'Yes'
When SoldAsVacant = 'N' THEN 'No'
ELSE SoldAsVacant
END
From PortfolioProjectPractice..NashvilleHousing

Update NashvilleHousing
Set SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
When SoldAsVacant = 'N' THEN 'No'
ELSE SoldAsVacant
END


Select DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
From PortfolioProjectPractice..NashvilleHousing
Group By SoldAsVacant
order by 2

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates


