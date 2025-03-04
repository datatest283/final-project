SELECT 
    staff_id,
    CONCAT(first_name, "_", last_name) as staff_full_name,
    store_id,
    manager_id AS staff_manager_id

    -- first_name,
    -- last_name,
    -- email,
    -- phone,
    -- active,

FROM {{ source('local_bike_dataset', 'staffs') }}