CREATE DATABASE valorant_db;
\c valorant_db

CREATE TABLE agents(
    id SERIAL PRIMARY KEY,
    name TEXT,
    image_url TEXT,
    role TEXT,
    is_playable BOOLEAN,
    voiceline TEXT
);

CREATE TABLE agent_abilites(
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
    image_icon TEXT
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT
)

ALTER TABLE users ADD COLUMN password_digest TEXT;