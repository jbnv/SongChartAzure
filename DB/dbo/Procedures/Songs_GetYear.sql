CREATE PROCEDURE [dbo].[Songs_GetYear]
	@year SMALLINT
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
	SELECT 'calendar:'+[Slug] AS [Fullname]
	FROM [Years]
	WHERE [Number] = @year
	UNION
	SELECT 'calendar:'+[Slug]
	FROM [Months]
	WHERE [Year] = @year
) fltr ON [DebutDateFullname] = fltr.[Fullname]