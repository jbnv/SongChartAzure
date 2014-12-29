CREATE VIEW [dbo].[Songs_Detailed]
AS 
SELECT		s.[Id],
			s.[Fullname],
			s.[Title],
			s.[ArtistId],
			a.[Fullname] AS [ArtistFullname],
			a.[Title] AS [ArtistTitle],
			s.[GenreId],
			g.[Fullname] AS [GenreFullname],
			g.[Title] AS [GenreTitle],
			[DebutDateFullname],
			s.[Ranks] AS [RanksString],
			s.[Tags],
			s.[Score],
			debut.[Rank] AS [DebutRank],
			sAgg.[PeakRank],
			sAgg.[Duration]
FROM		[Songs] s
LEFT OUTER JOIN	[Artists] a ON a.[Id] = s.[ArtistId]
LEFT OUTER JOIN [Genres] g ON g.[Id] = s.[GenreID]
LEFT OUTER JOIN (
	SELECT [SongId],[Rank] FROM [SongRanks] WHERE [WeekOrdinal] = 0
) debut ON debut.[SongId] = s.[Id]
LEFT OUTER JOIN (
	SELECT [SongId],MAX([Rank]) AS [PeakRank],COUNT(*) AS [Duration] FROM [SongRanks] GROUP BY [SongId]
) sAgg ON sAgg.[SongId] = s.[Id]