CREATE PROCEDURE [dbo].[Artists_Score]
AS
	UPDATE [Artists] 
	SET [SongCount] = (
		SELECT COUNT(*)
		FROM [Songs] 
		INNER JOIN [SongArtists] ON [SongArtists].[ArtistId] = [Songs].[Id]
		WHERE [SongArtists].[ArtistID]=[Artists].[Id]
	), [Score] = (
		SELECT COALESCE(SUM([Score]),0)
		FROM [Songs] 
		INNER JOIN [SongArtists] ON [SongArtists].[ArtistId] = [Songs].[Id]
		WHERE [SongArtists].[ArtistID]=[Artists].[Id]
	)
RETURN 0
