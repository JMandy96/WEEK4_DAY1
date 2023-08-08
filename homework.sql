-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- ANSWER: 2 actors

-- 2. How many payments were made between $3.99 and $5.99?
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--ANSWER: 2 payments

-- 3. What film does the store have the most of? (search in inventory)
SELECT COUNT(inventory_id), film_id
FROM inventory
GROUP BY film_id
ORDER BY COUNT(inventory_id) DESC;

--ANSWER: There are several films that have 8 copies in inventory



-- 4. How many customers have the last name ‘William’?
SELECT last_name
FROM customer
WHERE last_name LIKE 'William%';

--ANSWER: none, there is a williams and williamson though.

-- 5. What store employee (get the id) sold the most rentals?
SELECT DISTINCT staff_id, COUNT(rental_id)
FROM payment
GROUP BY staff_id;

--ANSWER: employee # 2

-- 6. How many different district names are there?
SELECT count(district)
FROM address;

--ANSWER: 603 disctricts

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT count(actor_id), film_id
FROM film_actor
GROUP BY film_id
ORDER BY count(actor_id) DESC;

--ANSWER: film_id 508 has the most actors at 15 actors.


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT count(last_name), store_id
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1
GROUP BY store_id;

--ANSWER: store 1 has 13 people with names ending in 'es'.



-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(rental_id), COUNT(customer_id)
FROM payment
WHERE rental_id > 250 AND customer_id BETWEEN 380 and 430
GROUP BY amount;

--ANSWER 11 payment amounts.

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;

-- ANSWER: There is a total of 5 different ratings, with most movies being rated PG-13