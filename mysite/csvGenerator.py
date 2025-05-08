import static
import csv

sentence    = "SELECT firstname, lastname, email FROM events_register WHERE event_id = 'IHB5M'"
outputFile  = 'output.csv'

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
