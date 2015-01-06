CREATE VIEW [dbo].[Songs_Detailed]
AS 
SELECT		s.[Id],
			s.[Fullname],
			s.[Title],
			LEN(s.[Title]) AS [Title_CharacterCount],
			LEN(s.[Title])-LEN(REPLACE(s.[Title],' ','')) AS [Title_WordCount],
			s.[ArtistID],
			a.[Fullname] AS [ArtistFullname],
			a.[Title] AS [ArtistTitle],
			s.[GenreID],
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
	SELECT [SongID],[Rank] FROM [SongRanks] WHERE [WeekOrdinal] = 0
) debut ON debut.[SongID] = s.[Id]
LEFT OUTER JOIN (
	SELECT [SongID],MIN([Rank]) AS [PeakRank],COUNT(*) AS [Duration] FROM [SongRanks] GROUP BY [SongID]
) sAgg ON sAgg.[SongID] = s.[Id]