import sqlite3
import sys


def Users(csv_file):
    data = []

    with open(csv_file, encoding='koi8_r') as fin:
        for line in fin.readlines():
            line = line.split('\t')
            user_id = int(line[0].split('_')[1])
            email = line[1]
            geo = line[2]
            data.append((user_id, email, geo[:-1]))
    
    with sqlite3.connect('biturbo.s3db') as conn:
        cur = conn.cursor()
        for user_id, email, geo in data:
            cur.execute('INSERT INTO USERS (USER_ID, EMAIL, GEO) VALUES (?, ?, ?)', (user_id, email, geo))
        conn.commit()


def Log(csv_file):
    data = []

    with open(csv_file) as fin:
        for line in fin.readlines():
            line = line.split()[4:]
            if (len(line) > 0):
                user_id = int(line[0].split(',')[0].split('_')[1])
                date = line[0].split('[')[1]
                time, win, bet = line[1].split(',')
                win = float(win) if len(win) > 0 else None
                bet = float(bet) if len(bet) > 0 else None
                data.append((user_id, date, bet, win))

    with sqlite3.connect('biturbo.s3db') as conn:
        cur = conn.cursor()
        for user_id, date, bet, win in data:
            cur.execute('INSERT INTO LOG (USER_ID, TIME, BET, WIN) VALUES (?, ?, ?, ?)', (user_id, date, bet, win))
        conn.commit()


if __name__ == '__main__':
    Users("users (1).csv")
    Log('log (1).csv')

