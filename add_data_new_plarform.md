# Instructions for Adding Data from New Ad Platforms

## Identify the Data Source
- Obtain the raw data from the new ad platform.

## Load Data into Big Query
- Upload the raw data file to your Big Query dataset **OR** to the seeds file in GitHub. In the latter case, do not forget to run the `dbt seed` command.

## Add New Platform to Your Source File
- Update the `_mcdm_paid_ads_basic_performance_structure__sources` file to include the new platform.

## Create a New dbt Model
- Create a new SQL file in your dbt models directory.
- Find all known data fields in the raw data and match them with the corresponding names from schema files.
- If fields are not found, add them as `NULL as 'not_found_field'`.
- At the end, copy the second part of the code from any existing performance SQL file. This will help you define proper data types for all columns and ensure columns are named correctly. (Do not forget to change the table name in the 1st and last line.)

## Hints
- **Engagement** can be calculated as the sum of views, likes, comments, and shares.
- Most important fields to identify: clicks, amount spent, engagements, conversions.
- Look for synonyms and double-check all available columns in your raw data.
- If **channel name** is missing add line `channel name' AS channel` as it is a must for group by command.

## Add Data to MCDM
- Update the `paid_ads_performance` SQL query to include the new platform's data, following the pattern used for existing platforms.

## Validate
- Run `dbt run` to build your models and verify that the new data is correctly included in the MCDM table.