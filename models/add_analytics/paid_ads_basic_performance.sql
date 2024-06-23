WITH bing AS (
    SELECT 
        channel,
        clicks,
        engagements,
        impressions,
        spend,
        total_conversions
    FROM {{ ref('bing_add_performance') }}
),
facebook AS (
    SELECT 
        channel,
        clicks,
        engagements,
        impressions,
        spend,
        total_conversions
    FROM {{ ref('facebook_add_performance') }}
),
tiktok AS (
    SELECT 
        channel,
        clicks,
        engagements,
        impressions,
        spend,
        total_conversions
    FROM {{ ref('tiktok_add_performance') }}
),
twitter AS (
    SELECT 
        channel,
        clicks,
        engagements,
        impressions,
        spend,
        total_conversions
    FROM {{ ref('twitter_add_performance') }}
),
combined_data AS (
    SELECT * FROM bing
    UNION ALL
    SELECT * FROM facebook
    UNION ALL
    SELECT * FROM tiktok
    UNION ALL
    SELECT * FROM twitter)
SELECT * from combined_data
