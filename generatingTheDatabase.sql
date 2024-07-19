-- Create Carts table
CREATE TABLE Carts (
    CartId INT AUTO_INCREMENT PRIMARY KEY
);

-- Create Products table
CREATE TABLE Products (
    ProductId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ImageUrl TEXT,
    Description TEXT,
    Price DECIMAL(18,2) NOT NULL,
    StockQuantity INT NOT NULL,
    RoomCategory INT NOT NULL,  -- Enum stored as integer
    FurnitureTypeCategory INT NOT NULL  -- Enum stored as integer
);

-- Create Users table
CREATE TABLE Users (
    UserId INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20),
    CartId INT,
    FOREIGN KEY (CartId) REFERENCES Carts(CartId) ON DELETE SET NULL
);

-- Create CartItems table
CREATE TABLE CartItems (
    CartItemId INT AUTO_INCREMENT PRIMARY KEY,
    CartId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (CartId) REFERENCES Carts(CartId) ON DELETE CASCADE,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId) ON DELETE RESTRICT
);

-- Create Orders table
CREATE TABLE Orders (
    OrderId INT AUTO_INCREMENT PRIMARY KEY,
    CartId INT NOT NULL,
    DeliveryPrice DECIMAL(18,2) NOT NULL,
    Address TEXT NOT NULL,
    FOREIGN KEY (CartId) REFERENCES Carts(CartId) ON DELETE CASCADE
);
