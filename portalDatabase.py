import mysql.connector
from mysql.connector import Error


class Database():
    def __init__(self,
                 host="localhost",
                 port="3306",
                 database="banks_portal",
                 user="root",
                 password="Barcelona220277875"):

        self.host       = host
        self.port       = port
        self.database   = database
        self.user       = user
        self.password   = password
        self.connection = None
        self.cursor     = None
        self.connect()

    def connect(self):
        try:
            self.connection = mysql.connector.connect(
                host         = self.host,
                port         = self.port,
                database     = self.database,
                user         = self.user,
                password     = self.password)
            
            if self.connection.is_connected():
                return
        except Error as e:
            print("Error while connecting to MySQL", e)


    def getAllAccounts(self):
        if self.connection.is_connected():
            self.cursor= self.connection.cursor();
            query = "SELECT * FROM accounts"
            self.cursor.execute(query)
            records = self.cursor.fetchall()
            return records

    def getAllTransactions(self):
        if self.connection.is_connected():
            self.cursor= self.connection.cursor();
            query = "SELECT * FROM transactions"
            self.cursor.execute(query)
            records = self.cursor.fetchall()
            return records
        
       
    def deposit(self, accountID, amount):
        if self.connection.is_connected():
            self.cursor= self.connection.cursor();
            query = "select * FROM Transactions WHERE TransactionType = 'deposit'"
            self.cursor.execute(query)
            records = self.cursor.fetchall()
            return records
        
   

    def withdraw(self, accountID, amount):
        if self.connection.is_connected():
            self.cursor= self.connection.cursor();
            query = "select * from Transactions WHERE TransactionType = 'withdraw'"
            self.cursor.execute(query)
            records = self.cursor.fetchall()
            return records
        
    def addAccount(self, ownerName, owner_ssn, balance, status):
        if self.connection.is_connected():
            self.cursor= self.connection.cursor();
            query = "INSERT INTO accounts (ownerName, owner_ssn, balance, status) VALUES (%s, %s, %s, %s)"
            self.cursor.execute(query,(ownerName, owner_ssn, balance, status))
            records = self.cursor.fetchall()
            return records
  
    def accountTransactions(self, accountID):
        if self.connection.is_connected():
            self.cursor= self.connection.cursor();
            query = ""
            self.cursor.execute(query,(ownerName, owner_ssn, balance, status))
            records = self.cursor.fetchall()
            return records
        pass
  
    def deleteAccount(self, AccountID):
        if self.connection.is_connected():
            self.cursor= self.connection.cursor();
            query = "DELETE FROM accounts WHERE accountID = %s"
            Values = (accounts)
            self.cursor.execute(query, Values)
            
            query = "DELETE FROM transactions WHERE accountID = %s"
            self.cursor.execute(query, Values)
            records = self.cursor.fetchall()
    
        
        
    
    
