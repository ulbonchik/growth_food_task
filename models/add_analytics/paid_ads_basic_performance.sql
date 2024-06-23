SELECT * FROM {{ ref('bing_add_performance') }}
    UNION ALL
SELECT * FROM {{ ref('facebook_add_performance') }}
    UNION ALL
SELECT * FROM {{ ref('tiktok_add_performance') }}
    UNION ALL
SELECT * FROM {{ ref('twitter_add_performance') }}
