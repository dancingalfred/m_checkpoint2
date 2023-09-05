import psycopg2

def db_connection():
    conn = psycopg2.connect(
    host="localhost",
    port="5432", # Usually port number 5432 for PostgreSQL
    database="dictdb",
    user="postgres",
    password="mittPW") # Change to your own pgAdmin postgres user
    return conn


def read_dict():
    dbconn = db_connection()
    cur = dbconn.cursor()
    cur.execute("SELECT id, word, translation FROM dictionary;")
    rows = cur.fetchall()
    cur.close()
    dbconn.close()
    return rows


while True: ## REPL - Read Execute Program Loop
    cmd = input("Command: ")

    if cmd == "quit":
        exit()
    else:
        print(read_dict())