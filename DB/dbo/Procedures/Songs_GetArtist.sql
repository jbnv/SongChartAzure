CREATE PROCEDURE [dbo].[Songs_GetArtist]
	@artistId INT
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
			ROW_NUMBER() OVER(ORDER BY [Score] DESC) AS [ChartRank],
			[DebutRank],
			[PeakRank],
			[Duration]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
WHERE [ArtistId] = @artistId
ORDER BY [Score] DESC