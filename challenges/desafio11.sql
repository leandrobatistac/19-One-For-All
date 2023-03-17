SELECT 
	alb.album_name as album,
  COUNT(alb.album_name) as favoritadas
FROM favorites AS f
INNER JOIN musics AS m ON m.music_id = f.music_id
INNER JOIN albums AS alb ON alb.album_id = m.album_id

GROUP BY album
ORDER BY favoritadas DESC, album
LIMIT 3;