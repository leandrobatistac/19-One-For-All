SELECT 
    (SELECT COUNT(music_id) FROM musics) AS cancoes,
    (SELECT COUNT(artist_id) FROM artists) AS artistas,
    (SELECT COUNT(album_id) FROM albums) AS albuns;