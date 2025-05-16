𝐌𝐮𝐬𝐭 𝐓𝐫𝐲: Meta (Hard Level) hashtag#SQL Interview Question — Solution

The sales department has given you the sales figures for the first two months of 2023. You've been tasked with determining the percentage of weekly sales on the first and last day of every week. Consider Sunday as last day of week and Monday as first day of week.

In your output, include the week number, percentage sales for the first day of the week, and percentage sales for the last day of the week. Both proportions should be rounded to the nearest whole number.

🔍By solving this, you'll learn how to use Mutiple CTEs, Joins, Group by, Agg function. Give it a try and share the output! 👇

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭
CREATE TABLE early_sales ( invoicedate DATETIME, invoiceno BIGINT, quantity BIGINT, stockcode NVARCHAR(50), unitprice FLOAT);

INSERT INTO early_sales (invoicedate, invoiceno, quantity, stockcode, unitprice) VALUES ('2023-01-01 10:00:00', 1001, 5, 'A001', 20.0), ('2023-01-01 15:30:00', 1002, 3, 'A002', 30.0), ('2023-01-02 09:00:00', 1003, 10, 'A003', 15.0), ('2023-01-02 11:00:00', 1004, 2, 'A004', 50.0), ('2023-01-08 10:30:00', 1005, 4, 'A005', 25.0), ('2023-01-08 14:45:00', 1006, 7, 'A006', 18.0), ('2023-01-15 08:00:00', 1007, 6, 'A007', 22.0), ('2023-01-15 16:00:00', 1008, 8, 'A008', 12.0), ('2023-01-22 09:30:00', 1009, 3, 'A009', 40.0), ('2023-01-22 18:00:00', 1010, 5, 'A010', 35.0), ('2023-02-01 10:00:00', 1011, 9, 'A011', 20.0), ('2023-02-01 12:00:00', 1012, 2, 'A012', 60.0), ('2023-02-05 09:30:00', 1013, 4, 'A013', 25.0), ('2023-02-05 13:00:00', 1014, 6, 'A014', 18.0), ('2023-02-12 10:00:00', 1015, 7, 'A015', 22.0), ('2023-02-12 14:00:00', 1016, 5, 'A016', 28.0);

---------

𝐄𝐱𝐩𝐥𝐚𝐧𝐚𝐭𝐢𝐨𝐧 𝐭𝐨 𝐒𝐨𝐥𝐯𝐞 𝐐𝐮𝐞𝐫𝐲
1. WeeklySales: This CTE calculates the total sales for each week by summing up the quantity * unitprice for every transaction in the given time frame (2023-01-01 to 2023-02-28). It groups by the week number (extracted from invoicedate using DATEPART).

2. SalesByDay: This CTE calculates the daily sales for each week. It groups by both the week number and the day of the week (extracted from invoicedate). The day_of_week for Monday is 1 and for Sunday is 7.

3. FirstAndLastDaySales: This CTE calculates the sales for Monday and Sunday of each week using conditional aggregation (CASE WHEN). It ensures that sales for Monday and Sunday are correctly captured for each week.
