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

sentence = "SELECT email FROM newsletter_register"


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