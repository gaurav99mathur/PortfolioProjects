Select * from MassKillingUSA..MassShooting

Update MassKillingUSA..MassShooting
Set date = CONVERT(date,date)

ALter table MassKillingUSA..MassShooting
Add IncidentDate DATE;

Update MassKillingUSA..MassShooting
Set IncidentDate = CONVERT(date,date)

Alter table MassKillingUSA..MAssShooting
DROP COLUMN F19,F20,F21,F22,F23,date

Select DISTINCT(location_type), Count(location_type) as TotalCases from MassKillingUSA..MassShooting
Group By location_type

Select DISTINCT(age_of_shooter), Count(age_of_shooter) as TotalCases from MassKillingUSA..MassShooting
Group By age_of_shooter

Select DISTINCT(prior_signs_mental_health_issues), Count(prior_signs_mental_health_issues) as TotalCases from MassKillingUSA..MassShooting
Group By prior_signs_mental_health_issues

Select DISTINCT(weapons_obtained_legally), Count(weapons_obtained_legally) as TotalCases from MassKillingUSA..MassShooting
Group By weapons_obtained_legally

Select DISTINCT(weapon_type), Count(weapon_type) as TotalCases from MassKillingUSA..MassShooting
Group By weapon_type

Select DISTINCT(race), Count(race) as TotalCases from MassKillingUSA..MassShooting
Group By race


Select DISTINCT(gender), Count(gender) as TotalCases from MassKillingUSA..MassShooting
Group By gender

Select DISTINCT(type), Count(type) as TotalCases from MassKillingUSA..MassShooting
Group By type

Select DISTINCT(year), Count(year) as TotalCases from MassKillingUSA..MassShooting
Group By year

Select DISTINCT(state), Count(state) as TotalCases from MassKillingUSA..MassShooting
Group By state






