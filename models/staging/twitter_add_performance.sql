SELECT
date,
channel,
clicks,
engagements,
spend
FROM {{ source('dbt_ulbonchik', 'src_promoted_tweets_twitter_all_data') }}