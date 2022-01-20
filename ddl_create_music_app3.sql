create table if not exists genre (
    id serial primary key,
    name varchar(20) not null
);

create table if not exists artist (
    id serial primary key,
    pseudonym text not null
);

create table if not exists artist_genre (
    id serial primary key,
    artist_id integer not null references artist(id),
    genre_id integer not null references genre(id),
    constraint ag_unique unique (artist_id, genre_id)
);

create table if not exists album (
    id serial primary key,
    name text,
    year integer not null
);

create table if not exists artist_album (
    id serial primary key,
    artist_id integer not null references artist(id),
    album_id integer not null references album(id),
    constraint aa_unique unique (artist_id, album_id)
);

create table if not exists track (
    id serial primary key,
    name text,
    duration integer not null,
    album_id integer not null references album(id)
);

create table if not exists compilation (
    id serial primary key,
    name text,
    year integer not null
);

create table if not exists compilation_track (
    id serial primary key,
    track_id integer not null references track(id),
    compilation_id integer not null references compilation(id),
    constraint ct_unique unique (track_id, compilation_id)
)