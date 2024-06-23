# Instructions for Adding Data from New Ad Platforms

## Identify the Data Source: 
Obtain the raw data from the new ad platform.
## Load Data into Big Query: 
Upload the raw data file to Big Query dataset 
**OR** to the seeds file in github in that case do not forget to run `dbt seed` comand.
## Add new platform to your souce file: 
`_mcdm_paid_ads_basic_performance_structure__sources`
##Create a New dbt Model:
- Create a new SQL file in your dbt models directory;
- Find all known data and match it with the corresponding names from schema files;
- If the the fields are not found add them as `NULL as 'not_found_filed'`
- At the end copy the second part of the code from any performance.sql file it will help you to define proper data types for all columns and check if the columns are named properly (do not forget to change table name in 1st and last line);
## Hints:
	- *Engagment* can be calculates as the sum of viwes, likes, comments and shares;
	- Most important field to be found: clicks, spend amount, engagements, conversions;
    - Look for synonims, double check all avaliable columns in your raw data;
## Add Data to MCDM:
- Update the paid_adsrformance SQL query to include the new platform's data, following the pattern used for existing platforms.
## Validate: 
Run dbt run to build your models and verify that the new data is correctly included in the MCDM table.

