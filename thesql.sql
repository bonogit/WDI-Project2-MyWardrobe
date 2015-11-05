create database mywardrobe;

create TABLE users
  (
    id SERIAL4 PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(50),
    password_digest VARCHAR(100)
  );

INSERT INTO users (username,email) VALUES ('bono','bono@gmail.com');
INSERT INTO users (username,email) VALUES ('admin','admin@gmail.com');

CREATE TABLE garments
(
  id SERIAL4 PRIMARY KEY,
  garment_name VARCHAR(150),
  location VARCHAR(100),
  status VARCHAR(50),
  brand VARCHAR(100),
  size VARCHAR(20),
  buy_value money,
  buy_currency VARCHAR(20),
  sold_value money,
  sold_currency VARCHAR(20),
  buy_date date,
   record_date date,
  user_id VARCHAR(50),
  image_id VARCHAR(50),
  image_url VARCHAR(200),
  category_id INTEGER,
  description VARCHAR(500)
);

INSERT INTO garments (garment_name,location,status,brand,size,buy_value,buy_currency,image_url)
 VALUES ('shirt top 1','wardrobe','in stock','A&F','m',40,'USD','/images/84329248.jpg');
INSERT INTO garments (garment_name,location,status,brand,size,buy_value,buy_currency,image_url)
 VALUES ('shirt top 2','wardrobe','in stock','polo','m',50,'AUD','/images/120552695.jpg');
INSERT INTO garments (garment_name,location,status,brand,size,buy_value,buy_currency,image_url)
 VALUES ('shirt top 3','drawer','in stock','levis','s',30,'AUD','/images/147988811.jpg');
ALTER TABLE garments DROP COLUMN category_id; 

CREATE TABLE categories
(
  id SERIAL4 PRIMARY KEY,
  lvl1 VARCHAR(50)
);

INSERT INTO categories (lvl1) VALUES ('top');
INSERT INTO categories (lvl1) VALUES ('outwear');
INSERT INTO categories (lvl1) VALUES ('dress');
INSERT INTO categories (lvl1) VALUES ('pant');
INSERT INTO categories (lvl1) VALUES ('short');
INSERT INTO categories (lvl1) VALUES ('skirt');
INSERT INTO categories (lvl1) VALUES ('accesory');
INSERT INTO categories (lvl1) VALUES ('bag');
-- CREATE TABLE image
-- (
--    id SERIAL4 PRIMARY KEY,
--    image_url VARCHAR(200),
--    image_type VARCHAR(50),
--    garment_id VARCHAR(50)
-- );

