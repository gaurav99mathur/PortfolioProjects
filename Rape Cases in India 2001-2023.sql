select [States/UTs/Cities] from IndiaRapeCaseDatabase..['RapeCases2001-2011']

select Distinct(YEAR), SUM([No# of Cases Reported (Incest Rape Cases)]) as TotalIncestRapeCaseReported,SUM([No# of Cases Reported (Other Rape Cases)]) as TotalOtherRapeCaseReported, SUM([No# of Cases Reported (Total Rape Cases)]) as TotalRapeCaseReported from IndiaRapeCaseDatabase..['RapeCases2001-2011']
group by Year


select Distinct([States/UTs/Cities]), SUM([No# of Cases Reported (Incest Rape Cases)]) as TotalIncestRapeCaseReported, SUM([No# of Cases Reported (Other Rape Cases)]) as TotalOtherRapeCaseReported, SUM([No# of Cases Reported (Total Rape Cases)]) as TotalRapeCaseReported from IndiaRapeCaseDatabase..['RapeCases2001-2011']
group by [States/UTs/Cities]
order by TotalRapeCaseReported DESC

select Distinct([States/UTs/Cities]), SUM([No# of Victims (Total Rape Cases) upto 10 Years]) as TotalVictimsUpto10Years, 
SUM([No# of Victims (Total Rape Cases) - 10-14 Years]) as TotalVictimsBetween10To14Years,
SUM([No# of Victims (Total Rape Cases) - 14 - 18 Years]) as TotalVictimsBetween14To18Years,
SUM([No# of Victims (Total Rape Cases) - 18 - 30 Years]) as TotalVictimsBetween18To30Years,
SUM([No# of Victims (Total Rape Cases) - 30 - 50 Years]) as TotalVictimsBetween30To50Years,
SUM([No# of Victims (Total Rape Cases) above 50 Years]) as TotalVictimsAbove50Years
from IndiaRapeCaseDatabase..['RapeCases2001-2011']
group by [States/UTs/Cities]

select Distinct(Year), SUM([No# of Victims (Total Rape Cases) upto 10 Years]) as TotalVictimsUpto10Years, 
SUM([No# of Victims (Total Rape Cases) - 10-14 Years]) as TotalVictimsBetween10To14Years,
SUM([No# of Victims (Total Rape Cases) - 14 - 18 Years]) as TotalVictimsBetween14To18Years,
SUM([No# of Victims (Total Rape Cases) - 18 - 30 Years]) as TotalVictimsBetween18To30Years,
SUM([No# of Victims (Total Rape Cases) - 30 - 50 Years]) as TotalVictimsBetween30To50Years,
SUM([No# of Victims (Total Rape Cases) above 50 Years]) as TotalVictimsAbove50Years
from IndiaRapeCaseDatabase..['RapeCases2001-2011']
group by Year










