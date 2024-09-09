--create database DDS
use DDS
go

CREATE TABLE ProductLine_DIM (
    Dim_ProductLineID_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    ProductLineID INT,
	ProductLine NVARCHAR(255),
	Status int
);

CREATE TABLE Product_DIM (
    Dim_ProductID_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    ProductID INT,
	UnitPrice FLOAT,
    Dim_ProductLineID_SK INT,
	Status int
    FOREIGN KEY (Dim_ProductLineID_SK) REFERENCES ProductLine_DIM(Dim_ProductLineID_SK)
);

CREATE TABLE City_DIM (
    Dim_Branch_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    BranchID INT,
	Branch NVARCHAR(255),
	City NVARCHAR(255),
	Status int
);

CREATE TABLE Payment_DIM (
    Dim_PaymentID_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    PaymentID INT,
	PaymentName NVARCHAR(255),
	Status int
);

CREATE TABLE CustomerType_DIM (
    Dim_CustomerType_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    CustomerTypeID INT,
	CustomerTypeName NVARCHAR(255),
	Status int
);

CREATE TABLE Date_DIM (
    Dim_DateID_SK INT IDENTITY(1,1) PRIMARY KEY,
	DateID INT,
	Date DATETIME,
    Day INT,
    Month INT,
    Year INT,
);

CREATE TABLE Fact_SupermarketSales (
    Dim_InvoiceID_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    InvoiceID INT,
	Dim_Branch_SK INT,
    Dim_ProductID_SK INT,
    Dim_Payment_SK INT,
    Dim_Customertype_SK INT,
    Dim_DateID_SK INT,
    Gender NVARCHAR(255),
    Quantity FLOAT,
    Total FLOAT,
    Time TIME,
    cogs FLOAT,
    GrossMargin FLOAT,
    GrossIncome FLOAT,
    Rating FLOAT,
	Status int
    FOREIGN KEY (Dim_Branch_SK) REFERENCES City_DIM(Dim_Branch_SK),
    FOREIGN KEY (Dim_ProductID_SK) REFERENCES Product_DIM(Dim_ProductID_SK),
    FOREIGN KEY (Dim_Payment_SK) REFERENCES Payment_DIM(Dim_PaymentID_SK),
    FOREIGN KEY (Dim_Customertype_SK) REFERENCES CustomerType_DIM(Dim_CustomerType_SK),
    FOREIGN KEY (Dim_DateID_SK) REFERENCES Date_DIM(Dim_DateID_SK)
);