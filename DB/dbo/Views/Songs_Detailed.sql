CREATE VIEW [dbo].[Songs_Detailed]
AS 
SELECT		s.[Fullname],
			s.[Title],
			s.[ArtistFullname],
			a.[Title] AS [ArtistTitle],
			s.[GenreFullname],
			g.[Title] AS [GenreTitle],
			[DebutDateFullname],
			[Ranks],
			[Tags],
			s.[Score] 
FROM		[Songs] s
LEFT OUTER JOIN	[Artists] a ON a.Fullname = s.ArtistFullname
LEFT OUTER JOIN [Genres] g ON g.Fullname = s.GenreFullname
