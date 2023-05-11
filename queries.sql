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