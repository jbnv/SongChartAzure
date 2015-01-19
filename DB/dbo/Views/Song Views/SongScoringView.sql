CREATE VIEW [SongScoringView]
AS
SELECT		[Songs].[Id] AS [SongId],
			[Songs].[Fullname],
			[WeekId]+ranks.Ordinal-1 AS [WeekId],
			rankFn.[Rank],
			scoreFn.[Score]
FROM		[Songs]
INNER JOIN	[dbo].[Months] ON 'calendar:'+[Months].[Slug] = [DebutDateFullname]
INNER JOIN (
	SELECT [Year],[MonthOrdinal],[WeekId]
	FROM [Calendar]
	WHERE [WeekOrdinal] = 1
) cal ON cal.[Year] = [Months].[Year] AND cal.[MonthOrdinal] = [Months].[MonthOrdinal]
CROSS APPLY [dbo].[Split](REPLACE(REPLACE([Ranks],'[',''),']',''),',') ranks
CROSS APPLY (SELECT CAST(ranks.Item AS DECIMAL(4,2)) AS [Rank]) rankFn
CROSS APPLY (SELECT CASE WHEN LOG(rankFn.[Rank]) > 3 THEN 0 ELSE 3-LOG(rankFn.[Rank]) END AS [Score]) AS scoreFn
WHERE		[Songs].[Ranks] IS NOT NULL AND [Songs].[Ranks] <> ''
			AND CAST(ranks.Item AS DECIMAL(6,2)) < 25.00
