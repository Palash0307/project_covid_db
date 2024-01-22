use database_covid;
Show tables;


Alter table table_name rename to covid_death;
Alter table table_name rename to covid_vaccine;
Select * from covid_death

SET SQL_SAFE_UPDATES = 0; #to make the changes

#########update to null and modify#######

UPDATE covid_death
SET 
  total_cases = NULLIF(total_cases, ''),
  new_cases = NULLIF(new_cases, ''),
  new_cases_smoothed = NULLIF(new_cases_smoothed, ''),
  total_deaths = NULLIF(total_deaths, ''),
  new_deaths = NULLIF(new_deaths, ''),
  new_deaths_smoothed = NULLIF(new_deaths_smoothed, ''),
  total_cases_per_million = NULLIF(total_cases_per_million, ''),
  new_cases_per_million = NULLIF(new_cases_per_million, ''),
  new_cases_smoothed_per_million = NULLIF(new_cases_smoothed_per_million, ''),
  total_deaths_per_million = NULLIF(total_deaths_per_million, ''),
  new_deaths_per_million = NULLIF(new_deaths_per_million, ''),
  new_deaths_smoothed_per_million = NULLIF(new_deaths_smoothed_per_million, ''),
  reproduction_rate = NULLIF(reproduction_rate, ''),
  icu_patients = NULLIF(icu_patients, ''),
  icu_patients_per_million = NULLIF(icu_patients_per_million, ''),
  hosp_patients = NULLIF(hosp_patients, ''),
  hosp_patients_per_million = NULLIF(hosp_patients_per_million, ''),
  weekly_icu_admissions = NULLIF(weekly_icu_admissions, ''),
  weekly_icu_admissions_per_million = NULLIF(weekly_icu_admissions_per_million, ''),
  weekly_hosp_admissions = NULLIF(weekly_hosp_admissions, ''),
  weekly_hosp_admissions_per_million = NULLIF(weekly_hosp_admissions_per_million, '');
  
  
Select * from covid_death

ALTER TABLE covid_death
MODIFY COLUMN total_cases INT,
MODIFY COLUMN new_cases INT,
MODIFY COLUMN new_cases_smoothed INT,
MODIFY COLUMN total_deaths INT,
MODIFY COLUMN new_deaths INT,
MODIFY COLUMN new_deaths_smoothed INT,
MODIFY COLUMN total_cases_per_million INT,
MODIFY COLUMN new_cases_per_million INT,
MODIFY COLUMN new_cases_smoothed_per_million INT,
MODIFY COLUMN total_deaths_per_million INT,
MODIFY COLUMN new_deaths_per_million INT,
MODIFY COLUMN new_deaths_smoothed_per_million INT,
MODIFY COLUMN reproduction_rate INT,
MODIFY COLUMN icu_patients INT,
MODIFY COLUMN icu_patients_per_million INT,
MODIFY COLUMN hosp_patients INT,
MODIFY COLUMN hosp_patients_per_million INT,
MODIFY COLUMN weekly_icu_admissions INT,
MODIFY COLUMN weekly_icu_admissions_per_million INT,
MODIFY COLUMN weekly_hosp_admissions INT,
MODIFY COLUMN weekly_hosp_admissions_per_million INT;
#########################################################
##covid_vaccine
UPDATE covid_vaccine
SET 
  total_tests = NULLIF(total_tests, ''),
  new_tests = NULLIF(new_tests, ''),
  total_tests_per_thousand = NULLIF(total_tests_per_thousand, ''),
  new_tests_per_thousand = NULLIF(new_tests_per_thousand, ''),
  new_tests_smoothed = NULLIF(new_tests_smoothed, ''),
  new_tests_smoothed_per_thousand = NULLIF(new_tests_smoothed_per_thousand, ''),
  positive_rate = NULLIF(positive_rate, ''),
  tests_per_case = NULLIF(tests_per_case, ''),
  tests_units = NULLIF(tests_units, ''),
  total_vaccinations = NULLIF(total_vaccinations, ''),
  people_vaccinated = NULLIF(people_vaccinated, ''),
  people_fully_vaccinated = NULLIF(people_fully_vaccinated, ''),
  total_boosters = NULLIF(total_boosters, ''),
  new_vaccinations = NULLIF(new_vaccinations, ''),
  new_vaccinations_smoothed = NULLIF(new_vaccinations_smoothed, ''),
  total_vaccinations_per_hundred = NULLIF(total_vaccinations_per_hundred, ''),
  people_vaccinated_per_hundred = NULLIF(people_vaccinated_per_hundred, ''),
  people_fully_vaccinated_per_hundred = NULLIF(people_fully_vaccinated_per_hundred, ''),
  total_boosters_per_hundred = NULLIF(total_boosters_per_hundred, ''),
  new_vaccinations_smoothed_per_million = NULLIF(new_vaccinations_smoothed_per_million, ''),
  new_people_vaccinated_smoothed = NULLIF(new_people_vaccinated_smoothed, ''),
  new_people_vaccinated_smoothed_per_hundred = NULLIF(new_people_vaccinated_smoothed_per_hundred, ''),
  extreme_poverty = NULLIF(extreme_poverty, ''),
  female_smokers = NULLIF(female_smokers, ''),
  male_smokers = NULLIF(male_smokers, ''),
  excess_mortality_cumulative_absolute = NULLIF(excess_mortality_cumulative_absolute, ''),
  excess_mortality_cumulative = NULLIF(excess_mortality_cumulative, ''),
  excess_mortality = NULLIF(excess_mortality, ''),
  excess_mortality_cumulative_per_million = NULLIF(excess_mortality_cumulative_per_million, '');




