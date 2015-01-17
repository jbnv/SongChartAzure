CREATE PROCEDURE [dbo].[Songs_GetArtist]
	@artistId INT
AS
SELECT		s.*,
			ROW_NUMBER() OVER(ORDER BY [Score] DESC) AS [ChartRank],
			sa.[RoleSlug]
FROM		[dbo].[Songs_Detailed] s
INNER JOIN [DecadeFullnames] dfn ON [DebutDateFullname] = dfn.[Fullname]
INNER JOIN [SongArtists] sa ON sa.SongId = s.Id
WHERE [ArtistId] = @artistId
ORDER BY [Score] DESC