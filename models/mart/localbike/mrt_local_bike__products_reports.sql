SELECT
  o.store_city,
  p.product_category_name,
  p.product_brand_name,
  p.product_name,
  
  ROUND(SUM(oi.amount_spent), 2) AS total_amount_spent,
  SUM(oi.product_quantity) AS total_qty_sold

FROM {{ ref('int_local_bike__order_items_with_metrics') }} oi
LEFT JOIN {{ ref('int_local_bike__orders_with_stores') }} o
  ON oi.order_id = o.order_id
LEFT JOIN {{ ref('int_local_bike__product_enriched') }} p
  ON p.product_id = oi.product_id
GROUP BY o.store_city, p.product_category_name, p.product_brand_name, p.product_name
