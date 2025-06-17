-- 1. Update refrigerator price to 800
UPDATE Products
SET price = 800.00
WHERE name = 'Refrigerator';

-- 2. Remove all cart items for a specific customer 
DELETE FROM Carts
WHERE customerID = 3;

-- 3. Retrieve Products Priced Below $100
SELECT * FROM Products
WHERE price < 100;

-- 4. Find Products with Stock Quantity Greater Than 5
SELECT * FROM Products
WHERE stockQuantity > 5;

-- 5. Retrieve Orders with Total Amount Between $500 and $1000
SELECT * FROM Orders
WHERE totalAmount BETWEEN 500 AND 1000;

-- 6. Find Products which name end with letter ‘r’
SELECT * FROM Products
WHERE name LIKE '%r';

-- 7. Retrieve Cart Items for Customer 5
SELECT * FROM Carts
WHERE customerID = 5;

-- 8. Find Customers Who Placed Orders in 2023
SELECT DISTINCT c.*
FROM Customers c
JOIN Orders o ON c.customerID = o.customerID
WHERE YEAR(o.orderDate) = 2023;

-- 9. Determine the Minimum Stock Quantity for Each Product Category (overall)
SELECT MIN(stockQuantity) AS MinStockQuantity
FROM Products;

-- 10. Calculate the Total Amount Spent by Each Customer
SELECT c.customerID, c.firstName, c.lastName, SUM(o.totalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.customerID = o.customerID
GROUP BY c.customerID, c.firstName, c.lastName;

-- 11. Find the Average Order Amount for Each Customer
SELECT c.customerID, c.firstName, c.lastName, AVG(o.totalAmount) AS AvgOrderAmount
FROM Customers c
JOIN Orders o ON c.customerID = o.customerID
GROUP BY c.customerID, c.firstName, c.lastName;

-- 12. Count the Number of Orders Placed by Each Customer
SELECT c.customerID, c.firstName, c.lastName, COUNT(o.orderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.customerID = o.customerID
GROUP BY c.customerID, c.firstName, c.lastName;

-- 13. Find the Maximum Order Amount for Each Customer
SELECT c.customerID, c.firstName, c.lastName, MAX(o.totalAmount) AS MaxOrderAmount
FROM Customers c
JOIN Orders o ON c.customerID = o.customerID
GROUP BY c.customerID, c.firstName, c.lastName;

-- 14. Get Customers Who Placed Orders Totaling Over $1000
SELECT c.customerID, c.firstName, c.lastName, SUM(o.totalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.customerID = o.customerID
GROUP BY c.customerID, c.firstName, c.lastName
HAVING SUM(o.totalAmount) > 1000;

-- 15. Subquery to Find Products Not in the Cart
SELECT * FROM Products
WHERE productID NOT IN (
    SELECT DISTINCT productID FROM Carts
);

-- 16. Subquery to Find Customers Who Haven't Placed Orders
SELECT * FROM Customers
WHERE customerID NOT IN (
    SELECT DISTINCT customerID FROM Orders
);

-- 17. Subquery to Calculate the Percentage of Total Revenue for a Product
SELECT p.productID, p.name,
    (SELECT SUM(itemAmount) FROM Order_Items WHERE productID = p.productID) * 100.0 /
    (SELECT SUM(itemAmount) FROM Order_Items) AS RevenuePercentage
FROM Products p
WHERE p.productID IN (SELECT DISTINCT productID FROM Order_Items);

-- 18. Subquery to Find Products with Low Stock 
SELECT * FROM Products
WHERE stockQuantity < (
    SELECT AVG(stockQuantity) FROM Products
);

-- 19. Subquery to Find Customers Who Placed High-Value Orders 
SELECT * FROM Customers
WHERE customerID IN (
    SELECT customerID FROM Orders
    WHERE totalAmount > 1000
);





--ME

SELECT c.customerID, c.firstName, c.lastName, o.orderID, o.orderDate, o.totalAmount
FROM Customers c
LEFT JOIN Orders o ON c.customerID = o.customerID;


SELECT o.orderID, o.orderDate, o.totalAmount, c.firstName, c.lastName
FROM Customers c
RIGHT JOIN Orders o ON c.customerID = o.customerID;


SELECT c.customerID, c.firstName, p.productID, p.name
FROM Customers c
CROSS JOIN Products p;


SELECT o.orderID, o.orderDate, c.firstName, c.lastName, oi.productID, oi.quantity
FROM Orders o
JOIN Customers c ON o.customerID = c.customerID
JOIN Order_Items oi ON o.orderID = oi.orderID;


SELECT c.customerID, c.firstName, c.lastName, o.orderID, o.orderDate,
       p.productID, p.name AS productName, oi.quantity, oi.itemAmount
FROM Customers c
JOIN Orders o ON c.customerID = o.customerID
JOIN Order_Items oi ON o.orderID = oi.orderID
JOIN Products p ON oi.productID = p.productID;


--MOST EXPENSIVE PRODUCTS ORDERED

SELECT TOP 1 p.name, oi.itemAmount
FROM Order_Items oi
JOIN Products p ON oi.productID = p.productID
ORDER BY oi.itemAmount DESC;

--CUSTOMERS WITH MORE THAN ONE ORDER

SELECT c.customerID, c.firstName, c.lastName, COUNT(o.orderID) AS orderCount
FROM Customers c
JOIN Orders o ON c.customerID = o.customerID
GROUP BY c.customerID, c.firstName, c.lastName
HAVING COUNT(o.orderID) > 1;

--PRODUCTS NEVER ORDERED

SELECT p.productID, p.name AS Neverorderedproduct
FROM Products p
WHERE p.productID NOT IN (SELECT DISTINCT productID FROM Order_Items);

--TOTAL REVENUE GENERATED

SELECT SUM(itemAmount) AS totalRevenue
FROM Order_Items;

--HIGHEST STOCK PRODUCT

SELECT TOP 1 name AS Highlyavailablestock, stockQuantity
FROM Products
ORDER BY stockQuantity DESC;




