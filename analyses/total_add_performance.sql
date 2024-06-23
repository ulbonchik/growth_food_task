with bing as (
    select 
        date,
        channel,
        clicks,
        0 as engagements, --as there are no engagements in original in bing file
        0 as impressions, --as there are no impressions in original in bing file
        spend,
        conv as conversions
    from {{ source('dbt_ulbonchik', 'src_ads_bing_all_data') }}
),
facebook as (
    select
        date, 
        channel,
        clicks,
        (likes + shares + comments) as engagements, --we create engagements field by adding likes, shares and comments
        impressions,
        spend,
        purchase as conversions
    from {{ source('dbt_ulbonchik', 'src_ads_creative_facebook_all_data') }}
),
tiktok as (
    select 
        date,
        channel,
        clicks,
        0 as engagements, --as there are no engagements in original tiktok file
        impressions,
        spend,
        purchase as conversions
    from {{ source('dbt_ulbonchik', 'src_ads_tiktok_ads_all_data') }}
),
twitter as (
    select 
        date,
        channel,
        clicks,
        engagements,
        0 as impressions, --as there are no impressions in original twitter file
        spend,
        0 as conversions --as there are no conversions in original twitter file
    from {{ source('dbt_ulbonchik', 'src_promoted_tweets_twitter_all_data') }}
),
combined_data as (
    select * from bing
    union all
    select * from facebook
    union all
    select * from tiktok
    union all
    select * from twitter
),
aggregated_data as (
    select
        date,
        channel,
        sum(clicks) as total_clicks,
        sum(engagements) as total_engagements,
        sum(impressions) as total_impressions,
        sum(spend) as total_spend,
        sum(conversions) as total_conversions,
        case when sum(conversions) = 0 then null else sum(spend) / sum(conversions) end as conversion_cost,
        case when sum(engagements) = 0 then null else sum(spend) / sum(engagements) end as engagement_cost,
        case when sum(clicks) = 0 then null else sum(spend) / sum(clicks) end as cpc
    from combined_data
    group by date, channel
)

select * from aggregated_data;