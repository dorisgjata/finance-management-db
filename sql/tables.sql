DROP TABLE IF EXISTS expenses CASCADE;
DROP TABLE IF EXISTS incomes CASCADE;
DROP TABLE IF EXISTS transactions_category CASCADE;
DROP TABLE IF EXISTS account CASCADE;

CREATE TABLE IF NOT EXISTS account(
	account_id INT NOT NULL AUTO_INCREMENT,
	account_type ENUM('Savings', 'Checkings' ) NOT NULL,
	ammount DOUBLE NOT NULL,
	PRIMARY KEY(account_id)
);

CREATE TABLE IF NOT EXISTS transactions_category(
	category_id INT NOT NULL AUTO_INCREMENT,
	category_name VARCHAR(100) NOT NULL,
	super_category_id INT NULL,
	CONSTRAINT super_category_fk FOREIGN KEY(super_category_id) REFERENCES transactions_category(category_id) ON DELETE CASCADE,
	PRIMARY KEY(category_id)
);
CREATE TABLE IF NOT EXISTS expenses(
	transaction_id INT NOT NULL AUTO_INCREMENT,
	#transaction_type ENUM('Expense', 'Income') NOT NULL,
	transaction_category_id INT NOT NULL,
	transaction_amount DOUBLE NOT NULL,
	transaction_date DATE NOT NULL,
	transaction_origin VARCHAR(100) NOT NULL,
	transaction_account_id INT NOT NULL, 
	CONSTRAINT account_fk FOREIGN KEY(transaction_account_id) REFERENCES account(account_id) ON DELETE CASCADE,
	CONSTRAINT category_fk FOREIGN KEY(transaction_category_id) REFERENCES transactions_category(category_id) ON DELETE CASCADE,
	PRIMARY KEY(transaction_id)
);

CREATE TABLE IF NOT EXISTS incomes LIKE expenses;