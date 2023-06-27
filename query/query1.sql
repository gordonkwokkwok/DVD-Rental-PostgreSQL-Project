SELECT *
FROM actor AS a
JOIN rental AS r ON a.actor_id = r.rental_id;
