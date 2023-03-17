SELECT
  m.music_name AS cancao, 
	COUNT(hs.music_id) AS reproducoes
FROM musics AS m
INNER JOIN history AS hs ON m.music_id = hs.music_id

GROUP BY hs.music_id
ORDER BY reproducoes DESC, cancao 
LIMIT 2;