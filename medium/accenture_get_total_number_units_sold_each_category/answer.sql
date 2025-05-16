WITH total_rev AS (
	SELECT product_id, SUM(COALESCE(quantity, 0)) AS total_units_sold
	FROM marketing_campaign
	GROUP BY product_id
)
SELECT
	product_id,
	total_units_sold,
	CASE WHEN total_units_sold >= 30 THEN 'Outstanding'
	WHEN total_units_sold >= 20 AND total_units_sold <= 29 THEN 'Satisfactory'
	WHEN total_units_sold >= 10 AND total_units_sold <= 19 THEN 'Unsatisfactory'
	WHEN total_units_sold >= 1 AND total_units_sold <= 9 THEN 'Poor'
	ELSE 'No Sales' END AS ad_performance
FROM total_rev
ORDER BY total_units_sold DESC