/*
Explore the structure of the albums table.

a. How many rows are in the albums table? 31
SELECT * FROM albums;

b. How many unique artist names are in the albums table? 23
SELECT DISTINCT ARTIST
FROM albums;

c. What is the primary key for the albums table? ID

d. What is the oldest release date for any album in the albums table? What is the most recent release date?
1967, 2011
*/



/*
Write queries to find the following information:

a. The name of all albums by Pink Floyd
SELECT name FROM albums WHERE artist = 'Pink Floyd';

b. The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date 
FROM albums 
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

c. The genre for the album Nevermind
SELECT genre 
FROM albums 
WHERE name = 'Nevermind';

d. Which albums were released in the 1990s
SELECT name 
FROM albums
WHERE release_date
BETWEEN 1990 and 1999;

e. Which albums had less than 20 million certified sales
SELECT name 
FROM albums
WHERE sales < 20.0;

f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT name 
FROM albums
WHERE genre = 'Rock';

Does not include Hard Rock or Progressive rock because the value has to match exactly to return a result
*/