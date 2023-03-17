SELECT COUNT(*) AS musicas_no_historico
FROM history AS hs
INNER JOIN users AS u ON hs.user_id = u.user_id
WHERE name_user = 'Barbara' AND last_name_user = 'Liskov';