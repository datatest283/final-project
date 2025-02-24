SELECT
  oi.order_id,
  product_id,
-- oi.product_price,
  oi.product_quantity,
  oi.product_quantity * oi.product_price * (1 - oi.product_discount) AS amount_spent

FROM {{ ref('stg_local_bike__order_items') }} oi 
