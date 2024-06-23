WITH bing AS (
    SELECT *
    FROM {{ ref('bing_add_performance') }}
),
facebook AS (
    SELECT *
    FROM {{ ref('facebook_add_performance') }}
),
tiktok AS (
    SELECT *
    FROM {{ ref('tiktok_add_performance') }}
),
twitter AS (
    SELECT *
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
        SUM(conversions) AS total_conversions,
        CASE WHEN SUM(conversions) = 0 THEN NULL ELSE SUM(spend) / SUM(conversions) END AS conversion_cost,
        CASE WHEN SUM(engagements) = 0 THEN NULL ELSE SUM(spend) / SUM(engagements) END AS engagement_cost,
        CASE WHEN SUM(clicks) = 0 THEN NULL ELSE SUM(spend) / SUM(clicks) END AS cpc
    FROM combined_data
    GROUP BY channel)

SELECT * from aggregated_data