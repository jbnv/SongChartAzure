CREATE VIEW [dbo].[MonthSummaries]
AS 
SELECT	mcr.[Year],mcr.[MonthOrdinal],COUNT(*) AS [SongCount]
FROM [MonthChartRanks] mcr 
GROUP BY mcr.[Year],mcr.[MonthOrdinal]
