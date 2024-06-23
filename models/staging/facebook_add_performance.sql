SELECT
date, 
channel,
clicks,
(likes + shares +comments+views) AS engagements, -- we create engagements field by adding likes, shares and comments
impressions,
spend,
purchase as conversions
FROM {{ source('dbt_ulbonchik', 'src_ads_creative_facebook_all_data')}}