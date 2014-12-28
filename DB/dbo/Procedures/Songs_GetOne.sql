CREATE PROCEDURE [dbo].[Songs_GetOne]
	@fullname VARCHAR(10)
AS
SELECT		[Fullname],
			[Title],
			[ArtistFullname],
			[ArtistTitle],
			[GenreFullname],
			[GenreTitle],
			[DebutDateFullname],
			[Ranks],
			[Tags],
			[Score] 
FROM		[dbo].[Songs_Detailed]
WHERE		[Fullname] = @fullname
RETURN 0
