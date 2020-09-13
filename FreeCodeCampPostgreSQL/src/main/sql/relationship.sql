CREATE TABLE car (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19, 2) NOT NULL
);

INSERT INTO car (make, model, price) VALUES
('Land Rover', 'Sterling', '87655.38'),
('GMC', 'Acadia', '17662.69');

CREATE TABLE person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL,
    car_id BIGINT REFERENCES car (id),
    UNIQUE(car_id)
);

INSERT INTO person (first_name, last_name, gender, email, date_of_birth, country_of_birth) VALUES
('Luis', 'Villalobos','Male', 'test@test.com','1995-04-24', 'Mexico'),
('Test', 'Test','Female', 'test2@test.com','1995-01-01', 'EUA'),
('Row', 'Row','Female', 'test4@test.com','1995-02-02', 'Canada');

UPDATE person SET car_id = 2 WHERE id = 1;

SELECT * FROM person
JOIN car ON person.car_id = car.id;

-- You can enable/disable expanded view with \x

-- INNER JOIN
SELECT person.first_name, car.make, car.model, car.price FROM person
JOIN car ON person.car_id = car.id;

-- LEFT JOIN
SELECT person.first_name, person.email, person.car_id, car.make, car.model, car.price FROM person
LEFT JOIN car ON person.car_id = car.id;

SELECT person.first_name, person.email, person.car_id, car.make, car.model, car.price FROM person
LEFT JOIN car ON person.car_id = car.id
WHERE car.* IS NULL;

-- RIGHT JOIN
SELECT person.first_name, person.email, person.car_id, car.make, car.model, car.price FROM person
RIGHT JOIN car ON person.car_id = car.id;

-- Handle UUID

DROP TABLE person;
DROP TABLE car;

SELECT * FROM pg_available_extensions;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TABLE car (
    car_uid UUID NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19, 2) NOT NULL
);

-- \df

INSERT INTO car (car_uid, make, model, price) VALUES
(uuid_generate_v4(), 'Land Rover', 'Sterling', '87655.38'),
(uuid_generate_v4(), 'GMC', 'Acadia', '17662.69');

CREATE TABLE person (
    person_uid UUID NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL,
    car_uid UUID REFERENCES car (car_uid),
    UNIQUE(car_uid),
    UNIQUE(email)
);

INSERT INTO person (person_uid, first_name, last_name, gender, email, date_of_birth, country_of_birth) VALUES
(uuid_generate_v4(), 'Luis', 'Villalobos','Male', 'test@test.com','1995-04-24', 'Mexico'),
(uuid_generate_v4(), 'Test', 'Test','Female', 'test2@test.com','1995-01-01', 'EUA'),
(uuid_generate_v4(), 'Row', 'Row','Female', 'test4@test.com','1995-02-02', 'Canada');

UPDATE person SET car_uid = '3f6831c3-e0cb-4b1c-8dcf-3153ff0c7c62'
WHERE person_uid = '9313a5f0-850e-463b-8e8c-f6d551133126';

UPDATE person SET car_uid = '5d054b0e-05ea-4294-b123-6d2636502cfd'
WHERE person_uid = '15158125-653c-4a80-a92b-1dfca370488e';
