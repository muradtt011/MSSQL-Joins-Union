CREATE DATABASE İMDB

USE İMDB

CREATE TABLE Directors(
Id int identity primary key,
DirectorName nvarchar(30),
DirectorAge int,
BirthPlace nvarchar(30)
)
INSERT INTO Directors(DirectorName,DirectorAge,BirthPlace)
VALUES ('Christopher Nolan',53,'London'),
       ('Lana Wachowski',55,'Chicago'),
	   ('Francis Ford Coppola',84,'Michigan')



CREATE TABLE Movies(
Id int identity primary key,
FilmPoint decimal(2,1),
FilmName nvarchar(30),
FilmDuration nvarchar(30),
ReleaseYear int,
DirectorsId int references Directors(Id)
)

INSERT INTO  Movies(FilmPoint,FilmName,FilmDuration,ReleaseYear,DirectorsId)
VALUES (9.1,'Oppenheimer','3h 8m',2023,1),
       (5.8,'Matrix','2h 54m',1999,2),
	   (8.7,'The Godfather','3h 20m',1972,3),
	   (9,'The Dark Knight','3h 8m',2008,1)



CREATE TABLE Actors(
Id int identity primary key,
ActorName nvarchar(30)
)

INSERT INTO Actors(ActorName)
VALUES('Cillian Murphy'),
      ('Keanu Reeves'),
	  ('Marlon Brando'),
	  ('Christian Bale')

CREATE TABLE Genres(
Id int identity primary key,
GenreName nvarchar(30)
)

INSERT INTO Genres(GenreName) 
VALUES ('History'),
       ('Fantasy'),
	   ('Drama'),
	   ('Action')

CREATE TABLE IMDBlist(
Id int identity primary key,
IMDBvalue decimal(2,1),
MovieId int references Movies(Id),
DirectorId int references Directors(Id),
ActorId int references Actors(Id),
GenreId int references Genres(Id)
)

INSERT INTO IMDBlist (IMDBvalue,DirectorId,MovieId,ActorId,GenreId) 
VALUES (9,1,1,1,1),
       (8,2,2,2,2),
	   (7.5,3,3,3,3),
	   (9.5,1,4,4,4)




-----------------SELECTALL----------------------------------
SELECT DirectorName, DirectorAge ,BirthPlace,FilmPoint,FilmName,FilmDuration,ReleaseYear,ActorName,GenreName,IMDBvalue 
FROM IMDBlist
JOIN Movies
ON
IMDBlist.MovieId=Movies.Id
JOIN Directors
ON
IMDBlist.DirectorId=Directors.Id
JOIN Actors
ON
IMDBlist.ActorId=Actors.Id
JOIN Genres
ON
IMDBlist.GenreId=Genres.Id


----------111111111111111111--------------------------------
SELECT FilmName,IMDBvalue,GenreName  FROM IMDBlist
JOIN Movies
ON
IMDBlist.MovieId=Movies.Id
JOIN Directors
ON
IMDBlist.DirectorId=Directors.Id
JOIN Actors
ON
IMDBlist.ActorId=Actors.Id
JOIN Genres
ON
IMDBlist.GenreId=Genres.Id
WHERE FilmPoint>6

-----------22222222222222222222---------------------------------

SELECT FilmName,IMDBvalue,GenreName FROM IMDBlist
JOIN Movies
ON
IMDBlist.MovieId=Movies.Id
JOIN Directors
ON
IMDBlist.DirectorId=Directors.Id
JOIN Actors
ON
IMDBlist.ActorId=Actors.Id
JOIN Genres
ON
IMDBlist.GenreId=Genres.Id
WHERE GenreName LIKE '%a%'

--------------33333333333333--------------------
SELECT FilmName,IMDBvalue,FilmDuration,GenreName  FROM IMDBlist
JOIN Movies
ON
IMDBlist.MovieId=Movies.Id
JOIN Directors
ON
IMDBlist.DirectorId=Directors.Id
JOIN Actors
ON
IMDBlist.ActorId=Actors.Id
JOIN Genres
ON
IMDBlist.GenreId=Genres.Id
 WHERE FilmName LIKE '%t' AND   LEN(FilmName)>10

----------------44444444444444---------------------
SELECT FilmName,IMDBvalue,DirectorName,ActorName  FROM IMDBlist
JOIN Movies
ON
IMDBlist.MovieId=Movies.Id
JOIN Directors
ON
IMDBlist.DirectorId=Directors.Id
JOIN Actors
ON
IMDBlist.ActorId=Actors.Id
JOIN Genres
ON
IMDBlist.GenreId=Genres.Id
WHERE FilmPoint>(SELECT AVG(FilmPoint) FROM Movies) 
ORDER BY IMDBvalue DESC





