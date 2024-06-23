SELECT
date,
channel,
clicks,
engagements,
0 as impressions,
spend,
0 as conversions
FROM {{ source('dbt_ulbonchik', 'src_promoted_tweets_twitter_all_data') }}