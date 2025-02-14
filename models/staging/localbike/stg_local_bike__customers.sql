SELECT 
    customer_id, 
    CONCAT(first_name, "_", last_name) AS customer_full_name,
    city AS customer_city, 
    state AS customer_state, 
    zip_code AS customer_zipcode

    -- first_name, 
    -- last_name,
    -- phone, 
    -- email, 
    -- street, 
FROM {{ source('local_bike_dataset', 'customers') }}