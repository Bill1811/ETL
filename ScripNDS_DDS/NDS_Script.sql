--CREATE DATABASE NDS
use NDS
go

CREATE TABLE ProductLine_NDS (
    ProductLineID_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    ProductLineID_NK NVARCHAR(255),
    ProductLine NVARCHAR(255),
    Created DATETIME,
    LastUpdated DATETIME,
    SourceID INT
);

CREATE TABLE Product_NDS (
    ProductID_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    ProductID_NK NVARCHAR(255),
    UnitPrice FLOAT,
    ProductLineID_SK INT,
    Created DATETIME,
    LastUpdated DATETIME,
    SourceID INT,
    FOREIGN KEY (ProductLineID_SK) REFERENCES ProductLine_NDS(ProductLineID_SK)
);

CREATE TABLE City_NDS (
    Branch_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Branch NVARCHAR(255),
    City NVARCHAR(255),
    Created DATETIME,
    LastUpdated DATETIME,
    SourceID INT
);

CREATE TABLE Payment_NDS (
    PaymentID_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    PaymentName NVARCHAR(255),
    Created DATETIME,
    LastUpdated DATETIME,
    SourceID INT
);

CREATE TABLE CustomerType_NDS (
    CustomerType_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    CustomerTypeName NVARCHAR(255),
    Created DATETIME,
    LastUpdated DATETIME,
    SourceID INT
);

CREATE TABLE Date_NDS (
    DateID_SK INT IDENTITY(1,1) PRIMARY KEY,
	Date DATETIME,
    Day INT,
    Month INT,
    Year INT,
);
CREATE TABLE Supermarket_Sales_NDS (
    InvoiceID_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    Branch_SK INT,
    ProductID_SK INT,
    Payment_SK INT,
    Customertype_SK INT,
    InvoiceID_NK NVARCHAR(255),
    DateID_SK INT,
	Time TIME,
    Gender NVARCHAR(255),
    Quantity FLOAT,
    Total FLOAT,
    cogs FLOAT,
    GrossMargin FLOAT,
    GrossIncome FLOAT,
    Rating FLOAT,
    Created DATETIME,
    LastUpdated DATETIME,
    SourceID INT,
    FOREIGN KEY (Branch_SK) REFERENCES City_NDS(Branch_SK),
    FOREIGN KEY (ProductID_SK) REFERENCES Product_NDS(ProductID_SK),
    FOREIGN KEY (Payment_SK) REFERENCES Payment_NDS(PaymentID_SK),
    FOREIGN KEY (Customertype_SK) REFERENCES CustomerType_NDS(CustomerType_SK),
    FOREIGN KEY (DateID_SK) REFERENCES Date_NDS(DateID_SK)
);
