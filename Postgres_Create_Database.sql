CREATE TABLE restaurant (
   id integer PRIMARY KEY,
   name varchar(20),
   description varchar(100),
   rating decimal,
   telephone char(10),
   hours varchar(100)
);

CREATE TABLE address(
   id integer PRIMARY KEY,
   restaurant_id integer REFERENCES restaurant(id) UNIQUE,
   street_number varchar(10),
   street_name varchar(20),
   city varchar(20),
   state varchar(15),
   google_map_link Varchar(50)
);

SELECT constraint_name,column_name
FROM information_schema.key_column_usage
WHERE table_name = 'restaurant';

SELECT constraint_name , column_name
FROM information_schema.key_column_usage
WHERE table_name = 'address';

CREATE TABLE category (
  id char(2) PRIMARY KEY,
  name varchar(20),
  description varchar(200)
);

SELECT constraint_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'category';

CREATE TABLE dish(
  id integer PRIMARY KEY,
  name varchar(50),
  description varchar(200),
  hot_and_spicy boolean
);

SELECT constraint_name,column_name
FROM information_schema.key_column_usage
WHERE table_name = 'dish';

CREATE TABLE review (
  id integer PRIMARY KEY,
  resteurant_id integer REFERENCES restaurant(id),
  rating decimal,
  description varchar(100),
  date date
);

SELECT constraint_name,column_name
FROM information_schema.key_column_usage
WHERE table_name = 'review';

CREATE TABLE categories_dishes (
   price money,
   category_id char(2) REFERENCES category(id),
   dish_id integer REFERENCES dish(id),
   PRIMARY KEY(category_id,dish_id)
);

SELECT constraint_name,column_name
FROM information_schema.key_column_usage
WHERE table_name = 'categories_dishes';






/* 
 *--------------------------------------------
 Insert values for restaurant
 *--------------------------------------------
 */
INSERT INTO restaurant VALUES (
  1,
  'Iro Sushi',
  'Japaneese restaurant',
  4.0,
  '07943564',
  '10.00-22.00'
  
);

/* 
 *--------------------------------------------
 Insert values for address
 *--------------------------------------------
 */
INSERT INTO address VALUES (
  1,
  1,
  '2020',
  'Busy Street',
  'Chinatown',
  'MA',
  'http://bit.ly/BytesOfChina'
  
);

/* 
 *--------------------------------------------
 Insert values for review
 *--------------------------------------------
 */
INSERT INTO review VALUES (
  1,
  1,
  5.0,
  'Would love to host another birthday party at Bytes of China!',
  '05-22-2020'
  
);

INSERT INTO review VALUES (
  2,
  1,
  4.5,
  'Other than a small mix-up, I would give it a 5.0!',
  '04-01-2020'
  
);

INSERT INTO review VALUES (
  3,
  1,
  3.9,
  'A reasonable place to eat for lunch, if you are in a rush!',
  '03-15-2020'
  
);

/* 
 *--------------------------------------------
 Insert values for category
 *--------------------------------------------
 */
INSERT INTO category VALUES (
  'C',
  'Chicken',
  null
);

INSERT INTO category VALUES (
  'LS',
  'Luncheon Specials',
  'Served with Hot and Sour Soup or Egg Drop Soup and Fried or Steamed Rice  between 11:00 am and 3:00 pm from Monday to Friday.'
);

INSERT INTO category VALUES (
  'HS',
  'House Specials',
  null
);

/* 
 *--------------------------------------------
 Insert values for dish
 *--------------------------------------------
 */
INSERT INTO dish VALUES (
  1,
  'Chicken with Broccoli',
  'Diced chicken stir-fried with succulent broccoli florets',
  false
);

INSERT INTO dish VALUES (
  2,
  'Sweet and Sour Chicken',
  'Marinated chicken with tangy sweet and sour sauce together with pineapples and green peppers',
  false
);

INSERT INTO dish VALUES (
  3,
  'Chicken Wings',
  'Finger-licking mouth-watering entree to spice up any lunch or dinner',
  true
);

INSERT INTO dish VALUES (
  4,
  'Beef with Garlic Sauce',
  'Sliced beef steak marinated in garlic sauce for that tangy flavor',
  true
);

INSERT INTO dish VALUES (
  5,
  'Fresh Mushroom with Snow Peapods and Baby Corns',
  'Colorful entree perfect for vegetarians and mushroom lovers',
  false
);

INSERT INTO dish VALUES (
  6,
  'Sesame Chicken',
  'Crispy chunks of chicken flavored with savory sesame sauce',
  false
);

INSERT INTO dish VALUES (
  7,
  'Special Minced Chicken',
  'Marinated chicken breast sauteed with colorful vegetables topped with pine nuts and shredded lettuce.',
  false
);

INSERT INTO dish VALUES (
  8,
  'Hunan Special Half & Half',
  'Shredded beef in Peking sauce and shredded chicken in garlic sauce',
  true
);

/*
 *--------------------------------------------
 Insert valus for cross-reference table, categories_dishes
 *--------------------------------------------
 */
INSERT INTO categories_dishes VALUES (
  6.95,
  'C',
  1
  
);

INSERT INTO categories_dishes VALUES (
  6.95,
  'C',
  3
  
);

INSERT INTO categories_dishes VALUES (
  8.95,
  'LS',
  1
  
);

INSERT INTO categories_dishes VALUES (
  8.95,
  'LS',
  4
  
);

INSERT INTO categories_dishes VALUES (
  8.95,
  'LS',
  5
  
);

INSERT INTO categories_dishes VALUES (
  15.95,
  'HS',
  6
  
);

INSERT INTO categories_dishes VALUES (
  16.95,
  'HS',
  7
  
);

INSERT INTO categories_dishes VALUES (
  17.95,
  'HS',
  8
  
);


