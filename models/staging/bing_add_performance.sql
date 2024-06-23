SELECT
    date,
    channel,
    clicks,
    0 as engagements,
    0 as impressions,
    spend,
    conv as conversions
FROM {{ source('dbt_ulbonchik', 'src_ads_bing_all_data') }}