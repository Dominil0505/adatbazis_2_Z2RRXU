-- =============================================
-- USERS ID auto icrement trigger
-- =============================================
create sequence seq_users start with 1 increment by 1;

create or replace trigger trg_users_id
before insert on users
for each row
begin 
  if :NEW.user_id is null then :NEW.user_id := seq_users.nextval;
  end if;
end;
/

-- =============================================
-- ARTISTS ID auto icrement trigger
-- =============================================
create sequence seq_artists start with 1 increment by 1;

create or replace trigger trg_artists_id
before insert on artists
for each row
begin
  if :NEW.artist_id is null then :NEW.artist_id := seq_artists.nextval;
  end if;
end;
/


-- =============================================
-- ALBUMS ID auto icrement trigger
-- =============================================
create sequence seq_albums start with 1 increment by 1;

create or replace trigger trg_albums_id
before insert on albums
for each row
begin
  if :NEW.album_id is null then :NEW.album_id := seq_albums.nextval;
  end if;
end;
/

-- =============================================
-- SONGS ID auto icrement trigger
-- =============================================
create sequence seq_songs start with 1 increment by 1;

create or replace trigger trg_songs_id
before insert on songs
for each row
begin
  if :NEW.song_id is null then :NEW.song_id := seq_songs.nextval;
  end if;
end;
/

-- =============================================
-- GENRES ID auto icrement trigger
-- =============================================
create sequence seq_genres start with 1 increment by 1;

create or replace trigger trg_genres_id
before insert on genres
for each row
begin
  if :NEW.genre_id is null then :NEW.genre_id := seq_genres.nextval;
  end if;
end;
/

-- =============================================
-- PLAYLISTS ID auto icrement trigger
-- =============================================
create sequence seq_playlists start with 1 increment by 1;

create or replace trigger trg_genres_id
before insert on genres
for each row
begin
  if :NEW.genre_id is null then :NEW.genre_id := seq_genres.nextval;
  end if;
end;
/

-- =============================================
-- STREAMS ID auto icrement trigger
-- =============================================
create sequence seq_streams start with 1 increment by 1;

create or replace trigger trg_streams_id
before insert on streams
for each row
begin
  if :NEW.stream_id is null then :NEW.stream_id := seq_streams.nextval;
  end if;
end;
/
