-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airports
(
  id SERIAL PRIMARY KEY,
  acronym VARCHAR(3) UNIQUE NOT NULL,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_airport INTEGER NOT NULL REFERENCES airports,
  to_airport INTEGER NOT NULL REFERENCES airports
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id INTEGER NOT NULL REFERENCES flights
);

INSERT INTO airports
  (acronym, city, country)
VALUES
  ('DCA', 'Washington DC', 'United States'),
  ('SEA', 'Seattle', 'United States'),
  ('HND', 'Tokyo', 'Japan'),
  ('LCY', 'London', 'United Kingdom'),
  ('LAX', 'Los Angeles', 'United States'),
  ('LAS', 'Las Vegas', 'United States'),
  ('MEX', 'Mexico City', 'Mexico'),
  ('CDG', 'Paris', 'France'),
  ('CMN', 'Casablanca', 'Morocco'),
  ('DXB', 'Dubai', 'UAE'),
  ('PEK', 'Beijing', 'China'),
  ('JFK', 'New York', 'United States'),
  ('CLT', 'Charlotte', 'United States'),
  ('CID', 'Cedar Rapids', 'United States'),
  ('ORD', 'Chicago', 'United States'),
  ('MSY', 'New Orleans', 'United States'),
  ('GRU', 'Sao Paolo', 'Brazil'),
  ('SCL', 'Santiago', 'Chile');

INSERT INTO flights
  (departure, arrival, airline, from_airport, to_airport)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 3, 4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 5, 6),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 2, 7),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 8, 9),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 10, 11),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 12, 13),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 14, 15),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 13, 16),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 17, 18);

  INSERT INTO passengers
  (first_name, last_name, seat, flight_id)
VALUES
  ('Jennifer', 'Finch', '33B', 1),
  ('Thadeus', 'Gathercoal', '8A', 2),
  ('Sonja', 'Pauley', '12F', 3),
  ('Jennifer', 'Finch', '20A', 4),
  ('Waneta', 'Skeleton', '23D', 5),
  ('Thadeus', 'Gathercoal', '18C', 6),
  ('Berkie', 'Wycliff', '9E', 7),
  ('Alvin', 'Leathes', '1A', 8),
  ('Berkie', 'Wycliff', '32B', 9),
  ('Cory', 'Squibbes', '10D', 10);
