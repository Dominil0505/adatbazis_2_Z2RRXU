-- =============================================
-- Amikor a felhasznalo meghallgat egy zenet 
-- akkor novekszik a stream_count a songs tablaba
-- =============================================

create or replace trigger trg_update_stream_count
after insert on streams
for each row
begin
  update songs
  set songs.stream_count = songs.stream_count + 1
  where songs.song_id = :NEW.song_id;
end;
/

-- =============================================
-- Amikor a felhasznalo hozzaad egy zenet az 
-- albumhoz akkor frissul az updated_at rekord
-- =============================================
create or replace trigger trg_albums_updated_at
before update on albums
for each row
begin
  :NEW.updated_at := sysdate;
end;
/
