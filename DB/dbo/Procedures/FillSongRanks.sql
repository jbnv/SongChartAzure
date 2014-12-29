CREATE PROCEDURE [dbo].[FillSongRanks]
AS
	DELETE FROM [SongRanks];

	INSERT INTO [SongRanks] ([SongId],[WeekId],[WeekOrdinal],[Rank])
	SELECT		[Songs].[Id],
				[WeekId]+ranks.Ordinal-1 AS [WeekId],
				ranks.Ordinal-1 AS [WeekOrdinal],
				CAST(ranks.Item AS DECIMAL(4,2))
	FROM		[Songs]
	INNER JOIN	[dbo].[Months] ON 'calendar:'+[Months].[Slug] = [DebutDateFullname]
	INNER JOIN (
		SELECT [Year],[MonthOrdinal],[WeekId]
		FROM [Calendar]
		WHERE [WeekOrdinal] = 1
	) cal ON cal.[Year] = [Months].[Year] AND cal.[MonthOrdinal] = [Months].[MonthOrdinal]
	CROSS APPLY [dbo].[Split](REPLACE(REPLACE([Ranks],'[',''),']',''),',') ranks
	WHERE		[Songs].[Ranks] IS NOT NULL AND [Songs].[Ranks] <> ''
				AND CAST(ranks.Item AS DECIMAL(6,2)) < 100.00
	;

	--TODO Operate on songs that are scoped only to the year or decade.
RETURN 0;
