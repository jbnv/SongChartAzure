CREATE PROCEDURE [dbo].[ScoreArtists]
AS
	UPDATE [Artists] 
	SET [Score] = (
		SELECT SUM([Score]) 
		FROM [Songs] 
		WHERE [ArtistFullname]=[Artists].[Fullname]
	)
RETURN 0
