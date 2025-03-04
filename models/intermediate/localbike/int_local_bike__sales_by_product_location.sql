SELECT
  o.store_city,
  o.store_name,
  i.product_id,
  i.product_name,
  i.product_category_name,
  i.product_brand_name,
  i.product_quantity,
  i.total_order_item_amount,
  o.order_date
FROM {{ ref('int_local_bike__orders_enriched') }} o
JOIN {{ ref('int_local_bike__order_items_enriched') }} i ON o.order_id = i.order_id
