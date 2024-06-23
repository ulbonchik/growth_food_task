SELECT
    date,
    clicks,
    spend,
    conv as total_conversions,
    ad_id,
    adset_id,
    campaign_id,
    channel,
FROM {{ source('dbt_ulbonchik', 'src_ads_bing_all_data') }}