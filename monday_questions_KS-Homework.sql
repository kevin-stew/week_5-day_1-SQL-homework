-- 1. How many actors are there with the last name ‘Wahlberg’?  --->  
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'Wahlberg';
-- ANSWER: 2

-- 2. How many payments were made between $3.99 and $5.99?  
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- ANSWER: 5607  

-- 3. What film does the store have the most of? (search in inventory) --->  ANSWER: the store has 8 copies of 72 different films 
SELECT *
FROM inventory;

SELECT film_id, COUNT(*) AS value_occurrence 
FROM inventory 
GROUP BY film_id 
ORDER BY value_occurrence DESC
LIMIT 75;
--ANSWER: the store has 8 copies of 72 different films 


-- 4. How many customers have the last name ‘William’?
SELECT *
FROM customer;

SELECT last_name, first_name
FROM customer
WHERE last_name LIKE 'Williams';
-- ANSWER: 0
-- (BUT 1 has 'William' as a first name)
-- (AND 1 has 'Williams' as a last name)


-- 5. What store employee (get the id) sold the most rentals?  --->  ANSWER: staff_id = 1  
SELECT *
FROM rental;

SELECT COUNT(rental_id), staff_id
FROM rental
GROUP BY staff_id;
-- ANSWER: staff_id = 1 


-- 6. How many different district names are there? ---> ANSWER:  378    
SELECT *
FROM rental;

SELECT COUNT(DISTINCT district)
FROM address;
-- ANSWER:  378    


-- 7. What film has the most actors in it? (use film_actor table and get film_id) 
SELECT *
FROM film_actor;

SELECT  film_id, COUNT(actor_id) AS total_actors
FROM film_actor 
GROUP BY film_id
ORDER BY total_actors DESC;
-- ANSWER: film_id 508  


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)  
SELECT *
FROM customer;

SELECT first_name, last_name, store_id
FROM customer
WHERE last_name LIKE '%es'
ORDER BY store_id DESC;

SELECT COUNT(last_name) AS es_last_name, store_id
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id;
-- ANSWER: 13'es' last names at store_id = 1


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  
-- with ids between 380 and 430? (use group by and having > 250) 
SELECT *
FROM payment;

SELECT amount, COUNT( amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount 
HAVING COUNT(amount) > 250
ORDER BY amount;
-- ANSWER: 3 different amounts: 0.99, 2.99, 4.99


-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total? 
SELECT *
FROM film;

SELECT COUNT(DISTINCT rating)
FROM film;

SELECT COUNT(DISTINCT film_id), rating 
FROM film
GROUP BY rating;
-- ANSWER: 5 different rating categories, PG-13 has the most films. 
