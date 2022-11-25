1.Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role.

select act_fname,act_lname,role from actors 
natural join movie_cast 
natural join movie 
where movie.mov_title='Annie Hall';

act_fname, act_lname, role
'Woody', 'Allen', 'Alvy Singer'

2.From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. Return director first name, last name and movie title.

select dir_fname,dir_lname,mov_title from director 
natural join movie_direction
natural join movie
where mov_title='Eyes Wide Shut';

dir_fname, dir_lname, mov_title
Stanley	Kubrick	Eyes Wide Shut

#3.Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.

select dir_fname,dir_lname,mov_title from director 
natural join movie_direction
natural join movie
natural join movie_cast
where role='sean Maguire';

dir_fname, dir_lname, mov_title
Gus	Van Sant	Good Will Hunting

4.Write a SQL query to find the actors who have not acted in any movie between1990 and 2000 (Begin and end values are included.). Return actor first name, last name, movie title and release year.

 select act_fname,act_lname,mov_title,mov_year from actors
 natural join movie_cast
 natural join movie
 where mov_year not between 1990 and 2000;
 
act_fname, act_lname, mov_title, mov_year
James	Stewart	Vertigo	1958
Deborah	Kerr	The Innocents	1961
Peter	OToole	Lawrence of Arabia	1962
Robert	De Niro	The Deer Hunter	1978
F. Murray	Abraham	Amadeus	1984
Harrison	Ford	Blade Runner	1982
Jack	Nicholson	Chinatown	1974
Woody	Allen	Annie Hall	1977
Kevin	Spacey	Beyond the Sea	2004
Jon	Voight	Deliverance	1972
Christian	Bale	The Prestige	2006
Maggie	Gyllenhaal	Donnie Darko	2001
Dev	Patel	Slumdog Millionaire	2008

5..Write a SQL query to find the directors with number of genres movies. Group the result set on director first name, last name and generic title. Sort the result-set in ascending order by director first name and last name. Return director first name, last name and number of genres movies.

select dir_fname,dir_lname,gen_title,count(gen_title)from director
natural join movie_direction
natural join genres
group by dir_fname,dir_lname,gen_title
order by dir_fname,dir_lname;

dir_fname, dir_lname, gen_title, count(gen_title)
Alfred	Hitchcock	Action	1
Alfred	Hitchcock	Adventure	1
Alfred	Hitchcock	Animation	1
Alfred	Hitchcock	Biography	1
Alfred	Hitchcock	Comedy	1
Alfred	Hitchcock	Crime	1
Alfred	Hitchcock	Drama	1
Alfred	Hitchcock	Horror	1
Alfred	Hitchcock	Music	1
Alfred	Hitchcock	Mystery	1
Alfred	Hitchcock	Romance	1
Alfred	Hitchcock	Thriller	1
Alfred	Hitchcock	War	1
Bryan	Singer	Action	1
Bryan	Singer	Adventure	1
Bryan	Singer	Animation	1
Bryan	Singer	Biography	1
Bryan	Singer	Comedy	1
Bryan	Singer	Crime	1
Bryan	Singer	Drama	1
Bryan	Singer	Horror	1
Bryan	Singer	Music	1
Bryan	Singer	Mystery	1
Bryan	Singer	Romance	1
Bryan	Singer	Thriller	1
Bryan	Singer	War	1
Christopher	Nolan	Action	1

#6.Write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.

select mov_title,mov_year,gen_title from movie
natural join movie_genres
natural join genres;

mov_title, mov_year, gen_title
Vertigo	1958	Mystery
The Innocents	1961	Horror
Lawrence of Arabia	1962	Adventure
The Deer Hunter	1978	War
Blade Runner	1982	Thriller
Eyes Wide Shut	1999	Mystery
The Usual Suspects	1995	Crime
Annie Hall	1977	Comedy
Princess Mononoke	1997	Animation
The Shawshank Redemption	1994	Crime
American Beauty	1999	Romance
Deliverance	1972	Adventure
Trainspotting	1996	Drama

#7.Write a SQL query to find all the movies with year, genres, and name of the director. 

select mov_title,mov_year,gen_title,dir_fname from movie
natural join movie_genres
natural join genres
natural join director;

mov_title, mov_year, gen_title, dir_fname
Back to the Future	1985	Drama	Alfred
Spirited Away	2001	Mystery	Alfred
Seven Samurai	1954	Drama	Alfred
Beyond the Sea	2004	Music	Alfred
Aliens	1986	Action	Alfred
Slumdog Millionaire	2008	Drama	Alfred
Trainspotting	1996	Drama	Alfred
Deliverance	1972	Adventure	Alfred
American Beauty	1999	Romance	Alfred
The Shawshank Redemption	1994	Crime	Alfred
Princess Mononoke	1997	Animation	Alfred
Annie Hall	1977	Comedy	Alfred
The Usual Suspects	1995	Crime	Alfred
Eyes Wide Shut	1999	Mystery	Alfred
Blade Runner	1982	Thriller	Alfred
The Deer Hunter	1978	War	Alfred

#8.Write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release. Return movie title, release year, date of release, duration, and first and last name of the director. 

select mov_title,mov_year,mov_dt_rel,mov_time,dir_fname,dir_lname from movie
natural join movie_direction
natural join movie_cast
natural join director
where mov_dt_rel<'1989-01-01'
order by mov_dt_rel desc;

mov_title, mov_year, mov_dt_rel, mov_time, dir_fname, dir_lname
Aliens	1986	1986-08-29	137	James	Cameron
Amadeus	1984	1985-01-07	160	Milos	Forman
Deliverance	1972	1982-10-05	109	John	Boorman
Blade Runner	1982	1982-09-09	117	Ridley	Scott
The Deer Hunter	1978	1979-03-08	183	Michael	Cimino
Annie Hall	1977	1977-04-20	93	Woody	Allen
Chinatown	1974	1974-08-09	130	Roman	Polanski
Lawrence of Arabia	1962	1962-12-11	216	David	Lean
The Innocents	1961	1962-02-19	100	Jack	Clayton
Vertigo	1958	1958-08-24	128	Alfred	Hitchcock
Eyes Wide Shut	1999	0000-00-00	159	Stanley	Kubrick

9.Write a SQL query to compute the average time and count number of movies for each genre. Return genre title, average time and number of movies for each genre.

select gen_title,avg(mov_time),count(gen_title)from genres
natural join movie
natural join movie_genres
group by gen_title;


gen_title, avg(mov_time), count(gen_title)
Mystery	137.3333	3
Horror	100.0000	1
Adventure	162.5000	2
War	183.0000	1
Thriller	117.0000	1
Crime	124.0000	2
Comedy	93.0000	1
Animation	134.0000	1
Romance	122.0000	1
Drama	134.2500	4
Action	137.0000	1
Music	118.0000	1




10.Write a SQL query to find movies with the lowest duration. Return movie title, movie year, director first name, last name, actor first name, last name and role.

select min(mov_time),mov_title,mov_year,dir_fname,dir_lname,act_fname,act_lname role from movie
natural join movie_direction
natural join director
natural join movie_cast
natural join actors;

min(mov_time), mov_title, mov_year, dir_fname, dir_lname, act_fname, role

'93', 'Vertigo', '1958', 'Alfred', 'Hitchcock', 'James', 'Stewart'






