CREATE VIEW [dbo].[Months]
AS
SELECT 
	y.[Decade],
	y.[Number] AS [Year], 
	m.[Ordinal] AS [MonthOrdinal], 
	m.[Name]+' '+CAST(y.[Number] AS VARCHAR) AS [Name],
	CAST(y.[Number] AS VARCHAR)
		+ '-'
		+ CASE WHEN m.[Ordinal]<10 THEN '0' ELSE '' END 
		+ CAST(m.[Ordinal] AS VARCHAR) AS [Slug] 
FROM [Years] y CROSS JOIN [MonthsOfYear] m
