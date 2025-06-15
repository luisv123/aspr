#               USAGE:
#               py3 getEmail.py "select email from newsletter_register;" "luiso.txt"
#

import sys
sys.path.append('mysite/')

import static


#sentence    = """SELECT
#    resultado_combinado.*
#FROM (
#	SELECT email FROM events_register_old
#	UNION
#	SELECT email FROM events_register WHERE event_id = "26ABRIL"
#) AS resultado_combinado;"""

#sentence = "select email from newsletter_register limit 100,280;"
#sentence = "select email from events_register where event_id ='14JUNIO';"
sentence = sys.argv[1]


db = static.getDbConnection()
cursor = db.cursor()

cursor.execute(sentence)
results = cursor.fetchall()

listEmails = ""

for result in results:
    if result[0] != "":
        listEmails += result[0] + ','

print(listEmails)
print()
print(len(results))

if len(sys.argv) > 2:
    name = sys.argv[2]
    try:
        with open(name, "w", encoding='utf-8') as file:
            if len(results) > 0:
                for i, row in enumerate(results):
                    if i == len(results)-1:
                        file.write(row[0])
                    else:
                        file.write(row[0] + ',')
        print(f"Archivo '{name}' creado y datos escritos con éxito.")
    except IOError as e:
        print(f"Error al escribir en el archivo: {e}")
else:
    print("Por favor, proporciona una sentencia SQL y un nombre para el archivo de salida, ambos entre comillas. Ejemplo: python3 getEmail.py  \" SELECT email from events_register where event_id='myEvent'\" \"salida.txt\"")





