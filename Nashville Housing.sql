-- To update NULL values with correct values in column OwnerName

Select * From [Practice Database]..NashvilleHousing
BEGIN TRANSACTION
Update [Practice Database]..NashvilleHousing
Set OwnerName = (Select a.OwnerName from [Practice Database]..NashvilleHousing a
JOIN [Practice Database]..NashvilleHousing b 
On a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
Where a.OwnerName is NULL
Group By a.OwnerName)

Select COUNT(OwnerName) from [Practice Database]..NashvilleHousing
where OwnerName is NULL

Select * From [Practice Database]..NashvilleHousing

ROLLBACK TRANSACTION

Update a
Set OwnerName = ISNULL(a.OwnerName,b.OwnerName)
From [Practice Database]..NashvilleHousing a
JOIN [Practice Database]..NashvilleHousing b
On a.ParcelID = b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
Where a.OwnerName is null

Select ParcelID, OwnerName from [Practice Database]..NashvilleHousing
Group By ParcelID, OwnerName
Order By ParcelID ASC

Update a
Set OwnerName = ISNULL(a.OwnerName,b.OwnerName)
From [Practice Database]..NashvilleHousing a
JOIN [Practice Database]..NashvilleHousing b
On a.ParcelID = b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
Where a.OwnerName is null


Select * From [Practice Database]..NashvilleHousing

--Oldest to newest house

Select DISTINCT(YearBuilt), Count(YearBuilt) from [Practice Database]..NashvilleHousing
Where YearBuilt is NOT NULL
Group By YearBuilt
Order By YearBuilt ASC

-- To show different types of Land Use with their Count.

Select DISTINCT(LandUse), Count(LandUse) from [Practice Database]..NashvilleHousing
Group By LandUse
Order By LandUse ASC

-- City wise number of properties within Nashville District

Select DISTINCT(PropertySplitCity) , Count(PropertySplitCity) from [Practice Database]..NashvilleHousing
Group By PropertySplitCity

-- How many land for Duplex Houses

Select DISTINCT(PropertySplitCity) , Count(PropertySplitCity) as TotalDuplexInTheCity from [Practice Database]..NashvilleHousing
Where LandUse = 'Duplex'
Group By PropertySplitCity

-- How Many Lands For Church in Nashville

Select  DISTINCT(PropertySplitCity), Count(PropertySplitCity) From [Practice Database]..NashvilleHousing
WHERE LandUse = 'CHURCH'
GROUP BY PropertySplitCity

-- HOW MANY HOUSE WITH 3 OR MORE BEDROOMS

SELECT DISTINCT(Bedrooms), COUNT(Bedrooms) as TotalProperties, PropertySplitCity FROM [Practice Database]..NashvilleHousing
where Bedrooms >= 3
Group By Bedrooms, PropertySplitCity

-- Average/Max/Min Prices of Propeties by City HIGH TO LOW

Select DISTINCT(OwnerSplitCity), COUNT(OwnerSplitCity) as TotalProperties ,ROUND(AVG(SalePrice),0) as AverageSalePrice, MAX(SalePrice) as MaxSalePrice, MIN(SalePrice) as MinSalePrice from [Practice Database]..NashvilleHousing
where OwnerSplitCity is Not NULL
Group By OwnerSplitCity
Order By MaxSalePrice DESC

-- 


