import subprocess
from datetime import datetime

host        = "aspr.mysql.pythonanywhere-services.com"
user        = "aspr"
password    = "3l3kta99"
database    = "aspr$aspr"
file        = datetime.now().strftime("backup_%Y-%m-%d_%H:%M.sql")

command = f"mysqldump -u {user} -h {host} --set-gtid-purged=OFF --no-tablespaces --databases '{database}' > dbBackups/{file}"

try:
    subprocess.run(command, shell=True, check=True)
    subprocess.run("clear", shell=True, check=True)
    print("\n  Backup Success. ("+datetime.now().strftime('%Y-%m-%d %H:%M')+")\n")


except subprocess.CalledProcessError as e:
    #print(f"Ocurrió un error al ejecutar el comando: {e}")
    file = open('dbBackupErrorLog','a')
    file.write(datetime.now().strftime("%Y-%m-%d_%H:%M:%S") + "\n" + e + "\n\n")
