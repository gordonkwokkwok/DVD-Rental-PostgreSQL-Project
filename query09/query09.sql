SELECT customer.customer_id, customer.first_name, customer.last_name, rental.rental_id 
FROM customer 
RIGHT JOIN rental ON customer.customer_id = rental.customer_id 
ORDER BY rental.rental_date DESC;
