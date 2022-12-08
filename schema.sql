/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    ID INTEGER,
    name varchar(100),
    date_of_birth date,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species varchar(50);

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  full_name varchar(100) NOT NULL,
  age SMALLINT NOT NULL
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  name varchar(50) NOT NULL
);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT 1) NOT NULL PRIMARY KEY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);