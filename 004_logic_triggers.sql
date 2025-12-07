-- =============================================
-- Amikor a felhasználó meghallgat egy zenét 
-- akkor növekszik a stream_count a songs táblába
-- =============================================

create or replace trigger trg_update_stream_count
after insert on streams
begin
  update songs
  set songs.stream_count = songs.stream_count + 1
  where songs.song_id = :NEW.song_id;
end;
/

-- =============================================
-- Amikor a felhasználó hozzáad egy zenét az 
-- albumhoz akkor frissül az updated_at rekord
-- =============================================
create or replace trigger trg_albums_updated_at
after update on albums
for each row
begin
  :new.updated_at := sysdate;
end;
/
