CREATE PROCEDURE [dbo].[Songs_GetMonth] @year SMALLINT, @month TINYINT
AS
SELECT		[Id],
			s.[Fullname],
			mcr.[Rank],
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
INNER JOIN [MonthChartRanks] mcr ON mcr.[SongId] = s.[Id]
WHERE mcr.[Year] = @year AND mcr.[MonthOrdinal] = @month
