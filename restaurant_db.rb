CREATE TABLE foods(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
description TEXT NOT NULL,
price INT NOT NULL,
allergens BOOLEAN NOT NULL,
created_at TIMESTAMP,
updated_at TIMESTAMP);

CREATE TABLE parties(
id SERIAL PRIMARY KEY,
people INT NOT NULL,
paid BOOLEAN NOT NULL,
created_at TIMESTAMP,
updated_at TIMESTAMP);

CREATE TABLE orders(
id SERIAL PRIMARY KEY,
party_id INT NOT NULL,
food_id INT NOT NULL,
created_at TIMESTAMP,
updated_at TIMESTAMP);

SELECT orders.partys_id, sum(foods.price) 
FROM orders JOIN foods 
ON foods_id=orders.foods_id
GROUP BY orders.partys_id 
ORDER BY orders.partys_id ASC; 

	