-- Update the data type for each VARCHAR column to INT
ALTER TABLE covid_vaccine
MODIFY COLUMN total_tests BIGINT,
MODIFY COLUMN new_tests BIGINT,
MODIFY COLUMN total_tests_per_thousand BIGINT,
MODIFY COLUMN new_tests_per_thousand BIGINT,
MODIFY COLUMN new_tests_smoothed BIGINT,
MODIFY COLUMN new_tests_smoothed_per_thousand BIGINT,
MODIFY COLUMN positive_rate BIGINT,
MODIFY COLUMN tests_per_case BIGINT,
MODIFY COLUMN total_vaccinations BIGINT,
MODIFY COLUMN people_vaccinated BIGINT,
MODIFY COLUMN people_fully_vaccinated BIGINT,
MODIFY COLUMN total_boosters BIGINT,
MODIFY COLUMN new_vaccinations BIGINT,
MODIFY COLUMN new_vaccinations_smoothed BIGINT,
MODIFY COLUMN total_vaccinations_per_hundred BIGINT,
MODIFY COLUMN people_vaccinated_per_hundred BIGINT,
MODIFY COLUMN people_fully_vaccinated_per_hundred BIGINT,
MODIFY COLUMN total_boosters_per_hundred BIGINT,
MODIFY COLUMN new_vaccinations_smoothed_per_million BIGINT,
MODIFY COLUMN new_people_vaccinated_smoothed BIGINT,
MODIFY COLUMN new_people_vaccinated_smoothed_per_hundred BIGINT,
MODIFY COLUMN extreme_poverty BIGINT,
MODIFY COLUMN female_smokers BIGINT,
MODIFY COLUMN male_smokers BIGINT,
MODIFY COLUMN excess_mortality_cumulative_absolute BIGINT,
MODIFY COLUMN excess_mortality_cumulative BIGINT,
MODIFY COLUMN excess_mortality BIGINT,
MODIFY COLUMN excess_mortality_cumulative_per_million BIGINT;

Select * from covid_vaccine
## Select data that we are going to be using

Select location,date,total_cases,new_cases,total_deaths,population from covid_death order by 1,2;

##total cases vs total deaths
# shows likelihood of dyiing uf you contract covid in your country
Select location,sum(total_cases)total_cases, sum(total_deaths) total_deaths, (sum(total_deaths)/sum(total_cases))*100 percentage_of_deaths
from covid_death
group by location;

