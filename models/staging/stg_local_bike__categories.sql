SELECT 
    category_id,
    category_name
FROM {{ source('local_bike_dataset', 'categories') }}