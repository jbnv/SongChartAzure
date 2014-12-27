CREATE VIEW [RankConflicts]
AS
SELECT c.[Year],c.[MonthOrdinal],c.[WeekOrdinal],s.[Title],filter.[Rank]
FROM (
	SELECT [WeekId],[Rank]
	FROM [SongRanks] 
	GROUP BY [WeekId],[Rank]
	HAVING COUNT(*) > 1
) filter 
INNER JOIN [SongRanks] sr ON sr.[Rank] = filter.[Rank] AND sr.[WeekId] = filter.[WeekId]
INNER JOIN [Calendar] c ON c.[WeekId] = filter.[WeekId]
INNER JOIN [Songs] s ON s.[Fullname] = sr.[SongFullname]
