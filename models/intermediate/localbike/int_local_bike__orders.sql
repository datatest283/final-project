WITH order_item_grouped_by_order AS (

SELECT
    order_id,
    order_item_id,

    sum(total_order_item_amount) AS total_order_amount,
    sum(product_quantity) AS total_items_by_order,
    count(DISTINCT product_id) AS total_distinct_items_by_order
    
FROM {{ ref('stg_local_bike__order_items') }}
GROUP BY 
    order_item_id,
    order_id
)

SELECT 
    oi.order_id,
    o.order_date,
    o.customer_id,
    s.store_name,
    
    coalesce(oi.total_order_amount, 0) AS total_order_amount,
    coalesce(oi.total_items_by_order, 0) AS total_items_by_order,
    coalesce(oi.total_distinct_items_by_order, 0) AS total_distinct_items_by_order
FROM order_item_grouped_by_order AS oi
LEFT JOIN {{ ref('stg_local_bike__orders') }} AS o ON o.order_id = oi.order_id
LEFT JOIN {{ ref('stg_local_bike__stores') }} AS s ON s.store_id = o.store_id



