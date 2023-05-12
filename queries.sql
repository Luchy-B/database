/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon' ;
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-01' ;
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3 ;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu' ;
SELECT name, escape attempts FROM animals WHERE weight_kg > 10.5 ;
SELECT * FROM animals WHERE neutered = true ;
SELECT * FROM animals WHERE name NOT IN ('Gabumon') ;
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 ;
BEGIN ;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon' ;
UPDATE animals SET species = 'pokemon' WHERE species IS NULL OR species = '';
SELECT * FROM animals;
COMMIT
SELECT * FROM animals;
BEGIN
DELETE FROM animals WHERE date_of_birth > '2022-01-01' ;
SAVEPOINT mult;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT mult;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) as highest_escape FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) as average_escape_attempt FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- 3RD PROJECT


SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

SELECT a.name
FROM animals a
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, a.name
FROM owners o
LEFT JOIN animals a ON a.owner_id = o.id;

SELECT s.name, COUNT(a.id) as count
FROM species s
LEFT JOIN animals a ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name, COUNT(a.id) as count
FROM owners o
LEFT JOIN animals a ON a.owner_id = o.id
GROUP BY o.full_name
ORDER BY count DESC
LIMIT 1;

-- Queries

SELECT animals.name,
    vets.name,
    visits.date_of_visit
FROM animals,
    vets,
    visits
WHERE animals.id = visits.animal_id
    AND vets.id = visits.vets_id
    AND vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT COUNT(distinct animals.name)
FROM animals,
    vets,
    visits
WHERE animals.id = visits.animal_id
    AND vets.id = visits.vets_id
    AND vets.name = 'Stephanie Mendez';

SELECT * FROM vets
left join specializations on vets.id = specializations.vets_id
left join species on specializations.species_id = species.id;

SELECT animals.name, visits.date_of_visit 
FROM animals, visits
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(visits.animal_id)
FROM animals
JOIN visits on animals.id = visits.animal_id
JOIN vets ON visits.vets_id = vets.id
GROUP BY animals.name
ORDER BY count DESC
LIMIT 1;

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals
JOIN visits on animals.id = visits.animal_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit
LIMIT 1;

SELECT animals.name animal_name, vets.name vet_name, visits.date_of_visit
FROM animals
JOIN visits on animals.id = visits.animal_id
JOIN vets ON visits.vets_id = vets.id
ORDER BY visits.date_of_visit
DESC LIMIT 1;

SELECT COUNT(*) FROM animals
JOIN visits on animals.id = visits.animal_id
JOIN vets ON visits.vets_id = vets.id
JOIN specializations ON vets.id = specializations.vets_id
JOIN species ON specializations.species_id = species.id
WHERE animals.species_id != species.id;

SELECT species.name, COUNT(*) FROM animals
JOIN visits on animals.id = visits.animal_id
JOIN vets ON visits.vets_id = vets.id
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

