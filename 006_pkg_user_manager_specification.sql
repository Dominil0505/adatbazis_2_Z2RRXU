create or replace package pkg_user_manager is

       procedure register_user(
         p_first_name in users.first_name%type,
         p_last_name in users.last_name%type,
         p_username in users.username%type,
         p_email in users.email%type,
         p_password in users.password%type
       );

       procedure register_as_artist(
         p_first_name in users.first_name%type,
         p_last_name in users.last_name%type,
         p_username in users.username%type,
         p_email in users.email%type,
         p_password in users.password%type,
         p_role in users.role%type
       );

       procedure follow_artist(user_id number, artist_id number);
       procedure delete_user(user_id number);

       function get_artist_followers(artist_id number) return varchar2;

end pkg_user_manager;
