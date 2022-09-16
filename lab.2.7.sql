-- Lab | SQL Join (Part I)  ******In this lab, you will be using the Sakila database of movie rentals*******


-- 1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.category_id, COUNT(DISTINCT f.film_id)
FROM sakila.category c
INNER JOIN sakila.film_category fc
ON c.category_id = fc.category_id
INNER JOIN sakila.film f
ON f.film_id = fc.film_id
GROUP BY c.category_id;

-- 2.Display the total amount rung up by each staff member in August of 2005.

SELECT s.staff_id, SUM(p.amount)
FROM sakila.staff s
INNER JOIN sakila.payment p
ON s.staff_id = p.staff_id
WHERE payment_date LIKE "2005-08%" 
GROUP BY staff_id;

-- 3.Which actor has appeared in the most films?

SELECT actor_id,  COUNT(DISTINCT f.film_id)
FROM sakila.film f
INNER JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY actor_id
ORDER BY actor_id DESC;

-- 4.Most active customer (the customer that has rented the most number of films)

SELECT c.customer_id,  COUNT(DISTINCT r.rental_id) AS number_of_rented_film
FROM sakila.customer c
INNER JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY  c.customer_id 
ORDER BY  number_of_rented_film DESC;

-- 5.Display the first and last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address
from sakila.staff s
inner join sakila.address a
on a.address_id = s.address_id;

-- 6.List each film and the number of actors who are listed for that film.

SELECT title,  COUNT(DISTINCT fa.actor_id) AS "total_paid"
FROM sakila.film f
INNER JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.title;


-- 7.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.


SELECT c.customer_id, c.last_name, c.first_name, SUM(p.amount)
FROM sakila.customer c
INNER JOIN sakila.payment p
ON c.customer_id = p.customer_id
GROUP BY customer_id, c.first_name, c.last_name
ORDER BY c.last_name;

-- 8.List number of films per category.

SELECT c.category_id, COUNT(DISTINCT fc.film_id) AS "number_of_film"
FROM sakila.category c
INNER JOIN  sakila.film_category fc
ON c.category_id= fc.category_id
GROUP BY category_id;