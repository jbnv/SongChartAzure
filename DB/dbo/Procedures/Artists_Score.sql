CREATE PROCEDURE [dbo].[Artists_Score]
AS
	UPDATE [Artists] 
	SET [SongCount] = (
		SELECT COUNT(*)
		FROM [Songs] 
		WHERE [ArtistId]=[Artists].[Id]
	), [Score] = (
		SELECT SUM([Score]) 
		FROM [Songs] 
		WHERE [ArtistId]=[Artists].[Id]
	)
RETURN 0
