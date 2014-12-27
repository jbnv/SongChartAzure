CREATE PROCEDURE [dbo].[ProjectRanks]
AS
	INSERT INTO [dbo].[SongRanks] ([SongFullname],[WeekId],[Rank])
	SELECT [SongFullname], [FinalWeekId]+N, r0.[Rank]*POWER(r0.[Rank]/r1.[Rank],N)
	FROM (
		SELECT [SongFullname], MAX([WeekId]) AS [FinalWeekId]
		from [dbo].[SongRanks]
		GROUP BY [SongFullname]
	) a
	OUTER APPLY (SELECT [Rank] FROM [dbo].[SongRanks] WHERE [SongFullname]=a.[SongFullname] AND [WeekId]=a.[FinalWeekId]) r0
	OUTER APPLY (SELECT [Rank] FROM [dbo].[SongRanks] WHERE [SongFullname]=a.[SongFullname] AND [WeekId]=a.[FinalWeekId]-1) r1
	OUTER APPLY (SELECT [Rank] FROM [dbo].[SongRanks] WHERE [SongFullname]=a.[SongFullname] AND [WeekId]=a.[FinalWeekId]-2) r2
	CROSS JOIN Numbers
	WHERE N < LOG(25/r0.[Rank]) / LOG(r0.[Rank]/r1.[Rank])
RETURN 0;