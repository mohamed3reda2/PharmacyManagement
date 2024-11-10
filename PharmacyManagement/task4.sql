create database Pharmacy
use Pharmacy
CREATE TABLE Product (
    Product_id INT PRIMARY KEY IDENTITY(1,1),
    Product_name NVARCHAR(100) NOT NULL,
    stock_Number INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
	Product_type NVARCHAR(100) NOT NULL,
    Expiration_date DATETIME NOT NULL
);

CREATE TABLE Users (
    User_id INT PRIMARY KEY IDENTITY(1,1),
    user_name NVARCHAR(50) NOT NULL,
    Pathological_condition NVARCHAR(50),
    Loyalty_Card BIT
);

CREATE TABLE Admin_users (
    Admin_ID INT PRIMARY KEY IDENTITY(1,1),
    Admin_name NVARCHAR(50),
    Admin_pass NVARCHAR(50)
);

CREATE TABLE sales (
    Product_id INT,
    User_id INT,
    Qty DECIMAL(10, 2) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    Total_Price AS (Qty * price) PERSISTED,
    sales_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE expenses (
    expenses_id INT PRIMARY KEY IDENTITY(1,1),
    Product_id INT,
    Qty DECIMAL(10, 2) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    Total_Price AS (Qty * price) PERSISTED,
    expenses_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

CREATE TABLE reports (
    report_id INT PRIMARY KEY IDENTITY(1,1),
    Total_Price_e DECIMAL(15, 2) NOT NULL,
    Total_Price_s DECIMAL(15, 2) NOT NULL,
    report_Content NVARCHAR(500) NOT NULL,
    report_date DATETIME DEFAULT GETDATE()
);

INSERT INTO Admin_users (Admin_name, Admin_pass) VALUES 
('mohamed', '123'),
('ahmed', '123')


INSERT INTO Product (Product_name, stock_Number, price, Expiration_date) VALUES
('Bactericidal Antibiotic', 198, 2.50, '2024-12-31'),
('Narrow-Spectrum', 200, 67.20, '2024-10-01'),
('Broad-Spectrum', 150, 100.00, '2024-09-15'),
('Ceftriaxone', 80, 30.00, '2024-11-10'),
('Amoxicillin', 60, 400.50, '2025-01-20')


INSERT INTO Users (user_name, Pathological_condition, Loyalty_Card) VALUES
('mohamed', 'None', 1),
('ahmed', 'None', 1),
('Omar', 'None', 0),
('osama', 'None', 0),
('moaz', 'None', 1)

INSERT INTO sales (Product_id, User_id, Qty, price) VALUES
(1, 1, 5, 2.50),
(2, 2, 10, 1.20),
(3, 3, 8, 1.00),
(4, 4, 3, 3.00),
(5, 5, 2, 4.50);

delete from sales where Product_id =1

INSERT INTO expenses (Product_id, Qty, price) VALUES
(1, 20, 2.00),
(2, 30, 1.00),
(3, 25, 0.80),
(4, 15, 2.50),
(5, 10, 3.50);


DECLARE @total_sales DECIMAL(10, 2);
DECLARE @total_expenses DECIMAL(10, 2);

SELECT @total_sales = SUM(Total_Price) FROM sales WHERE sales_date BETWEEN '2024-01-01' AND '2024-12-31';
SELECT @total_expenses = SUM(Total_Price) FROM expenses WHERE expenses_date BETWEEN '2024-01-01' AND '2024-12-31';

INSERT INTO reports (Total_Price_e, Total_Price_s, report_Content) 
VALUES (@total_expenses, @total_sales, CONCAT(@total_sales - @total_expenses, ' التوقيت '));
select * from reports
select * from Users
select * from sales
select * from expenses

	if not exists (select 1 from Admin_users where Admin_name ='mohamed' )
	begin 
	end