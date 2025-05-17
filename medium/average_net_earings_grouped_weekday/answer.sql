SELECT
	trim(to_char(customer_placed_order_datetime, 'Day')) AS week_day,
	EXTRACT(hour from customer_placed_order_datetime) AS given_hour,
	AVG(order_total + tip_amount - discount_amount - refunded_amount) AS net_earnings
FROM doordash_delivery
GROUP BY
trim(to_char(customer_placed_order_datetime, 'Day')),
EXTRACT(hour from customer_placed_order_datetime)