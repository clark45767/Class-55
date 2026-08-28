import pandas as pd
import sqlite3

connection = sqlite3.connect('mydatabase.db')
df = pd.read_sql("Select * from restaurant", connection)
print(df)
connection.close()