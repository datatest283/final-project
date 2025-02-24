SELECT
  o.order_id,
  s.store_city,
  s.store_name,

FROM {{ ref('stg_local_bike__orders') }} o
LEFT JOIN {{ ref('stg_local_bike__stores') }} s ON s.store_id = o.store_id