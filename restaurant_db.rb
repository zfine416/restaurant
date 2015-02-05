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
partys_id INT NOT NULL,
foods_id INT NOT NULL,
created_at TIMESTAMP,
updated_at TIMESTAMP);

	

