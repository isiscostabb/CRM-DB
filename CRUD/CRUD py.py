import psycopg2
from prettytable import PrettyTable

# Conectar ao banco de dados PostgreSQL
conn = psycopg2.connect(
    dbname="tb",
    user="postgres",
    password="123456",
    host="localhost",
    port="5432"
)
cursor = conn.cursor()

# Função para criar um cliente
def create_cliente():
    id_cliente = int(input("ID do cliente: "))  # Solicita o ID do cliente ao usuário
    nome_cliente = input("Nome do cliente: ")
    email = input("Email: ")
    telefone = input("Telefone: ")
    endereco = input("Endereço: ")
    cpf_cnpj = input("CPF/CNPJ: ")
    data_cadastro = input("Data de cadastro (YYYY-MM-DD): ")
    tipo_cliente = input("Tipo de cliente: ")

    cursor.execute("""
        INSERT INTO clientes (id_cliente, nome_cliente, email, telefone, endereco, cpf_cnpj, data_cadastro, tipo_cliente)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        RETURNING id_cliente;
    """, (id_cliente, nome_cliente, email, telefone, endereco, cpf_cnpj, data_cadastro, tipo_cliente))
    conn.commit()
    print("Cliente criado com ID:", cursor.fetchone()[0])

# Função para ler todos os clientes
def read_clientes():
    cursor.execute("SELECT * FROM clientes;")
    rows = cursor.fetchall()
    table = PrettyTable(["ID Cliente", "Nome", "Email", "Telefone", "Endereço", "CPF/CNPJ", "Data Cadastro", "Tipo Cliente"])
    for row in rows:
        table.add_row(row)
    print(table)

# Função para atualizar um cliente
def update_cliente():
    id_cliente = int(input("ID do cliente a ser atualizado: "))
    nome_cliente = input("Nome do cliente: ")
    email = input("Email: ")
    telefone = input("Telefone: ")
    endereco = input("Endereço: ")
    cpf_cnpj = input("CPF/CNPJ: ")
    data_cadastro = input("Data de cadastro (YYYY-MM-DD): ")
    tipo_cliente = input("Tipo de cliente: ")

    cursor.execute("""
        UPDATE clientes
        SET nome_cliente = %s, email = %s, telefone = %s, endereco = %s, cpf_cnpj = %s, data_cadastro = %s, tipo_cliente = %s
        WHERE id_cliente = %s;
    """, (nome_cliente, email, telefone, endereco, cpf_cnpj, data_cadastro, tipo_cliente, id_cliente))
    conn.commit()
    print("Cliente atualizado com ID:", id_cliente)

# Função para deletar um cliente
def delete_cliente():
    id_cliente = int(input("ID do cliente a ser deletado: "))
    
    try:
        # Deletar registros relacionados nas outras tabelas
        cursor.execute("DELETE FROM avaliacao WHERE id_cliente = %s;", (id_cliente,))
        cursor.execute("DELETE FROM entrada WHERE id_cliente = %s;", (id_cliente,))
        cursor.execute("DELETE FROM reserva WHERE id_cliente = %s;", (id_cliente,))
        cursor.execute("DELETE FROM historico_uso WHERE id_cliente = %s;", (id_cliente,))

        # Agora deletar o cliente
        cursor.execute("DELETE FROM clientes WHERE id_cliente = %s;", (id_cliente,))
        conn.commit()
        print("Cliente deletado com ID:", id_cliente)
    except psycopg2.Error as e:
        conn.rollback()
        print("Erro ao deletar cliente:", e)

# Menu principal
def main():
    while True:
        print("\nEscolha uma operação:")
        print("1. Criar cliente")
        print("2. Ler todos os clientes")
        print("3. Atualizar cliente")
        print("4. Deletar cliente")
        print("5. Sair")

        escolha = input("Digite o número da operação: ")

        if escolha == '1':
            create_cliente()
        elif escolha == '2':
            read_clientes()
        elif escolha == '3':
            update_cliente()
        elif escolha == '4':
            delete_cliente()
        elif escolha == '5':
            break
        else:
            print("Escolha inválida. Tente novamente.")

if __name__ == "__main__":
    main()

    # Fechar a conexão
    cursor.close()
    conn.close()
