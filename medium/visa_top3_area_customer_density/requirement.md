𝐌𝐮𝐬𝐭 𝐓𝐫𝐲: Visa (Medium Level) hashtag#SQL Interview Question — Solution

Identify the top 3 areas with the highest customer density. Customer density = (total number of unique customers in the area / area size).
Your output should include the area name and its calculated customer density.

🔍By solving this, you'll learn how to use Join, Group By. Give it a try and share the output! 👇

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭
CREATE TABLE transaction_records (customer_id BIGINT, store_id BIGINT, transaction_amount BIGINT, transaction_date DATETIME, transaction_id BIGINT PRIMARY KEY);

INSERT INTO transaction_records (customer_id, store_id, transaction_amount, transaction_date, transaction_id) VALUES (101, 1, 500, '2024-01-01 10:15:00', 10001), (102, 2, 1500, '2024-01-02 12:30:00', 10002), (103, 1, 700, '2024-01-03 14:00:00', 10003), (104, 3, 1200, '2024-01-04 09:45:00', 10004), (105, 2, 800, '2024-01-05 11:20:00', 10005);

CREATE TABLE stores (area_name VARCHAR(20), area_size BIGINT, store_id BIGINT PRIMARY KEY, store_location TEXT, store_open_date DATETIME);

INSERT INTO stores (area_name, area_size, store_id, store_location, store_open_date) VALUES ('Downtown', 1000, 1, 'Main Street', '2020-01-01'), ('Uptown', 1500, 2, 'Park Avenue', '2021-06-15'), ('Midtown', 1200, 3, 'Broadway', '2019-11-20'), ('Suburbs', 2000, 4, 'Elm Street', '2018-08-10');

---------

𝐄𝐱𝐩𝐥𝐚𝐧𝐚𝐭𝐢𝐨𝐧 𝐭𝐨 𝐒𝐨𝐥𝐯𝐞 𝐐𝐮𝐞𝐫𝐲
1. COUNT(DISTINCT t.customer_id) * 1.0: Ensures that the division result is a floating-point value (avoids integer division).

2. GROUP BY s.area_name, s.area_size: Groups the results by area_name and area_size.

3. ORDER BY cust_den DESC: Orders by customer density in descending order.