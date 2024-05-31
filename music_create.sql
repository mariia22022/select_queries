CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(80)  NOT NULL	
);

CREATE TABLE IF NOT EXISTS singer (
	singer_id SERIAL PRIMARY KEY,	
	singer_name VARCHAR(40) NOT NULL	
);

CREATE TABLE IF NOT EXISTS genre_singer (	
	genre_id INTEGER NOT NULL REFERENCES genre(genre_id),
	singer_id INTEGER NOT NULL REFERENCES singer(singer_id),
    CONSTRAINT genre_singer_pk PRIMARY KEY (genre_id,singer_id)	
);

CREATE TABLE IF NOT EXISTS album (    
	album_id SERIAL PRIMARY KEY,	
	album_name VARCHAR(80) NOT NULL,
    album_year INTEGER NOT NULL
);


CREATE TABLE IF NOT EXISTS singer_album (	
	album_id INTEGER NOT NULL REFERENCES album(album_id),
	singer_id INTEGER NOT NULL REFERENCES singer(singer_id),
	CONSTRAINT singer_album_pk PRIMARY KEY (album_id,singer_id)
);


CREATE TABLE IF NOT EXISTS track (    
	track_id SERIAL PRIMARY KEY,	
	track_name VARCHAR(80) NOT NULL,
    track_duration INTEGER NOT NULL,
    album_id INTEGER NOT NULL REFERENCES album(album_id),
    CONSTRAINT fk_album UNIQUE (album_id, track_id)
);

CREATE TABLE IF NOT EXISTS collections (    
	collection_id SERIAL PRIMARY KEY,	
	collection_name VARCHAR(80) NOT NULL,
    collection_year INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS track_collection (	
	track_id INTEGER NOT NULL REFERENCES track(track_id),
	collection_id INTEGER NOT NULL REFERENCES collections(collection_id),
    CONSTRAINT track_collection_pk PRIMARY KEY (track_id,collection_id)
);
