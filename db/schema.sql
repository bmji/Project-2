CREATE DATABASE valorant_db;
\c valorant_db

CREATE TABLE agents(
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
    image_url TEXT,
    full_portrait TEXT,
    role TEXT,
    voiceline TEXT
);

CREATE TABLE agent_abilities(
    id SERIAL PRIMARY KEY,
    agent_id INT,
    name TEXT,
    description TEXT,
    image_icon TEXT
);

CREATE TABLE agent_notes(
    id SERIAL PRIMARY KEY,
    agent_id INT,
    notes TEXT,
    tier TEXT
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT
)

ALTER TABLE users ADD COLUMN password_digest TEXT;

UPDATE agents SET image_url = 'https://media.valorant-api.com/agents/22697a3d-45bf-8dd7-4fec-84a9e28c69d7/displayiconsmall.png'
WHERE id = 4;