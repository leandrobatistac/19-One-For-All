SELECT
	FORMAT(MIN(p.plan_price), 2) as faturamento_minimo,
	FORMAT(MAX(p.plan_price), 2) as faturamento_maximo,
	FORMAT(AVG(p.plan_price), 2) AS faturamento_medio,
	FORMAT(SUM(p.plan_price), 2) AS faturamento_total
FROM plans as p
INNER JOIN users as u on p.plan_id = u.plan_id;