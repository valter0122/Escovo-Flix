-- =========================
-- 4. FUNCTIONS / PROCEDURES
-- =========================

-- 1. Função para inserir novo usuário
CREATE OR REPLACE FUNCTION fn_inserir_usuario(
p_nome VARCHAR,
p_email VARCHAR,
p_senha_hash VARCHAR,
p_data_nascimento DATE
)
RETURNS VOID AS $$
BEGIN
INSERT INTO usuarios (nome, email, senha_hash, data_nascimento, data_cadastro)
VALUES (p_nome, p_email, p_senha_hash, p_data_nascimento, CURRENT_TIMESTAMP);
END;
$$ LANGUAGE plpgsql;


-- 2. Função para criar uma nova assinatura
CREATE OR REPLACE FUNCTION fn_criar_assinatura(
p_id_usuario INTEGER,
p_id_plano INTEGER,
p_data_inicio DATE
)
RETURNS VOID AS $$
BEGIN
INSERT INTO assinaturas (id_usuario, id_plano, data_inicio, status)
VALUES (p_id_usuario, p_id_plano, p_data_inicio, 'Ativa');
END;
$$ LANGUAGE plpgsql;


-- 3. Função para registrar reprodução de vídeo/episódio
CREATE OR REPLACE FUNCTION fn_registrar_reproducao(
p_id_perfil INTEGER,
p_id_video INTEGER,
p_id_episodio INTEGER,
p_tempo_assistido INTEGER
)
RETURNS VOID AS $$
BEGIN
INSERT INTO historico_reproducao (id_perfil, id_video, id_episodio, data_reproducao, tempo_assistido)
VALUES (p_id_perfil, p_id_video, p_id_episodio, CURRENT_TIMESTAMP, p_tempo_assistido);
END;
$$ LANGUAGE plpgsql;


--4. Atualiza status da assinatura automaticamente 
CREATE OR REPLACE FUNCTION fn_atualizar_status_assinatura()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.data_fim IS NOT NULL AND NEW.data_fim <= CURRENT_DATE THEN
        NEW.status := 'Cancelada';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- 5. Bloqueia perfil infantil de ver vídeos 18+ 
CREATE OR REPLACE FUNCTION fn_bloquear_conteudo_infantil()
RETURNS TRIGGER AS $$
DECLARE
    classificacao TEXT;
    tipo_perfil   TEXT;
BEGIN
    SELECT v.classificacao_indicativa INTO classificacao
    FROM videos v WHERE v.id_video = NEW.id_video;

    SELECT p.tipo_perfil INTO tipo_perfil
    FROM perfis_usuario p WHERE p.id_perfil = NEW.id_perfil;

    IF tipo_perfil = 'Infantil' AND classificacao = '18+' THEN
        RAISE EXCEPTION 'Perfil Infantil não pode assistir vídeos 18+';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



-- 6. Encerra uma assinatura ativa
CREATE OR REPLACE FUNCTION fn_encerrar_assinatura(p_id_assinatura INTEGER)
RETURNS VOID AS $$
BEGIN
    UPDATE assinaturas
    SET data_fim = CURRENT_DATE,
        status   = 'Cancelada'
    WHERE id_assinatura = p_id_assinatura
      AND status = 'Ativa';
END;
$$ LANGUAGE plpgsql;

-- 7. Retorna vídeos por categoria (view‑like function) 
CREATE OR REPLACE FUNCTION fn_videos_por_categoria(p_id_categoria INTEGER)
RETURNS TABLE(id_video INTEGER, titulo VARCHAR, categoria VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT v.id_video, v.titulo, c.nome
    FROM videos v
    JOIN video_categoria vc ON vc.id_video = v.id_video
    JOIN categorias c       ON c.id_categoria = vc.id_categoria
    WHERE c.id_categoria = p_id_categoria;
END;
$$ LANGUAGE plpgsql;


-- 8. Obtém perfis de um usuário 
CREATE OR REPLACE FUNCTION fn_obter_perfis_usuario(p_id_usuario INTEGER)
RETURNS TABLE(id_perfil INTEGER, avatar_url VARCHAR, tipo_perfil VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT id_perfil, avatar_url, tipo_perfil
    FROM perfis_usuario
    WHERE id_usuario = p_id_usuario;
END;
$$ LANGUAGE plpgsql;