USE MovieClubChurnDB;

PRINT 'Inserting sample data...';

--adding imaginary customers
INSERT INTO dbo.Customers (CustomerID, FirstName, LastName, Location, JoinDate) VALUES
(1, 'Amit', 'Sharma', 'Mumbai', '2022-01-15'),
(2, 'Priya', 'Singh', 'Delhi', '2022-03-10'),
(3, 'Rahul', 'Verma', 'Bangalore', '2022-05-20'),
(4, 'Sneha', 'Patel', 'Mumbai', '2022-07-01'),
(5, 'Vikram', 'Kumar', 'Delhi', '2023-02-11'),
(6, 'Anita', 'Das', 'Kolkata', '2023-04-05'),
(7, 'Rajesh', 'Gupta', 'Bangalore', '2023-06-18'),
(8, 'Deepa', 'Malik', 'Mumbai', '2023-08-22'),
(9, 'Suresh', 'Nair', 'Chennai', '2022-09-01'),
(10, 'Meena', 'Iyer', 'Pune', '2023-11-15');
GO

--adding different movie plans
INSERT INTO dbo.Plans (PlanID, PlanName, MonthlyPrice) VALUES
(101, 'Basic Movies', 9.99),
(102, 'Premium Movies', 19.99),
(103, 'Family Pack', 29.99);
GO

--subscription history
--dbo. prefix for consistency
INSERT INTO dbo.Subscriptions (SubscriptionID, CustomerID, PlanID, StartDate, EndDate, Status) VALUES
-- Amit: Was Basic, then Premium, now Premium Active
(1, 1, 101, '2022-01-15', '2023-01-14', 'Expired'),
(2, 1, 102, '2023-01-15', '2024-01-14', 'Expired'),
(3, 1, 102, '2024-01-15', '2025-01-14', 'Active'), -- His CURRENT status is Active

-- Priya: Was Basic, then cancelled Basic
(4, 2, 101, '2022-03-10', '2023-03-09', 'Expired'),
(5, 2, 101, '2023-03-10', '2024-03-09', 'Cancelled'),-- Current status is Cancelled (Churned)

-- Rahul: Was Premium, still Premium Active
(6, 3, 102, '2022-05-20', '2023-05-19', 'Expired'),
(7, 3, 102, '2023-05-20', '2024-05-19', 'Active'), -- Current status is Active

-- Sneha: Had Family Pack, it expired, didn't renew
(8, 4, 103, '2022-07-01', '2023-06-30', 'Expired'), -- Current status is Expired (Churned)

-- Vikram: Was Basic, now Basic Active
(9, 5, 101, '2023-02-11', '2024-02-10', 'Expired'),
(10, 5, 101, '2024-02-11', '2025-02-10', 'Active'), -- Current status is Active

-- Anita: Had Premium, cancelled it
(11, 6, 102, '2023-04-05', '2024-04-04', 'Cancelled'),-- Current status is Cancelled (Churned)

-- Rajesh: Has Family Pack Active
(12, 7, 103, '2023-06-18', '2024-06-17', 'Active'), -- Current status is Active

-- Deepa: Had Basic, it expired
(13, 8, 101, '2023-08-22', '2024-02-21', 'Expired'), -- curretn status is Expired (Churned)

-- Suresh: Was Basic, then Premium, then cancelled Premium
(14, 9, 101, '2022-09-01', '2023-08-31', 'Expired'),
(15, 9, 102, '2023-09-01', '2024-03-15', 'Cancelled'),-- current status is Cancelled (Churned)

-- Meena: Has Family Pack Active
(16, 10, 103, '2023-11-15', '2024-11-14', 'Active'); -- current status is Active
GO

PRINT 'Sample data inserted successfully!';

print 'verifying count'
SELECT COUNT(*) AS CustomerCount FROM dbo.Customers; 
SELECT COUNT(*) AS PlanCount FROM dbo.Plans;       
SELECT COUNT(*) AS SubscriptionCount FROM dbo.Subscriptions;
GO

print 'verifying data'
SELECT TOP 5 * FROM dbo.Customers;
SELECT * FROM dbo.Plans;
SELECT TOP 5 * FROM dbo.Subscriptions ORDER BY SubscriptionID DESC; 
GO

