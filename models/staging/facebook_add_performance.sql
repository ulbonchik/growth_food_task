SELECT
date, 
channel,
clicks,
(likes + shares +comments) AS engagements,
impressions,
spend,
purchase as conversitions
FROM {{ source('dbt_ulbonchik', 'src_ads_creative_facebook_all_data')}}