-- SELECT-ЗАПРОСЫ

--ЗАДАНИЕ 2

--Название и продолжительность самого длительного трека.
SELECT track_name, track_duration
FROM track 
WHERE track_duration = (SELECT max(track_duration) FROM track);


--Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name
FROM track 
WHERE track_duration >= 3.5*60;


--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection_name
FROM collections 
WHERE collection_year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT singer_name 
FROM singer
WHERE singer_name NOT LIKE '% %' ;

--Название треков, которые содержат слово «мой» или «my».

SELECT track_name
FROM track 
WHERE track_name LIKE '%my%' OR track_name LIKE '%мой%';


-- ЗАДАНИЕ 3

--Количество исполнителей в каждом жанре.
SELECT genre_id , count(singer_id)
FROM genre_singer 
GROUP BY genre_id;

--Количество исполнителей в каждом жанре 2 вариант
SELECT genre.genre_name , count(singer_id) 
FROM genre_singer 
	JOIN genre ON  genre.genre_id = genre_singer.genre_id 
GROUP BY genre.genre_id;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT a.album_name ,count(t.track_id) 
FROM album a 
	JOIN track t ON a.album_id = t.album_id 
WHERE a.album_year IN(2019,2020)
GROUP BY a.album_name ;

--Средняя продолжительность треков по каждому альбому.
SELECT a.album_name, avg(t.track_duration) 
FROM album a 
	JOIN track t ON a.album_id = t.album_id
GROUP BY a.album_name;


--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT s.singer_name
FROM singer s 
	 JOIN singer_album sa ON s.singer_id = sa.singer_id 
	 JOIN album a ON a.album_id = sa.album_id 
WHERE a.album_year <> 2020;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT c.collection_name
FROM collections c 
	JOIN track_collection tc ON c.collection_id = tc.collection_id 
	JOIN track t ON t.track_id = tc.track_id 
	JOIN album a ON a.album_id = t.album_id 
	JOIN singer_album sa ON sa.album_id = a.album_id 
	JOIN singer s ON s.singer_id  = sa.singer_id 
WHERE s.singer_name LIKE 'Maroon%';


-- ЗАДАНИЕ 4

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.album_name
FROM singer_album sa 
	JOIN album a ON sa.album_id = a.album_id 
WHERE sa.singer_id =
	(SELECT  gs.singer_id  
	FROM genre_singer gs
		JOIN singer s ON s.singer_id = gs.singer_id 
	GROUP BY gs.singer_id
	HAVING count(gs.genre_id) > 1) ;


-- Наименования треков, которые не входят в сборники.
SELECT t.track_name 
FROM track t 
	LEFT JOIN track_collection tc ON T.track_id = TC.track_id 
WHERE tc.collection_id IS NULL;  
   
--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
 
SELECT s.singer_name
FROM singer s 
	JOIN singer_album sa ON s.singer_id =sa.singer_id 
	JOIN album a ON sa.album_id =a.album_id 
WHERE a.album_id  =
		(SELECT album_id 
		FROM track t 
		WHERE track_duration = 
			(SELECT min(track_duration)
		   	FROM  track));
		   
		   
 --Названия альбомов, содержащих наименьшее количество треков.
SELECT album_name
FROM album
WHERE album_id = 
	(SELECT album_id
	 FROM track t 
	 GROUP BY album_id
	 HAVING count(track_id)=
		   (SELECT min(s) from
			    (SELECT count(*) AS s
			     FROM track t 
			     GROUP BY album_id)) );
		
	


