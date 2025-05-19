
WITH order_month_total AS (
	SELECT 
		DATE_TRUNC('month', created_at)::date AS order_month,
        SUM(purchase_amt) AS total_purchase
    FROM amazon_purchases
    WHERE purchase_amt > 0
	GROUP BY DATE_TRUNC('month', created_at)::date
),
month_range AS (
	SELECT MIN(order_month) AS min_order_month,
		MAX(order_month) AS max_order_month
	FROM order_month_total
),
month_series AS (
	SELECT generate_series(min_order_month, max_order_month, interval '1 month') as month_range 
	FROM month_range
),
monthly_total aS (
	SELECT month_all.month_range AS order_month,
		COALESCE(total_purchase, 0) AS total_purchase
	FROM month_series month_all
	LEFT JOIN order_month_total month_total
	ON month_all.month_range = month_total.order_month
)
SELECT
	TO_CHAR(order_month, 'YYYY-MM') AS order_month,
	AVG(total_purchase) OVER (ORDER BY order_month ASC ROWS 
							  BETWEEN 2 PRECEDING AND CURRENT ROW) AS three_month_rolling_avg
FROM monthly_total
ORDER BY order_month ASC
