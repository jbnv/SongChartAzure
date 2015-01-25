CREATE PROCEDURE [dbo].[FillSongRanks]
AS
	DELETE FROM [SongRanks];

	INSERT INTO [SongRanks] ([SongId],[WeekOrdinal],[WeekId],[Rank])
	SELECT		[Songs].[Id],
				r0.Ordinal-1 AS [WeekOrdinal],
				[WeekId]+r0.Ordinal-1 AS [WeekId],
				r1.[Rank]
	FROM		[Songs]
	CROSS APPLY [dbo].[Split](REPLACE(REPLACE([Ranks],'[',''),']',''),',') r0
	CROSS APPLY (
		SELECT CASE ISNUMERIC(r0.[Item]) 
				WHEN 1 THEN CAST(r0.[Item] AS DECIMAL(6,2)) 
				ELSE CAST(0 AS DECIMAL(6,2)) 
				END AS [Rank]
	) r1
	LEFT OUTER JOIN	[dbo].[Months] ON 'calendar:'+[Months].[Slug] = [DebutDateFullname]
	LEFT OUTER JOIN (
		SELECT [Year],[MonthOrdinal],[WeekId]
		FROM [Calendar]
		WHERE [WeekOrdinal] = 1
	) cal ON cal.[Year] = [Months].[Year] AND cal.[MonthOrdinal] = [Months].[MonthOrdinal]
	WHERE		[Songs].[Ranks] IS NOT NULL AND [Songs].[Ranks] <> ''
				AND r1.[Rank] < 100.00
	;

RETURN 0;
