CREATE PROCEDURE [dbo].[Songs_GetDecade]
	@decade SMALLINT
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
			[DebutRank],
			[PeakRank],
			[Duration]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
WHERE dfn.DecadeNumber = @decade