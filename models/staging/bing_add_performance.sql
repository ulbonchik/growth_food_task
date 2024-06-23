SELECT
    date,
    channel,
    clicks,
    spend,
    conv as conversions
FROM {{ source('dbt_ulbonchik', 'src_ads_bing_all_data') }}