SELECT 
    category_id AS product_category_id,
    category_name AS product_category_name
FROM {{ source('local_bike_dataset', 'categories') }}