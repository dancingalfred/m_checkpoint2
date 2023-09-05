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

def add_to_dict(word,translation):
    dbconn = db_connection()
    cur = dbconn.cursor()
    cur.execute("INSERT INTO dictionary (word, translation) VALUES (%s, %s);",(word, translation))
    dbconn.commit()
    cur.close()
    dbconn.close()
    return "done"


def delete_from_dict(word):
    dbconn = db_connection()
    cur = dbconn.cursor()
    cur.execute("DELETE FROM dictionary WHERE word = %s;", (word,))
    dbconn.commit()
    cur.close()
    dbconn.close()
    return "done"


while True: ## REPL - Read Execute Program Loop
    cmd = input("Command: ")


    if cmd == "list":
        print(read_dict())
    if cmd == "add":
        new_word = input("Type new word: ")
        new_translation = input("Type new translation: ")
        add_to_dict(new_word,new_translation)
    if cmd == "delete":
        del_word = input("Type word to delete: ")
        delete_from_dict(del_word)
    if cmd == "quit":
        exit()
    # else:
    #     print(read_dict())