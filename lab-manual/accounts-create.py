import MySQLdb as db
import sys
import conf

conn = db.connect("shark", conf.username, conf.password, conf.database)
cursor = conn.cursor()
cursor.execute("DROP TABLE IF EXISTS accounts")

# Create Tables
sql = """CREATE TABLE accounts (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                name VARCHAR(50),
                                balance DECIMAL(10, 2))"""
cursor.execute(sql)

# Insert into Tables
sql = """INSERT INTO accounts (name, balance) VALUES ('Alice', 500.00),
                                                     ('Bob', 50000.00),
                                                     ('Charlie', 100.00)"""
cursor.execute(sql)
