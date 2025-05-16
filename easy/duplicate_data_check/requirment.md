Duplicate data flooding your data pipeline?

Luckily, SQL’s ROW_NUMBER() can be that "Flex Tape" solution you need to quickly identify and handle duplicate data.

Duplicate rows pouring into your pipelines, reports breaking, and queries grinding to a halt.

🔧 How does it help?

By assigning a unique number to rows within partitions of your data, you can:
1. Identify duplicates
2. Retain only the "first occurrence"
3. Clean up your dataset and keep your data healthy

Here’s an example:

WITH RankedData AS ( 
 SELECT *, 
 ROW_NUMBER() OVER (PARTITION BY column_you_want_to_deduplicate ORDER BY created_at) AS row_num 
 FROM your_table 
) 
SELECT * 
FROM RankedData 
WHERE row_num = 1; 

How do you handle duplicate data in your pipelines? Share your favourite tricks below! 👇