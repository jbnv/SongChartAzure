CREATE VIEW [dbo].[Artists_Detailed]
AS
SELECT		a.[Id],
			a.[Fullname],
			a.[Title],
			[GenreId],
			g.[Title] AS [GenreTitle],
			[Tags],
			a.[SongCount],
			a.[Score]
FROM		[Artists] a 
LEFT OUTER JOIN [Genres] g ON g.[Id] = a.[GenreID]
