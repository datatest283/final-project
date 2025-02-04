SELECT 
    customer_id, 
    first_name, 
    last_name, 
    phone, 
    email, 
    street, 
    city, 
    state, 
    zip_code 
FROM {{ source('local_bike_dataset', 'customers') }}