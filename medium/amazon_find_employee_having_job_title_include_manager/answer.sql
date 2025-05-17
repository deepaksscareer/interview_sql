SELECT first_name, worker_title
FROM workers wrk
JOIN titles ttl
ON wrk.worker_id = ttl.worker_ref_id
AND UPPER(worker_title) LIKE '%MANAGER%'