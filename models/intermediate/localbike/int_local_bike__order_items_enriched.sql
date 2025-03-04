SELECT
  oi.order_id,
  oi.product_id,
  oi.product_quantity,
  oi.total_order_item_amount,
  p.product_name,
  c.product_category_name,
  b.product_brand_name
FROM {{ ref('stg_local_bike__order_items') }} oi 
LEFT JOIN {{ ref('stg_local_bike__products') }} p ON p.product_id = oi.product_id
LEFT JOIN {{ ref('stg_local_bike__categories') }} c ON c.product_category_id = p.product_category_id
LEFT JOIN {{ ref('stg_local_bike__brands') }} b ON b.product_brand_id = p.product_brand_id
