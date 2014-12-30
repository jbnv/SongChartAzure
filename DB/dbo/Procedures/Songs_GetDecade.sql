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
INNER JOIN (
	SELECT 'calendar:'+CAST(@decade AS VARCHAR)+'s' AS [Fullname]
	UNION
	SELECT 'calendar:'+[Slug]
	FROM [Years]
	WHERE [Decade] = @decade
	UNION
	SELECT 'calendar:'+[Slug]
	FROM [Months]
	WHERE [Decade] = @decade
) fltr ON [DebutDateFullname] = fltr.[Fullname]