# looking at total cases vs population
#propotion of population got covid
Select location,sum(total_cases)total_cases, sum(population) population, (sum(total_cases)/sum(population))*100 percentage_of_deaths
from covid_death
where location in ('Brazil','Russia','India','China','South Africa')
group by location
order by 4;
#Brazilgot the highes number of cases 


#how many people died

 
Select location,sum(total_deaths)total_deaths, sum(population) population, (sum(total_deaths)/sum(population))*100 percentage_of_deaths
from covid_death
where location in ('Brazil','Russia','India','China','South Africa')
group by location
order by 4;
#Brazil have the highest cases for deaths

#to check the country with highest deaths in each continent

SELECT continent, location, MAX(total_deaths) AS max_deaths
FROM (
    SELECT location, continent, 
           DENSE_RANK() OVER (PARTITION BY continent ORDER BY SUM(total_deaths) DESC) AS rn,
           SUM(total_deaths) AS total_deaths
    FROM covid_death
    GROUP BY location, continent
) a
WHERE rn =1
GROUP BY continent, location
ORDER BY 2;
# 4 countries of brics that is Brazil, Russia, India  and South Africa have highest number of deaths in their respective continent

###top 5 countries in each continent
WITH RankedDeaths AS (
    SELECT
        location,
        continent,
        SUM(total_deaths) AS total_deaths,
        ROW_NUMBER() OVER (PARTITION BY continent ORDER BY SUM(total_deaths) DESC) AS death_rank
    FROM
        covid_death
    GROUP BY
        location, continent
),
Top5DeathsPerContinent AS (
    SELECT
        location,
        continent,
        total_deaths
    FROM
        RankedDeaths
    WHERE
        death_rank <= 5
)
SELECT
    continent,
    location,
    total_deaths
FROM
    Top5DeathsPerContinent
ORDER BY
    continent, total_deaths DESC;

##Global numbers
#per day total new cases and new deaths
Select date,sum(new_cases) new_cases,sum(new_deaths) new_deaths
from covid_death
where continent is not null
group by date
order by 1,2

#overall cases, deaths and percentagge
Select sum(total_cases) CASES, sum(total_deaths) DEATHS, (sum(total_deaths)/sum(total_cases))*100 PROPORTION_OF_DEATHS
from covid_death
where continent is not null;
#over 1% of deaths occuring in the total number of cases

####Covid_vaccine table####
#Rolling Count 
#new vaccines each day for each location of a country 
WITH cte AS (
    SELECT
        d.location,
        d.date,
        d.continent,
        d.population,
        v.new_vaccinations,
        SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.date) AS Rolling_total
    FROM
        covid_vaccine v
    JOIN
        covid_death d ON v.location = d.location AND v.date = d.date
)
SELECT
	location,
    max(cte.new_vaccinations) Max_vaccine,
    max(cte.Rolling_total / population) * 100 AS percentage 
FROM
    cte
group by location;


##TEMP table



Create table PercentPopulationVaccinated(

Location nvarchar(255),
Date datetime,
Continent nvarchar(255),
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric);
Alter table PercentPopulationVaccinated
modify column RollingPeopleVaccinated bigint;
Insert into PercentPopulationVaccinated(
SELECT
        d.location,
        d.date,
        d.continent,
        d.population,
        v.new_vaccinations,
        SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.date) AS Rolling_total
    FROM
        covid_vaccine v
    JOIN
        covid_death d ON v.location = d.location AND v.date = d.date

);

Select *, (RollingPeopleVaccinated/Population)*100
from PercentPopulationVaccinated

#Creating View to store data for later
CREATE VIEW PercentPopulationVaccinatedView AS
SELECT
    d.location,
    d.date,
    d.continent,
    d.population,
    v.new_vaccinations,
    SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.date) AS Rolling_total
FROM
    covid_vaccine v
JOIN
    covid_death d ON v.location = d.location AND v.date = d.date
where d.continent is not null;







