WITH terr_count AS (
    SELECT territory_id, COUNT(DISTINCT cust_id) AS total_cust
    FROM map_customer_territory
    GROUP BY territory_id
),
max_cust_count AS (
    SELECT MAX(total_cust) AS max_cost
    FROM terr_count
),
total_cust_count AS (
    SELECT emp.empl_id, total_cust
    FROM terr_count terr
    JOIN map_employee_territory emp
    ON emp.territory_id = terr.territory_id

    JOIN max_cust_count max_cnt
    ON total_cust = max_cost
)
SELECT *
FROM total_cust_count