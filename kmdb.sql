-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS top_cast;

-- Create new tables, according to your domain model
CREATE TABLE movie (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year_released TEXT,
  MPAA_rating TEXT,
  director TEXT
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  movie_title TEXT,
  role TEXT,
  year TEXT
);

CREATE TABLE top_cast (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor id TEXT,
  movie id TEXT
);
-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
INSERT INTO movie (title, year_released, MPAA_rating, director)
VALUES ("Batman Begins", "2005",  "PG-13", "Christopher Nolan");
INSERT INTO movie (title, year_released, MPAA_rating, director)
VALUES ("The Dark Knight", "2008",  "PG-13", "Christopher Nolan");
INSERT INTO movie (title, year_released, MPAA_rating, director)
VALUES ("The Dark Knight Rises", "2012",  "PG-13", "Christopher Nolan");

INSERT INTO actors (name, movie_title, role, year)
VALUES ("Christian Bale", "Batman Begins", "Bruce Wayne", "2005");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Michael Caine", "Batman Begins", "Alfred", "2005");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Liam Neeson", "Batman Begins", "Ra's Al Ghul", "2005");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Katie Holmes", "Batman Begins", "Rachel Dawes", "2005");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Gary Oldman", "Batman Begins", "Commissioner Gordon", "2005");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Christian Bale", "The Dark Knight", "Bruce Wayne", "2008");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Michael Caine", "The Dark Knight", "Alfred", "2008");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Health Ledger", "The Dark Knight", "Joker", "2008");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Aaron Eckhart", "The Dark Knight", "Harvey Dent", "2008");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Maggie Gyllenhaal", "The Dark Knight", "Rachel Dawes", "2008");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Christian Bale", "The Dark Knight Rises", "Bruce Wayne", "2012");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Gary Oldman", "The Dark Knight Rises", "Comissioner Gordon", "2012");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Tom Hardy", "The Dark Knight Rises", "Bane", "2012");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Joseph Gordon-Levitt", "The Dark Knight Rises", "John Blake", "2012");
INSERT INTO actors (name, movie_title, role, year)
VALUES ("Anne Hathaway", "The Dark Knight Rises", "Selina Kyle", "2012");


-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
Select * from movie;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""

.width 25 25 20

-- The SQL statement for the cast output
Select movie_title, name, role from actors