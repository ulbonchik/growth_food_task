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
    SELECT * FROM twitter
),
aggregated_data AS (
    SELECT
        channel,
        SUM(clicks) AS total_clicks,
        SUM(engagements) AS total_engagements,
        SUM(impressions) AS total_impressions,
        SUM(spend) AS total_spend,
        SUM(total_conversions) AS total_conversions,
        CASE 
            WHEN SUM(total_conversions) = 0 THEN NULL 
            ELSE SUM(spend) / SUM(total_conversions) 
        END AS conversion_cost,
        CASE 
            WHEN SUM(engagements) = 0 THEN NULL 
            ELSE SUM(spend) / SUM(engagements) 
        END AS engagement_cost,
        CASE 
            WHEN SUM(clicks) = 0 THEN NULL 
            ELSE SUM(spend) / SUM(clicks) 
        END AS cpc
    FROM combined_data
    GROUP BY channel
)
SELECT * FROM aggregated_data