SELECT
	(a.artist_name) as artista,
  (alb.album_name) as album
FROM artists AS a 
INNER JOIN albums AS alb ON a.artist_id = alb.artist_id
WHERE a.artist_name = 'Elis Regina';