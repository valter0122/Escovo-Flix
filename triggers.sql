-- =========================
-- 5.     TRIGGERS
-- =========================

--1. Trigger para impedir reprodução se a assinatura estiver cancelada
CREATE OR REPLACE FUNCTION fn_impedir_reproducao_assinatura_cancelada()
RETURNS TRIGGER AS $$
DECLARE
v_status TEXT;
BEGIN
SELECT a.status INTO v_status
FROM assinaturas a
JOIN perfis_usuario p ON p.id_usuario = a.id_usuario
WHERE p.id_perfil = NEW.id_perfil
ORDER BY a.data_inicio DESC
LIMIT 1;
IF v_status <> 'Ativa' THEN
RAISE EXCEPTION 'Reprodução bloqueada: assinatura inativa para este perfil.';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_verifica_assinatura_ativa
BEFORE INSERT ON historico_reproducao
FOR EACH ROW
EXECUTE FUNCTION fn_impedir_reproducao_assinatura_cancelada();



--2. Trigger para atualizar status assinatura 
DROP TRIGGER IF EXISTS trg_atualizar_status_assinatura ON assinaturas;
CREATE TRIGGER trg_atualizar_status_assinatura
BEFORE INSERT OR UPDATE ON assinaturas
FOR EACH ROW
EXECUTE FUNCTION fn_atualizar_status_assinatura();



--3. Trigger para bloquear conteúdo infantil 
DROP TRIGGER IF EXISTS trg_bloquear_conteudo_infantil ON historico_reproducao;
CREATE TRIGGER trg_bloquear_conteudo_infantil
BEFORE INSERT ON historico_reproducao
FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_conteudo_infantil();



-- 4. Verifica e-mail único (reforço) 
CREATE OR REPLACE FUNCTION fn_verifica_email_unico()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM usuarios WHERE email = NEW.email AND id_usuario <> COALESCE(NEW.id_usuario, 0)) THEN
        RAISE EXCEPTION 'E-mail % já está em uso.', NEW.email;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_verifica_email_unico ON usuarios;
CREATE TRIGGER trg_verifica_email_unico
BEFORE INSERT OR UPDATE ON usuarios
FOR EACH ROW
EXECUTE FUNCTION fn_verifica_email_unico();




-- 5. Limita número de perfis conforme plano 
CREATE OR REPLACE FUNCTION fn_limita_numero_telas()
RETURNS TRIGGER AS $$
DECLARE
    v_telas INTEGER;
    v_qtd   INTEGER;
BEGIN
    SELECT pl.numero_telas INTO v_telas
    FROM assinaturas a
    JOIN planos pl ON pl.id_plano = a.id_plano
    WHERE a.id_usuario = NEW.id_usuario
      AND a.status = 'Ativa'
    ORDER BY a.data_inicio DESC
    LIMIT 1;

    IF v_telas IS NULL THEN
        RAISE EXCEPTION 'Usuário não possui assinatura ativa.';
    END IF;

    SELECT COUNT(*) INTO v_qtd
    FROM perfis_usuario
    WHERE id_usuario = NEW.id_usuario;

    IF v_qtd >= v_telas THEN
        RAISE EXCEPTION 'Limite de perfis excedido (% / %).', v_qtd, v_telas;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_limita_numero_telas ON perfis_usuario;
CREATE TRIGGER trg_limita_numero_telas
BEFORE INSERT ON perfis_usuario
FOR EACH ROW
EXECUTE FUNCTION fn_limita_numero_telas();
