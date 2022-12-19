SELECT iso_code, continent, location
FROM CovidDeaths;

SELECT * 
FROM CovidVaccinate
ORDER BY 1,2;

SELECT *
FROM CovidDeaths;



SELECT *
FROM CovidDeaths
WHERE location LIKE 'India';



SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1,2;

---- Total Cases vs Total Deaths
SELECT Location, date, total_cases, total_deaths, ROUND(((total_deaths/total_cases)*100), 3) AS death_percentage
FROM CovidDeaths
WHERE location LIKE 'india'
ORDER BY 1,2;

-- Total Cases vs Population

SELECT location, date, population, total_cases, (total_cases/population)*100 AS infection_percentage
FROM CovidDeaths
WHERE location LIKE 'india'
ORDER BY 1,2;

-- Countries with Highest Infection Rate compared to Population


SELECT location, population, MAX(total_cases) as highest_total_cases, MAX((total_cases/population)*100) AS highest_infection_percentage
FROM CovidDeaths
GROUP BY location, population
ORDER BY highest_infection_percentage DESC;

-- Countries with Highest Death Count per Population

SELECT location, MAX(((cast(total_deaths as INT))/population)*100) AS max_death_percentage
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY max_death_percentage DESC;

-- BREAKING THINGS DOWN BY CONTINENT

-- Showing continents with the highest death count per population

SELECT continent, MAX(cast(total_deaths AS INT)) AS tot_death_count
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY tot_death_count DESC;

-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From CovidDeaths dea
Join CovidVaccinate vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3;



