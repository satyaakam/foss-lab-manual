import MySQLdb as db
import conf
from decimal import Decimal

def input_num(msg, numtype):
    while True:
        try:
            num = raw_input(msg)
            num = numtype(num)
            return num
        except ValueError, e:
            print "Invalid number."

def get_balance(accno):
    cursor.execute("SELECT balance FROM accounts WHERE id = %d" % accno)
    row = cursor.fetchone()
    if row == None:
        return 0
    else:
        return row[0]

def set_balance(accno, balance):
    cursor.execute("UPDATE accounts SET balance = %s WHERE id = %d" %
                   (balance, accno))

def transact():
    while True:
        accno = input_num("Enter Account No.: ", int)
        if accno == -1: break
        balance = get_balance(accno)
        print "The current balance is", balance
        amount = input_num("Enter amount to credit/debit: ", Decimal)
        set_balance(accno, balance + amount)
        print "The new balance is", get_balance(accno)

def main():
    global cursor
    conn = db.connect(conf.server, conf.username,
                      conf.password, conf.database)
    cursor = conn.cursor()
    transact()

if __name__ == "__main__":
    main()
