SELECT 
    brand_id,
    brand_name
FROM {{ source('local_bike_dataset', 'brands') }}