/* Use "workout_app" database with the command in psql:
   \c workout_app
*/

CREATE SCHEMA IF NOT EXISTS workout;

SET search_path TO workout;

/* Entities */

CREATE TABLE Users (
    u_id SERIAL, -- SERIAL auto increments u_id upon data insertion --
    username TEXT NOT NULL,
    user_password TEXT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birthday DATE NOT NULL,
    user_weight INTEGER NOT NULL,
    PRIMARY KEY (u_id) 
);

CREATE TYPE workout_type AS ENUM ('Push', 'Pull', 'Legs', 'Upper Body', 'Lower Body', 'Full-body', 'Cardio', 'Other');
-- Recall that string literals are single quotes

CREATE TABLE Entries (
    entry_id SERIAL, -- SERIAL auto increments entry_id upon data insertion --
    entry_date DATE NOT NULL,
    workout workout_type NOT NULL,
    bias TEXT,
    u_id INTEGER NOT NULL, -- Note: Data type is not SERIAL anymore since it is a foreign key
    FOREIGN KEY (u_id) REFERENCES Users (u_id) ON DELETE CASCADE,
    PRIMARY KEY (entry_id)
);

CREATE TABLE PersonalRecords (
    pr_id SERIAL, -- SERIAL auto increments pr_id upon data insertion --
    exercise TEXT NOT NULL,
    pr_weight INTEGER NOT NULL,
    pr_set INTEGER NOT NULL,
    reps INTEGER NOT NULL,
    pr_date DATE NOT NULL,
    u_id INTEGER NOT NULL, -- Note: Data type is not SERIAL anymore since it is a foreign key
    FOREIGN KEY (u_id) REFERENCES Users (u_id) ON DELETE CASCADE,
    PRIMARY KEY (pr_id)
);

/*
Relationships
    - NOTE: COMBINED Relationship Tables with the N-side entities of the relationship for efficiency
    - Recall you can combine tables for efficiency, particularly with 1-to-N relationships since 
    the primary key is the same for the individual relationship tables and the N-side tables
*/

-- CREATE TABLE Enters (
--     u_id INTEGER NOT NULL,
--     entry_id SERIAL NOT NULL, 
--     FOREIGN KEY (u_id) REFERENCES Users (u_id) ON DELETE CASCADE,
--     FOREIGN KEY (entry_id) REFERENCES Entries (entry_id) ON DELETE CASCADE,
--     PRIMARY KEY (entry_id) -- one-to-many relationship Users <1---n> Entries --
-- );

-- CREATE TABLE Records (
--     u_id INTEGER NOT NULL,
--     pr_id SERIAL NOT NULL, 
--     FOREIGN KEY (u_id) REFERENCES Users (u_id) ON DELETE CASCADE,
--     FOREIGN KEY (pr_id) REFERENCES PersonalRecords (pr_id) ON DELETE CASCADE,
--     PRIMARY KEY (pr_id) -- one-to-many relationship Users <1---n> PersonalRecords -- 
-- );