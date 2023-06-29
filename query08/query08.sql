SELECT MIN(length) as min_length, MAX(length) as max_length 
FROM film 
WHERE title LIKE 'A%';
