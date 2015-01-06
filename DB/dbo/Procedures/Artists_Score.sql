CREATE PROCEDURE [dbo].[Artists_Score]
AS
	UPDATE [Artists] 
	SET [SongCount] = (
		SELECT COUNT(*)
		FROM [Songs] 
		WHERE [ArtistID]=[Artists].[Id]
	), [Score] = (
		SELECT COALESCE(SUM([Score]),0)
		FROM [Songs] 
		WHERE [ArtistID]=[Artists].[Id]
	)
RETURN 0
