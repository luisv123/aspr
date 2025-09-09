import random
import sys
sys.path.append('mysite/')
import static
from urllib.parse import urlparse



def urlValidator(url):
    try:
        res = urlparse(url)
        return all([res.scheme, res.netloc])
    except:
        return False



alphabet = list("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
db = static.getDbConnection()
cursor = db.cursor(dictionary=True)
urlPre = 'https://aspr.pythonanywhere.com/s/'

print()
print('  Link Shortener (Original)')

while True:
    print()
    link = input('  Link : ')

    link = link.strip()
    if urlValidator(link):
        break

    else:
        print()
        print('  URL Format Invalid ( https://idk.com )')
        print()

cursor.execute(f"SELECT * FROM links_key WHERE link = '{link}'")
result = cursor.fetchall()
if len(result) > 0:
    print()
    print('  URL recorded D:')
    print('  '+ urlPre + result[0]['link'] +'/')
    print()

else:

    while True:
        key = ''
        key += alphabet[random.randint( 0, len(alphabet)-1 )]
        key += alphabet[random.randint( 0, len(alphabet)-1 )]
        key += alphabet[random.randint( 0, len(alphabet)-1 )]

        cursor.execute(f"SELECT count(*) as count FROM links_key WHERE link_id = '{key}'")
        result = cursor.fetchall()
        if result[0]['count'] == 0:
            break

cursor.execute(f"INSERT INTO links_key(link_id, link) VALUES('{key}','{link}')")
db.commit()

print()
print('  Link Registered.')
print('  '+ urlPre + key +'/')
print()