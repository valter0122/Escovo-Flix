-- =========================
-- 3.  INDEX
-- =========================

-- ==============================
-- Tabela: usuarios
-- ==============================
CREATE INDEX idx_usuarios_nome ON usuarios (nome);
CREATE UNIQUE INDEX idx_usuarios_email_unique ON usuarios (email);
CREATE INDEX idx_usuarios_nome_email ON usuarios (nome, email);



-- ==============================
-- Tabela: assinaturas
-- ==============================
CREATE INDEX idx_assinaturas_idusuario ON assinaturas (id_usuario);
CREATE INDEX idx_assinaturas_idplano_data ON assinaturas (id_plano, data_inicio);
CREATE INDEX idx_assinaturas_status ON assinaturas (status);
CREATE INDEX idx_assinaturas_ativas ON assinaturas (data_fim)
WHERE data_fim IS NULL;



-- ==============================
-- Tabela: videos
-- ==============================
CREATE INDEX idx_videos_titulo ON videos (titulo);
CREATE INDEX idx_videos_ano ON videos (ano_lancamento);



-- ==============================
-- Tabela: episodios
-- ==============================
CREATE INDEX idx_episodios_idvideo ON episodios (id_video);
CREATE INDEX idx_episodios_titulo ON episodios (titulo);
CREATE INDEX idx_episodios_temp_ep ON episodios (temporada, numero_episodio);



-- ==============================
-- Tabela: perfis_usuario
-- ==============================
CREATE INDEX idx_perfis_usuario_idusuario ON perfis_usuario (id_usuario);
CREATE INDEX idx_perfis_usuario_tipo ON perfis_usuario (tipo_perfil);



-- ==============================
-- Tabela: historico_reproducao
-- ==============================
CREATE INDEX idx_historico_idperfil ON historico_reproducao (id_perfil);
CREATE INDEX idx_historico_idvideo ON historico_reproducao (id_video);
CREATE INDEX idx_historico_data_reproducao ON historico_reproducao (data_reproducao);




-- ==============================
-- Tabela: planos
-- ==============================
CREATE INDEX idx_planos_nome ON planos (nome);
CREATE INDEX idx_planos_preco ON planos (preco);
CREATE INDEX idx_planos_resolucao_telas ON planos (resolucao_maxima, numero_telas);



-- ==============================
-- Tabela: categorias
-- ==============================
CREATE INDEX idx_categorias_nome ON categorias (nome);



-- ==============================
-- Tabela: video_categoria
-- ==============================
CREATE INDEX idx_video_categoria_id_video ON video_categoria (id_video);
CREATE INDEX idx_video_categoria_id_categoria ON video_categoria (id_categoria);
CREATE INDEX idx_video_categoria_composite ON video_categoria (id_video, id_categoria);