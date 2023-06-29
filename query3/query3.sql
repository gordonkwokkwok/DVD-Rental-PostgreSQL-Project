SELECT c.customer_id, c.first_name, c.last_name, p.amount 
FROM customer as c
LEFT JOIN payment as p 
ON c.customer_id = p.customer_id
ORDER BY p.amount DESC
LIMIT 10;
