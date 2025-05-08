import mysql.connector

def getDbConnection():
    return mysql.connector.connect(host='aspr.mysql.pythonanywhere-services.com', user='aspr', password='3l3kta99', database='aspr$aspr')