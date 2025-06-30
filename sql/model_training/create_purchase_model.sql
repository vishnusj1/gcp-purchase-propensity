CREATE OR REPLACE MODEL `real-time-purchase-propensity.mvp_propensity.purchase_model`
OPTIONS (
  model_type = 'LOGISTIC_REG',
  input_label_cols = ['label'],
  data_split_method = 'RANDOM',
  data_split_eval_fraction = 0.2,
  max_iterations = 20
) AS
SELECT
  page_views,
  add_to_cart_events,
  begin_checkout_events,
  view_item_events,
  sessions_per_user_day,
  prior_purchases,
  days_since_first_seen,
  device_category,
  traffic_medium,
  label
FROM `real-time-purchase-propensity.mvp_propensity.purchase_features_balanced`;
