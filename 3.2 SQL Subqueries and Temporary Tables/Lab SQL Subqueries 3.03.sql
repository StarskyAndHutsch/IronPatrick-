Use sakila;
-- Instructions

-- How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT 
    f.title AS Film, COUNT(i.inventory_id) AS 'Inventory Count'
FROM
    film AS f
        JOIN
    inventory AS i ON f.film_id = i.film_id
WHERE
    f.title = 'Hunchback Impossible'
	group by f.film_id;


-- List all films whose length is longer than the average of all the films.

-- Use subqueries to display all actors who appear in the film Alone Trip.

SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Actors in Alone Trip'
FROM
    actor
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            film_actor
        WHERE
            film_id = (SELECT 
                    film_id
                FROM
                    film
                WHERE
                    title = 'Alone Trip'));

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

SELECT 
    f.title AS 'Movie Title'
FROM
    film AS f
        JOIN
    film_category AS fc ON fc.film_id = f.film_id
        JOIN
    category AS c ON c.category_id = fc.category_id
WHERE
    c.name = 'Family';

-- Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

	SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS 'Name',
    c.email AS 'email'
FROM
    customer AS c
        JOIN
    address AS a ON c.address_id = a.address_id
        JOIN
    city AS cy ON a.city_id = cy.city_id
        JOIN
    country AS ct ON ct.country_id = cy.country_id
WHERE
    ct.country = 'Canada';

-- Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

-- Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments