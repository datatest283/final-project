SELECT
  store_city,
  product_category_name,
  product_brand_name,
  product_name,
  ROUND(SUM(total_order_item_amount), 2) AS total_amount_spent,
  SUM(product_quantity) AS total_qty_sold
FROM {{ ref('int_local_bike__sales_by_product_location') }}
GROUP BY store_city, product_category_name, product_brand_name, product_name