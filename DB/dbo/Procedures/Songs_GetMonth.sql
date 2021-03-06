﻿CREATE PROCEDURE [dbo].[Songs_GetMonth] @year SMALLINT, @month TINYINT
AS
SELECT		[Id],
			s.[Fullname],			
			ROW_NUMBER() OVER(ORDER BY mcr.[Score] DESC) AS [ChartRank],
			[Title],
			[ArtistsXML],
			[GenreId],
			[GenreFullname],
			[GenreTitle],
			CASE [DebutDateFullname] WHEN 'calendar:'+m.[Slug] THEN 'debut' ELSE '' END AS [DebutDateFullname], 
			[RanksString],
			[Tags],
			mcr.[Score],
			[DebutRank],
			[PeakRank],
			[Duration]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [MonthChartRanks] mcr ON mcr.[SongId] = s.[Id]
INNER JOIN [Months] m ON m.[Year] = mcr.[Year] AND m.[MonthOrdinal] = mcr.[MonthOrdinal]
WHERE mcr.[Year] = @year AND mcr.[MonthOrdinal] = @month
ORDER BY mcr.[Score] DESC
