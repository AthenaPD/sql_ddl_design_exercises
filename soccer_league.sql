-- in terminal:
-- psql < soccer_league.sql
-- psql soccer_league

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name TEXT UNIQUE NOT NULL,
    coach VARCHAR(100) NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    salary_k FLOAT,
    nationality TEXT,
    team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    nationality TEXT
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    mdate DATE NOT NULL,
    stadium VARCHAR(100) NOT NULL,
    team1 INTEGER NOT NULL REFERENCES teams,
    team2 INTEGER NOT NULL REFERENCES teams,
    referee INTEGER NOT NULL REFERENCES referees
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches,
    time_min INTEGER NOT NULL,
    player_id INTEGER REFERENCES players
);


INSERT INTO teams
    (team_name, coach)
VALUES
    ('Blue', 'George Dush'),
    ('Green', 'Donald Duck'),
    ('Red', 'Aaron Bach'),
    ('Yellow', 'Vimal Roberts');

INSERT INTO players
    (name, birth_date, salary_k, nationality, team_id)
VALUES
    ('Blue1', '1990-12-09', 5, 'India', 1),
    ('Blue2', '1990-12-09', 5, 'India', 1),
    ('Blue3', '1990-12-09', 5, 'India', 1),
    ('Blue4', '1990-12-09', 5, 'India', 1),
    ('Blue5', '1990-12-09', 5, 'India', 1),
    ('Blue6', '1990-12-09', 5, 'India', 1),
    ('Blue7', '1990-12-09', 5, 'India', 1),
    ('Blue8', '1990-12-09', 5, 'India', 1),
    ('Blue9', '1990-12-09', 5, 'India', 1),
    ('Blue10', '1985-02-09', 5, 'India', 1),
    ('Blue11', '1990-12-09', 5, 'India', 1),
    ('Green1', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Green2', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Green3', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Green4', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Green5', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Green6', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Green7', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Green8', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Green9', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Green10', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Green11', '1988-11-19', 5.4, 'Sri Lanka', 2),
    ('Red1', '1998-01-19', 4.9, 'China', 3),
    ('Red2', '1998-01-19', 4.9, 'China', 3),
    ('Red3', '1998-01-19', 4.9, 'China', 3),
    ('Red4', '1998-01-19', 4.9, 'China', 3),
    ('Red5', '1998-01-19', 4.9, 'China', 3),
    ('Red6', '1998-01-19', 4.9, 'China', 3),
    ('Red7', '1998-01-19', 4.9, 'China', 3),
    ('Red8', '1998-01-19', 4.9, 'China', 3),
    ('Red9', '1998-01-19', 4.9, 'China', 3),
    ('Red10', '1998-01-19', 4.9, 'China', 3),
    ('Red11', '1998-01-19', 4.9, 'China', 3),
    ('Yellow1', '1985-08-19', 5.1, 'Japan', 4),
    ('Yellow2', '1985-06-19', 5.1, 'Japan', 4),
    ('Yellow3', '1985-06-19', 5.1, 'Japan', 4),
    ('Yellow4', '1985-06-19', 5.1, 'Japan', 4),
    ('Yellow5', '1985-06-19', 5.1, 'Japan', 4),
    ('Yellow6', '1985-06-19', 5.1, 'Japan', 4),
    ('Yellow7', '1985-06-19', 5.1, 'Japan', 4),
    ('Yellow8', '1985-06-19', 5.1, 'Japan', 4),
    ('Yellow9', '1985-06-19', 5.1, 'Japan', 4),
    ('Yellow10', '1985-06-19', 5.1, 'Japan', 4),
    ('Yellow11', '1985-08-19', 5.1, 'Japan', 4);

INSERT INTO referees 
    (name, birth_date, nationality)
VALUES
    ('Roberts Winskey', '1975-05-21', 'Bulgaria'),
    ('Mikey Mouse', '1976-06-15', 'U.S.A.');

INSERT INTO matches
    (mdate, stadium, team1, team2, referee)
VALUES
    ('2024-08-24', 'San Jose, CA', 1, 2, 1), -- 2:1
    ('2024-08-24', 'San Jose, CA', 3, 4, 2), -- 1:2
    ('2024-08-24', 'San Jose, CA', 1, 3, 1), -- 1:2
    ('2024-08-24', 'San Jose, CA', 2, 4, 2), -- 0:1
    ('2024-08-24', 'San Jose, CA', 1, 4, 1), -- 0:1
    ('2024-08-24', 'San Jose, CA', 2, 3, 2); -- 1:1

INSERT INTO goals
    (match_id, time_min, player_id)
VALUES
    (1, 5, 5),
    (1, 15, 14),
    (1, 45, 7),
    (2, 7, 24),
    (2, 13, 38),
    (2, 40, 40),
    (3, 16, 30),
    (3, 25, 9),
    (3, 39, 33),
    (4, 50, 41),
    (5, 43, 44),
    (6, 33, 12),
    (6, 47, 26);
