-- Description: Creates a flattened data mart view for conversion funnel tracking
-- Source Table: bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*

CREATE OR REPLACE VIEW `ecommerce-portfolio-analytics.ecommerce_analytics.vw_ecommerce_funnel` AS
WITH base_events AS (
  SELECT
    PARSE_DATE('%Y%m%d', event_date) AS event_date,
    user_pseudo_id,
    event_name,
    device.category AS device_category,
    geo.country AS country
  FROM
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
)
SELECT
  event_date,
  device_category,
  country,
  COUNT(DISTINCT CASE WHEN event_name = 'page_view' THEN user_pseudo_id END) AS total_visitors,
  COUNT(DISTINCT CASE WHEN event_name = 'view_item' THEN user_pseudo_id END) AS product_viewers,
  COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_pseudo_id END) AS cart_adders,
  COUNT(DISTINCT CASE WHEN event_name = 'begin_checkout' THEN user_pseudo_id END) AS checkout_starters,
  COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_pseudo_id END) AS buyers
FROM
  base_events
GROUP BY
  1, 2, 3;
