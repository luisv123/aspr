import sys
sys.path.append('mysite/')

import static
import csv

sentence    = "select email from events_register where event_id ='14JUNIO';"
outputFile  = '14JUNIO.csv'

db = static.getDbConnection()
cursor = db.cursor()

cursor.execute(sentence)
results = cursor.fetchall()

cols = []

for result in results:
    row = []
    for element in result:
        if len(str(element).split('|')) == 1:
            row.append(element)

        else:
            for i in element.split('|'):
                row.append(i)

    cols.append(row)

print(cols)

with open(outputFile, 'w') as csvFile:
    csvWriter = csv.writer(csvFile)
    csvWriter.writerows(cols)
