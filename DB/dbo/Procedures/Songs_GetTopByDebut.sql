CREATE PROCEDURE [dbo].[Songs_GetTopByDebut]
AS
SELECT		[Id],
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
			ROW_NUMBER() OVER(ORDER BY [DebutRank] ASC, [Score] DESC) AS [ChartRank],
			[DebutRank],
			[PeakRank],
			[Duration]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
WHERE [DebutRank] <= 10
ORDER BY [DebutRank] ASC, [Score] DESC