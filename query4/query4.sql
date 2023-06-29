SELECT customer_id , count(*) AS Rental_Count
FROM rental
WHERE rental_date BETWEEN '2005-07-01' AND '2005-08-31' 
GROUP BY customer_id 
ORDER BY Rental_Count DESC;

