𝐌𝐮𝐬𝐭 𝐓𝐫𝐲: Amazon (Hard Level) hashtag#SQL Interview Question — Solution

You have been asked to find the fifth highest salary without using TOP or LIMIT. 
Note: Duplicate salaries should not be removed.

🔍By solving this, you'll learn how to use CTE and Windows function. Give it a try and share the output! 👇

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭
CREATE TABLE com_worker ( worker_id BIGINT PRIMARY KEY, department VARCHAR(25), first_name VARCHAR(25), last_name VARCHAR(25), joining_date DATETIME, salary BIGINT);

INSERT INTO com_worker (worker_id, department, first_name, last_name, joining_date, salary) VALUES  (1, 'HR', 'John', 'Doe', '2020-01-15', 50000), (2, 'IT', 'Jane', 'Smith', '2019-03-10', 60000), (3, 'Finance', 'Emily', 'Jones', '2021-06-20', 75000), (4, 'Sales', 'Michael', 'Brown', '2018-09-05', 60000), (5, 'Marketing', 'Chris', 'Johnson', '2022-04-12', 70000), (6, 'IT', 'David', 'Wilson', '2020-11-01', 80000), (7, 'Finance', 'Sarah', 'Taylor', '2017-05-25', 45000), (8, 'HR', 'James', 'Anderson', '2023-01-09', 65000), (9, 'Sales', 'Anna', 'Thomas', '2020-02-18', 55000), (10, 'Marketing', 'Robert', 'Jackson', '2021-07-14', 60000);
---------

𝐄𝐱𝐩𝐥𝐚𝐧𝐚𝐭𝐢𝐨𝐧 𝐭𝐨 𝐒𝐨𝐥𝐯𝐞 𝐐𝐮𝐞𝐫𝐲
1. DENSE_RANK(): This function assigns a rank to each row, starting from 1 for the highest salary. It assigns the same rank to duplicate values, but there won't be gaps in the rank numbers.

2. ORDER BY salary DESC: The salaries are ordered in descending order, so the highest salary gets rank 1.

3. WHERE rank = 5: Filters the result to get the row with rank 5, which corresponds to the fifth highest salary.