# EscovoFlix – Banco de Dados & CRUD GUI

**EscovoFlix** é um projeto acadêmico para a disciplina de Banco de Dados II  
que demonstra o desenho completo de um sistema de streaming:

* **Scripts SQL** (tabelas, cargas, índices, *views*, *functions/procedures* e *triggers*)
* **Consultas de negócio** otimizadas
* **Aplicação GUI** em **Python + Tkinter** para CRUD da tabela `videos`

> Compatível com PostgreSQL 13+ e Python 3.8+.

---

## 📁 Estrutura de pastas

```
banco/
├── criacao_de_tabelas.sql
├── insercao_de_dados.sql
├── funcoes.sql
├── triggers.sql
├── views.sql
├── index.sql
├── selects-pesquisas.sql
└── crud_videos.py
```


## ⚙️ Requisitos

| Tecnologia | Versão mínima | Observação |
|------------|---------------|------------|
| PostgreSQL | 13           | Usuário `postgres` local |
| Python     | 3.8          | Tkinter já incluso no Windows; no Linux use `sudo apt install python3-tk` |
| Bibliotecas| `psycopg2-binary` |

```bash
pip install psycopg2-binary
```



## 🗄️ Montando o banco

1. Crie o banco (se ainda não existir):

```bash
createdb escovoflix
```

2. Importe os scripts **na ordem**:

```bash
psql -d escovoflix -f criacao_de_tabelas.sql
psql -d escovoflix -f insercao_de_dados.sql
psql -d escovoflix -f index.sql
psql -d escovoflix -f funcoes.sql
psql -d escovoflix -f triggers.sql
psql -d escovoflix -f views.sql
psql -d escovoflix -f arrumando_crud.sql
```

> Basta rodar cada arquivo ou usar `\i caminho/arquivo.sql` dentro do `psql`.


## 💻 Rodando o CRUD GUI

1. Ajuste as credenciais no topo de **`crud_videos.py`** (host, user, senha).
2. No terminal:

```bash
python crud_videos.py
```

### Principais atalhos na interface

| Botão           | Ação |
|-----------------|------|
| **Inserir**     | Adiciona novo vídeo |
| **Atualizar título** | Atualiza somente o título do vídeo selecionado |
| **Deletar**     | Remove vídeo (verifica chaves estrangeiras) |
| **Recarregar lista** | Atualiza a grade a partir do banco |
| **Fechar**      | Encerra o programa |

## 🔍 Consultas de negócio

O arquivo **`selects-pesquisas.sql`** contém 9 exemplos comentados, como:

* Top 5 vídeos mais vistos por mês
* Perfis que mais assistem conteúdo **18+**
* Relatório de assinaturas ativas vs canceladas





## 👨‍💻 Autores

* **Valter Roessle de Vasconcelos** – RA 202411488  
* **Giovane Eyng Martinello** – RA 202411

---

Distribuído somente para fins didáticos.
