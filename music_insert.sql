
-- ввод данных в таблицу genre
INSERT INTO genre (genre_name)
VALUES ('rock');

INSERT INTO genre (genre_name)
VALUES ('classic');

INSERT INTO genre (genre_name)
VALUES ('country');

INSERT INTO genre (genre_name)
VALUES ('pop');


-- ввод данных в таблицу singer
INSERT  INTO singer (singer_name)
VALUES ('Dua Lipa');

INSERT  INTO singer (singer_name)
VALUES ('Maroon 5');

INSERT  INTO singer (singer_name)
VALUES ('Johnny Cash');

INSERT  INTO singer (singer_name)
VALUES ('Freddie Mercury');

-- ввод данных в промежуточную таблицу genre-singer
INSERT INTO genre_singer (genre_id, singer_id)
VALUES (4, 1);

INSERT INTO genre_singer (genre_id, singer_id)
VALUES (4, 2);

INSERT INTO genre_singer (genre_id, singer_id)
VALUES (1, 2);

INSERT INTO genre_singer (genre_id, singer_id)
VALUES (3, 3);

INSERT INTO genre_singer (genre_id, singer_id)
VALUES (1, 4);


-- ввод данных в таблицу album
INSERT INTO album (album_name,album_year)
VALUES ('Songs About Jane', 2002);

INSERT INTO album (album_name,album_year)
VALUES ('Future Nostalgia', 2020);

INSERT INTO album (album_name,album_year)
VALUES ('At Folsom Prison', 1968);

INSERT INTO album (album_name,album_year)
VALUES ('The Miracle', 1989);


SELECT * FROM album;

-- ввод данных в промежуточную таблицу singer-album
INSERT INTO singer_album(album_id, singer_id)
VALUES (1,2);

INSERT INTO singer_album(album_id, singer_id)
VALUES (2,1);

INSERT INTO singer_album(album_id, singer_id)
VALUES (3,3);

INSERT INTO singer_album(album_id, singer_id)
VALUES (4,4);

-- ввод данных в таблицу track
INSERT INTO track(track_name, track_duration, album_id)
VALUES ('The Wall',101,3);

INSERT INTO track(track_name, track_duration, album_id)
VALUES ('I Want It All',282,4);

INSERT INTO track(track_name, track_duration, album_id)
VALUES ('The Invisible Man',235,4);

INSERT INTO track(track_id,track_name, track_duration, album_id)
VALUES (5,'Love Again',258,2);

INSERT INTO track(track_name, track_duration, album_id)
VALUES ('Physical',193,2);

INSERT INTO track(track_name, track_duration, album_id)
VALUES ('Through with You',181,1);

INSERT INTO track(track_name, track_duration, album_id)
VALUES ('Sweetest Goodbye',270,1);


-- ввод данных в таблицу collections
INSERT INTO collections (collection_name,collection_year)
VALUES ('relax',2020);

INSERT INTO collections (collection_name,collection_year)
VALUES ('travel',2021);

INSERT INTO collections (collection_name,collection_year)
VALUES ('romantic',2023);

INSERT INTO collections (collection_name,collection_year)
VALUES ('favorite',2018);

-- ввод данных в промежуточную таблицу track-collection

INSERT INTO track_collection(track_id, collection_id)
VALUES (1,1);
INSERT INTO track_collection(track_id, collection_id)
VALUES (2,1);
INSERT INTO track_collection(track_id, collection_id)
VALUES (4,1);

INSERT INTO track_collection(track_id, collection_id)
VALUES (4,2);
INSERT INTO track_collection(track_id, collection_id)
VALUES (5,2);
INSERT INTO track_collection(track_id, collection_id)
VALUES (6,2);

INSERT INTO track_collection(track_id, collection_id)
VALUES (1,3);
INSERT INTO track_collection(track_id, collection_id)
VALUES (7,3);
INSERT INTO track_collection(track_id, collection_id)
VALUES (8,3);

INSERT INTO track_collection(track_id, collection_id)
VALUES (1,4);
INSERT INTO track_collection(track_id, collection_id)
VALUES (2,4);
INSERT INTO track_collection(track_id, collection_id)
VALUES (4,4);
INSERT INTO track_collection(track_id, collection_id)
VALUES (5,4);
INSERT INTO track_collection(track_id, collection_id)
VALUES (6,4);
INSERT INTO track_collection(track_id, collection_id)
VALUES (7,4);
INSERT INTO track_collection(track_id, collection_id)
VALUES (8,4);