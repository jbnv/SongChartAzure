CREATE PROCEDURE [dbo].[FillSongRanks]
AS
INSERT INTO [SongRanks] ([SongFullname],[WeekId],[Rank])
SELECT		[Songs].[Fullname],
			[WeekId]+ranks.Ordinal-1 AS [WeekId],
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
RETURN 0;
