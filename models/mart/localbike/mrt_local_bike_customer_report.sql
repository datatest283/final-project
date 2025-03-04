SELECT
    customer_id,
    store_name,
    total_orders,
    total_order_amount,
    total_items,
    total_distinct_items,
    customer_recency_days
  
FROM {{ ref('int_local_bike__customer_enriched') }}
