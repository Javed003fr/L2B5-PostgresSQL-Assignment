-- Active: 1747946198249@@127.0.0.1@5432@conservation_db

-- create table - rangers
CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

-- create table - species
CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

-- create table - sightings
CREATE Table sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER NOT NULL REFERENCES rangers (ranger_id),
    species_id INTEGER NOT NULL REFERENCES species (species_id),
    sighting_time TIMESTAMP NOT NULL,
    "location" VARCHAR(50) NOT NULL,
    notes TEXT
);

-- Sample Date Inserting

-- insert sample data in rangers table
INSERT INTO
    rangers (ranger_id, full_name, region)
VALUES (
        1,
        'Alice Green',
        'Northern Hills'
    ),
    (2, 'Bob White', 'River Delta'),
    (
        3,
        'Carol King',
        'Mountain Range'
    ),
    (
        4,
        'Haward Lee',
        'Yellow Mount'
    );

-- insert sample data in species table
INSERT INTO
    species (
        species_id,
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        1,
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        2,
        'Bengal Tiger',
        'Pantera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        3,
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        4,
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

-- insert sample data in sightings table
INSERT INTO
    sightings (
        sighting_id,
        species_id,
        ranger_id,
        "location",
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        4,
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

-- problem # 1:
INSERT INTO
    rangers (full_name, region)
VALUES ('Derek Fox', 'Coastal Plains');

-- problem # 2:
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

-- problem # 3 :
SELECT * FROM sightings WHERE location ILIKE '%Pass%';

-- problem # 4 :
SELECT r.full_name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
    LEFT JOIN sightings s on r.ranger_id = s.ranger_id
GROUP BY
    r.ranger_id,
    r.full_name
ORDER BY r.full_name;

-- problem # 5 :
SELECT spc.common_name
FROM species spc
    LEFT JOIN sightings s ON spc.species_id = s.species_id
WHERE
    s.species_id IS NULL;

-- problem # 6 :
SELECT spc.common_name, s.sighting_time, r.full_name
FROM
    sightings s
    JOIN species spc ON s.species_id = spc.species_id
    JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;

-- problem # 7 :
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    discovery_date < '1800-01-01';

-- problem # 8 :
SELECT
    sighting_id,
    CASE
        WHEN EXTRACT(
            HOUR
            FROM sighting_time::TIME
        ) < 12 THEN 'Morning'
        WHEN EXTRACT(
            HOUR
            FROM sighting_time::TIME
        ) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END
FROM sightings;

-- problem # 9 :
DELETE FROM rangers
WHERE
    ranger_id NOT IN (
        SELECT DISTINCT
            ranger_id
        FROM sightings
    );