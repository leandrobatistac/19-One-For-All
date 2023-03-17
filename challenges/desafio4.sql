SELECT 
  CONCAT(u.name_user, ' ', u.last_name_user) AS pessoa_usuaria,
	IF((SELECT COUNT(*) FROM history AS hs
	WHERE YEAR(hs.date_play) >= 2021 
	AND u.user_id = hs.user_id) > 0, 
	'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM users AS u
ORDER BY pessoa_usuaria;