-- Users that purchased at least once vs. total users observed
WITH purchasers AS (
  SELECT DISTINCT user_pseudo_id
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'purchase' AND user_pseudo_id IS NOT NULL
)
SELECT
  COUNT(DISTINCT user_pseudo_id) AS total_users,
  (SELECT COUNT(*) FROM purchasers) AS purchasing_users,
  SAFE_DIVIDE(
    (SELECT COUNT(*) FROM purchasers),
    COUNT(DISTINCT user_pseudo_id)
  ) AS overall_conversion_rate
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE user_pseudo_id IS NOT NULL;