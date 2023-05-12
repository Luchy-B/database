/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER PRIMARY KEY,
    name STRING NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(5,2) NOT NULL,
    species varchar(255)
);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(255) NOT NULL,
    age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL
);

ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals DROP column species;
ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-- 4TH PROJECT


CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
  species_id INTEGER NOT NULL,
  vets_id INTEGER NOT NULL,
  PRIMARY KEY (species_id, vets_id),
  FOREIGN KEY (species_id) REFERENCES species (id),
  FOREIGN KEY (vets_id) REFERENCES vets (id)
);

CREATE TABLE visits (
  animal_id INTEGER NOT NULL,
  vets_id INTEGER NOT NULL,
  date_of_visit DATE,
  PRIMARY KEY (animal_id, vets_id, date_of_visit),
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vets_id) REFERENCES vets(id)
);