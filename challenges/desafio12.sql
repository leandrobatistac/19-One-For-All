SELECT 
  a.artist_name as artista,
  CASE
        WHEN COUNT(f.music_id) >= 5 THEN 'A'
        WHEN COUNT(f.music_id) >= 3 THEN 'B'
        WHEN COUNT(f.music_id) >= 1 THEN 'C'
        ELSE '-'
  END as ranking
FROM favorites AS f
INNER JOIN musics AS m ON m.music_id = f.music_id
INNER JOIN albums AS alb ON alb.album_id = m.album_id
RIGHT JOIN artists AS a ON a.artist_id = alb.artist_id

GROUP BY artista
ORDER BY COUNT(f.music_id) DESC, artista;