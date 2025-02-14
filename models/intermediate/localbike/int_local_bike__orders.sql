with order_item_grouped_by_order as (

select
    order_item_id,
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    shipped_date,
    store_id,
    staff_id,
    sum(total_order_item_amount) as total_order_amount,
    sum(quantity) as total_items,
    count(distinct product_id) as total_distinct_items
from {{ ref('stg_local_bike__order_items') }}
group by 
    order_item_id,
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    shipped_date,
    store_id,
    staff_id,

),

select oi.order_id,
    oi.customer_id,
    oi.order_status,
    oi.order_date,
    store_id,
    staff_id,
    coalesce(oi.total_order_amount, 0) as total_order_amount,
    coalesce(oi.total_items, 0) as total_items,
    coalesce(oi.total_distinct_items, 0) as total_distinct_items
from order_item_grouped_by_order as oi 
