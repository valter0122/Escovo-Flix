-- =========================
-- 6.  VIEWS
-- =========================

-- View 1: vídeos mais assistidos
CREATE OR REPLACE VIEW vw_videos_mais_assistidos AS
SELECT
v.id_video,
v.titulo,
COUNT(hr.id_historico) AS total_reproducoes
FROM
videos v
LEFT JOIN
historico_reproducao hr ON hr.id_video = v.id_video
GROUP BY
v.id_video, v.titulo
ORDER BY
total_reproducoes DESC;


-- View 2: tempo total assistido por perfil
CREATE OR REPLACE VIEW vw_tempo_total_assistido_por_perfil AS
SELECT
p.id_perfil,
u.nome AS nome_usuario,
SUM(hr.tempo_assistido) AS tempo_total_minutos
FROM
historico_reproducao hr
JOIN
perfis_usuario p ON p.id_perfil = hr.id_perfil
JOIN
usuarios u ON u.id_usuario = p.id_usuario
GROUP BY
p.id_perfil, u.nome;


-- View 3: assinaturas por plano
CREATE OR REPLACE VIEW vw_assinaturas_por_plano AS
SELECT
pl.nome AS nome_plano,
COUNT(a.id_assinatura) AS total_assinaturas
FROM
assinaturas a
JOIN
planos pl ON pl.id_plano = a.id_plano
GROUP BY
pl.nome
ORDER BY
total_assinaturas DESC;





-- View 4. Últimos vídeos por perfil 
CREATE OR REPLACE VIEW vw_ultimos_videos_por_perfil AS
SELECT
    hr.id_perfil,
    u.nome AS nome_usuario,
    v.titulo,
    MAX(hr.data_reproducao) AS ultima_reproducao
FROM historico_reproducao hr
JOIN videos v ON v.id_video = hr.id_video
JOIN perfis_usuario p ON p.id_perfil = hr.id_perfil
JOIN usuarios u ON u.id_usuario = p.id_usuario
GROUP BY hr.id_perfil, u.nome, v.titulo;



--view5. Assinaturas ativas por usuário 
CREATE OR REPLACE VIEW vw_assinaturas_ativas AS
SELECT
    u.id_usuario,
    u.nome,
    a.id_assinatura,
    pl.nome AS plano,
    a.data_inicio,
    a.data_fim
FROM assinaturas a
JOIN usuarios u ON u.id_usuario = a.id_usuario
JOIN planos pl ON pl.id_plano = a.id_plano
WHERE a.status = 'Ativa';



-- viwe 6. Usuários com assinatura ativa e plano 
CREATE OR REPLACE VIEW vw_usuarios_com_assinatura_ativa AS
SELECT
    u.id_usuario,
    u.nome,
    a.id_assinatura,
    p.nome AS plano,
    a.data_inicio
FROM usuarios u
JOIN assinaturas a ON a.id_usuario = u.id_usuario
JOIN planos p ON p.id_plano = a.id_plano
WHERE a.status = 'Ativa';



--view 7. Vídeos e suas categorias 
CREATE OR REPLACE VIEW vw_videos_por_categoria AS
SELECT
    v.id_video,
    v.titulo,
    c.nome AS categoria
FROM videos v
JOIN video_categoria vc ON vc.id_video = v.id_video
JOIN categorias c ON c.id_categoria = vc.id_categoria;


-- view8. Resumo de uso de plano (nº de usuários) 
CREATE OR REPLACE VIEW vw_resumo_uso_plano AS
SELECT
    pl.nome AS plano,
    COUNT(DISTINCT a.id_usuario) AS total_usuarios
FROM planos pl
LEFT JOIN assinaturas a ON a.id_plano = pl.id_plano
GROUP BY pl.nome;


--view 9. Top 10 vídeos mais assistidos 
CREATE OR REPLACE VIEW vw_top_10_videos AS
SELECT
    v.id_video,
    v.titulo,
    COUNT(hr.id_historico) AS total_reproducoes
FROM videos v
JOIN historico_reproducao hr ON hr.id_video = v.id_video
GROUP BY v.id_video, v.titulo
ORDER BY total_reproducoes DESC
LIMIT 10;


-- view 10. Reproduções por dia (últimos 30 dias) 
CREATE OR REPLACE VIEW vw_reproducoes_por_dia AS
SELECT
    DATE(hr.data_reproducao) AS dia,
    COUNT(*) AS total
FROM historico_reproducao hr
WHERE hr.data_reproducao >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY DATE(hr.data_reproducao)
ORDER BY dia DESC;