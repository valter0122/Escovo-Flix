-- 1. Vídeos mais assistidos
SELECT v.titulo, COUNT(h.id_hist) AS total_reproducoes
FROM videos v
JOIN historico_reproducao h ON v.id_video = h.id_video
GROUP BY v.titulo
ORDER BY total_reproducoes DESC;

-- 2. Tempo total assistido por perfil
SELECT p.nome_perfil, SUM(v.duracao) AS tempo_total_min
FROM historico_reproducao h
JOIN videos v ON h.id_video = v.id_video
JOIN perfis_usuario p ON h.id_perfil = p.id_perfil
GROUP BY p.nome_perfil;

-- 3. Assinaturas ativas por plano
SELECT pl.nome_plano, COUNT(*) AS total_ativas
FROM assinaturas a
JOIN planos pl ON a.id_plano = pl.id_plano
WHERE a.data_fim IS NULL
GROUP BY pl.nome_plano;

-- 4. Total de vídeos por categoria
SELECT c.nome_categoria, COUNT(vc.id_video) AS total_videos
FROM categorias c
JOIN video_categoria vc ON c.id_categoria = vc.id_categoria
GROUP BY c.nome_categoria;

-- 5. Clientes que mais pagaram
SELECT c.nome_cliente, SUM(r.valor) AS total_pago
FROM recebimentos r
JOIN contasreceber cr ON r.id_contasreceber = cr.id_contasreceber
JOIN clientes c ON cr.id_cliente = c.id_cliente
GROUP BY c.nome_cliente
ORDER BY total_pago DESC;

-- 6. Planos com maior média de telas por resolução
SELECT AVG(numero_telas) AS media_telas, resolucao_maxima
FROM planos
GROUP BY resolucao_maxima
ORDER BY media_telas DESC;

-- 7. Assinaturas finalizadas no mês atual
SELECT COUNT(*) AS total_finalizadas
FROM assinaturas
WHERE EXTRACT(MONTH FROM data_fim) = EXTRACT(MONTH FROM CURRENT_DATE)
  AND EXTRACT(YEAR FROM data_fim) = EXTRACT(YEAR FROM CURRENT_DATE);

-- 8. Número de episódios por vídeo (séries)
SELECT v.titulo, COUNT(e.id_episodio) AS total_episodios
FROM videos v
JOIN episodios e ON v.id_video = e.id_video
GROUP BY v.titulo
ORDER BY total_episodios DESC;

-- 9. Categorias mais assistidas nos últimos 30 dias
SELECT 
  c.nome_categoria,
  COUNT(h.id_hist) AS total_reproducoes
FROM historico_reproducao h
JOIN videos v ON h.id_video = v.id_video
JOIN video_categoria vc ON v.id_video = vc.id_video
JOIN categorias c ON vc.id_categoria = c.id_categoria
WHERE h.data_hora >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY c.nome_categoria
ORDER BY total_reproducoes DESC;
