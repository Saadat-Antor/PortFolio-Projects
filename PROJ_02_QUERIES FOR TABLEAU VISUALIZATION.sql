  
/*


QUERIES DONE FOR TABLEAU VIZ


*/




-- VIZ 1. WHAT PERCENTAGE OF CHANCE EACH COUNTRY HAS TO DIE BY COVID-19

SELECT SUM(NEW_CASES) AS TOTAL_CASES, SUM(CAST(NEW_DEATHS AS INT)) AS TOTAL_DEATHS, (TOTAL_DEATHS/TOTAL_CASES)*100 AS [P.O.CHANCES] 
FROM [dbo].[coviddeaths]
WHERE CONTINENT IS NOT NULL
ORDER BY TOTAL_CASES, TOTAL_DEATHS



-- VIZ 2. THE TOTAL NUMBER OF DEATHS FOR SPECIFIC LOCATIONS  

SELECT LOCATION, SUM(CAST(NEW_DEATHS AS INT)) AS TOTAL_DEATHS
FROM [dbo].[coviddeaths]
WHERE CONTINENT IS NULL
AND LOCATION NOT IN ('WORLD', 'EUROPEAN UNION', 'INTERNATIONAL')
GROUP By LOCATION
ORDER BY TOTAL_DEATHS DESC



-- VIZ 3. COUNTRIES WITH HIGHEST INFECTED CASES COMPARED TO POPULATION

SELECT LOCATION, POPULATION, MAX(TOTAL_CASES) AS HIGHEST_INF_COUNT, MAX((TOTAL_CASES/POPULATION))*100 AS [P.O.INFECTED] 
FROM [dbo].[coviddeaths]
GROUP BY LOCATION, POPULATION
ORDER BY [P.O.INFECTED] DESC



-- VIZ 4. COUNTRIES WITH HIGHEST DEATH COUNT PER POPULATION

SELECT LOCATION, MAX(CAST(TOTAL_DEATHS AS INT)) AS TOTALDEATHS
FROM [dbo].[coviddeaths]
WHERE CONTINENT IS NOT NULL
GROUP BY LOCATION
ORDER BY TOTALDEATHS DESC
