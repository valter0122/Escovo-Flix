# 🎬 Escovoflix - Sistema de Gerenciamento de Vídeos (PostgreSQL + Tkinter)

Este projeto é um sistema CRUD com interface gráfica feito em Python (Tkinter) conectado a um banco de dados PostgreSQL.  
Ele permite gerenciar vídeos, incluindo informações como título, descrição, duração, tipo, ano e classificação indicativa.

---

## 📦 Conteúdo da pasta `banco`

- `crud_videos.py` → Aplicação principal em Python com interface Tkinter
- `criacao_de_tabelas.sql` → Criação das tabelas do banco de dados
- `insercao_de_dados.sql` → Dados iniciais de exemplo
- `funcoes.sql` → Functions e Procedures utilizadas
- `triggers.sql` → Triggers automáticas do sistema
- `views.sql` → Views com junções e consultas prontas
- `index.sql` → Índices aplicados para otimizar o banco
- `selects-pesquisas.sql` → Consultas SQL baseadas em regras de negócio
- `arrumando_crud.sql` → Script complementar de ajustes

---

## 🧰 Pré-requisitos

- Python 3 instalado
- PostgreSQL instalado e rodando
- Biblioteca `psycopg2` instalada:
  ```bash
  pip install psycopg2-binary
