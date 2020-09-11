
CREATE DATABASE test;

-- To use a DB you need to put: \c [name]

DROP DATABASE test;

CREATE TABLE person (
    id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(6),
    date_of_birth DATE
); --without constraint

-- To check tables yo need to put: \d
-- To describe a single table you put: \d [table]

DROP TABLE person;

CREATE TABLE person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(7) NOT NULL,
    date_of_birth date NOT NULL,
    email VARCHAR(150)
); --with constraint6

INSERT INTO person (first_name, last_name, gender, date_of_birth) VALUES
('Nashe', 'Osorio', 'FEMALE', date '1996-01-02');

INSERT INTO person (first_name, last_name, gender, date_of_birth, email) VALUES
('Luis', 'Villalobos', 'MALE', DATE '1995-04-24', 'luisvillalobosmelendez@outlook.com');

-- show only tables: \dt

SELECT * FROM person;

-- To populate table you could use https://mockaroo.com/

-- To run querys in external files
-- \i C:/Users/luise/Projects/SqlExercises/FreeCodeCampPostgreSQL/src/main/sql/populate-table-person.sql

-- Handle nulls with coalesce()

SELECT COALESCE(1) AS NUMBER
SELECT COALESCE(null, 1) AS NUMBER
SELECT COALESCE(null, null, 1) AS NUMBER

SELECT COALESCE(email, 'empty email') FROM person;

