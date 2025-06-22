-- SCRIPT COMPLETO DO BANCO DE DADOS - escovoflix
-- =========================
-- 1. CRIAÇÃO DAS TABELAS
-- =========================
CREATE TABLE usuarios (
id_usuario SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
senha_hash VARCHAR(256) NOT NULL,
data_nascimento DATE NOT NULL,
data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE planos (
id_plano SERIAL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
resolucao_maxima VARCHAR(20),
numero_telas INTEGER
);


CREATE TABLE assinaturas (
id_assinatura SERIAL PRIMARY KEY,
id_usuario INTEGER NOT NULL REFERENCES usuarios(id_usuario),
id_plano INTEGER NOT NULL REFERENCES planos(id_plano),
data_inicio DATE NOT NULL,
data_fim DATE,
status VARCHAR(20) NOT NULL
);


CREATE TABLE videos (
id_video SERIAL PRIMARY KEY,
titulo VARCHAR(200) NOT NULL,
descricao TEXT,
duracao INTEGER NOT NULL,
tipo VARCHAR(20),
ano_lancamento INTEGER,
classificacao_indicativa VARCHAR(10)
);


CREATE TABLE episodios (
id_episodio SERIAL PRIMARY KEY,
id_video INTEGER NOT NULL REFERENCES videos(id_video),
temporada INTEGER,
numero_episodio INTEGER,
titulo VARCHAR(200),
duracao INTEGER
);


CREATE TABLE categorias (
id_categoria SERIAL PRIMARY KEY,
nome VARCHAR(50) NOT NULL
);


CREATE TABLE video_categoria (
id_video INTEGER REFERENCES videos(id_video),
id_categoria INTEGER REFERENCES categorias(id_categoria),
PRIMARY KEY(id_video, id_categoria)
);


CREATE TABLE perfis_usuario (
id_perfil SERIAL PRIMARY KEY,
id_usuario INTEGER NOT NULL REFERENCES usuarios(id_usuario),
avatar_url VARCHAR(200),
tipo_perfil VARCHAR(20)
);


CREATE TABLE historico_reproducao (
id_historico SERIAL PRIMARY KEY,
id_perfil INTEGER NOT NULL REFERENCES perfis_usuario(id_perfil),
id_video INTEGER NOT NULL REFERENCES videos(id_video),
id_episodio INTEGER REFERENCES episodios(id_episodio),
data_reproducao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
tempo_assistido INTEGER
);