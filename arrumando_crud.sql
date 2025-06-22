--=====================
--arrumando crud para deletar videos em cascata
--=====================

--remover constaint categoria
ALTER TABLE video_categoria
DROP CONSTRAINT video_categoria_id_video_fkey;

-- botando ON DELETE CASCADE
ALTER TABLE video_categoria
ADD CONSTRAINT video_categoria_id_video_fkey
FOREIGN KEY (id_video)
REFERENCES videos(id_video)
ON DELETE CASCADE;


--remover constaint historico
ALTER TABLE historico_reproducao
DROP CONSTRAINT IF EXISTS historico_reproducao_id_video_fkey;

-- botando ON DELETE CASCADE
ALTER TABLE historico_reproducao
ADD CONSTRAINT historico_reproducao_id_video_fkey
FOREIGN KEY (id_video)
REFERENCES videos(id_video)
ON DELETE CASCADE;

