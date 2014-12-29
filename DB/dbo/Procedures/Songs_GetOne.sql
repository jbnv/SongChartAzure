CREATE PROCEDURE [dbo].[Songs_GetOne]
	@id INT
AS
SELECT		[Id],
			[Fullname],
			[Title],
			[ArtistFullname],
			[ArtistTitle],
			[GenreFullname],
			[GenreTitle],
			[DebutDateFullname],
			[RanksString],
			[Tags],
			[Score],
			[DebutRank],
			[PeakRank],
			[Duration]
FROM		[dbo].[Songs_Detailed]
WHERE		[Id] = @id
RETURN 0
