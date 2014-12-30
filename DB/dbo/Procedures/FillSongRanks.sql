CREATE PROCEDURE [dbo].[FillSongRanks]
AS
	DELETE FROM [SongRanks];

	INSERT INTO [SongRanks] ([SongId],[WeekOrdinal],[WeekId],[Rank])
	SELECT		[Songs].[Id],
				ranks.Ordinal-1 AS [WeekOrdinal],
				[WeekId]+ranks.Ordinal-1 AS [WeekId],
				CAST(ranks.Item AS DECIMAL(4,2))
	FROM		[Songs]
	CROSS APPLY [dbo].[Split](REPLACE(REPLACE([Ranks],'[',''),']',''),',') ranks
	LEFT OUTER JOIN	[dbo].[Months] ON 'calendar:'+[Months].[Slug] = [DebutDateFullname]
	LEFT OUTER JOIN (
		SELECT [Year],[MonthOrdinal],[WeekId]
		FROM [Calendar]
		WHERE [WeekOrdinal] = 1
	) cal ON cal.[Year] = [Months].[Year] AND cal.[MonthOrdinal] = [Months].[MonthOrdinal]
	WHERE		[Songs].[Ranks] IS NOT NULL AND [Songs].[Ranks] <> ''
				AND CAST(ranks.Item AS DECIMAL(6,2)) < 100.00
	;

RETURN 0;
