Select *
From [Portfolio Project]..CovidDeaths
order by 3,4

--Select *
--From [Portfolio Project]..CovidVaccinations
--order by 3,4

-- Select Data that e are going to be using

Select location, date, total_cases, new_cases, total_deaths, population
From [Portfolio Project]..CovidDeaths
order by 1,2

-- Total Cases Vs Total Deaths
-- Shows likelihood of dying if you have covid in your country

Select location, date, total_cases, total_deaths , (total_deaths/total_cases)*100 as DeathPercentage
From [Portfolio Project]..CovidDeaths
where location like 'India'
order by 1,2

-- Total Cases Vs Population
-- SHows what %age of population got covid

Select location, date, total_cases, population , (total_cases/population)*100 as PercentPopulationInfected
From [Portfolio Project]..CovidDeaths
where location like 'India'
order by 1,2

-- Countries with Highest Infection Rate per population

Select location, population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as
	PercentPopulationInfected
From [Portfolio Project]..CovidDeaths
-- where location like 'India'
Group by location,population
order by PercentPopulationInfected desc

-- Countries with Highest Death Count per population


Select location,  Max(cast(total_deaths as int)) as TotalDeathCount
From [Portfolio Project]..CovidDeaths
where continent is not null
-- where location like 'India'
Group by location
order by TotalDeathCount desc


-- LET'S BREAK THINGS BY CONTINENTS
-- Showing the continents with Highest Death Count per population

Select continent,  Max(cast(total_deaths as int)) as TotalDeathCount
From [Portfolio Project]..CovidDeaths
where continent is not null 
-- where location like 'India'
Group by continent
order by TotalDeathCount desc

--  GLOBAL NUMBERS

Select SUM(new_cases) as TotalGlobalCases, SUM(cast(new_deaths as int)) as TotalGlobalDeaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as GlobalDeathPercentage
From [Portfolio Project]..CovidDeaths
--where location like 'India'
where continent is not null
--Group By date
Order By 1,2

-- Looking at Total Population Vs Vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (Partition By dea.location Order By dea.location, dea.date)
as RollingPeopleVaccinated --, (RollingPeopleVaccinated/population)*100
From [Portfolio Project]..CovidDeaths dea
Join [Portfolio Project]..CovidVaccinations vac
On dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
Order By 2,3


-- Use CTE

With PopvsVac (Continent, location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (Partition By dea.location Order By dea.location, dea.date)
as RollingPeopleVaccinated 
--, (RollingPeopleVaccinated/population)*100
From [Portfolio Project]..CovidDeaths dea
Join [Portfolio Project]..CovidVaccinations vac
On dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
--Order By 2,3
)
Select * , (RollingPeopleVaccinated/Population)*100
From PopvsVac

-- TEMP TABLE

Drop Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric,
)
Insert Into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (Partition By dea.location Order By dea.location, dea.date)
as RollingPeopleVaccinated 
--, (RollingPeopleVaccinated/population)*100
From [Portfolio Project]..CovidDeaths dea
Join [Portfolio Project]..CovidVaccinations vac
On dea.location = vac.location
and dea.date = vac.date
--where dea.continent is not null
--Order By 2,3

Select * , (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated

-- Creating View to store data for later visualizations

--Drop View if exists PercentPopulationVaccinated

Create View PercentPopulationVaccinated as 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (Partition By dea.location Order By dea.location, dea.date)
as RollingPeopleVaccinated 
--, (RollingPeopleVaccinated/population)*100
From [Portfolio Project]..CovidDeaths dea
Join [Portfolio Project]..CovidVaccinations vac
On dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
--Order By 2,3

Select * From PercentPopulationVaccinated