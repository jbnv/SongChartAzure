CREATE PROCEDURE [dbo].[Songs_GetTopByPeak]
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
			ROW_NUMBER() OVER(ORDER BY [PeakRank] ASC, [Score] DESC) AS [ChartRank],
			[DebutRank],
			[PeakRank],
			[Duration]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
WHERE [PeakRank] < 1.5
ORDER BY [PeakRank] ASC, [Score] DESC