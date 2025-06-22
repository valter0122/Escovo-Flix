-- =========================
-- 2. INSERÇÃO DE DADOS
-- =========================

--=================================================USUARIOS=============================

INSERT INTO usuarios (id_usuario, nome, email, senha_hash, data_nascimento, data_cadastro) VALUES (1, 'Carolina
Rezende', 'xmartins@ig.com.br', 'fcb8973aa39841d9972d', '1993-06-30', CURRENT_TIMESTAMP);
INSERT INTO usuarios (id_usuario, nome, email, senha_hash, data_nascimento, data_cadastro) VALUES (2, 'Sr.
Thiago Lima', 'joao-miguel63@gmail.com', 'a564f4c9e4b191417be6', '1990-05-24', CURRENT_TIMESTAMP);
INSERT INTO usuarios (id_usuario, nome, email, senha_hash, data_nascimento, data_cadastro) VALUES (3, 'Dr.
Calebe Pires', 'lfernandes@melo.com', '5bf9d7b12f24ec24d36b', '1996-12-29', CURRENT_TIMESTAMP);
INSERT INTO usuarios (id_usuario, nome, email, senha_hash, data_nascimento, data_cadastro) VALUES (4, 'Leandro
Oliveira', 'juliapereira@ig.com.br', '8ff4223af272520c3c04', '1986-10-16', CURRENT_TIMESTAMP);
INSERT INTO usuarios (id_usuario, nome, email, senha_hash, data_nascimento, data_cadastro) VALUES (5, 'Sophia
Melo', 'camposalexia@bol.com.br', '5f5d54c42286a6cdd4d4', '1997-04-12', CURRENT_TIMESTAMP);
INSERT INTO usuarios (id_usuario, nome, email, senha_hash, data_nascimento, data_cadastro) VALUES (6, 'Luiz
Felipe da Cruz', 'martinsnatalia@hotmail.com', 'b2c310752d723a69ac8e', '1977-06-01', CURRENT_TIMESTAMP);
INSERT INTO usuarios (id_usuario, nome, email, senha_hash, data_nascimento, data_cadastro) VALUES (7, 'Isaac
Campos', 'felipe52@uol.com.br', 'fb15cb16b75367303f76', '2002-12-16', CURRENT_TIMESTAMP);
INSERT INTO usuarios (id_usuario, nome, email, senha_hash, data_nascimento, data_cadastro) VALUES (8,
'Emanuella da Cunha', 'cpinto@uol.com.br', '430e0b18524ed862b5a5', '1976-08-09', CURRENT_TIMESTAMP);
INSERT INTO usuarios (id_usuario, nome, email, senha_hash, data_nascimento, data_cadastro) VALUES (9, 'Levi
Nogueira', 'pietro94@da.com', 'b8a4790569243686acfb', '1983-10-25', CURRENT_TIMESTAMP);
INSERT INTO usuarios (id_usuario, nome, email, senha_hash, data_nascimento, data_cadastro) VALUES (10, 'Srta.
Daniela Vieira', 'giovanna10@hotmail.com', '7636a0bf7d3c98735e1e', '2007-03-24', CURRENT_TIMESTAMP);



--=================================================PLANOS=============================
INSERT INTO planos (id_plano, nome, preco, resolucao_maxima, numero_telas) VALUES (1, 'Básico', 19.90, '720p',
1);
INSERT INTO planos (id_plano, nome, preco, resolucao_maxima, numero_telas) VALUES (2, 'Padrão', 32.90, '1080p',
2);
INSERT INTO planos (id_plano, nome, preco, resolucao_maxima, numero_telas) VALUES (3, 'Premium', 45.90, '4K',
4);



--=================================================ASSINATURAS=============================
INSERT INTO assinaturas (id_assinatura, id_usuario, id_plano, data_inicio, data_fim, status) VALUES (1, 1, 2,
'2025-03-15', '2025-04-21', 'Cancelada');
INSERT INTO assinaturas (id_assinatura, id_usuario, id_plano, data_inicio, data_fim, status) VALUES (2, 2, 1,
'2024-11-24', '2025-04-06', 'Cancelada');
INSERT INTO assinaturas (id_assinatura, id_usuario, id_plano, data_inicio, data_fim, status) VALUES (3, 3, 3,
'2025-02-14', '2025-04-14', 'Cancelada');
INSERT INTO assinaturas (id_assinatura, id_usuario, id_plano, data_inicio, data_fim, status) VALUES (4, 4, 2,
'2025-04-14', NULL, 'Ativa');
INSERT INTO assinaturas (id_assinatura, id_usuario, id_plano, data_inicio, data_fim, status) VALUES (5, 5, 1,
'2024-08-07', '2025-02-16', 'Cancelada');
INSERT INTO assinaturas (id_assinatura, id_usuario, id_plano, data_inicio, data_fim, status) VALUES (6, 6, 3,
'2024-09-27', NULL, 'Ativa');
INSERT INTO assinaturas (id_assinatura, id_usuario, id_plano, data_inicio, data_fim, status) VALUES (7, 7, 1,
'2024-10-20', '2025-01-11', 'Cancelada');
INSERT INTO assinaturas (id_assinatura, id_usuario, id_plano, data_inicio, data_fim, status) VALUES (8, 8, 2,
'2025-01-07', NULL, 'Ativa');
INSERT INTO assinaturas (id_assinatura, id_usuario, id_plano, data_inicio, data_fim, status) VALUES (9, 9, 1,
'2024-06-17', NULL, 'Ativa');
INSERT INTO assinaturas (id_assinatura, id_usuario, id_plano, data_inicio, data_fim, status) VALUES (10, 10, 3,
'2024-06-13', NULL, 'Ativa');




--=================================================VIDEOS=============================
INSERT INTO videos (id_video, titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
VALUES (1, 'Filme 1', 'Descrição do filme 1', 120, 'Filme', 2019, '18+');
INSERT INTO videos (id_video, titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
VALUES (2, 'Filme 2', 'Descrição do filme 2', 101, 'Filme', 2016, '12+');
INSERT INTO videos (id_video, titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
VALUES (3, 'Filme 3', 'Descrição do filme 3', 68, 'Filme', 2017, '12+');
INSERT INTO videos (id_video, titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
VALUES (4, 'Filme 4', 'Descrição do filme 4', 77, 'Filme', 2021, '18+');
INSERT INTO videos (id_video, titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
VALUES (5, 'Filme 5', 'Descrição do filme 5', 118, 'Filme', 2023, '18+');
INSERT INTO videos (id_video, titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
VALUES (6, 'Filme 6', 'Descrição do filme 6', 108, 'Filme', 2020, '18+');
INSERT INTO videos (id_video, titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
VALUES (7, 'Filme 7', 'Descrição do filme 7', 78, 'Filme', 2019, '12+');
INSERT INTO videos (id_video, titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
VALUES (8, 'Filme 8', 'Descrição do filme 8', 72, 'Filme', 2023, '10+');
INSERT INTO videos (id_video, titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
VALUES (9, 'Filme 9', 'Descrição do filme 9', 97, 'Filme', 2018, '18+');
INSERT INTO videos (id_video, titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
VALUES (10, 'Filme 10', 'Descrição do filme 10', 119, 'Filme', 2015, 'Livre');




--=================================================EPISODIOS=============================
INSERT INTO episodios (id_episodio, id_video, temporada, numero_episodio, titulo, duracao) VALUES (1, 7, 1, 1,
'Episódio 1', 27);
INSERT INTO episodios (id_episodio, id_video, temporada, numero_episodio, titulo, duracao) VALUES (2, 3, 1, 2,
'Episódio 2', 49);
INSERT INTO episodios (id_episodio, id_video, temporada, numero_episodio, titulo, duracao) VALUES (3, 8, 1, 3,
'Episódio 3', 33);
INSERT INTO episodios (id_episodio, id_video, temporada, numero_episodio, titulo, duracao) VALUES (4, 4, 1, 4,
'Episódio 4', 45);
INSERT INTO episodios (id_episodio, id_video, temporada, numero_episodio, titulo, duracao) VALUES (5, 4, 1, 5,
'Episódio 5', 46);
INSERT INTO episodios (id_episodio, id_video, temporada, numero_episodio, titulo, duracao) VALUES (6, 9, 1, 6,
'Episódio 6', 27);
INSERT INTO episodios (id_episodio, id_video, temporada, numero_episodio, titulo, duracao) VALUES (7, 3, 1, 7,
'Episódio 7', 28);
INSERT INTO episodios (id_episodio, id_video, temporada, numero_episodio, titulo, duracao) VALUES (8, 6, 1, 8,
'Episódio 8', 24);
INSERT INTO episodios (id_episodio, id_video, temporada, numero_episodio, titulo, duracao) VALUES (9, 6, 1, 9,
'Episódio 9', 26);
INSERT INTO episodios (id_episodio, id_video, temporada, numero_episodio, titulo, duracao) VALUES (10, 4, 1,
10, 'Episódio 10', 21);




--=================================================CATEGORIAS=============================
INSERT INTO categorias (id_categoria, nome) VALUES (1, 'Ação');
INSERT INTO categorias (id_categoria, nome) VALUES (2, 'Comédia');
INSERT INTO categorias (id_categoria, nome) VALUES (3, 'Drama');
INSERT INTO categorias (id_categoria, nome) VALUES (4, 'Documentário');




--=================================================VIDEO CATEGORIAS (LIGAÇÃO)=============================
INSERT INTO video_categoria (id_video, id_categoria) VALUES (1, 2);
INSERT INTO video_categoria (id_video, id_categoria) VALUES (2, 3);
INSERT INTO video_categoria (id_video, id_categoria) VALUES (3, 3);
INSERT INTO video_categoria (id_video, id_categoria) VALUES (4, 2);
INSERT INTO video_categoria (id_video, id_categoria) VALUES (5, 3);
INSERT INTO video_categoria (id_video, id_categoria) VALUES (6, 2);
INSERT INTO video_categoria (id_video, id_categoria) VALUES (7, 1);
INSERT INTO video_categoria (id_video, id_categoria) VALUES (8, 4);
INSERT INTO video_categoria (id_video, id_categoria) VALUES (9, 2);
INSERT INTO video_categoria (id_video, id_categoria) VALUES (10, 2);




--=================================================PERFIL DOS USUARIOS=============================
INSERT INTO perfis_usuario (id_perfil, id_usuario, avatar_url, tipo_perfil) VALUES (1, 1,
'https://avatar.com/1.png', 'Principal');
INSERT INTO perfis_usuario (id_perfil, id_usuario, avatar_url, tipo_perfil) VALUES (2, 2,
'https://avatar.com/2.png', 'Infantil');
INSERT INTO perfis_usuario (id_perfil, id_usuario, avatar_url, tipo_perfil) VALUES (3, 3,
'https://avatar.com/3.png', 'Principal');
INSERT INTO perfis_usuario (id_perfil, id_usuario, avatar_url, tipo_perfil) VALUES (4, 4,
'https://avatar.com/4.png', 'Infantil');
INSERT INTO perfis_usuario (id_perfil, id_usuario, avatar_url, tipo_perfil) VALUES (5, 5,
'https://avatar.com/5.png', 'Convidado');
INSERT INTO perfis_usuario (id_perfil, id_usuario, avatar_url, tipo_perfil) VALUES (6, 6,
'https://avatar.com/6.png', 'Convidado');
INSERT INTO perfis_usuario (id_perfil, id_usuario, avatar_url, tipo_perfil) VALUES (7, 7,
'https://avatar.com/7.png', 'Principal');
INSERT INTO perfis_usuario (id_perfil, id_usuario, avatar_url, tipo_perfil) VALUES (8, 8,
'https://avatar.com/8.png', 'Infantil');
INSERT INTO perfis_usuario (id_perfil, id_usuario, avatar_url, tipo_perfil) VALUES (9, 9,
'https://avatar.com/9.png', 'Principal');
INSERT INTO perfis_usuario (id_perfil, id_usuario, avatar_url, tipo_perfil) VALUES (10, 10,
'https://avatar.com/10.png', 'Convidado');




--=================================================HISTORICO=============================
INSERT INTO historico_reproducao (id_historico, id_perfil, id_video, id_episodio, data_reproducao,
tempo_assistido) VALUES (1, 1, 2, 4, CURRENT_TIMESTAMP, 28);
INSERT INTO historico_reproducao (id_historico, id_perfil, id_video, id_episodio, data_reproducao,
tempo_assistido) VALUES (2, 2, 10, 8, CURRENT_TIMESTAMP, 43);
INSERT INTO historico_reproducao (id_historico, id_perfil, id_video, id_episodio, data_reproducao,
tempo_assistido) VALUES (3, 3, 7, 5, CURRENT_TIMESTAMP, 7);
INSERT INTO historico_reproducao (id_historico, id_perfil, id_video, id_episodio, data_reproducao,
tempo_assistido) VALUES (4, 4, 6, 10, CURRENT_TIMESTAMP, 50);
INSERT INTO historico_reproducao (id_historico, id_perfil, id_video, id_episodio, data_reproducao,
tempo_assistido) VALUES (5, 5, 10, 4, CURRENT_TIMESTAMP, 10);
INSERT INTO historico_reproducao (id_historico, id_perfil, id_video, id_episodio, data_reproducao,
tempo_assistido) VALUES (6, 6, 10, 5, CURRENT_TIMESTAMP, 38);
INSERT INTO historico_reproducao (id_historico, id_perfil, id_video, id_episodio, data_reproducao,
tempo_assistido) VALUES (7, 7, 2, 5, CURRENT_TIMESTAMP, 15);
INSERT INTO historico_reproducao (id_historico, id_perfil, id_video, id_episodio, data_reproducao,
tempo_assistido) VALUES (8, 8, 4, 2, CURRENT_TIMESTAMP, 41);
INSERT INTO historico_reproducao (id_historico, id_perfil, id_video, id_episodio, data_reproducao,
tempo_assistido) VALUES (9, 9, 8, 1, CURRENT_TIMESTAMP, 36);
INSERT INTO historico_reproducao (id_historico, id_perfil, id_video, id_episodio, data_reproducao,
tempo_assistido) VALUES (10, 10, 9, 4, CURRENT_TIMESTAMP, 45);