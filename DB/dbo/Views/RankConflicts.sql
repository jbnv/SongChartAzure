CREATE VIEW [RankConflicts]
AS
SELECT c.[Year],c.[MonthOrdinal],c.[WeekOrdinal],filter.[Rank],s.[Title],s.[Id],s.[Fullname]
FROM (
	SELECT [WeekId],[Rank]
	FROM [SongRanks] 
	WHERE [IsCalculated] = 0 AND [Rank] <= 25
	GROUP BY [WeekId],[Rank]
	HAVING COUNT(*) > 1
) filter 
INNER JOIN [SongRanks] sr ON sr.[Rank] = filter.[Rank] AND sr.[WeekId] = filter.[WeekId]
INNER JOIN [Calendar] c ON c.[WeekId] = filter.[WeekId]
INNER JOIN [Songs] s ON s.[Id] = sr.[SongId]
