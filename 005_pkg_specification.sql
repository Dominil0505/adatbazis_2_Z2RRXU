create or replace package pkg_music_manager is
       
       procedure add_song_to_album(
         p_album_id in albums.album_id%type,
         p_song_id in songs.song_id%type
       );

       procedure add_song_to_playlist(
         p_playlist_id in playlists.playlist_id%type,
         p_song_id in songs.song_id%type
       );
       
       procedure play_song(p_song_id in songs.song_id%type);
       
       procedure create_album(
         p_title in albums.title%type,
         p_artist_id in artists.artist_id%type
       );
       
       procedure share_album(
         p_album_id in albums.album_id%type,
         p_user_id in users.user_id%type
       );
       
       function get_playlist_duration(p_playlist_id number) return number;
       function get_albums_with_song_names(album_id number) return varchar2;
       function find_album_with_song_names(song_name varchar2) return varchar2;
       function get_top_songs(p_limit number default 5) return varchar2;
       
end pkg_music_manager;
