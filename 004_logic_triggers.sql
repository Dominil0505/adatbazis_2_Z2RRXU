  -- =============================================
  -- Amikor a felhasznalo meghallgat egy zenet 
  -- akkor novekszik a stream_count a songs tablaba
  -- =============================================

  CREATE OR REPLACE TRIGGER trg_update_stream_count
  AFTER INSERT ON streams
  FOR EACH ROW
BEGIN
  UPDATE songs
     SET songs.stream_count = songs.stream_count + 1
   WHERE songs.song_id = :new.song_id;
END;
  /

  -- =============================================
  -- Amikor a felhasznalo hozzaad egy zenet az 
  -- albumhoz akkor frissul az updated_at rekord
  -- =============================================
  CREATE OR REPLACE TRIGGER trg_albums_updated_at
  BEFORE UPDATE ON albums
  FOR EACH ROW BEGIN :new.updated_at := SYSDATE; END;
/
