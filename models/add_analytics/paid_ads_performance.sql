CREATE TABLE paid_ads_performance (
    date DATE,
    add_to_cart INT64,
    clicks INT64,
    comments INT64,
    engagements INT64,
    impressions INT64,
    installs INT64,
    likes INT64,
    link_clicks INT64,
    post_click_conversions INT64,
    post_view_conversions INT64,
    posts INT64,
    purchase INT64,
    registrations INT64,
    revenue INT64,
    shares INT64,
    spend INT64,
    total_conversions INT64,
    video_views INT64,
    ad_id STRING,
    adset_id STRING,
    campaign_id STRING,
    channel STRING,
    creative_id STRING,
    placement_id STRING
);

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
)
INSERT INTO dbt_ulbonchik.new_paid_ads_performance (
    date, 
    add_to_cart, 
    clicks, 
    comments, 
    engagements, 
    impressions, 
    installs, 
    likes, 
    link_clicks, 
    post_click_conversions, 
    post_view_conversions, 
    posts, 
    purchase, 
    registrations, 
    revenue, 
    shares, 
    spend, 
    total_conversions, 
    video_views, 
    ad_id, 
    adset_id, 
    campaign_id, 
    channel, 
    creative_id, 
    placement_id
)
SELECT 
    date, 
    add_to_cart, 
    clicks, 
    comments, 
    engagements, 
    impressions, 
    installs, 
    likes, 
    link_clicks, 
    post_click_conversions, 
    post_view_conversions, 
    posts, 
    purchase, 
    registrations, 
    revenue, 
    shares, 
    spend, 
    total_conversions, 
    video_views, 
    ad_id, 
    adset_id, 
    campaign_id, 
    channel, 
    creative_id, 
    placement_id
FROM combined_data;