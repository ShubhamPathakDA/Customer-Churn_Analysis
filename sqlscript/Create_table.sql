create database MovieClubChurnDB

USE MovieClubChurnDB;
-- 1 customer Info
PRINT 'Creating Customers table...';
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,    
    FirstName NVARCHAR(50),        
    LastName NVARCHAR(50),        
    Location NVARCHAR(50),         
    JoinDate DATE   
	);
GO

-- 2: Movie Plan Information
PRINT 'Creating Plans table...';
CREATE TABLE Plans (
    PlanID INT PRIMARY KEY,         
    PlanName NVARCHAR(50),         
    MonthlyPrice DECIMAL(10, 2)     
);
GO

--3: Subscription Records Who had which plan and when
PRINT 'Creating Subscriptions table...';
CREATE TABLE Subscriptions (
    SubscriptionID INT PRIMARY KEY, 
    CustomerID INT,                 
    PlanID INT,                     
    StartDate DATE,                 
    EndDate DATE,                   
    Status VARCHAR(20)             
        CHECK(Status IN ('Active', 'Cancelled', 'Expired')), 
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), 
    FOREIGN KEY (PlanID) REFERENCES Plans(PlanID)             
);
GO

PRINT 'All tables created successfully!';
