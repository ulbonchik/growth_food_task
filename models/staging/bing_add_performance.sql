SELECT
date,
channel,
clicks,
spend,
conv as conversitions
FROM {{ source('dbt_ulbonchik', 'src_ads_bing_all_data') }}