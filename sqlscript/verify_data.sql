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
