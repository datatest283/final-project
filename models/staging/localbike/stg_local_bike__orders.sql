SELECT 
    order_id, --primary key
    customer_id, 
    order_status, 
    order_date, 
    -- required_date,
    shipped_date,  --manage NULL while keeping DATE format
    store_id,
    staff_id 
FROM {{ source('local_bike_dataset', 'orders') }}