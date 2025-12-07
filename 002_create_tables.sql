/*
       USERS table
*/
create table users (
       user_id number primary key,
       first_name varchar2(50) not null,
       last_name varchar2(50) not null,
       username  varchar2(50) not null,
       password varchar2(100) not null,
       email varchar2(255) not null,
       role varchar2(10) default 'user' not null,
       created_at date default sysdate,
       
       constraint email_unique unique(email),
       constraint username_unique unique(username)
) tablespace users;

create index idx_email on users(email);
create index idx_username on users(username);

comment on table users is 'Felhasznalokat tarolja';

/*
       ARTISTS table
*/
create table artists (
       artist_id number primary key,
       name varchar2(50) not null,
       avatar_url varchar2(255) null,
       bio varchar2(255) null,
       user_id number not null,
       created_at date default sysdate,
       
       constraint artist_name_unique unique(name),
       constraint artist_user_fk foreign key (user_id) 
                  references users(user_id)
                  on delete cascade
) tablespace users;

create index idx_artist_name on artists(name);

comment on table artists is 'Eloadokat tarolja';

/*
       ALBUMS table
*/
create table albums (
       album_id number primary key,
       title varchar2(200) not null,
       cover_img varchar2(255) null,
       artist_id number null,
       release_date date,
       created_at date default sysdate,
       updated_at date default sysdate,
       
       constraint album_artist_fk foreign key(artist_id)
                  references artists(artist_id)
                  on delete set null
) tablespace users;

create index idx_album_title on albums(title);

comment on table albums is 'Az eloadohoz tartozo albumot tarolja';

/*
       SONGS table
*/
create table songs (
       song_id number primary key,
       title varchar2(200) not null,
       duration_seconds number(5) not null,
       album_id number not null,
       stream_count number default 0,
       created_at date default sysdate,
       
       constraint song_album_fk foreign key(album_id) 
                  references albums(album_id)
                  on delete cascade       
) tablespace users;

comment on table songs is 'Eloado dalait tarolja';

/*
       GENRES table
*/
create table genres(
       genre_id number primary key,
       name varchar2(50) not null,
       
       constraint genre_name_unique unique(name)
) tablespace users;

create index idx_genre_name on genres(name);
comment on table genres is 'Zene mufajait tarolja';


/*
       SONGS - GENRES table
*/
create table songs_genres(
       song_id number not null,
       genre_id number not null,
       
       constraint pk_songs_genres primary key (song_id, genre_id),
       
       constraint genre_song_fk foreign key(song_id)
                  references songs(song_id)
                  on delete cascade,
                  
       constraint genre_fk foreign key(genre_id)
                  references genres(genre_id)
                  on delete cascade
) tablespace users;

comment on table songs_genres is 'A zenehez tartozo mufaj kapcsolo tablaja N:M';

/*
       PLAYLISTS table
*/

create table playlists (
       playlist_id number primary key,
       title varchar2(50) not null,
       description varchar2(255) null,
       user_id number not null,
       is_public char(1) default 'F' check(is_public in ('T', 'F')),
       created_at date default sysdate,
       
       constraint playlist_user_fk foreign key (user_id) 
                  references users(user_id) 
                  on delete cascade
       
) tablespace users;

create index idx_playlist_title on playlists(title);

comment on table playlists is 'Felhasznalo altal letrehozott lejatszasi lista';

/* 
       PLAYLISTS - SONGS table
*/

create table playlists_songs(
       playlist_id number not null,
       song_id number not null,
       track_order number null,
       added_at date default sysdate,
       
       constraint pk_playlists_songs primary key (playlist_id, song_id),

       constraint ps_playlist_fk foreign key (playlist_id)
                  references playlists(playlist_id)
                  on delete cascade,

       constraint ps_song_fk foreign key (song_id)
                  references songs(song_id)
                  on delete cascade
       
) tablespace users;
comment on table playlists_songs is 'Felhasznalo altal letrehozott lejatszasi listaban levo zenek';

/*
       USER FOLLOWS ARTISTS table
*/

create table user_follows_artists(
       user_id number not null,
       artist_id number not null,
       followed_at date default sysdate,
       
       constraint pk_user_follows primary key (user_id, artist_id),
       
       constraint follow_user_fk foreign key (user_id)
                  references users(user_id)
                  on delete cascade,
                  
       constraint follow_artist_fk foreign key (artist_id)
                  references artists(artist_id)
                  on delete cascade
) tablespace users;

comment on table user_follows_artists is 'Felhasznalo altal kovetett eloadok';


/*
       STREAMS table
*/

create table streams (
       stream_id number primary key,
       song_id number not null,
       user_id number not null,
       played_at timestamp default systimestamp,
       
       constraint stream_user_fk foreign key (user_id)
                  references users(user_id)
                  on delete cascade,
                  
       constraint stream_song_fk foreign key (song_id)
                  references songs(song_id)
                  on delete cascade
) tablespace users;
comment on table streams is 'Felhasznalo jelenlegi lejatszasa';

/*
       PLAYLIST_COLLABORATORS table
*/

create table playlist_collaborators(
      playlist_id number,
      user_id number not null,
      permission_level varchar2(5) default 'view',
      
      constraint pk_collab primary key (playlist_id, user_id),

      constraint playlist_collab_user_fk foreign key (user_id)
                  references users(user_id)
                  on delete cascade,

      constraint playlist_collab_list_fk foreign key (playlist_id)
                  references playlists(playlist_id)
                  on delete cascade
) tablespace users;

comment on table playlist_collaborators is 'Felhasznalo altal megosztott album';
