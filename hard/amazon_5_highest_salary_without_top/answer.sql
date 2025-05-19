WITH source_sal AS (
	--Without TOP or LIMIT, use DENSE_RANK
	SELECT
		salary,
		DENSE_RANK() OVER(ORDER BY salary DESC)
	FROM com_worker
)
SELECT DISTINCT salary
FROM source_sal
WHERE dense_rank = 5
