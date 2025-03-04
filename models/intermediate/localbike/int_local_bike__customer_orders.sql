SELECT
  o.customer_id,
  o.store_name,
  o.order_id,
  o.order_date,
  o.total_order_amount
FROM {{ ref('int_local_bike__orders_enriched') }} o