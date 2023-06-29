(SELECT address_id FROM address)
UNION
(SELECT address_id FROM store)
ORDER BY address_id ASC;
