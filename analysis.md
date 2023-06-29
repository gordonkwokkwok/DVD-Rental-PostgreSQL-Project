# ⭐️SQL Analysis of DVD Rental Database
The following set of 10 diverse SQL queries provides an in-depth analysis of a DVD rental database. The queries cover various aspects of the business, including customer behaviors, film properties, rental patterns, and staff performance.

In addition, for a more in-depth view and to facilitate better comprehension, the results of each query are extracted and stored as csv files in the "query" folder. Each file corresponds to the respective query, allowing readers to explore the data in a more familiar format, aiding in data interpretation, and making it easier to generate insights or perform further analysis.

<br>

**1. SELECT and WHERE**

```
SELECT first_name, last_name FROM actor WHERE first_name = 'Johnny';
```

This query retrieves the first and last names of actors whose first name is 'Johnny'. It helps identify actors who share the same first name in the database.

<br>

**2. INNER JOIN and GROUP BY**

```
SELECT film.title, COUNT(actor.actor_id) as actor_count
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY film.title;
```

This query determines the number of actors in each film. It can provide insights into movies with large or small casts.

<br>

**3. LEFT JOIN and LIMIT**

```
SELECT customer.customer_id, customer.first_name, customer.last_name, payment.amount
FROM customer
LEFT JOIN payment ON customer.customer_id = payment.customer_id
ORDER BY payment.amount DESC
LIMIT 10;
```

This query identifies the top 10 customers who have made the largest payments. This can be useful in identifying high-spending customers.

<br>

**4. COUNT, BETWEEN, AND ORDER BY**

```
SELECT customer_id , count(*) AS Rental_Count
FROM rental
WHERE rental_date BETWEEN '2005-07-01' AND '2005-08-31'
GROUP BY customer_id
ORDER BY Rental_Count DESC;
```

This query calculates the number of rentals each customer made during the summer holiday (July and August) of 2005. It can help identify trends or customer habits during holiday periods.

<br>

**5. DISTINCT, IN**

```
SELECT DISTINCT customer_id
FROM rental
WHERE customer_id IN (SELECT customer_id FROM payment WHERE amount > 10);
```

This query identifies unique customers who have made payments exceeding 10 units. This can be useful to target customers who regularly make substantial payments.

<br>

**6. CASE Statement**

```
SELECT rating, 
       AVG(length) AS avg_length, 
       CASE 
         WHEN AVG(length) > 120 THEN 'Long'
         ELSE 'Short'
       END AS film_length_category
FROM film 
GROUP BY rating;

```

This query calculates the average length of films for each rating category, and classifies them into 'Long' or 'Short' categories based on whether their average length is greater than 120 minutes. This can be used to categorize films based on their average length and rating.

<br>

**7. Window Function**

```
SELECT rental_id, customer_id, rental_date, 
       RANK() OVER (PARTITION BY customer_id ORDER BY rental_date) as rental_rank
FROM rental;

```

This query assigns a rank to each rental for a specific customer, based on the rental date. The earliest rental gets the lowest rank. This can be used to understand rental patterns of customers, such as the frequency and timing of their rentals.

<br>

**8. MIN, MAX, LIKE with Wildcard Characters % and _**

```
SELECT MIN(length) as min_length, MAX(length) as max_length
FROM film
WHERE title LIKE 'A%';
```

This query determines the shortest and longest films that start with 'A'. This could be useful in understanding the range of film lengths in a certain category.

<br>

**9. RIGHT JOIN, ORDER BY ASC OR DESC**

```
SELECT customer.customer_id, customer.first_name, customer.last_name, rental.rental_id
FROM customer
RIGHT JOIN rental ON customer.customer_id = rental.customer_id
ORDER BY rental.rental_date DESC;
```

This query lists all rentals and, for each rental, the corresponding customer details, sorted by the most recent rental. This helps analyze rental trends and active customers.

<br>

**10. CROSS JOIN, LIMIT**

```
SELECT film.title, category.name
FROM film
CROSS JOIN category
LIMIT 100;
```

This query returns a combination of every film title with every category name, limiting the results to the first 100 records
