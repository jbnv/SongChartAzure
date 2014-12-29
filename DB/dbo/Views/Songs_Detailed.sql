CREATE VIEW [dbo].[Songs_Detailed]
AS 
SELECT		s.[Id],
			s.[Fullname],
			s.[Title],
			s.[ArtistFullname],
			a.[Title] AS [ArtistTitle],
			s.[GenreFullname],
			g.[Title] AS [GenreTitle],
			[DebutDateFullname],
			s.[Ranks] AS [RanksString],
			[Tags],
			s.[Score],
			debut.[Rank] AS [DebutRank],
			sAgg.[PeakRank],
			sAgg.[Duration]
FROM		[Songs] s
LEFT OUTER JOIN	[Artists] a ON a.Fullname = s.ArtistFullname
LEFT OUTER JOIN [Genres] g ON g.Fullname = s.GenreFullname
LEFT OUTER JOIN (
	SELECT [SongId],[Rank] FROM [SongRanks] WHERE [WeekOrdinal] = 0
) debut ON debut.[SongId] = s.[Id]
LEFT OUTER JOIN (
	SELECT [SongId],MAX([Rank]) AS [PeakRank],COUNT(*) AS [Duration] FROM [SongRanks] GROUP BY [SongId]
) sAgg ON sAgg.[SongId] = s.[Id]