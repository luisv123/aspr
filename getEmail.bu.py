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
sentence = "select email from events_register where event_id ='14JUNIO';"


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