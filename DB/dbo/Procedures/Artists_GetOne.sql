CREATE PROCEDURE [dbo].[Artists_GetOne]
	@id INT
AS
SELECT		[Id],
			[Fullname],
			[Title],
			[GenreId],
			[GenreTitle],
			[Tags],
			[SongCount]
			[Score]
FROM		[dbo].[Artists_Detailed]
WHERE		[Id] = @id
RETURN 0
