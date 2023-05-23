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
  
    #def accountTransactions(self, accountID):
     #   if self.connection.is_connected():
      #      self.cursor= self.connection.cursor();
          #  query = ""
          #  self.cursor.execute(query,(ownerName, owner_ssn, balance, status))
           # records = self.cursor.fetchall()
            #return records
       # pass
  
    def deleteAccount(self, AccountID):
        if self.connection.is_connected():
            self.cursor= self.connection.cursor();
            query = "DELETE FrOM accounts WHERE accountID = %s"
            Values = (accounts)
            self.cursor.execute(query, Values)
            
            query = "DELETE FROM transactions WHERE accountID = %s"
            self.cursor.execute(query, Values)
            records = self.cursor.fetchall()
    
        
        
    
    


from http.server import HTTPServer, BaseHTTPRequestHandler


class demoServer(BaseHTTPRequestHandler):

    # constructor
    def __init__(self, *args):
        # constructor from base class
        BaseHTTPRequestHandler.__init__(self, *args)

    def do_GET(self):
        try:
            if self.path == "/":
                self.send_response(200)  # success
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(b"<html><head><title>HOME</title></head>")
                self.wfile.write(b"<body><h1>Welcome to my page</h1>")
                self.wfile.write(b"<ul>")
                self.wfile.write(b"<li><a href='/addAccount'>Add Account</a></li>")
                self.wfile.write(b"<li><a href='/withdraw'>Withdraw</a></li>")
                self.wfile.write(b"<li><a href='/deposit'>Deposit</a></li>")
                self.wfile.write(b"<li><a href='/searchTransaction'>Search Transaction</a></li>")
                self.wfile.write(b"<li><a href='/deleteAccount'>Delete Account</a></li>")
                self.wfile.write(b"</ul>")
                self.wfile.write(b"</body></html>")
            elif self.path == "/addAccount":
                self.send_response(200)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(b"<html><head><title>Add Account</title></head>")
                self.wfile.write(b"<body><h1>Add Account</h1></body></html>")
            elif self.path == "/withdraw":
                self.send_response(200)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(b"<html><head><title>Withdraw</title></head>")
                self.wfile.write(b"<body><h1>Withdraw</h1></body></html>")
            elif self.path == "/deposit":
                self.send_response(200)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(b"<html><head><title>Deposit</title></head>")
                self.wfile.write(b"<body><h1>Deposit</h1></body></html>")
            elif self.path == "/searchTransaction":
                self.send_response(200)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(b"<html><head><title>Search Transaction</title></head>")
                self.wfile.write(b"<body><h1>Search Transaction</h1></body></html>")
            elif self.path == "/deleteAccount":
                self.send_response(200)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(b"<html><head><title>Delete Account</title></head>")
                self.wfile.write(b"<body><h1>Delete Account</h1></body></html>")

        except IOError:
            self.send_error(404, "File Not Found: %s" % self.path)
            
    #def do_GET(self):
        #try:
            #if self.path == "/"


def run(server_class=HTTPServer, handler_class=demoServer, port=8000):
    server_address =('localhost', port)
    httpd = server_class(server_address, handler_class)
    print('Starting httpd on {}'.format(port))
    httpd.serve_forever()
