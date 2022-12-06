/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name Like '%mon'

--List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31'


SELECT name FROM animals WHERE neutered = true and escape_attempts < 3 ;

-"Pikachu".
SELECT date_of_birth FROM animals WHERE name IN('Agumon','Pikachu');


SELECT name,escape_attempts from animals  WHERE weight_kg > 10.5;

SELECT * from animals WHERE neutered = true;

SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';

SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg<=17.3;