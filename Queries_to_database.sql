/*
Query that displays the restaurant name, its address (street number and name) 
and telephone number
*/
SELECT restaurant.name, address.street_name,restaurant.telephone
FROM restaurant
JOIN address
ON restaurant.id = address.restaurant_id;

/*
Query to get the best rating the restaurant ever received. 
Display the rating as best_rating
*/
SELECT  MAX(review.rating) AS best_rating,restaurant.name
FROM review
JOIN restaurant
ON review.resteurant_id = restaurant.id
GROUP BY restaurant.name;

/*
Query to display a dish name, its price and category sorted by the dish name
*/
SELECT dish.name AS dish_name,category.name AS category_name,categories_dishes.price
FROM dish
JOIN categories_dishes
ON dish.id = categories_dishes.dish_id
JOIN category
ON category.id = categories_dishes.category_id;

/*
New query to display the results, sorted by category name.
*/
SELECT category.name AS category_name, dish.name AS dish, categories_dishes.price
FROM category
JOIN categories_dishes
ON category.id = categories_dishes.category_id
JOIN dish
ON categories_dishes.dish_id = dish.id;

/*
Query in that displays all the spicy dishes, their prices and category
*/
SELECT dish.name AS spicy_dish, category.name AS category_name, categories_dishes.price
FROM dish
JOIN categories_dishes
ON dish.id = categories_dishes.dish_id
JOIN category
ON category.id = categories_dishes.category_id
WHERE hot_and_spicy = true;

/*
Query that displays the dish_id and COUNT(dish_id) as dish_count 
from the categories_dishes table
*/
SELECT categories_dishes.dish_id, COUNT(categories_dishes.dish_id) AS dish_count
FROM categories_dishes
GROUP BY categories_dishes.dish_id;

/*
Query to display only the dish(es) from the categories_dishes table 
which appears more than once
*/
SELECT categories_dishes.dish_id, COUNT(categories_dishes.dish_id) AS dish_count
FROM categories_dishes
GROUP BY categories_dishes.dish_id
HAVING COUNT(categories_dishes.dish_id) > 1;

/*
Query that incorporates multiple tables that display the dish name as dish_name 
and dish count as dish_count
*/
SELECT dish.name AS dish_name, COUNT(categories_dishes.dish_id) AS dish_count
FROM dish
JOIN categories_dishes
ON dish.id = categories_dishes.dish_id
GROUP BY dish.name
HAVING COUNT(categories_dishes.dish_id) > 1;

/*
Query that displays the best rating as best_rating and the description too
*/
SELECT review.rating AS best_rating, restaurant.name, review.description
FROM review
JOIN restaurant
ON review.resteurant_id = restaurant.id
ORDER BY review.rating DESC
LIMIT 1 ;