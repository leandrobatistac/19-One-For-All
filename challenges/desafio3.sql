SELECT 
  CONCAT(u.name_user, ' ', u.last_name_user) AS pessoa_usuaria,
  COUNT(hs.music_id) AS musicas_ouvidas,
  ROUND(SUM(m.music_duration) / 60, 2) AS total_minutos
FROM 
	users as u 
  INNER JOIN history as hs ON u.user_id = hs.user_id
	INNER JOIN musics AS m ON hs.music_id = m.music_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;