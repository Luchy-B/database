/* Populate database with sample data. */


INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Charmander', '2020-02-08', 0, false, 11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', '2021-11-15', 2, true, 5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', '1993-04-02', 3, false, 12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', '2005-06-12', 1, true, 45);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', '2022-05-14', 4, true, 22);

-- 3RD PROJECT

INSERT INTO owners (name, age) VALUES ('Sam Smith', 25)

-- Inserting data into Owners table
INSERT INTO owners (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

-- Inserting data into Species table

INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

-- update animals to include species_id
  
UPDATE animals 
SET species_id = species.id
FROM
    species
WHERE
    animals.name LIKE '%mon'
    AND species.name = 'Digimon';

UPDATE
    animals
SET
    species_id = species.id
FROM
    species
WHERE
    NOT animals.name LIKE '%mon'
    AND species.name = 'Pokemon';

-- Update animals to include owner_id

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = owners.id FROM owners WHERE (animals.name = 'Devimon' OR animals.name = 'Plantmon') AND owners.full_name = 'Bob';

UPDATE animals SET owner_id = owners.id FROM owners WHERE (animals.name = 'Charmander' OR animals.name = 'Squirtle' 
OR animals.name = 'Blossom'
)
AND owners.full_name = 'Melody Pond';


UPDATE
    animals
SET
    owner_id = owners.id
FROM
    owners
WHERE
    (
        animals.name = 'Angemon'
        OR animals.name = 'Boarmon'
    )
    AND owners.full_name = 'Dean Winchester';