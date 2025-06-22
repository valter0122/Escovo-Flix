import tkinter as tk
from tkinter import ttk, messagebox, simpledialog
import psycopg2

def conectar():
    return psycopg2.connect(
        dbname="escovoflix",
        user="postgres",
        password="123456",
        host="localhost",
        port="5432"
    )

# Corrige sequência do id_video
def corrigir_sequencia():
    try:
        conn = conectar()
        cur = conn.cursor()
        cur.execute("SELECT setval('videos_id_video_seq', (SELECT MAX(id_video) FROM videos))")
        conn.commit()
        cur.close(); conn.close()
    except Exception as e:
        messagebox.showwarning("Atenção", f"Erro ao corrigir sequência: {e}")

def inserir_video():
    titulo  = entry_titulo.get().strip()
    descricao = entry_desc.get().strip()
    duracao = entry_duracao.get().strip()
    tipo = tipo_var.get()
    ano = entry_ano.get().strip()
    classif = class_var.get()

    if not titulo or not duracao or not tipo or not classif:
        messagebox.showwarning("Campos obrigatórios", "Preencha os campos obrigatórios (*).")
        return

    try:
        duracao = int(duracao)
        ano = int(ano) if ano else None
    except ValueError:
        messagebox.showerror("Erro", "Duração e Ano devem ser números.")
        return

    try:
        conn = conectar(); cur = conn.cursor()
        cur.execute("""
            INSERT INTO videos (titulo, descricao, duracao, tipo, ano_lancamento, classificacao_indicativa)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (titulo, descricao, duracao, tipo, ano, classif))
        conn.commit()
        cur.close(); conn.close()
        corrigir_sequencia()
        messagebox.showinfo("Sucesso", "Vídeo inserido!")
        listar_videos()
    except Exception as e:
        messagebox.showerror("Erro", str(e))

def listar_videos():
    for i in tree.get_children():
        tree.delete(i)
    try:
        conn = conectar(); cur = conn.cursor()
        cur.execute("""
            SELECT id_video, titulo, COALESCE(duracao,0), COALESCE(tipo,''), 
                   COALESCE(ano_lancamento,0), COALESCE(classificacao_indicativa,'') 
            FROM videos ORDER BY id_video
        """)
        for row in cur.fetchall():
            tree.insert('', 'end', values=row)
        cur.close(); conn.close()
    except Exception as e:
        messagebox.showerror("Erro", str(e))

def atualizar_video():
    vid = simpledialog.askinteger("Atualizar", "ID do vídeo:")
    if not vid: return
    novo = simpledialog.askstring("Novo título", "Digite o novo título:")
    if not novo: return
    try:
        conn = conectar(); cur = conn.cursor()
        cur.execute("UPDATE videos SET titulo = %s WHERE id_video = %s", (novo, vid))
        if cur.rowcount == 0:
            messagebox.showwarning("Aviso", "ID não encontrado.")
        else:
            conn.commit()
            messagebox.showinfo("Atualizado", "Título alterado.")
        cur.close(); conn.close()
        listar_videos()
    except Exception as e:
        messagebox.showerror("Erro", str(e))

def deletar_video():
    vid = simpledialog.askinteger("Deletar", "ID do vídeo:")
    if not vid: return
    try:
        conn = conectar(); cur = conn.cursor()
        cur.execute("DELETE FROM videos WHERE id_video = %s", (vid,))
        if cur.rowcount == 0:
            messagebox.showwarning("Aviso", "ID não encontrado.")
        else:
            conn.commit()
            messagebox.showinfo("Deletado", "Vídeo excluído.")
        cur.close(); conn.close()
        listar_videos()
    except Exception as e:
        messagebox.showerror("Erro", str(e))

# ===== INTERFACE =====
root = tk.Tk()
root.title("CRUD - Tabela Videos")

frm = tk.Frame(root, padx=10, pady=10)
frm.pack()

# Campos
tk.Label(frm, text="Título *").grid(row=0, column=0, sticky="e")
entry_titulo = tk.Entry(frm, width=40)
entry_titulo.grid(row=0, column=1, columnspan=3, sticky="w")

tk.Label(frm, text="Descrição").grid(row=1, column=0, sticky="e")
entry_desc = tk.Entry(frm, width=40)
entry_desc.grid(row=1, column=1, columnspan=3, sticky="w")

tk.Label(frm, text="Duração (min) *").grid(row=2, column=0, sticky="e")
entry_duracao = tk.Entry(frm, width=10)
entry_duracao.grid(row=2, column=1, sticky="w")

tk.Label(frm, text="Ano lançamento").grid(row=2, column=2, sticky="e")
entry_ano = tk.Entry(frm, width=10)
entry_ano.grid(row=2, column=3, sticky="w")

tk.Label(frm, text="Tipo *").grid(row=3, column=0, sticky="e")
tipo_var = tk.StringVar()
tipo_opcao = ttk.Combobox(frm, textvariable=tipo_var, values=["Filme", "Série"], state="readonly", width=10)
tipo_opcao.grid(row=3, column=1, sticky="w")

tk.Label(frm, text="Classificação *").grid(row=3, column=2, sticky="e")
class_var = tk.StringVar()
class_opcao = ttk.Combobox(frm, textvariable=class_var,
    values=["Livre", "10+", "12+", "14+", "16+", "18+"], state="readonly", width=10)
class_opcao.grid(row=3, column=3, sticky="w")

# Botões
tk.Button(frm, text="Inserir", command=inserir_video).grid(row=4, column=0, pady=5)
tk.Button(frm, text="Atualizar título", command=atualizar_video).grid(row=4, column=1)
tk.Button(frm, text="Deletar", command=deletar_video).grid(row=4, column=2)
tk.Button(frm, text="Fechar", command=root.destroy).grid(row=4, column=3)

# Treeview
cols = ("ID", "Título", "Duração", "Tipo", "Ano", "Classificação")
tree = ttk.Treeview(root, columns=cols, show="headings", height=10)
for col in cols:
    tree.heading(col, text=col)
    tree.column(col, anchor="center", width=90 if col == "ID" else 120)
tree.pack(pady=10)

tk.Button(root, text="Recarregar lista", command=listar_videos).pack()

listar_videos()
root.mainloop()
