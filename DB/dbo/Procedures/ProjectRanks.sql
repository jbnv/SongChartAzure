--TODO Implement accelerated scaling.
CREATE PROCEDURE [dbo].[ProjectRanks]
AS
	INSERT INTO [dbo].[SongRanks] ([SongId],[WeekId],[WeekOrdinal],[Rank])
	SELECT [SongId], [FinalWeekId]+N, [FinalWeekOrdinal]+N, r0.[Rank]*POWER(r0.[Rank]/r1.[Rank],N)
	FROM (
		SELECT [SongId], MAX([WeekId]) AS [FinalWeekId], MAX([WeekOrdinal]) AS [FinalWeekOrdinal]
		FROM [dbo].[SongRanks]
		GROUP BY [SongId]
	) a
	OUTER APPLY (SELECT [Rank] FROM [dbo].[SongRanks] WHERE [SongId]=a.[SongId] AND [WeekId]=a.[FinalWeekId]) r0
	OUTER APPLY (SELECT [Rank] FROM [dbo].[SongRanks] WHERE [SongId]=a.[SongId] AND [WeekId]=a.[FinalWeekId]-1) r1
	OUTER APPLY (SELECT [Rank] FROM [dbo].[SongRanks] WHERE [SongId]=a.[SongId] AND [WeekId]=a.[FinalWeekId]-2) r2
	CROSS JOIN Numbers
	WHERE N > 0 AND N < LOG(25/r0.[Rank]) / LOG(r0.[Rank]/r1.[Rank])
RETURN 0;