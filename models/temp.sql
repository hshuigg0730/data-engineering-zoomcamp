select count(*) from {{ ref('fct_monthly_zone_revenue') }}
-- 12184



SELECT 
    total_monthly_trips, 
    SUM(revenue_monthly_total_amount) AS total_revenue
FROM {{ ref('fct_monthly_zone_revenue') }}
WHERE service_type = 'Green' 
    AND EXTRACT(YEAR FROM revenue_month) = 2020
GROUP BY pickup_zone
ORDER BY total_revenue DESC
-- East Harlem North 1816746.25

SELECT 
    SUM(total_monthly_trips) AS total_trips
FROM {{ ref('fct_monthly_zone_revenue') }}
WHERE service_type = 'Green'
    AND revenue_month = '2019-10-01' 
-- 384624
