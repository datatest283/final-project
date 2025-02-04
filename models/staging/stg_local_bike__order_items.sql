SELECT 
    CONCAT(order_id, '_' , item_id) AS order_item_id,
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount,
    ((quantity * list_price) * (1 - discount)) AS total_order_item_amount
FROM {{ source('local_bike_dataset', 'order_items') }}