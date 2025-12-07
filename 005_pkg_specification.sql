CREATE OR REPLACE PACKAGE pkg_music_manager IS

  PROCEDURE add_song_to_album(p_album_id IN albums.album_id%TYPE
                             ,p_song_id  IN songs.song_id%TYPE);

  PROCEDURE add_song_to_playlist(p_playlist_id IN playlists.playlist_id%TYPE
                                ,p_song_id     IN songs.song_id%TYPE);

  PROCEDURE play_song(p_song_id IN songs.song_id%TYPE);

  PROCEDURE create_album(p_title     IN albums.title%TYPE
                        ,p_artist_id IN artists.artist_id%TYPE);

  PROCEDURE share_album(p_album_id IN albums.album_id%TYPE
                       ,p_user_id  IN users.user_id%TYPE);

  FUNCTION get_playlist_duration(p_playlist_id NUMBER) RETURN NUMBER;
  FUNCTION get_albums_with_song_names(album_id NUMBER) RETURN VARCHAR2;
  FUNCTION find_album_with_song_names(song_name VARCHAR2) RETURN VARCHAR2;
  FUNCTION get_top_songs(p_limit NUMBER DEFAULT 5) RETURN VARCHAR2;

END pkg_music_manager;
