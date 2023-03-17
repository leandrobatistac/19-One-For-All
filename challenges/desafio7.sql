SELECT
	a.artist_name AS artista,
    alb.album_name AS album,
	COUNT(fa.artist_id) AS pessoas_seguidoras
FROM artists AS a
INNER JOIN albums AS alb ON a.artist_id = alb.artist_id
INNER JOIN followed_artists AS fa ON fa.artist_id = a.artist_id

GROUP BY artista, album
ORDER BY COUNT(fa.artist_id) DESC, artista, album;