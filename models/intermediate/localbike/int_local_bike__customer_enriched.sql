WITH order_items_agg AS (
SELECT
  order_id,
  product_id,
  SUM((product_quantity * product_price) * (1 - product_discount)) AS total_order_item_amount,
  SUM(product_quantity) AS total_items_by_order,
  COUNT(DISTINCT product_id) AS total_distinct_items_by_order
--FROM `databird-final-project.local_bike_dataset.order_items` 
FROM {{ ref('stg_local_bike__order_items') }}
GROUP BY order_id, product_id
)

SELECT
  o.customer_id,
  s.store_name,
  COUNT(DISTINCT oi.order_id) as total_orders,
  SUM(oi.total_order_item_amount) as total_order_amount,
  SUM(oi.total_items_by_order) as total_items,
  COUNT(DISTINCT oi.product_id) AS total_distinct_items,
  MIN(o.order_date) as first_order_date,
  MAX(o.order_date) as last_order_date,
  DATE_DIFF('2019-01-01', MAX(order_date), DAY) AS customer_recency_days,

-- FROM databird-final-project.local_bike_dataset.orders o
FROM {{ ref('stg_local_bike__orders') }} o
LEFT JOIN order_items_agg oi ON oi.order_id = o.order_id
LEFT JOIN {{ ref('stg_local_bike__stores') }} s ON s.store_id = o.store_id
GROUP BY customer_id, store_name