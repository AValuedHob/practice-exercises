-- How many counties are represented? How many companies?

SELECT COUNT(county)
FROM ecd;
Select COUNT(company)
FROM ecd;
SELECT COUNT(DISTINCT county) AS county_count, COUNT(DISTINCT company) AS company_count
FROM ecd;

-- How many companies did not get ANY Economic Development grants (ed) for any of their projects? (Hint, you will probably need a couple of steps to figure this one out)

SELECT COUNT(DISTINCT company) AS no_grant_count
FROM ecd
WHERE ed IS NULL;

-- What is the total capital_investment, in millions, when there was a grant received from the fjtap? Call the column fjtap_cap_invest_mil.

SELECT SUM (capital_investment) / 1000000 AS fjtap_cap_invest_mil
FROM ecd
WHERE fjtap IS NOT NULL;

-- What is the average number of new jobs for each county_tier?

SELECT county_tier, ROUNd(AVG(new_jobs),2) AS avg_new_jobs
FROM ecd
GROUP by county_tier
ORDER by county_tier;

-- How many companies are LLCs? Call this value llc_companies. (Hint, combine COUNT() and DISTINCT(). Also, consider that LLC may not always be capitalized the same in company names. Find a SQL keyword that can help you with this.)

SELECT COUNT(DISTINCT company) AS llc_companies
FROM ecd
WHERE company ILIKE '%llc%';
