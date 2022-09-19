USE sakila;
-- Activity 1

-- Drop column picture from staff.
SELECT 
    *
FROM
    staff;

ALTER TABLE staff
DROP COLUMN picture;

SELECT 
    *
FROM
    staff;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff(staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
VALUES (3, 'Tammy', 'Sanders', '79', 'tammy@sakilastaff.com', '2', '1', 'tammy', 'secret', now());

SELECT * FROM staff;

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 
-- 1. You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
-- select customer_id from sakila.customer
-- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- Use similar method to get inventory_id, film_id, and staff_id.

SELECT 
    *
FROM
    sakila.customer
WHERE
    first_name = 'CHARLOTTE'
        AND last_name = 'HUNTER';

SELECT 
    *
FROM
    sakila.film
WHERE
    title = 'Academy Dinosaur';

SELECT 
    *
FROM
    sakila.inventory
WHERE
    inventory_id = '1';

INSERT INTO rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (1, now(), 1, 130, now(), 1, now());

SELECT 
    *
FROM
    sakila.rental
WHERE
    customer_id = 130;
