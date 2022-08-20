select *
from PortfolioProject..coviddata
where location = 'Azerbaijan' and continent is not null

--Exploring total cases vs total deaths
--Probability of dying if person has covid in Azerbaijan

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as deathpercentage
from PortfolioProject..coviddata
where location = 'Azerbaijan' and continent is not null
order by date

-- exploting total cases vs population
Select location, date, population, total_cases, (total_cases/population)*100 as PercentPopulationInfection
from PortfolioProject..coviddata
where location = 'Azerbaijan' and continent is not null
order by date

--exploring total vaccination vs population
Select location, date, population, total_vaccinations, (total_vaccinations/population)*100 as PercentPopulationVaccinated
from PortfolioProject..coviddata
where location = 'Azerbaijan' and continent is not null
order by date


-- countries with highest infection rate (comparison with population)
Select location, population, MAX(total_cases) as highestinfectioncount, MAX((total_cases/population))*100 as PercentPopulationInfection
from PortfolioProject..coviddata
where continent is not null
Group by location, population
order by PercentPopulationInfection desc

Select location, population, MAX(total_cases) as highestinfectioncount, MAX((total_cases/population))*100 as PercentPopulationInfection
from PortfolioProject..coviddata
where location = 'Azerbaijan' and continent is not null
Group by location, population
order by PercentPopulationInfection desc

-- countries with highest death rate (comparison with population)
Select location, population, MAX(cast(total_deaths as int)) as totaldeathcount
from PortfolioProject..coviddata
Group by location, population
order by totaldeathcount desc

--continents with highest death count per population
Select location, population, MAX(cast(total_deaths as int)) as totaldeathcount
from PortfolioProject..coviddata
where continent is null
Group by location, population
order by totaldeathcount desc

Select location, population, MAX(cast(total_deaths as int)) as totaldeathcount
from PortfolioProject..coviddata
where location = 'Azerbaijan'
Group by location, population
order by totaldeathcount desc


