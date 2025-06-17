-- Create Product Table
CREATE TABLE Products (
    productID INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100),
    Description VARCHAR(255),
    price DECIMAL(10,2),
    stockQuantity INT
);

-- Insert Data into Product Table
INSERT INTO Products (name, Description, price, stockQuantity) VALUES
('Laptop', 'High-performance laptop', 800.00, 10),
('Smartphone', 'Latest smartphone', 600.00, 15),
('Tablet', 'Portable tablet', 300.00, 20),
('Headphones', 'Noise-canceling', 150.00, 30),
('TV', '4K Smart TV', 900.00, 5),
('Coffee Maker', 'Automatic coffee maker', 50.00, 25),
('Refrigerator', 'Energy-efficient', 700.00, 10),
('Microwave Oven', 'Countertop microwave', 80.00, 15),
('Blender', 'High-speed blender', 70.00, 20),
('Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);

-- Create Customer Table
CREATE TABLE Customers (
    customerID INT IDENTITY(1,1) PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    Email VARCHAR(100),
    address VARCHAR(255)
);

-- Insert Data into Customer Table
INSERT INTO Customers (firstName, lastName, Email, address) VALUES
('John', 'Doe', 'johndoe@example.com', '123 Main St, City'),
('Jane', 'Smith', 'janesmith@example.com', '456 Elm St, Town'),
('Robert', 'Johnson', 'robert@example.com', '789 Oak St, Village'),
('Sarah', 'Brown', 'sarah@example.com', '101 Pine St, Suburb'),
('David', 'Lee', 'david@example.com', '234 Cedar St, District'),
('Laura', 'Hall', 'laura@example.com', '567 Birch St, County'),
('Michael', 'Davis', 'michael@example.com', '890 Maple St, State'),
('Emma', 'Wilson', 'emma@example.com', '321 Redwood St, Country'),
('William', 'Taylor', 'william@example.com', '432 Spruce St, Province'),
('Olivia', 'Adams', 'olivia@example.com', '765 Fir St, Territory');

-- Create Order Table
CREATE TABLE Orders (
    orderID INT IDENTITY(1,1) PRIMARY KEY,
    customerID INT FOREIGN KEY REFERENCES Customers(customerID),
    orderDate DATE,
    totalAmount DECIMAL(10,2)
);

-- Insert Data into Order Table
INSERT INTO Orders (customerID, orderDate, totalAmount) VALUES
(1, '2023-01-05', 1200.00),
(2, '2023-02-10', 900.00),
(3, '2023-03-15', 300.00),
(4, '2023-04-20', 150.00),
(5, '2023-05-25', 1800.00),
(6, '2023-06-30', 400.00),
(7, '2023-07-05', 700.00),
(8, '2023-08-10', 160.00),
(9, '2023-09-15', 140.00),
(10, '2023-10-20', 1400.00);

-- Create OrderItem Table
CREATE TABLE Order_Items (
    orderItemID INT IDENTITY(1,1) PRIMARY KEY,
    orderID INT FOREIGN KEY REFERENCES Orders(orderID),
    productID INT FOREIGN KEY REFERENCES Products(productID),
    quantity INT,
    itemAmount DECIMAL(10,2)
);

-- Insert Data into OrderItem Table
INSERT INTO Order_Items (orderID, productID, quantity, itemAmount) VALUES
(1, 1, 2, 1600.00),
(1, 3, 1, 300.00),
(2, 2, 3, 1800.00),
(3, 5, 2, 1800.00),
(4, 4, 4, 600.00),
(4, 6, 1, 50.00),
(5, 1, 1, 800.00),
(5, 2, 2, 1200.00),
(6, 10, 2, 240.00),
(6, 9, 3, 210.00);

-- Create Cart Table
CREATE TABLE Carts (
    cartID INT IDENTITY(1,1) PRIMARY KEY,
    customerID INT FOREIGN KEY REFERENCES Customers(customerID),
    productID INT FOREIGN KEY REFERENCES Products(productID),
    quantity INT
);

-- Insert Data into Cart Table
INSERT INTO Carts (customerID, productID, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 3),
(3, 4, 4),
(3, 5, 2),
(4, 6, 1),
(5, 1, 1),
(6, 10, 2),
(6, 9, 3),
(7, 7, 2);



SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Carts;