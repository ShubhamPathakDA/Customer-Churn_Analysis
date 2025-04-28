USE MovieClubChurnDB;
----handle errors---------
IF OBJECT_ID('dbo.CustomerCurrentStatus', 'V') IS NOT NULL
    DROP VIEW dbo.CustomerCurrentStatus;
GO
-----------------------------
CREATE VIEW dbo.CustomerCurrentStatus AS
WITH LatestSubscriptionInfo AS (
    SELECT
        CustomerID,                   
        MAX(SubscriptionID) AS LatestSubscriptionID 
    FROM dbo.Subscriptions           
    GROUP BY CustomerID               
)

SELECT
    cust.CustomerID,         
    cust.FirstName,          
    cust.LastName,           
    cust.Location,           
    cust.JoinDate,           
    sub.PlanID,              
    p.PlanName,            
    p.MonthlyPrice,       
    sub.Status AS LatestStatus 
FROM dbo.Customers cust                             
JOIN LatestSubscriptionInfo lsi ON cust.CustomerID = lsi.CustomerID 
JOIN dbo.Subscriptions sub ON lsi.LatestSubscriptionID = sub.SubscriptionID
JOIN dbo.Plans p ON sub.PlanID = p.PlanID;  
GO

PRINT 'View CustomerCurrentStatus created successfully!';


--VIEW 
PRINT 'Testing the View... Each customer should appear only ONCE with their latest status:';
SELECT *
FROM dbo.CustomerCurrentStatus
ORDER BY CustomerID; 
GO

----------------------used for handling errors
USE MovieClubChurnDB;
GO
IF OBJECT_ID('dbo.CustomerCurrentStatus', 'V') IS NOT NULL
    DROP VIEW dbo.CustomerCurrentStatus;
GO
PRINT 'Cleaned up previous view attempt.';
