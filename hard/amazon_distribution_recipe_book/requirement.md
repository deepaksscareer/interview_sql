𝐌𝐮𝐬𝐭 𝐓𝐫𝐲: Amazon (Hard Level) hashtag#SQL Interview Question — Solution

You are given the table with titles of recipes from a cookbook and their page numbers. You are asked to represent how the recipes will be distributed in the book.

Produce a table consisting of three columns: left_page_number, left_title and right_title. The k-th row (counting from 0), should contain the number and the title of the page with the number 2×k in the first and second columns respectively, and the title of the page with the number 2×k+1 in the third column.

Each page contains at most 1 recipe. If the page does not contain a recipe, the appropriate cell should remain empty (NULL value). Page 0 (the internal side of the front cover) is guaranteed to be empty.

🌀 Trust me, this one will surely challenge you...! You'll learn self join, subquery. Give it a try and share the output! 👇

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭
CREATE TABLE cookbook_titles (page_number INT PRIMARY KEY,title VARCHAR(255));

INSERT INTO cookbook_titles (page_number, title) VALUES (1, 'Scrambled eggs'), (2, 'Fondue'), (3, 'Sandwich'), (4, 'Tomato soup'), (6, 'Liver'), (11, 'Fried duck'), (12, 'Boiled duck'), (15, 'Baked chicken');
---------

𝐄𝐱𝐩𝐥𝐚𝐧𝐚𝐭𝐢𝐨𝐧 𝐭𝐨 𝐒𝐨𝐥𝐯𝐞 𝐐𝐮𝐞𝐫𝐲
1. Subqueries for left and right pages: The LEFT_PAGES subquery filters pages with even numbers (page_number % 2 = 0) and selects their titles.
The RIGHT_PAGES subquery filters pages with odd numbers (page_number % 2 = 1) and selects their titles.

2. Joining left and right pages: A LEFT JOIN is used to pair even-numbered pages (LEFT_PAGES) with the odd-numbered pages immediately following them (RIGHT_PAGES).

2. Output columns: The query outputs the page number and title for the left page and the title for the right page.
