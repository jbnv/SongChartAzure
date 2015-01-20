
CREATE VIEW [MonthChartRanks]
AS
SELECT c.[Year],c.[MonthOrdinal],sr.[SongId],SUM([Score]) AS [Score]
FROM [Calendar] c
INNER JOIN [SongRanks] sr ON sr.[WeekId] = c.[WeekId]
GROUP BY c.[Year],c.[MonthOrdinal],sr.[SongId]
