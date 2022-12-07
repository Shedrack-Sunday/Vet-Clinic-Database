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

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS null;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT deleteByBirth;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO deleteByBirth;
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

SELECT COUNT(name) FROM animals;
SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth < '2000-01-01' GROUP BY species