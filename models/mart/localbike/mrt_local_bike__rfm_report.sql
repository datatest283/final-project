-- Report at Monthly level

WITH customer_rfm_metrics AS (
SELECT 
    customer_id,
    store_name,
    
    -- Récence : jours depuis le dernier achat
    DATE_DIFF('2019-01-01', MAX(order_date), DAY) AS customer_recency_days,
    -- Fréquence : nombre total d'achats
    COUNT(DISTINCT order_date) AS customer_frequency,
    -- Montant : total des achats
    SUM(total_order_amount) AS customer_ltv

FROM {{ ref('int_local_bike__orders') }}
--FROM databird-final-project.local_bike_dataset.orders
GROUP BY customer_id, store_name

)

SELECT * FROM customer_rfm_metrics r