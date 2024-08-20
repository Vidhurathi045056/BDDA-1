-- Create the database
CREATE DATABASE PizzaHutStores;

-- Use the created database
USE PizzaHutStores;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderNo VARCHAR(20) UNIQUE NOT NULL,
    PaymentMode VARCHAR(50) NOT NULL,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the PizzaTypes table
CREATE TABLE PizzaTypes (
    PizzaID INT PRIMARY KEY AUTO_INCREMENT,
    PizzaName VARCHAR(100) NOT NULL,
    PizzaSize ENUM('Small', 'Medium', 'Large') NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- Create the Sides table
CREATE TABLE Sides (
    SideID INT PRIMARY KEY AUTO_INCREMENT,
    SideName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- Create the ColdDrinks table
CREATE TABLE ColdDrinks (
    DrinkID INT PRIMARY KEY AUTO_INCREMENT,
    DrinkName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PizzaID INT,
    SideID INT,
    DrinkID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (PizzaID) REFERENCES PizzaTypes(PizzaID),
    FOREIGN KEY (SideID) REFERENCES Sides(SideID),
    FOREIGN KEY (DrinkID) REFERENCES ColdDrinks(DrinkID)
);
INSERT INTO Customers (CustomerName, PhoneNumber)
VALUES 
('John Doe', '123-456-7890'),
('Jane Smith', '987-654-3210'),
('Alice Johnson', '555-123-4567'),
('Bob Brown', '444-555-6666');
INSERT INTO PizzaTypes (PizzaName, PizzaSize, Price)
VALUES 
('Pepperoni', 'Small', 8.99),
('Pepperoni', 'Medium', 12.99),
('Pepperoni', 'Large', 15.99),
('Margherita', 'Small', 7.99),
('Margherita', 'Medium', 11.99),
('Margherita', 'Large', 14.99),
('BBQ Chicken', 'Small', 9.99),
('BBQ Chicken', 'Medium', 13.99),
('BBQ Chicken', 'Large', 16.99);
INSERT INTO Sides (SideName, Price)
VALUES 
('Garlic Bread', 3.99),
('Chicken Wings', 5.99),
('Mozzarella Sticks', 4.99);
INSERT INTO ColdDrinks (DrinkName, Price)
VALUES 
('Coke', 1.99),
('Pepsi', 1.99),
('Sprite', 1.99);
INSERT INTO Orders (CustomerID, OrderNo, PaymentMode)
VALUES 
(1, 'ORD001', 'Credit Card'),
(2, 'ORD002', 'Cash'),
(3, 'ORD003', 'Debit Card'),
(4, 'ORD004', 'Online Payment');
INSERT INTO OrderDetails (OrderID, PizzaID, SideID, DrinkID, Quantity)
VALUES 
(1, 1, 1, 1, 2), -- Order 1: 2 Small Pepperoni Pizzas, Garlic Bread, Coke
(2, 5, 2, 2, 1), -- Order 2: 1 Medium Margherita Pizza, Chicken Wings, Pepsi
(3, 9, 3, 3, 3), -- Order 3: 3 Large BBQ Chicken Pizzas, Mozzarella Sticks, Sprite
(4, 7, NULL, 1, 1); -- Order 4: 1 Small BBQ Chicken Pizza, Coke (no side)
