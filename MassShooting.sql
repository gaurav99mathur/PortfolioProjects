-- Shows All Data from the Table MassShooting
Select * from MassKillingUSA..MassShooting

--To change date format from dd-mm--yyyy-hh-mm--ss to DD-MM-YYYY

Update MassKillingUSA..MassShooting
Set date = CONVERT(date,date)

ALter table MassKillingUSA..MassShooting
Add IncidentDate DATE;

Update MassKillingUSA..MassShooting
Set IncidentDate = CONVERT(date,date)

-- Delete Unused columns F19,F20,F21,F22,date

Alter table MassKillingUSA..MAssShooting
DROP COLUMN F19,F20,F21,F22,F23,date

-- To show Location Wise Number Of Shootings

Select DISTINCT(location_type), Count(location_type) as TotalCases from MassKillingUSA..MassShooting
Group By location_type

-- To show Age Wise Number Of Shootings (Shooter's Age)

Select DISTINCT(age_of_shooter), Count(age_of_shooter) as TotalCases from MassKillingUSA..MassShooting
Group By age_of_shooter

-- If Shooter had Prior Signs Of Mental Health Issues

Select DISTINCT(prior_signs_mental_health_issues), Count(prior_signs_mental_health_issues) as TotalCases from MassKillingUSA..MassShooting
Group By prior_signs_mental_health_issues

-- If Weapons Were Obtained legally

Select DISTINCT(weapons_obtained_legally), Count(weapons_obtained_legally) as TotalCases from MassKillingUSA..MassShooting
Group By weapons_obtained_legally

--Cases with different Weapon Types

Select DISTINCT(weapon_type), Count(weapon_type) as TotalCases from MassKillingUSA..MassShooting
Group By weapon_type

-- To Show Race Wise cases of Shooting

Select DISTINCT(race), Count(race) as TotalCases from MassKillingUSA..MassShooting
Group By race

-- To show Gender Wise Number Of Shootings

Select DISTINCT(gender), Count(gender) as TotalCases from MassKillingUSA..MassShooting
Group By gender

-- To show Type Wise Number Of Shootings whether Mass Shooting or Spree

Select DISTINCT(type), Count(type) as TotalCases from MassKillingUSA..MassShooting
Group By type

-- To show Year Wise Number Of Shootings

Select DISTINCT(year), Count(year) as TotalCases from MassKillingUSA..MassShooting
Group By year

-- To show State Wise Number Of Shootings

Select DISTINCT(state), Count(state) as TotalCases from MassKillingUSA..MassShooting
Group By state






