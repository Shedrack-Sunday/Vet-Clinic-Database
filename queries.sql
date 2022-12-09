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

SELECT b.full_name AS owner, a.* FROM animals AS a
INNER JOIN owners AS b ON a.owner_id =  b.id
WHERE b.full_name = 'Melody Pond';

SELECT a.name, b.name AS type FROM animals AS a
INNER JOIN species AS b ON a.species_id = b.id
WHERE b.name = 'Pokemon';

SELECT full_name, a.name FROM owners 
LEFT JOIN animals AS a ON owners.id = a.owner_id;

SELECT species.name, COUNT(animals.name) FROM animals
INNER JOIN species ON animals.species_id = species.id
GROUP BY species.id;

SELECT owners.full_name, animals.name FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
INNER JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT owners.full_name, animals.name, escape_attempts FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT full_name, COUNT(animals.id) FROM owners
INNER JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.id
ORDER BY COUNT(animals.id) DESC LIMIT 1;

SELECT vets.name, animals.name, visits.visit_date FROM animals
INNER JOIN visits ON animals.id = visits.animals_id
INNER JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC LIMIT 1;

SELECT DISTINCT COUNT(animals.name), vets.name FROM animals
INNER JOIN visits ON animals.id = visits.animals_id
INNER JOIN vets ON visits.vets_id = vets.id
GROUP BY vets.name
HAVING vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id
LEFT JOIN species ON specializations.species_id = species.id;

SELECT vets.name, animals.name, visits.visit_date FROM animals
INNER JOIN visits ON animals.id = visits.animals_id
INNER JOIN vets ON visits.vets_id = vets.id
WHERE
  vets.name = 'Stephanie Mendez'
  AND visits.visit_date >= '2020-04-1'
  AND visits.visit_date <= '2020-08-30';

SELECT animals.name, COUNT(animals.name) FROM animals
INNER JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY COUNT DESC LIMIT 1;

SELECT vets.name, animals.name, visits.visit_date FROM animals
INNER JOIN visits ON animals.id = visits.animals_id
INNER JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.visit_date LIMIT 1;

SELECT animals.*, vets.*, visits.visit_date FROM animals
INNER JOIN visits ON animals.id = visits.animals_id
INNER JOIN vets ON visits.vets_id = vets.id
ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(visits.id) FROM vets
INNER JOIN visits ON visits.vets_id = vets.id
INNER JOIN animals ON animals.id = visits.animals_id
INNER JOIN specializations ON vets.id = specializations.vets_id
INNER JOIN species ON specializations.species_id = species.id
WHERE animals.species_id != specializations.species_id;

SELECT species.name, COUNT(species.name) FROM vets
INNER JOIN visits ON visits.vets_id = vets.id
INNER JOIN animals ON animals.id = visits.animals_id
INNER JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name LIMIT 1;