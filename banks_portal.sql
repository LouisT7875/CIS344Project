
use banks_portal;
CREATE TABLE accounts(
accountId int not null unique auto_increment PRIMARY KEY,
ownerName varchar (45) Not Null,
owner_ssn int not null,
balance decimal (10,2) not null default 0.00,
account_status varchar(45)
);

CREATE TABLE Transactions(
transactionId int not null unique auto_increment PRIMARY KEY,
accountID int not null,
transactionType varchar (45) not null,
transactionAmount decimal(10,2) not null
);

INSERT into accounts(ownerName, owner_ssn, balance, account_status)
VALUES ("Maria Jozef", 123456798, 10000.00, "active"),("Linda Jones", 987654321, 2600.00, "inactive"), ("John McGrail",222222222, 100.50, "active"),("Patty Luna", 111111111, 509.75, "inactive");
SELECT * from accounts;

INSERT into Transactions(accountID, transactionType, transactionAmount)
VALUES(1, "deposit", 650.98),(3, "withdraw", 899.87),(3, "deposit",350.00);
SELECT * from Transactions;

DELIMITER //
CREATE PROCEDURE accountTransactions(IN accountID INT)
BEGIN SELECT * FROM Transactions
WHERE accountID = accountID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deposit(
IN accountID INT, IN amount DECIMAL(10,2))
BEGIN
INSERT INTO transactions(accountId, transactionType, transactionAmount)
Values( accountID, "deposit", amount);
UPDATE accounts SET balance = balance + amount where accountId = accountID;
END //
DELIMITER //

DELIMITER //
CREATE PROCEDURE withdraw( IN amountId INT, in amount DECIMAL(10,2))
BEGIN INSERT INTO Transactions(accountId, transactionType, transactionAmount)
Values(accountID, "withdraw", amount);

UPDATE accounts SET balance = balance - amount where accountId = accountID;
END //
