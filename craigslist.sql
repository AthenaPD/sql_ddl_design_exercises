-- in terminal:
-- psql < craigslist.sql
-- psql craigslist

DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT,
    state VARCHAR(2)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    preferred_region_id INTEGER NOT NULL REFERENCES regions
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    location TEXT,
    region_id INTEGER NOT NULL REFERENCES regions,
    category INTEGER NOT NULL REFERENCES categories
);

INSERT INTO regions 
    (name, state)
VALUES
    ('New York City', 'NY'),
    ('Seattle', 'WA'),
    ('San Francisco', 'CA'),
    ('San Jose', 'CA'),
    ('Atlanta', 'GA'),
    ('Chicago', 'IL'),
    ('Los Angeles', 'CA'),
    ('San Diego', 'CA'),
    ('Portland', 'OR'),
    ('Portland', 'ME');

INSERT INTO categories
    (name)
VALUES
    ('Housing'),
    ('Roommate Search'),
    ('Shared apartment');

INSERT INTO users 
    (name, preferred_region_id)
VALUES
    ('Dina Lee', 1),
    ('Ruj McCarthy', 5),
    ('Amanda Wong', 7),
    ('Ching Du', 2),
    ('Sue Ng', 1),
    ('Alex Chow', 8),
    ('Filipe J', 9),
    ('Chris John', 10),
    ('Ally Roberts', 10),
    ('Lindsay O''Connor', 5),
    ('Aaron Bach', 1);

INSERT INTO posts
    (title, description, user_id, location, region_id, category)
VALUES
    ('Nice Big Room in SD', 'Share with 1 female PhD student in Psychology', 1, 'La Jolla, CA', 8, 3),
    ('A female roomate needed', 'Share an luxury apartment with 1 female PhD student in Psychology in Downtown La Jolla', 1, 'La Jolla, CA', 8, 2),
    ('Looking for a female roomate', 
    'I am a 30 yr old female Master student in CS looking for a clean, matured female roommate to share an nice apartment with in downtown Seattle',
    3, 'Downtown Seattle', 2, 2),
    ('Looking for an apartment for rent', 'Looking for an 1B1B in midtown NYC', 11, 'NYC midtown', 1, 1),
    ('Spacious 1B1B apartment in Atlanta', 'Looking for clean low-key low-maintenance tenants', 2, 'Atlanta Downtown', 5, 1);
