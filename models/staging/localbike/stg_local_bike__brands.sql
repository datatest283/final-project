SELECT 
    brand_id AS product_brand_id,
    brand_name AS product_brand_name
FROM {{ source('local_bike_dataset', 'brands') }}