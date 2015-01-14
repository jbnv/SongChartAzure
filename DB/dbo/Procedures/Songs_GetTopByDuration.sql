CREATE PROCEDURE [dbo].[Songs_GetTopByDuration]
AS
SELECT		TOP 40 [Id],
			s.[Fullname],
			[Title],
			[ArtistId],
			[ArtistFullname],
			[ArtistTitle],
			[GenreId],
			[GenreFullname],
			[GenreTitle],
			[DebutDateFullname],
			[RanksString],
			[Tags],
			[Score],
			ROW_NUMBER() OVER(ORDER BY [Duration] DESC, [Score] DESC) AS [ChartRank],
			[DebutRank],
			[PeakRank],
			[Duration]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
ORDER BY [Duration] DESC, [Score] DESC