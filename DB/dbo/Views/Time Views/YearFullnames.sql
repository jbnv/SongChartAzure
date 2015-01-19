CREATE VIEW [dbo].[YearFullnames]
AS 
SELECT [Number] AS [YearNumber], 'calendar:'+[Slug] AS [Fullname]
FROM [Years]
UNION
SELECT [Year], 'calendar:'+[Slug]
FROM [Months]
