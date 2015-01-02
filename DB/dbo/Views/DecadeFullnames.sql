CREATE VIEW [dbo].[DecadeFullnames]
AS 
SELECT [Number] AS [DecadeNumber], 'calendar:'+[Slug] AS [Fullname]
FROM [Decades] d
UNION
SELECT [Decade], 'calendar:'+[Slug]
FROM [Years]
UNION
SELECT [Decade], 'calendar:'+[Slug]
FROM [Months]

