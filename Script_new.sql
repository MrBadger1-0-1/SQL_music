CREATE TABLE IF NOT EXISTS Genre(
	GenreID SERIAL PRIMARY KEY,
	Genre_name VARCHAR(40) NOT null,
	unique(Genre_name)
);

create table  if not exists Autor(
	AutorID SERIAL primary key,
	Autor_name VARCHAR(60) not null,
	unique(Autor_name)
);

create table if not EXISTS Autor_genre(
	id SERIAL primary key,
	AutorID integer not null references Autor(AutorID),
	GenreID integer not null references  Genre(GenreID)
);

create table if not exists Album(
	AlbumID SERIAL primary key,
	Album_name VARCHAR(60) not null,
	Relise_date date not null,
	check (Relise_date > '1100.01.01' and Relise_date < current_date)
);

create table if not exists Album_autor(
	id SERIAL primary key,
	AutorID integer not null references Autor(AutorID),
	AlbumID integer not null references Album(AlbumID)
);


create table if not exists Track(
	TrackID SERIAL primary key,
	Track_name VARCHAR(60) not null,
	Duration integer check (Duration >= 1 and Duration <= 1200),
	AlbumID integer not null references Album(AlbumID)	
);

create table if not exists Collection(
	CollectionID SERIAL primary key,
	Collection_name VARCHAR(60) not null,
	Relise_date date not null
);

create table if not exists Collection_track(
	id SERIAL primary key,
	TrackID integer not null references Track(TrackID),
	CollectionID integer not null references Collection(CollectionID)
);