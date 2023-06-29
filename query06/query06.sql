SELECT rating, 
       AVG(length) AS avg_length, 
       CASE 
         WHEN AVG(length) > 120 THEN 'Long'
         ELSE 'Short'
       END AS film_length_category
FROM film 
GROUP BY rating;
