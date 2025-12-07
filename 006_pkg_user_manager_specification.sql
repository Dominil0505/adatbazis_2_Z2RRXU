CREATE OR REPLACE PACKAGE pkg_user_manager IS

  PROCEDURE register_user(p_first_name IN users.first_name%TYPE
                         ,p_last_name  IN users.last_name%TYPE
                         ,p_username   IN users.username%TYPE
                         ,p_email      IN users.email%TYPE
                         ,p_password   IN users.password%TYPE);

  PROCEDURE register_as_artist(p_first_name IN users.first_name%TYPE
                              ,p_last_name  IN users.last_name%TYPE
                              ,p_username   IN users.username%TYPE
                              ,p_email      IN users.email%TYPE
                              ,p_password   IN users.password%TYPE
                              ,p_role       IN users.role%TYPE);

  PROCEDURE follow_artist(user_id   NUMBER
                         ,artist_id NUMBER);
  PROCEDURE delete_user(user_id NUMBER);

  FUNCTION get_artist_followers(artist_id NUMBER) RETURN VARCHAR2;

END pkg_user_manager;
