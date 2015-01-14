CREATE PROCEDURE [dbo].[Songs_GetMonth] @year SMALLINT, @month TINYINT
AS
SELECT		[Id],
			s.[Fullname],
			mcr.[Rank],
			ROW_NUMBER() OVER(ORDER BY mcr.[Rank] DESC) AS [ChartRank],
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
ORDER BY mcr.[Rank] DESC
