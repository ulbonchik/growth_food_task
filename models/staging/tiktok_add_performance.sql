SELECT
date,
channel,
clicks,
impressions,
spend,
purchase as conversitions
FROM {{ source('dbt_ulbonchik', 'src_ads_tiktok_ads_all_data') }}