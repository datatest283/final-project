SELECT 
    store_id, 
    store_name,
    city AS store_city
    -- phone, 
    -- email, 
    -- street, 
    -- state AS store_state, 
    -- zip_code AS store_zip_code
FROM {{ source('local_bike_dataset', 'stores') }}