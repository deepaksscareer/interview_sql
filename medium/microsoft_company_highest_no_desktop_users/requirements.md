Write a query that returns the company (customer id column) with highest number of users that use desktop only.

🔍 Definitely you are going to enjoy by solving this, you'll learn how to use cte, subquery. Give it a try and share the output! 👇

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭
CREATE TABLE fact_events (id INT PRIMARY KEY, time_id DATETIME, user_id VARCHAR(50), customer_id VARCHAR(50), client_id VARCHAR(50), event_type VARCHAR(50), event_id INT);

INSERT INTO fact_events (id, time_id, user_id, customer_id, client_id, event_type, event_id) VALUES  (1, '2024-12-01 10:00:00', 'U1', 'C1', 'desktop', 'click', 101), (2, '2024-12-01 11:00:00', 'U2', 'C1', 'mobile', 'view', 102), (3, '2024-12-01 12:00:00', 'U3', 'C2', 'desktop', 'click', 103), (4, '2024-12-01 13:00:00', 'U1', 'C1', 'desktop', 'click', 104), (5, '2024-12-01 14:00:00', 'U2', 'C1', 'tablet', 'view', 105), (6, '2024-12-01 15:00:00', 'U4', 'C3', 'desktop', 'click', 106), (7, '2024-12-01 16:00:00', 'U3', 'C2', 'desktop', 'click', 107), (8, '2024-12-01 17:00:00', 'U5', 'C4', 'desktop', 'click', 108), (9, '2024-12-01 18:00:00', 'U6', 'C4', 'mobile', 'view', 109), (10, '2024-12-01 19:00:00', 'U7', 'C5', 'desktop', 'click', 110);

---------

𝐄𝐱𝐩𝐥𝐚𝐧𝐚𝐭𝐢𝐨𝐧 𝐭𝐨 𝐒𝐨𝐥𝐯𝐞 𝐐𝐮𝐞𝐫𝐲
1. Group by customer_id and user_id:
Count distinct client_id values for each user and customer combination.
Count how many client_id values are specifically desktop.

2. The subquery immediately feeds into the main query to group by customer_id and calculate the desktop_only_user_count.