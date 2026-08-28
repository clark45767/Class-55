import sqlite3

database = 'database.sqlite'

connection = sqlite3.connect(database)
print('Open datas successfuly')

import pandas as pd
tables = pd.read_sql("""Select *
                    from salesman
                    ;""",connection)
tables