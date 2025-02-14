SELECT 
    store_id, 
    store_name, 
    -- phone, 
    -- email, 
    -- street, 
    city AS store_city, 
    state AS store_state, 
    zip_code AS store_zip_code
FROM {{ source('local_bike_dataset', 'stores') }}