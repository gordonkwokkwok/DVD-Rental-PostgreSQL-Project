SELECT DISTINCT customer_id 
FROM rental 
WHERE customer_id IN (SELECT customer_id FROM payment WHERE amount > 10);
